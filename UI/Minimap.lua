local addonName, ns = ...

-- ===========================================================================
-- UI/Minimap.lua -- a draggable minimap button. Left-click toggles the panel
-- for wherever you are, right-click opens the options.
-- ===========================================================================

local U, T = ns.U, ns.Theme

local M = {}
ns.Minimap = M

local button

-- How far from the minimap's centre the button should sit.
--
-- The first version of this hardcoded 80 pixels, which is only correct for a
-- default-sized round minimap. Anything that resizes the minimap, including a
-- UI addon or a different default on this client, left the button sitting
-- inside the border ring. Derive it from the frame instead and let the user
-- add an offset on top.
local function minimapRadius()
	local half = (Minimap:GetWidth() or 140) / 2
	local offset = (ns.db and ns.db.minimapOffset) or 10
	return half + offset
end

-- GetMinimapShape is set by whichever addon squares off the minimap, if any.
-- Absent means round, which is the default.
local function minimapShape()
	if type(GetMinimapShape) ~= "function" then return "ROUND" end
	local ok, shape = pcall(GetMinimapShape)
	if ok and type(shape) == "string" then return shape end
	return "ROUND"
end

local function positionByAngle(angle)
	if not (button and Minimap) then return end
	local rad = math.rad(angle or 215)
	local x, y = math.cos(rad), math.sin(rad)
	local r = minimapRadius()

	if minimapShape() == "ROUND" then
		x, y = x * r, y * r
	else
		-- Square or part-square minimap: push the point out to the bounding
		-- box rather than the circle, so the button still clears the edge.
		local m = math.max(math.abs(x), math.abs(y))
		if m > 0 then x, y = (x / m) * r, (y / m) * r end
	end

	button:ClearAllPoints()
	button:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

-- Exposed so the options sliders can nudge it live.
function M:Reposition()
	positionByAngle(ns.db and ns.db.minimapAngle or 215)
end

local function build()
	if button or not Minimap then return end

	button = CreateFrame("Button", "ForAllTheNerdsMinimapButton", Minimap)
	button:SetSize(31, 31)
	button:SetFrameStrata("MEDIUM")
	button:SetFrameLevel(8)
	button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	button:RegisterForDrag("LeftButton")

	local overlay = button:CreateTexture(nil, "OVERLAY")
	overlay:SetSize(53, 53)
	overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
	overlay:SetPoint("TOPLEFT")

	local icon = button:CreateTexture(nil, "ARTWORK")
	icon:SetSize(19, 19)
	icon:SetTexture("Interface\\ICONS\\INV_Misc_Book_09")
	icon:SetPoint("CENTER", -1, 1)

	button:SetScript("OnClick", function(_, btn)
		if btn == "RightButton" then
			if ns.Options then ns.Options:Open() end
		else
			if ns.Panel then ns.Panel:Toggle() end
		end
	end)

	button:SetScript("OnEnter", function(self)
		if not GameTooltip then return end
		GameTooltip:SetOwner(self, "ANCHOR_LEFT")
		GameTooltip:AddLine("ForAllTheNerds")
		local here = ns.Detect and ns.Detect.entry
		if here then
			GameTooltip:AddLine(here.name, 1, 0.82, 0)
			GameTooltip:AddLine(here.hook, 0.85, 0.82, 0.75, true)
		else
			GameTooltip:AddLine("No lore written for here yet.", 0.6, 0.6, 0.6, true)
		end
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("Left-click: read about here", 0.5, 0.7, 1)
		GameTooltip:AddLine("Right-click: settings", 0.5, 0.7, 1)
		GameTooltip:AddLine("Drag: move it round the minimap", 0.5, 0.7, 1)
		GameTooltip:Show()
	end)

	button:SetScript("OnLeave", function()
		if GameTooltip then GameTooltip:Hide() end
	end)

	-- Dragging moves the button around the minimap's edge.
	button:SetScript("OnDragStart", function(self)
		self.dragging = true
		self:SetScript("OnUpdate", function(s)
			local mx, my = Minimap:GetCenter()
			local scale = Minimap:GetEffectiveScale()
			local cx, cy = GetCursorPosition()
			cx, cy = cx / scale, cy / scale
			local atan2 = math.atan2 or math.atan
			local angle = math.deg(atan2(cy - my, cx - mx))
			if ns.db then ns.db.minimapAngle = angle end
			positionByAngle(angle)
		end)
	end)

	button:SetScript("OnDragStop", function(self)
		self.dragging = nil
		self:SetScript("OnUpdate", nil)
	end)

	positionByAngle(ns.db and ns.db.minimapAngle or 215)
end

function M:Refresh()
	if not (ns.db and ns.db.minimapButton) then
		if button then button:Hide() end
		return
	end
	build()
	if button then
		positionByAngle(ns.db.minimapAngle)
		button:Show()
	end
end

ns.OnReady(function() M:Refresh() end)
