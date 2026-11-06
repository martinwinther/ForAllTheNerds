local addonName, ns = ...

-- ===========================================================================
-- Detect.lua -- works out where the player is and decides whether to speak.
--
-- Zone names are read with the long-standing globals GetZoneText,
-- GetSubZoneText, GetMinimapZoneText and GetRealZoneText, all of which exist
-- on the Mainline API surface Forever shares and on Classic Era. Every read
-- goes through U.CallStr, which guards against the call being absent and
-- against Midnight-style secret values.
--
-- Nothing here touches the combat log, unit health or any other API in the
-- "secret value" family, so the addon has no exposure to those restrictions.
-- ===========================================================================

local U = ns.U

local D = {}
ns.Detect = D

-- Current resolved location
D.zoneName    = nil
D.subName     = nil
D.entry       = nil   -- the lore entry we would show for "here"
D.zoneEntry   = nil   -- the containing zone's entry, if any
D.inInstance  = false

local pending        -- a place we wanted to announce but could not yet
local throttleQueued = false

-- ---------------------------------------------------------------------------
-- Reading the client
-- ---------------------------------------------------------------------------

local function readInstance()
	if type(IsInInstance) ~= "function" then return false, nil end
	local ok, inInstance, instType = pcall(IsInInstance)
	if not ok or not inInstance then return false, nil end
	-- Instance name: GetInstanceInfo's first return. Fall back to zone text.
	local name = U.CallStr(GetInstanceInfo)
	if not name then name = U.CallStr(GetRealZoneText) end
	if not name then name = U.CallStr(GetZoneText) end
	return true, name, instType
end

-- Resolve the best lore entry for where we are standing.
-- Returns entry, zoneEntry, zoneName, subName
function D:Resolve()
	local inInstance, instanceName = readInstance()

	local zoneName = U.CallStr(GetZoneText) or U.CallStr(GetRealZoneText)
	local subName  = U.CallStr(GetSubZoneText)
	local miniName = U.CallStr(GetMinimapZoneText)

	local zoneEntry = zoneName and ns.FindZone(zoneName) or nil

	-- 1. Inside an instance, the instance entry is the most specific thing we have.
	if inInstance and instanceName then
		local inst = ns.FindInstance(instanceName)
		if inst and ns.IsVisible(inst) then
			return inst, zoneEntry, zoneName, subName
		end
		-- Some instances are registered as subzones of their parent zone
		-- (the Deadmines, Shadowfang Keep, Wailing Caverns and so on).
		local asSub = ns.FindSub(instanceName, zoneName)
		if asSub and ns.IsVisible(asSub) then
			return asSub, zoneEntry, zoneName, subName
		end
		local asZone = ns.FindZone(instanceName)
		if asZone and ns.IsVisible(asZone) then
			return asZone, zoneEntry, zoneName, subName
		end
	end

	-- 2. The subzone, if we know it. This is the Goldshire / Northshire Abbey
	--    case. FindSubIn requires the entry's parent to be the zone we are
	--    actually standing in, so a name shared across zones cannot mismatch.
	if subName then
		local sub = ns.FindSubIn(subName, zoneName)
		if sub and ns.IsVisible(sub) then
			return sub, zoneEntry, zoneName, subName
		end
	end

	-- 3. The minimap label sometimes carries a finer-grained name than
	--    GetSubZoneText, particularly on the edges of a subzone.
	if miniName and miniName ~= subName then
		local sub = ns.FindSubIn(miniName, zoneName)
		if sub and ns.IsVisible(sub) then
			return sub, zoneEntry, zoneName, miniName
		end
	end

	-- 4. Fall back to the zone itself.
	if zoneEntry and ns.IsVisible(zoneEntry) then
		return zoneEntry, zoneEntry, zoneName, subName
	end

	return nil, zoneEntry, zoneName, subName
end

-- ---------------------------------------------------------------------------
-- Deciding whether to speak
-- ---------------------------------------------------------------------------

local function kindAllowed(entry)
	local db = ns.db
	if not db then return false end
	if entry.kind == "zone" then return db.toastZones end
	if entry.kind == "sub" then return db.toastSubzones end
	if entry.kind == "instance" then return db.toastDungeons end
	return true
end

local function inCombat()
	if type(UnitAffectingCombat) ~= "function" then return false end
	local ok, result = pcall(UnitAffectingCombat, "player")
	-- UnitAffectingCombat can return a secret boolean on Midnight-family
	-- clients. If we cannot read it, assume we are not in combat rather than
	-- silently suppressing everything forever.
	if not ok then return false end
	if ns.has.secrets and issecretvalue(result) then return false end
	return result and true or false
end

-- A taxi route crosses a great many zones and subzones in a couple of minutes.
-- Announcing each one as it passes underneath is noise, and marking them seen
-- is worse than noise: with "only the first time I ever visit" turned on it
-- would quietly burn the first visit for every place the player has flown over
-- and never actually stood in.
local function onTaxi()
	if type(UnitOnTaxi) ~= "function" then return false end
	local ok, result = pcall(UnitOnTaxi, "player")
	if not ok then return false end
	if ns.has.secrets and issecretvalue(result) then return false end
	return result and true or false
