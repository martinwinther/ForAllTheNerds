-- ===========================================================================
-- tools/mock_wow.lua
-- A deliberately permissive stand-in for the WoW client API, enough to load
-- ForAllTheNerds outside the game and exercise its real code paths.
--
-- It is NOT a simulator. It exists so that `lua tools/validate.lua` can catch
-- nil-indexing, bad argument counts and data mistakes before you alt-tab into
-- the game, which is otherwise a 60-second reload loop per typo.
-- ===========================================================================

local M = {}

-- Templates the mock pretends to know about. CreateFrame errors on anything
-- else, which is what the real client does, so the addon's template-fallback
-- paths get exercised honestly.
local KNOWN_TEMPLATES = {
	BackdropTemplate = true,
	UIPanelScrollFrameTemplate = true,
	UIPanelCloseButton = true,
	InterfaceOptionsCheckButtonTemplate = true,
	OptionsSliderTemplate = true,
	UICheckButtonTemplate = true,
	UISliderTemplate = true,
	ChatConfigCheckButtonTemplate = true,
}

if os.getenv("FTN_NO_TEMPLATES") then
	KNOWN_TEMPLATES = {}
end

-- Every frame registers its events here so the harness can fire them.
M.eventHandlers = {}   -- [event] = { frame, frame, ... }
M.frames = {}
M.printed = {}

-- Where the fake player is standing.
M.location = {
	zone = "Elwynn Forest",
	subzone = "Goldshire",
	minimap = "Goldshire",
	realzone = "Elwynn Forest",
	inInstance = false,
	instanceType = nil,
	instanceName = nil,
	uiMapID = 37,
}

-- ---------------------------------------------------------------------------
-- Font strings and textures
-- ---------------------------------------------------------------------------

