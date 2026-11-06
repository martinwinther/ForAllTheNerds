local addonName, ns = ...

-- ===========================================================================
-- Core.lua -- namespace, saved variables, API capability probe, bootstrap.
-- ===========================================================================

local U = ns.U

ns.NAME      = addonName
ns.VERSION   = "1.2.0"
ns.TITLE     = "ForAllTheNerds"

-- ---------------------------------------------------------------------------
-- Which client are we on?
--
-- WOW_PROJECT_CAMELOT (18) is Forever's project id. The constant may be absent
-- on older clients, so compare only when both sides exist, and treat an
-- unknown client as "modern" if the Mainline-only APIs are present.
-- ---------------------------------------------------------------------------

local function detectFlavour()
	local id = WOW_PROJECT_ID
	if id and WOW_PROJECT_CAMELOT and id == WOW_PROJECT_CAMELOT then return "forever" end
	if id and WOW_PROJECT_CLASSIC and id == WOW_PROJECT_CLASSIC then return "classic" end
	if id and WOW_PROJECT_MAINLINE and id == WOW_PROJECT_MAINLINE then
		-- Forever reported PROJECT_ID 1 on early beta builds before 18 existed.
		-- Distinguish by interface version rather than trusting the id alone.
		local _, _, _, iface = GetBuildInfo()
		iface = tonumber(iface) or 0
		if iface >= 16000 and iface < 17000 then return "forever" end
		return "retail"
	end
	return "unknown"
end

ns.flavour = detectFlavour()

-- Capability probe. Never branch on the flavour alone -- probe the API.
ns.has = {
	timer        = (C_Timer and type(C_Timer.After) == "function") and true or false,
	map          = (C_Map and type(C_Map.GetBestMapForUnit) == "function") and true or false,
	mapInfo      = (C_Map and type(C_Map.GetMapInfo) == "function") and true or false,
	settings     = (Settings and type(Settings.RegisterAddOnCategory) == "function") and true or false,
	settingsOpen = (Settings and type(Settings.OpenToCategory) == "function") and true or false,
	legacyOptions = (type(InterfaceOptions_AddCategory) == "function") and true or false,
	secrets      = (type(issecretvalue) == "function") and true or false,
	addonMeta    = (C_AddOns and type(C_AddOns.GetAddOnMetadata) == "function") and true or false,
	backdrop     = (type(BackdropTemplateMixin) == "table") and true or false,
}

-- ---------------------------------------------------------------------------
-- Defaults
-- ---------------------------------------------------------------------------

ns.defaults = {
	enabled          = true,

	-- Automatic display
	autoToast        = true,   -- show the toast on entering somewhere new
	toastZones       = true,   -- ...for full zones
	toastSubzones    = true,   -- ...for subzones (Goldshire, Northshire Abbey)
	toastDungeons    = true,   -- ...for dungeon and raid interiors
	toastSeconds     = 9,      -- how long the toast lingers
	onlyFirstVisit   = false,  -- once per character, ever, instead of per session
	repeatCooldown   = 900,    -- seconds before the same place can toast again
	suppressInCombat = true,
	suppressInInstance = false,
	suppressOnTaxi   = true,   -- stay silent while flying a taxi route

	-- Reading
	chatEcho         = false,  -- also print the hook line to chat
	autoOpenPanel    = false,  -- open the full panel instead of a toast
	panelScale       = 1.0,
	fontSize         = 13,

	-- Content
	showForeverContent = false, -- lore for Forever's brand-new zones (mild spoilers)
	showDidYouKnow   = true,
	showReadMore     = true,
	useFandomWiki    = false,  -- link wowpedia.fandom.com instead of warcraft.wiki.gg

	-- Chrome
	minimapButton    = true,
	minimapAngle     = 215,
	minimapOffset    = 10,   -- pixels beyond the minimap's own edge
	debug            = false,

	-- Position of the toast, saved between sessions
	toastPoint       = { point = "TOP", x = 0, y = -220 },
	panelPoint       = { point = "CENTER", x = 0, y = 0 },

	-- Gap finding
	logUnknown       = true,   -- note places the client reports that have no entry
	unknown          = {},     -- ["Zone|Subzone"] = { zone, sub, count }

	-- Per-character state
	seen             = {},  -- [key] = true, for onlyFirstVisit
	lastShown        = {},  -- [key] = GetTime() stamp, for repeatCooldown
	stats            = { discovered = 0, read = 0 },
}