end

D.OnTaxi = onTaxi

function D:Announce(entry, force)
	local db = ns.db
	if not (db and entry) then return end

	if not force then
		if not db.enabled then return end
		-- Checked before anything can write to the DB, so a flyover leaves no
		-- trace in `seen` or `lastShown`.
		if db.suppressOnTaxi and onTaxi() then return end
		if not db.autoToast then return end
		if not kindAllowed(entry) then return end
		if not ns.ShouldAnnounce(entry.key) then return end
		if db.suppressInCombat and inCombat() then
			pending = entry
			return
		end
		if db.suppressInInstance and self.inInstance and entry.kind ~= "instance" then return end
	end

	ns.MarkSeen(entry.key)

	if db.autoOpenPanel and not force then
		if ns.Panel then ns.Panel:Show(entry) end
	elseif ns.Toast then
		ns.Toast:Show(entry)
	end

	if db.chatEcho then
		U.Print("|cffffd100%s|r -- %s", entry.name, entry.hook)
	end
end

-- ---------------------------------------------------------------------------
-- Event handling
-- ---------------------------------------------------------------------------

-- Is there an entry for here that the spoiler setting is hiding? Walking into
-- one of Forever's new dungeons and getting nothing at all looks like the addon
-- is broken, when in fact it has a write-up and has been told not to show it.
local hinted = {}

local function hiddenEntryFor(zoneName, subName)
	local function check(e)
		if e and e.spoiler and not ns.IsVisible(e) then return e end
		return nil
	end
	if subName then
		local e = check(ns.FindSubIn(subName, zoneName)) or check(ns.FindInstance(subName))
		if e then return e end
	end
	if zoneName then
		local e = check(ns.FindInstance(zoneName)) or check(ns.FindZone(zoneName))
		if e then return e end
	end
	return nil
end

function D:Update(force)
	local entry, zoneEntry, zoneName, subName = self:Resolve()
	local inInstance = select(1, readInstance())

	local changed = (entry ~= self.entry)

	self.entry      = entry
	self.zoneEntry  = zoneEntry
	self.zoneName   = zoneName
	self.subName    = subName
	self.inInstance = inInstance

	-- Note anything the client names that has no entry, including the common
	-- case where a subzone is unwritten and we quietly fell back to the zone.
	-- Looked up without the spoiler filter, so Forever's hidden entries are not
	-- reported as missing.
	if zoneName then
		if subName then
			if not (ns.FindSubIn(subName, zoneName) or ns.FindInstance(subName)) then
				ns.RecordUnknown(zoneName, subName)
			end
		elseif not (ns.FindZone(zoneName) or ns.FindInstance(zoneName)) then
			ns.RecordUnknown(zoneName, nil)
		end
	end

	-- Nothing to show, but something written: say so once per place per session.
	if not entry and ns.db and ns.db.enabled then
		local hidden = hiddenEntryFor(zoneName, subName)
		if hidden and not hinted[hidden.key] then
			hinted[hidden.key] = true
			U.Print("%s has an entry, but it is one of Forever's new places and those are hidden by default. Turn them on with /ftn forever on.",
				hidden.name)
		end
	end

	if entry and (changed or force) then
		self:Announce(entry, force)
	end

	if ns.Panel and ns.Panel.OnLocationChanged then
		ns.Panel:OnLocationChanged(entry)
	end
end

-- Zone events fire in bursts: crossing a subzone boundary can produce
-- ZONE_CHANGED and ZONE_CHANGED_INDOORS together, and the client's zone
-- strings are briefly stale right after a load screen. Coalesce into one
-- update a short moment later.
local function queueUpdate(delay)
	if throttleQueued then return end
	throttleQueued = true
	U.After(delay or 0.6, function()
		throttleQueued = false
		local ok, err = pcall(function() D:Update(false) end)
		if not ok then U.Debug("update failed: %s", tostring(err)) end
	end)
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ZONE_CHANGED")
f:RegisterEvent("ZONE_CHANGED_INDOORS")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_CONTROL_GAINED")

f:SetScript("OnEvent", function(_, event)
	if not ns.db then return end

	if event == "PLAYER_REGEN_ENABLED" then
		-- Combat ended. Show whatever we held back, if it is still relevant.
		if pending then
			local held = pending
			pending = nil
			if held == D.entry and ns.ShouldAnnounce(held.key) then
				D:Announce(held, false)
			end
		end
		return
	end

	if event == "PLAYER_CONTROL_GAINED" then
		-- Just dismounted from a flight path, most likely. The zone string may
		-- not have changed since the last place we flew over, so forget what we
		-- thought we were standing in and look again properly.
		D.entry = nil
		queueUpdate(1.5)
		return
	end

	if event == "PLAYER_ENTERING_WORLD" then
		-- Longer delay: zone strings are not reliable immediately after a load.
		queueUpdate(2.0)
	else
		queueUpdate(0.6)
	end
end)

ns.OnReady(function()
	queueUpdate(2.0)
end)
