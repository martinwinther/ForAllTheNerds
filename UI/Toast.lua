local addonName, ns = ...

-- ===========================================================================
-- UI/Toast.lua -- the small fading card that appears when you walk somewhere.
-- One line of hook text, clickable for the full write-up.
-- ===========================================================================

local U, T = ns.U, ns.Theme

local Toast = {}
ns.Toast = Toast

local frame, icon, title, meta, hook, hint
local lingerTimer = 0
local state = "hidden"   -- hidden | fadein | linger | fadeout

local WIDTH = 380

local function build()
	if frame then return end

	frame = T.Frame("ForAllTheNerdsToast", UIParent, "BackdropTemplate")
	frame:SetSize(WIDTH, 92)
	frame:SetFrameStrata("HIGH")
	frame:SetClampedToScreen(true)
	T.ApplyBackdrop(frame, 0.9)
	T.RestorePosition(frame, "toastPoint", "TOP", 0, -220)
	T.MakeMovable(frame, "toastPoint")
	frame:Hide()

	icon = frame:CreateTexture(nil, "ARTWORK")
	icon:SetSize(36, 36)
	icon:SetPoint("TOPLEFT", 12, -12)
	icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

	title = T.Text(frame, "OVERLAY", 3, T.color.gold)
	title:SetPoint("TOPLEFT", icon, "TOPRIGHT", 10, 0)
	title:SetPoint("RIGHT", frame, "RIGHT", -12, 0)
	title:SetHeight(18)

	meta = T.Text(frame, "OVERLAY", -2, T.color.dim)
	meta:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -2)
	meta:SetPoint("RIGHT", frame, "RIGHT", -12, 0)
	meta:SetHeight(14)

	hook = T.Text(frame, "OVERLAY", 0, T.color.body)
	hook:SetPoint("TOPLEFT", icon, "BOTTOMLEFT", 0, -8)
	hook:SetPoint("RIGHT", frame, "RIGHT", -12, 0)
	hook:SetJustifyH("LEFT")
	hook:SetWordWrap(true)

	hint = T.Text(frame, "OVERLAY", -3, T.color.accent)
	hint:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -12, 8)
	hint:SetJustifyH("RIGHT")
	hint:SetText("click to read more")

	-- Left-click opens the panel, right-click dismisses.
	frame:SetScript("OnMouseUp", function(self, button)
		if button == "RightButton" then
			Toast:Hide()
		elseif button == "LeftButton" and self.entry then
			Toast:Hide()
			if ns.Panel then ns.Panel:Show(self.entry) end
		end
	end)

	frame:SetScript("OnEnter", function(self)
		-- Hovering holds the toast open so a long hook can actually be read.
		if state == "fadeout" or state == "linger" then
			state = "linger"
			lingerTimer = math.max(lingerTimer, 3)
			self:SetAlpha(1)
			self.ftnFade = nil
		end
	end)
end

-- The toast runs its own clock rather than chaining timers, so hovering can
-- extend it and a new toast can interrupt cleanly.
local function startDriver()
	frame:SetScript("OnUpdate", function(self, delta)
		if state == "linger" then
			lingerTimer = lingerTimer - delta
			if lingerTimer <= 0 then
				state = "fadeout"
				T.Fade(self, self:GetAlpha(), 0, 0.8, function(f)
					f:Hide()
					state = "hidden"
					f:SetScript("OnUpdate", nil)
				end)
			end
		end
	end)
end

function Toast:Show(entry)
	if not entry then return end
	build()

	frame.entry = entry

	icon:SetTexture(T.Icon(entry))

	title:SetText(entry.name)

	local bits = {}
	local kind = T.kindLabel[entry.kind]
	if kind then bits[#bits + 1] = U.Hex(T.color.dim, kind) end
	local faction = T.FactionTag(entry)
	if faction ~= "" then bits[#bits + 1] = faction end
	if entry.levels then bits[#bits + 1] = U.Hex(T.color.dim, entry.levels) end
	if entry.era == "forever" then bits[#bits + 1] = U.Hex(T.color.spoiler, "new") end
	meta:SetText(table.concat(bits, U.Hex("555555", "  -  ")))

	hook:SetText(entry.hook)

	-- Size the card to the hook text rather than guessing.
	local hookHeight = math.max(hook:GetStringHeight(), 16)
	frame:SetHeight(12 + 36 + 8 + hookHeight + 8 + 14 + 8)

	frame:Show()
	state = "fadein"
	T.Fade(frame, 0, 1, 0.35, function()
		state = "linger"
		lingerTimer = (ns.db and ns.db.toastSeconds) or 9
		startDriver()
	end)
end

function Toast:Hide()
	if not frame then return end
	frame.ftnFade = nil
	frame:SetScript("OnUpdate", nil)
	frame:Hide()
	state = "hidden"
end

function Toast:IsShown()
	return frame and frame:IsShown()
end

-- /ftn unlock parks a dummy toast on screen so the user can drag it.
function Toast:ShowPlacement()
	build()
	Toast:Show({
		name = "Drag me where you want it",
		kind = "zone",
		faction = "Neutral",
		levels = "preview",
		hook = "This is roughly how much room a hook line takes. Drag the card, then right-click to dismiss it.",
		key = "__placement__",
	})
	state = "linger"
	lingerTimer = 600
end