local function makeRegion(kind)
	local r = { __kind = kind, __text = "", __shown = true }
	local noop = function() return r end

	function r:SetPoint() return self end
	function r:SetAllPoints() return self end
	function r:ClearAllPoints() return self end
	function r:SetSize() return self end
	function r:SetWidth() return self end
	function r:SetHeight() return self end
	function r:SetTexture() return self end
	function r:SetColorTexture() return self end
	function r:SetTexCoord() return self end
	function r:SetJustifyH() return self end
	function r:SetJustifyV() return self end
	function r:SetWordWrap() return self end
	function r:SetSpacing() return self end
	function r:SetTextColor() return self end
	function r:SetAlpha() return self end
	function r:Show() self.__shown = true end
	function r:Hide() self.__shown = false end
	function r:IsShown() return self.__shown end
	function r:GetObjectType() return self.__kind end

	function r:SetText(t) self.__text = tostring(t or "") end
	function r:GetText() return self.__text end
	function r:SetFont(path, size, flags)
		self.__font, self.__size, self.__flags = path, size, flags
		return self
	end
	function r:GetFont() return self.__font or "Fonts\\FRIZQT__.TTF", self.__size or 12, self.__flags or "" end
	-- Rough but monotonic: enough for the panel's height maths to be exercised.
	function r:GetStringHeight()
		local len = #(self.__text or "")
		local width = self.__width or 400
		local charsPerLine = math.max(math.floor(width / 7), 20)
		local lines = math.max(math.ceil(len / charsPerLine), 1)
		-- count explicit newlines too
		for _ in string.gmatch(self.__text or "", "\n") do lines = lines + 1 end
		return lines * ((self.__size or 12) + 3)
	end
	function r:GetStringWidth() return math.min(#(self.__text or "") * 7, 400) end

	-- Catch-all for regions: any method we did not stub becomes a no-op.
	-- Internal fields (the __ prefixed ones) must still read as nil, or
	-- `self.__width or 400` quietly becomes a function.
	setmetatable(r, {
		__index = function(_, key)
			if type(key) == "string" and key:sub(1, 2) == "__" then return nil end
			return noop
		end,
	})
	return r
end

-- ---------------------------------------------------------------------------
-- Frames
-- ---------------------------------------------------------------------------

local frameCounter = 0

local function makeFrame(frameType, name, parent, template)
	frameCounter = frameCounter + 1

	local f = {
		__kind = frameType or "Frame",
		__name = name,
		__parent = parent,
		__template = template,
		__shown = false,
		__scripts = {},
		__events = {},
		__alpha = 1,
		__checked = false,
		__value = 0,
		__point = { "CENTER", nil, "CENTER", 0, 0 },
	}

	function f:GetObjectType() return self.__kind end
	function f:GetName() return self.__name end
	function f:GetParent() return self.__parent end

	function f:SetScript(event, fn) self.__scripts[event] = fn end
	function f:GetScript(event) return self.__scripts[event] end
	function f:HookScript(event, fn) self.__scripts[event] = fn end

	function f:RegisterEvent(event)
		self.__events[event] = true
		M.eventHandlers[event] = M.eventHandlers[event] or {}
		for _, existing in ipairs(M.eventHandlers[event]) do
			if existing == self then return end
		end
		table.insert(M.eventHandlers[event], self)
	end

	function f:UnregisterEvent(event)
		self.__events[event] = nil
		local list = M.eventHandlers[event]
		if not list then return end
		for i = #list, 1, -1 do
			if list[i] == self then table.remove(list, i) end
		end
	end

	function f:UnregisterAllEvents()
		for event in pairs(self.__events) do self:UnregisterEvent(event) end
	end

	function f:Show() self.__shown = true
		local s = self.__scripts.OnShow
		if s then s(self) end
	end
	function f:Hide() self.__shown = false end
	function f:IsShown() return self.__shown end
	function f:IsVisible() return self.__shown end

	function f:SetAlpha(a) self.__alpha = a end
	function f:GetAlpha() return self.__alpha end

	function f:SetPoint(p, rel, relP, x, y)
		self.__point = { p, rel, relP, x or 0, y or 0 }
		return self
	end
	function f:GetPoint() return self.__point[1], self.__point[2], self.__point[3], self.__point[4], self.__point[5] end
	function f:ClearAllPoints() return self end

	function f:SetWidth(w) self.__width = w end
	function f:SetHeight(h) self.__height = h end
	function f:GetWidth() return self.__width or 100 end
	function f:GetHeight() return self.__height or 100 end
	function f:SetSize(w, h) self.__width, self.__height = w, h end

	function f:CreateTexture() return makeRegion("Texture") end
	function f:CreateFontString(_, _, inherits)
		local fs = makeRegion("FontString")
		fs.__inherits = inherits
		function fs:SetWidth(w) self.__width = w end
		return fs
	end

	function f:SetBackdrop(b) self.__backdrop = b end
	function f:SetBackdropColor() end
	function f:SetBackdropBorderColor() end

	function f:SetChecked(v) self.__checked = v and true or false end
	function f:GetChecked() return self.__checked end

	function f:SetMinMaxValues(lo, hi) self.__min, self.__max = lo, hi end
	function f:GetMinMaxValues() return self.__min or 0, self.__max or 1 end
	function f:SetValue(v)
		self.__value = v
		local s = self.__scripts.OnValueChanged
		if s then s(self, v) end
	end
	function f:GetValue() return self.__value end
	function f:SetValueStep(s) self.__step = s end
	function f:SetObeyStepOnDrag() end
	function f:SetOrientation() end

	function f:SetScrollChild(c) self.__scrollChild = c end
	function f:GetVerticalScroll() return self.__vscroll or 0 end
	function f:SetVerticalScroll(v) self.__vscroll = v end
	function f:GetVerticalScrollRange() return 400 end

	function f:SetScale(s) self.__scale = s end
	function f:GetScale() return self.__scale or 1 end
	function f:GetEffectiveScale() return self.__scale or 1 end
	function f:GetCenter() return 400, 300 end

	function f:RegisterForClicks() end
	function f:RegisterForDrag() end
	function f:EnableMouse() end
	function f:EnableMouseWheel() end
	function f:EnableKeyboard() end
	function f:SetMovable() end
	function f:StartMoving() end
	function f:StopMovingOrSizing() end
	function f:SetClampedToScreen() end
	function f:SetFrameStrata() end
	function f:SetFrameLevel() end
	function f:SetPropagateKeyboardInput() end
	function f:SetParent(p) self.__parent = p end
	function f:Raise() end
	function f:SetAttribute() end

	-- Anything else: a no-op that keeps chaining, rather than a nil-index crash.
	-- Record it so validate.lua can report what the addon reached for, which is
	-- how you find out you need a better stub.
	setmetatable(f, {
		__index = function(self, key)
			-- Internal state fields must read as nil rather than as a function.
			if type(key) == "string" and key:sub(1, 2) == "__" then return nil end
			M.missing = M.missing or {}
			M.missing[(frameType or "Frame") .. ":" .. tostring(key)] = true
			return function() return self end
		end,
	})

	-- EditBoxes hold real text, because the URL box reads its own contents back
	-- to decide whether the player has altered them.
	if frameType == "EditBox" then
		f.__editText = ""
		function f:SetText(v) self.__editText = tostring(v or "")
			local s = self.__scripts.OnTextChanged
			if s then s(self) end
		end
		function f:GetText() return self.__editText end
		function f:SetAutoFocus() end
		function f:SetFocus() M.focusedEditBox = self end
		function f:ClearFocus() end
		function f:HighlightText() self.__highlighted = true end
		function f:SetFontObject() end
		function f:SetMaxLetters() end
		function f:SetNumeric() end
	end

	-- Templates bring their own child regions along. The checkbox templates
	-- give you a .Text font string, and the slider templates .Low/.High/.Text,
	-- so provide them when a template was asked for. Without a template the
	-- addon has to build its own, which is the fallback path.
	if template then
		if frameType == "CheckButton" then
			f.Text = makeRegion("FontString")
		elseif frameType == "Slider" then
			f.Low = makeRegion("FontString")
			f.High = makeRegion("FontString")
			f.Text = makeRegion("FontString")
		end
	end

	if name then _G[name] = f end
	table.insert(M.frames, f)
	return f
end

-- ---------------------------------------------------------------------------
-- Install the globals
-- ---------------------------------------------------------------------------

function M.install()
	_G.CreateFrame = function(frameType, name, parent, template)
		if template and not KNOWN_TEMPLATES[template] then
			error("unknown template: " .. tostring(template), 2)
		end
		return makeFrame(frameType, name, parent, template)
	end

	_G.UIParent = makeFrame("Frame", "UIParent")
	_G.Minimap = makeFrame("Frame", "Minimap")

	_G.GameTooltip = makeFrame("GameTooltip", "GameTooltip")
	_G.GameTooltip.SetOwner = function() end
	_G.GameTooltip.AddLine = function() end
	_G.GameTooltip.Show = function() end
	_G.GameTooltip.Hide = function() end

	_G.BackdropTemplateMixin = {}

	-- Forever reports project id 18 (WOW_PROJECT_CAMELOT) and interface 16001.
	_G.WOW_PROJECT_MAINLINE = 1
	_G.WOW_PROJECT_CLASSIC = 2
	_G.WOW_PROJECT_CAMELOT = 18
	_G.WOW_PROJECT_ID = tonumber(os.getenv("FTN_PROJECT_ID") or "") or 18

	_G.GetBuildInfo = function()
		return "1.60.1", "70338", "2026-11-04", os.getenv("FTN_TOC") or "16001"
	end

	-- Secret values exist on the Midnight/Forever API family. Lua has no way to
	-- make a real one, so a secret is modelled as a unique box table held in a
	-- registry that issecretvalue knows about. The addon's guards reject it on
	-- the issecretvalue branch, which is the branch under test; anything the
	-- harness has not boxed answers false exactly as before.
	M.secrets = {}
	function M.secret(v)
		local box = { boxed = v }
		M.secrets[box] = true
		return box
	end
	_G.issecretvalue = function(v) return M.secrets[v] == true end

	-- Unit API. M.units["target"] = { name=, isPlayer=, playerControlled=,
	-- secretName=, identityRestricted= }. Absent means the unit does not exist.
	M.units = M.units or {}

	local function unitOf(unit) return M.units[unit] end

	_G.UnitExists = function(unit) return unitOf(unit) ~= nil end

	_G.UnitName = function(unit)
		local u = unitOf(unit)
		if not u then return nil end
		if u.secretName then return M.secret(u.name) end
		return u.name
	end

	if not os.getenv("FTN_NO_UNITISPLAYER") then
		_G.UnitIsPlayer = function(unit)
			local u = unitOf(unit)
			if not u then return nil end
			if u.secretIsPlayer then return M.secret(false) end
			return u.isPlayer and true or false
		end
	end

	-- GUIDs on the modern format. u.guid overrides it outright, so a test can
	-- hand over a vanilla-style hex GUID or outright rubbish.
	_G.UnitGUID = function(unit)
		local u = unitOf(unit)
		if not u then return nil end
		if u.secretGUID then return M.secret("Creature-0-1465-0-2105-1-0") end
		if u.guid then return u.guid end
		if not u.id then return nil end
		return string.format("Creature-0-1465-0-2105-%d-000043F59F", u.id)
	end

	_G.UnitPlayerControlled = function(unit)
		local u = unitOf(unit)
		if not u then return nil end
		return u.playerControlled and true or false
	end

	_G.UNKNOWNOBJECT = "Unknown Entity"

	if not os.getenv("FTN_NO_SECRET_PROBE") then
		_G.C_Secrets = {
			ShouldUnitIdentityBeSecret = function(unit)
				local u = unitOf(unit)
				if not u then return false end
				return u.identityRestricted and true or false
			end,
		}
	end

	_G.C_Timer = {
		After = function(delay, fn)
			M.timers = M.timers or {}
			table.insert(M.timers, { at = (M.clock or 0) + delay, fn = fn })
		end,
		NewTimer = function(delay, fn)
			C_Timer.After(delay, fn)
			return { Cancel = function() end }
		end,
	}

	-- A small stand-in AreaTable. Keys are area ids, values the subzone name the
	-- client would report. Deliberately mixes places the lore files cover with
	-- places they do not, and repeats one name under two ids, because the real
	-- table does that constantly.
	M.areas = M.areas or {
		[9]    = "Northshire Valley",
		[12]   = "Elwynn Forest",
		[87]   = "Goldshire",
		[88]   = "Goldshire",
		[1519] = "Stormwind City",
		[7777] = "Nowhere The Lore Covers",
		[7778] = "Another Unwritten Hollow",
	}

	_G.C_Map = {
		GetBestMapForUnit = function() return M.location.uiMapID end,
		GetMapInfo = function(id) return { mapID = id, name = M.location.zone } end,
	}

	if not os.getenv("FTN_NO_AREAINFO") then
		C_Map.GetAreaInfo = function(id)
			if M.areaInfoSecret then return M.secret("Somewhere") end
			return M.areas[id]
		end
	end

	_G.C_AddOns = {
		GetAddOnMetadata = function(_, field)
			if field == "Version" then return "1.0.0" end
			return nil
		end,
	}

	_G.GetZoneText = function() return M.location.zone or "" end
	_G.GetSubZoneText = function() return M.location.subzone or "" end
	_G.GetMinimapZoneText = function() return M.location.minimap or M.location.subzone or "" end
	_G.GetRealZoneText = function() return M.location.realzone or M.location.zone or "" end

	_G.IsInInstance = function()
		return M.location.inInstance, M.location.instanceType
	end
	_G.GetInstanceInfo = function()
		return M.location.instanceName or M.location.zone, M.location.instanceType
	end

	_G.UnitAffectingCombat = function() return M.inCombat or false end
	_G.UnitOnTaxi = function() return M.onTaxi or false end
	_G.GetTime = function() return M.clock or 0 end
	_G.GetCursorPosition = function() return 400, 300 end

	_G.SlashCmdList = {}

	if not os.getenv("FTN_NO_SETTINGS") then
		_G.Settings = {
			RegisterCanvasLayoutCategory = function(_, name)
				return { ID = name, name = name }
			end,
			RegisterAddOnCategory = function() M.settingsRegistered = true end,
			OpenToCategory = function() M.settingsOpened = true end,
			RegisterAddOnSetting = function() end,
		}
	end

	if os.getenv("FTN_LEGACY_OPTIONS") then
		_G.InterfaceOptions_AddCategory = function() M.legacyRegistered = true end
		_G.InterfaceOptionsFrame_OpenToCategory = function() end
		_G.InterfaceOptionsFrame = makeFrame("Frame", "InterfaceOptionsFrame")
	end

	-- Capture print output instead of spraying it, so the harness can assert.
	local realPrint = print
	_G.print = function(...)
		local parts = {}
		for i = 1, select("#", ...) do parts[#parts + 1] = tostring(select(i, ...)) end
		local text = table.concat(parts, " ")
		table.insert(M.printed, text)
		if os.getenv("FTN_VERBOSE") then realPrint("    | " .. text) end
	end
	M.realPrint = realPrint
end

-- ---------------------------------------------------------------------------
-- Driving the fake client
-- ---------------------------------------------------------------------------

function M.fire(event, ...)
	local list = M.eventHandlers[event]
	if not list then return 0 end
	local fired = 0
	-- Copy: a handler may unregister itself mid-iteration.
	local snapshot = {}
	for i = 1, #list do snapshot[i] = list[i] end
	for i = 1, #snapshot do
		local frame = snapshot[i]
		local fn = frame.__scripts and frame.__scripts.OnEvent
		if fn and frame.__events[event] then
			fn(frame, event, ...)
			fired = fired + 1
		end
	end
	return fired
end

-- Advance the fake clock and run any timers that are now due.
function M.advance(seconds)
	M.clock = (M.clock or 0) + (seconds or 0)
	local ran = 0
	local guard = 0
	while guard < 100 do
		guard = guard + 1
		local due
		local timers = M.timers or {}
		for i = 1, #timers do
			if timers[i].at <= M.clock then due = i break end
		end
		if not due then break end
		local t = table.remove(M.timers, due)
		t.fn()
		ran = ran + 1
	end
	return ran
end

-- Move the fake player. Anything the caller does not specify is RESET rather
-- than left over from the previous location: a stale minimap label leaking
-- into the next case produced a false pass once already.
function M.moveTo(loc)
	M.location.zone         = loc.zone
	M.location.realzone     = loc.realzone or loc.zone
	M.location.subzone      = loc.subzone or ""
	M.location.minimap      = loc.minimap or loc.subzone or loc.zone or ""
	M.location.inInstance   = loc.inInstance or false
	M.location.instanceType = loc.instanceType
	M.location.instanceName = loc.instanceName
	M.location.uiMapID      = loc.uiMapID or 0
	M.fire("ZONE_CHANGED_NEW_AREA")
	M.advance(1.0)
end

function M.lastPrinted(n)
	local out = {}
	for i = math.max(1, #M.printed - (n or 5) + 1), #M.printed do
		out[#out + 1] = M.printed[i]
	end
	return out
end

function M.clearPrinted() M.printed = {} end

return M