-- ---------------------------------------------------------------------------
-- Bootstrap
-- ---------------------------------------------------------------------------

-- Modules register a callback here and get called once the DB exists.
ns.onReady = {}
function ns.OnReady(fn)
	if type(fn) == "function" then ns.onReady[#ns.onReady + 1] = fn end
end

local function fireReady()
	for i = 1, #ns.onReady do
		local ok, err = pcall(ns.onReady[i])
		if not ok then U.Print("|cffff6666error during setup:|r %s", tostring(err)) end
	end
	ns.onReady = {}
	ns.ready = true
end

local boot = CreateFrame("Frame")
boot:RegisterEvent("ADDON_LOADED")
boot:RegisterEvent("PLAYER_LOGIN")

boot:SetScript("OnEvent", function(_, event, arg1)
	if event == "ADDON_LOADED" and arg1 == addonName then
		-- SavedVariables are populated before ADDON_LOADED fires, so this is
		-- the first safe place to read them.
		if type(ForAllTheNerdsDB) ~= "table" then ForAllTheNerdsDB = {} end
		ns.db = U.ApplyDefaults(ForAllTheNerdsDB, ns.defaults)
		ns.db.version = ns.VERSION

		-- Trim any cooldown stamps left over from a previous session; GetTime()
		-- resets on each login so old stamps are meaningless and would
		-- otherwise suppress the first visit of the session.
		ns.db.lastShown = {}

		boot:UnregisterEvent("ADDON_LOADED")

	elseif event == "PLAYER_LOGIN" then
		if not ns.db then
			if type(ForAllTheNerdsDB) ~= "table" then ForAllTheNerdsDB = {} end
			ns.db = U.ApplyDefaults(ForAllTheNerdsDB, ns.defaults)
		end
		fireReady()
		U.Debug("ready on %s (interface %s), %d places known",
			ns.flavour, select(4, GetBuildInfo()), ns.Index and ns.Index.total or 0)
		boot:UnregisterEvent("PLAYER_LOGIN")
	end
end)

-- ---------------------------------------------------------------------------
-- Small shared helpers that need the DB
-- ---------------------------------------------------------------------------

function ns.IsEnabled()
	return ns.db and ns.db.enabled
end

-- Places the client names that this database has nothing for.
--
-- The lore was written from lists I put together by hand, and three entries in
-- the second batch turned out to be wrong because the list was wrong. Letting
-- the game report the gaps avoids that: these are the exact strings
-- GetSubZoneText returns, correctly spelled, for places somebody has actually
-- stood in.
local UNKNOWN_CAP = 400

function ns.RecordUnknown(zone, sub)
	local db = ns.db
	if not (db and db.logUnknown and zone) then return end

	local key = zone .. "|" .. (sub or "")
	local rec = db.unknown[key]
	if rec then
		rec.count = (rec.count or 0) + 1
		return
	end

	-- Cap it, so a long session cannot grow the saved variables without limit.
	local n = 0
	for _ in pairs(db.unknown) do n = n + 1 end
	if n >= UNKNOWN_CAP then return end

	db.unknown[key] = { zone = zone, sub = sub, count = 1 }
end

function ns.UnknownList()
	local out = {}
	if not (ns.db and ns.db.unknown) then return out end
	for _, rec in pairs(ns.db.unknown) do out[#out + 1] = rec end
	table.sort(out, function(a, b)
		if a.count ~= b.count then return a.count > b.count end
		if a.zone ~= b.zone then return a.zone < b.zone end
		return (a.sub or "") < (b.sub or "")
	end)
	return out
end

function ns.MarkSeen(key)
	if not (ns.db and key) then return end
	if not ns.db.seen[key] then
		ns.db.seen[key] = true
		ns.db.stats.discovered = (ns.db.stats.discovered or 0) + 1
	end
	ns.db.lastShown[key] = GetTime()
end

function ns.WasSeen(key)
	return ns.db and key and ns.db.seen[key] or false
end

-- Should this place be announced right now?
function ns.ShouldAnnounce(key)
	local db = ns.db
	if not (db and key) then return false end
	if db.onlyFirstVisit and db.seen[key] then return false end
	local last = db.lastShown[key]
	if last and (GetTime() - last) < (db.repeatCooldown or 0) then return false end
	return true
end
