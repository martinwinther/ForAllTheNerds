local addonName, ns = ...

-- ===========================================================================
-- Data/Index.lua -- runs after every data file has registered.
-- Resolves collisions, builds the counts and the browse lists.
-- ===========================================================================

local U = ns.U

ns.Index = { total = 0, zones = 0, subs = 0, instances = 0, continents = {} }

-- A few places are registered both as a zone (because GetZoneText returns them
-- when you are inside) and as a subzone of their parent region (because the
-- lore file that described the region listed them). Thunder Bluff and Darnassus
-- are the obvious cases. Drop the subzone copy so searches do not show the
-- same place twice, and so the zone entry (which is the fuller write-up) wins.
local function dedupe()
	local dropped = 0
	for key, entry in pairs(ns.Subzones) do
		if ns.Zones[key] then
			if entry.multi then
				-- Keep only the ones whose parent differs from the zone's own name,
				-- i.e. genuinely distinct places that happen to share a name.
				local keep = {}
				for i = 1, #entry do
					if U.Key(entry[i].parent) ~= key then keep[#keep + 1] = entry[i] end
				end
				if #keep == 0 then
					ns.Subzones[key] = nil
					dropped = dropped + 1
				elseif #keep == 1 then
					ns.Subzones[key] = keep[1]
				else
					keep.multi = true
					ns.Subzones[key] = keep
				end
			else
				ns.Subzones[key] = nil
				dropped = dropped + 1
			end
		end
	end
	return dropped
end

-- Aliases index the SAME entry table under several keys, so counting keys
-- would count an aliased entry once per alias. Count distinct entries.
local function countBucket(bucket)
	local seen, n = {}, 0
	for _, entry in pairs(bucket) do
		local list = entry.multi and entry or { entry }
		for i = 1, #list do
			if not seen[list[i]] then
				seen[list[i]] = true
				n = n + 1
			end
		end
	end
	return n
end

local function build()
	local dropped = dedupe()

	ns.Index.zones     = countBucket(ns.Zones)
	ns.Index.subs      = countBucket(ns.Subzones)
	ns.Index.instances = countBucket(ns.Instances)
	ns.Index.total     = ns.Index.zones + ns.Index.subs + ns.Index.instances

	-- Group zones by continent for /ftn list.
	local byContinent = {}
	for i = 1, #ns.zoneOrder do
		local z = ns.zoneOrder[i]
		local c = z.continent or "Elsewhere"
		byContinent[c] = byContinent[c] or {}
		table.insert(byContinent[c], z)
	end
	for _, list in pairs(byContinent) do
		table.sort(list, function(a, b) return a.name < b.name end)
	end
	ns.Index.continents = byContinent

	-- Attach each subzone to its parent so the panel can offer "nearby" links.
	ns.Index.children = {}
	local seenChild = {}
	local function indexChildren(bucket)
		for _, entry in pairs(bucket) do
			local list = entry.multi and entry or { entry }
			for i = 1, #list do
				local e = list[i]
				if e.parent and not seenChild[e] then
					seenChild[e] = true
					local pk = U.Key(e.parent)
					if pk then
						ns.Index.children[pk] = ns.Index.children[pk] or {}
						table.insert(ns.Index.children[pk], e)
					end
				end
			end
		end
	end
	indexChildren(ns.Subzones)
	for _, list in pairs(ns.Index.children) do
		table.sort(list, function(a, b) return a.name < b.name end)
	end

	U.Debug("index built: %d zones, %d subzones, %d instances (%d duplicate subzone keys dropped)",
		ns.Index.zones, ns.Index.subs, ns.Index.instances, dropped)
end

ns.OnReady(build)

-- Flat iterator over every distinct entry, used by the validator's coverage
-- report and by /ftn search. Deduplicates by identity so an entry registered
-- under several aliases is visited once.
function ns.EachEntry(fn)
	local seen = {}
	local function walk(bucket)
		for _, entry in pairs(bucket) do
			local list = entry.multi and entry or { entry }
			for i = 1, #list do
				local e = list[i]
				if not seen[e] then
					seen[e] = true
					fn(e)
				end
			end
		end
	end
	walk(ns.Zones)
	walk(ns.Subzones)
	walk(ns.Instances)
end
