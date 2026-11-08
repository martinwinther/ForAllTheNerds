local addonName, ns = ...

-- ===========================================================================
-- Core.lua -- namespace, saved variables, API capability probe, bootstrap.
-- ===========================================================================

local U = ns.U

ns.NAME      = addonName
ns.VERSION   = "1.2.3"
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
	-- Needed to tell an NPC from a player before anything is written down.
	-- Without it the roster logger refuses to run at all, rather than risk
	-- recording the name of somebody's character.
	unitIsPlayer = (type(UnitIsPlayer) == "function") and true or false,
	-- C_Secrets.ShouldUnitIdentityBeSecret(unit) says whether a name read for
	-- that unit would come back secret, so we can decline to ask at all.
	identityProbe = (C_Secrets and type(C_Secrets.ShouldUnitIdentityBeSecret) == "function") and true or false,
	-- C_Map.GetAreaInfo(areaID) hands back the client's own subzone name for an
	-- AreaTable id. Present on Forever 1.60.1 and on Classic Era, and it has no
	-- secret-value predicate, so the names can simply be read.
	areaInfo     = (C_Map and type(C_Map.GetAreaInfo) == "function") and true or false,
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
	logNPCs          = true,   -- note the NPCs actually standing in the world
	npcs             = {},     -- ["name|Zone"] = { name, zone, sub, count, id }
	areaScan         = {},     -- the last /ftn areas result: { when, total, missing }

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

-- NPCs the player has actually stood in front of.
--
-- The same problem as the place list, one step worse. The character worklist
-- for 1.3 was built from the wiki, and the wiki cannot answer the two
-- questions that matter: whether an NPC exists in this client at all, and
-- which zone it stands in. It lists characters who were added years after
-- vanilla, and it files Orgrim Doomhammer under Durotar, where he cannot be
-- targeted because he is dead. The client can answer both, so let it.
--
-- What goes in: the name exactly as the client spells it, the zone and subzone
-- it was seen in, and a count. Nothing else, and nothing about players.
local NPC_CAP = 1200

function ns.RecordNPC(name, zone, sub, id)
	local db = ns.db
	if not (db and db.logNPCs and name and zone) then return end

	local key = name .. "|" .. zone
	local rec = db.npcs[key]
	if rec then
		rec.count = (rec.count or 0) + 1
		-- Keep the first subzone seen. A wandering guard reports a different
		-- one every few steps and the first is as good as any. The id is worth
		-- filling in late, though: the first sighting may have been in combat
		-- or in an instance, where the client would not give one.
		if id and not rec.id then rec.id = id end
		return
	end

	local n = 0
	for _ in pairs(db.npcs) do n = n + 1 end
	if n >= NPC_CAP then return end

	db.npcs[key] = { name = name, zone = zone, sub = sub, count = 1, id = id }
end

function ns.NPCList()
	local out = {}
	if not (ns.db and ns.db.npcs) then return out end
	for _, rec in pairs(ns.db.npcs) do out[#out + 1] = rec end
	table.sort(out, function(a, b)
		if a.zone ~= b.zone then return a.zone < b.zone end
		if a.count ~= b.count then return a.count > b.count end
		return a.name < b.name
	end)
	return out
end

-- Every place the client has a name for.
--
-- The gap list and the roster both wait for the player to walk somewhere. This
-- does not: C_Map.GetAreaInfo turns an AreaTable id into the subzone name the
-- client would report for it, so walking the ids walks the whole world from a
-- standing start. That is the only way to get at Forever's new zones, whose
-- subzone names appear in no outside source at all.
--
-- The wiki documents no id range and no behaviour for an unused id, so this
-- assumes nothing: U.CallStr turns anything that is not a plain string into
-- nil, and nil ids are simply skipped. Chunked across frames because twenty
-- thousand lookups in one go would be felt as a freeze.
local AREA_SCAN_MAX = 20000
local AREA_CHUNK = 400

function ns.ScanAreas(maxId, onDone)
	if type(maxId) ~= "number" or maxId < 1 then maxId = AREA_SCAN_MAX end
	if not ns.has.areaInfo then
		if onDone then onDone(nil, "this client has no C_Map.GetAreaInfo") end
		return
	end

	local found, seen = {}, {}
	local id = 1

	local function step()
		local stop = id + AREA_CHUNK - 1
		if stop > maxId then stop = maxId end
		for i = id, stop do
			local name = U.CallStr(C_Map.GetAreaInfo, i)
			-- Many ids share a name. Keep the first and count the rest.
			if name then
				local key = U.Key(name)
				if key and not seen[key] then
					seen[key] = true
					found[#found + 1] = { id = i, name = name }
				end
			end
		end
		id = stop + 1
		if id > maxId then
			if onDone then onDone(found, nil) end
		else
			U.After(0, step)
		end
	end

	step()
end

-- Split a scan into what the database already covers and what it does not.
-- The misses are the worklist: real place names, spelled the way the client
-- spells them, with nothing written for them yet.
function ns.AreaGaps(found)
	local known, missing = 0, {}
	for i = 1, #(found or {}) do
		local a = found[i]
		if ns.FindZone(a.name) or ns.FindSub(a.name) or ns.FindInstance(a.name) then
			known = known + 1
		else
			missing[#missing + 1] = a
		end
	end
	return known, missing
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
