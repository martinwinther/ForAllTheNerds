local addonName, ns = ...

-- ===========================================================================
-- UI/Theme.lua -- colours, fonts and frame helpers shared by the toast,
-- the panel and the options page.
-- ===========================================================================

local U = ns.U

local T = {}
ns.Theme = T

T.color = {
	gold      = "ffd100",
	parchment = "f0e0c0",
	body      = "d8d0c0",
	dim       = "9a9a9a",
	accent    = "8ab4f8",
	alliance  = "6a9bd8",
	horde     = "c43c3c",
	neutral   = "e8c35a",
	hostile   = "d06a4a",
	spoiler   = "c08ad8",
}

T.factionColor = {
	Alliance  = T.color.alliance,
	Horde     = T.color.horde,
	Neutral   = T.color.neutral,
	Contested = T.color.gold,
	Hostile   = T.color.hostile,
}

T.kindLabel = {
	zone     = "Zone",
	sub      = "Locale",
	instance = "Instance",
}

T.icon = {
	zone     = "Interface\\ICONS\\INV_Misc_Map_01",
	sub      = "Interface\\ICONS\\INV_Misc_Book_09",
	instance = "Interface\\ICONS\\INV_Misc_Key_03",
}

function T.Icon(entry)
	return T.icon[entry and entry.kind or "sub"] or T.icon.sub
end

function T.FactionTag(entry)
	if not (entry and entry.faction) then return "" end
	local hex = T.factionColor[entry.faction] or T.color.dim
	return U.Hex(hex, entry.faction)
end

-- ---------------------------------------------------------------------------
-- Frames
-- ---------------------------------------------------------------------------

-- CreateFrame with a template, falling back to no template if the template is
-- not registered on this client. BackdropTemplate is required on the Mainline
-- API surface before SetBackdrop exists on a plain frame.
function T.Frame(name, parent, template)
	if template then
		local ok, frame = pcall(CreateFrame, "Frame", name, parent, template)
		if ok and frame then return frame end
	end
	return CreateFrame("Frame", name, parent)
end

local BACKDROP = {
	bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 16, edgeSize = 16,
	insets = { left = 4, right = 4, top = 4, bottom = 4 },
}

function T.ApplyBackdrop(frame, alpha)
	if type(frame.SetBackdrop) ~= "function" then
		-- No backdrop API on this frame: fake it with textures so the panel is
		-- still readable rather than transparent.
		local bg = frame:CreateTexture(nil, "BACKGROUND")
		bg:SetAllPoints(frame)
		bg:SetColorTexture(0.05, 0.05, 0.06, alpha or 0.92)
		frame.ftnFallbackBG = bg
		return
	end
	frame:SetBackdrop(BACKDROP)
	frame:SetBackdropColor(0.05, 0.05, 0.06, alpha or 0.92)
	frame:SetBackdropBorderColor(0.45, 0.38, 0.25, 1)
end

-- A font string using the game's own fonts, scaled by the user's fontSize.
function T.Text(parent, layer, size, hex)
	local fs = parent:CreateFontString(nil, layer or "OVERLAY", "GameFontNormal")
	local base = (ns.db and ns.db.fontSize) or 13
	local font, _, flags = fs:GetFont()
	fs:SetFont(font, base + (size or 0), flags)
	fs:SetJustifyH("LEFT")
	fs:SetJustifyV("TOP")
	if hex then
		local r, g, b = U.RGB(hex)
		fs:SetTextColor(r, g, b)
	end
	return fs
end

-- Make a frame movable and remember where the user put it.
function T.MakeMovable(frame, dbKey)
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
	frame:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		if not (ns.db and dbKey) then return end
		local point, _, _, x, y = self:GetPoint()
		ns.db[dbKey] = { point = point, x = x, y = y }
	end)
end

function T.RestorePosition(frame, dbKey, defPoint, defX, defY)
	local p = ns.db and ns.db[dbKey]
	frame:ClearAllPoints()
	if p and p.point then
		frame:SetPoint(p.point, UIParent, p.point, p.x or 0, p.y or 0)
	else
		frame:SetPoint(defPoint or "CENTER", UIParent, defPoint or "CENTER", defX or 0, defY or 0)
	end
end

-- Simple manual fade, so we do not depend on AnimationGroups or UIFrameFade
-- being present and behaving the same way across clients.
function T.Fade(frame, from, to, duration, onDone)
	frame.ftnFade = { from = from, to = to, elapsed = 0, duration = duration, onDone = onDone }
	frame:SetAlpha(from)
	frame:SetScript("OnUpdate", function(self, delta)
		local s = self.ftnFade
		if not s then self:SetScript("OnUpdate", nil) return end
		s.elapsed = s.elapsed + delta
		local pct = s.duration > 0 and (s.elapsed / s.duration) or 1
		if pct >= 1 then
			self:SetAlpha(s.to)
			self.ftnFade = nil
			self:SetScript("OnUpdate", nil)
			if s.onDone then s.onDone(self) end
		else
			self:SetAlpha(s.from + (s.to - s.from) * pct)
		end
	end)
end
