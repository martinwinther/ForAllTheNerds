local addonName, ns = ...

-- ===========================================================================
-- Data/Schema.lua -- the registration API the lore files call into.
--
-- Entries are keyed by NAME, not by uiMapID. That is deliberate: Forever's new
-- zones have map ids nobody outside Blizzard has catalogued yet, and subzones
-- (Goldshire, Northshire Abbey) have never had map ids at all. GetZoneText and
-- GetSubZoneText return the localised display name, which is what we match on.
--
-- Entry shape:
--   name        string   display name, exactly as the client spells it
--   kind        string   "zone" | "sub" | "instance"
--   continent   string   "Eastern Kingdoms" | "Kalimdor" | "Elemental Plane" | ...
--   parent      string   for subzones: the zone that contains them
--   faction     string   "Alliance" | "Horde" | "Contested" | "Neutral" | "Hostile"
--   levels      string   free text, e.g. "1-10", "55-60", "Capital"
--   hook        string   ONE line. This is what the toast shows.
--   lore        table    ordered paragraphs, 1-4 of them, each 2-5 sentences
--   didYouKnow  string   optional single curiosity
--   readMore    table    optional source hints, e.g. { "Wowpedia: Elwynn Forest" }
--   era         string   "pre-wow" | "vanilla" | "forever"
--   spoiler     boolean  true = hidden unless the user opts in
--   aliases     table    other strings the client might report for this place
-- ===========================================================================

local U = ns.U

ns.Zones     = {}
ns.Subzones  = {}
ns.Instances = {}

-- Registration order, so /ftn list can print things in a sensible sequence.
ns.zoneOrder = {}

local function warn(fmt, ...)
	-- Only surfaces with /ftn debug on, so a typo in a data file is findable
	-- without nagging ordinary users.
	U.Debug("|cffff9966data:|r " .. string.format(fmt, ...))
end

local function validate(entry, kind)
	if type(entry) ~= "table" then return false, "entry is not a table" end
	if type(entry.name) ~= "string" or entry.name == "" then return false, "missing name" end
	if type(entry.hook) ~= "string" or entry.hook == "" then
		return false, "missing hook for " .. entry.name
	end
	if type(entry.lore) ~= "table" or #entry.lore == 0 then
		return false, "missing lore for " .. entry.name
	end
	for i = 1, #entry.lore do
		if type(entry.lore[i]) ~= "string" then
			return false, string.format("lore[%d] of %s is not a string", i, entry.name)
		end
	end
	if kind == "sub" and type(entry.parent) ~= "string" then
		return false, "subzone " .. entry.name .. " has no parent"
	end
	return true
end

local function finish(entry, kind)
	entry.kind = kind
	entry.era = entry.era or "vanilla"
	entry.faction = entry.faction or "Contested"
	if entry.spoiler == nil then entry.spoiler = false end
	return entry
end

-- Index an entry under its own name plus any aliases.
local function put(bucket, entry)
	local key = U.Key(entry.name)
	if not key then return end
	entry.key = key

	if bucket[key] then
		-- Name collision. Subzone names repeat across the world ("The Crossroads"
		-- does not, but "Ruins of ..." and camp names do), so keep a list and let
		-- the resolver pick by parent zone.
		local existing = bucket[key]
		if existing.multi then
			existing[#existing + 1] = entry
		else
			bucket[key] = { multi = true, existing, entry }
		end
	else
		bucket[key] = entry
	end

	if entry.aliases then
		for i = 1, #entry.aliases do
			local ak = U.Key(entry.aliases[i])
			if ak and not bucket[ak] then bucket[ak] = entry end
		end
	end
end

-- ---------------------------------------------------------------------------
-- Public registration
-- ---------------------------------------------------------------------------

function ns.Zone(entry)
	local ok, err = validate(entry, "zone")
	if not ok then warn("%s", err) return end
	put(ns.Zones, finish(entry, "zone"))
	ns.zoneOrder[#ns.zoneOrder + 1] = entry
end

function ns.Sub(entry)
	local ok, err = validate(entry, "sub")
	if not ok then warn("%s", err) return end
	put(ns.Subzones, finish(entry, "sub"))
end

function ns.Instance(entry)
	local ok, err = validate(entry, "instance")
	if not ok then warn("%s", err) return end
	put(ns.Instances, finish(entry, "instance"))
end

-- Register many subzones of one parent in a compact form:
--   ns.SubsOf("Elwynn Forest", { { name=..., hook=..., lore={...} }, ... })
function ns.SubsOf(parent, list)
	if type(list) ~= "table" then return end
	for i = 1, #list do
		local e = list[i]
		if type(e) == "table" then
			e.parent = e.parent or parent
			ns.Sub(e)
		end
	end
end

-- ---------------------------------------------------------------------------
-- Lookup
-- ---------------------------------------------------------------------------

-- Pick the right entry out of a collision list using the containing zone.
local function disambiguate(found, zoneName)
	if not found then return nil end
	if not found.multi then return found end
	local zk = U.Key(zoneName)
	for i = 1, #found do
		if zk and U.Key(found[i].parent) == zk then return found[i] end
	end
	return found[1]
end

function ns.FindZone(name)
	local key = U.Key(name)
	if not key then return nil end
	return disambiguate(ns.Zones[key], name)
end

function ns.FindSub(name, zoneName)
	local key = U.Key(name)
	if not key then return nil end
	return disambiguate(ns.Subzones[key], zoneName)
end

-- Like FindSub, but REQUIRES that the entry belongs to the zone we are in.
-- Without this, standing in a zone whose own entry is hidden (a Forever zone
-- with the spoiler option off, say) could match an unrelated subzone that
-- happens to share a name with whatever the minimap is reporting.
function ns.FindSubIn(name, zoneName)
	local key = U.Key(name)
	if not key then return nil end
	local found = ns.Subzones[key]
	if not found then return nil end
	local zk = U.Key(zoneName)
	local list = found.multi and found or { found }
	for i = 1, #list do
		local e = list[i]
		if not e.parent then return e end
		if zk and U.Key(e.parent) == zk then return e end
	end
	return nil
end

function ns.FindInstance(name)
	local key = U.Key(name)
	if not key then return nil end
	return disambiguate(ns.Instances[key], name)
end

-- Is this entry allowed to be shown under the current settings?
function ns.IsVisible(entry)
	if not entry then return false end
	if entry.spoiler and not (ns.db and ns.db.showForeverContent) then return false end
	return true
end

-- Search every bucket for a loose substring match. Used by /ftn <name>.
function ns.Search(query, limit)
	local q = U.Key(query)
	if not q then return {} end
	limit = limit or 12
	local hits, seen = {}, {}

	local function scan(bucket)
		for key, entry in pairs(bucket) do
			local list = entry.multi and entry or { entry }
			for i = 1, #list do
				local e = list[i]
				if ns.IsVisible(e) and not seen[e] then
					local ek = U.Key(e.name)
					if ek and (ek == q or string.find(ek, q, 1, true)) then
						seen[e] = true
						-- exact matches first, then shorter names
						hits[#hits + 1] = { entry = e, score = (ek == q) and 0 or U.Len(e.name) }
					end
				end
			end
		end
	end

	scan(ns.Zones)
	scan(ns.Instances)
	scan(ns.Subzones)

	table.sort(hits, function(a, b)
		if a.score ~= b.score then return a.score < b.score end
		return a.entry.name < b.entry.name
	end)

	local out = {}
	for i = 1, math.min(#hits, limit) do out[i] = hits[i].entry end
	return out
end
