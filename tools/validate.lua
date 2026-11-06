#!/usr/bin/env lua
-- ===========================================================================
-- tools/validate.lua
--
-- Loads the whole addon outside WoW against tools/mock_wow.lua, then:
--   1. checks every data file actually registered without error
--   2. runs data-quality rules over every lore entry
--   3. walks a list of real locations and asserts the right entry resolves
--   4. smoke-tests every slash command
--
-- Run:  lua tools/validate.lua            (from the repo root)
--       FTN_VERBOSE=1 lua tools/validate.lua      to see the addon's output
--       FTN_NO_TEMPLATES=1 lua tools/validate.lua to exercise UI fallbacks
--       FTN_NO_SETTINGS=1 lua tools/validate.lua  to exercise legacy options
-- ===========================================================================

local ADDON_NAME = "ForAllTheNerds"

-- Allow running from either the repo root or tools/.
local function exists(path)
	local fh = io.open(path, "r")
	if fh then fh:close() return true end
	return false
end

-- The addon files sit at the repository root, which is what the BigWigs
-- packager expects when it builds a release.
local root = ""
if not exists(ADDON_NAME .. ".toc") then
	if exists("../" .. ADDON_NAME .. ".toc") then
		root = "../"
	else
		io.stderr:write("cannot find " .. ADDON_NAME .. ".toc\n")
		os.exit(2)
	end
end

package.path = root .. "tools/?.lua;" .. package.path
local mock = require("mock_wow")
mock.install()

-- ---------------------------------------------------------------------------
-- Reporting
-- ---------------------------------------------------------------------------

local errors, warnings, notes = {}, {}, {}
local function fail(fmt, ...) errors[#errors + 1] = string.format(fmt, ...) end
local function warn(fmt, ...) warnings[#warnings + 1] = string.format(fmt, ...) end
local function note(fmt, ...) notes[#notes + 1] = string.format(fmt, ...) end

local out = mock.realPrint
local function section(title)
	out("")
	out("== " .. title .. " " .. string.rep("=", math.max(0, 62 - #title)))
end

-- ---------------------------------------------------------------------------
-- 1. Load the addon in TOC order
-- ---------------------------------------------------------------------------

section("Loading")

local tocPath = root .. ADDON_NAME .. ".toc"
local files, interfaceLine, savedVars = {}, nil, nil

for rawLine in io.lines(tocPath) do
	local line = rawLine:gsub("\r", ""):gsub("^%s+", ""):gsub("%s+$", "")
	if line:match("^##%s*Interface:") then
		interfaceLine = line:match("^##%s*Interface:%s*(.+)$")
	elseif line:match("^##%s*SavedVariables:") then
		savedVars = line:match("^##%s*SavedVariables:%s*(.+)$")
	elseif line ~= "" and not line:match("^#") then
		files[#files + 1] = line
	end
end

out(string.format("TOC lists %d files, Interface: %s", #files, tostring(interfaceLine)))

-- Forever's interface version. 16001 must be present or the addon loads
-- flagged out-of-date on the client it is written for.
if not (interfaceLine and interfaceLine:find("16001", 1, true)) then
	fail("TOC Interface line does not include 16001 (WoW: Forever): %s", tostring(interfaceLine))
end
if not savedVars or not savedVars:find("ForAllTheNerdsDB", 1, true) then
	fail("TOC does not declare SavedVariables: ForAllTheNerdsDB")
end

local ns = {}
local loaded = 0

for i = 1, #files do
	local rel = files[i]:gsub("\\", "/")
	local path = root .. rel
	if not exists(path) then
		fail("TOC lists a file that does not exist: %s", rel)
	else
		local chunk, loadErr = loadfile(path)
		if not chunk then
			fail("%s failed to parse: %s", rel, tostring(loadErr))
		else
			local ok, runErr = pcall(chunk, ADDON_NAME, ns)
			if not ok then
				fail("%s failed to run: %s", rel, tostring(runErr))
			else
				loaded = loaded + 1
			end
		end
	end
end

out(string.format("Loaded %d/%d files", loaded, #files))

if #errors > 0 then
	section("Load errors")
	for i = 1, #errors do out("  FAIL  " .. errors[i]) end
	os.exit(1)
end

-- ---------------------------------------------------------------------------
-- 2. Boot: ADDON_LOADED then PLAYER_LOGIN
-- ---------------------------------------------------------------------------

section("Boot")

_G.ForAllTheNerdsDB = {}
local firedA = mock.fire("ADDON_LOADED", ADDON_NAME)
if not ns.db then
	fail("ns.db was not created by ADDON_LOADED (%d handlers fired)", firedA)
	section("Errors")
	for i = 1, #errors do out("  FAIL  " .. errors[i]) end
	os.exit(1)
end

local firedL = mock.fire("PLAYER_LOGIN")
mock.advance(3)

out(string.format("ADDON_LOADED -> %d handlers, PLAYER_LOGIN -> %d handlers", firedA, firedL))
out(string.format("Detected flavour: %s", tostring(ns.flavour)))
-- What flavour SHOULD we have detected, given how the mock was configured?
local expectFlavour = "forever"
local pid = tonumber(os.getenv("FTN_PROJECT_ID") or "") or 18
local toc = tonumber(os.getenv("FTN_TOC") or "") or 16001
if pid == 2 then
	expectFlavour = "classic"
elseif pid == 1 then
	expectFlavour = (toc >= 16000 and toc < 17000) and "forever" or "retail"
elseif pid ~= 18 then
	expectFlavour = "unknown"
end
if ns.flavour ~= expectFlavour then
	fail("flavour detected as %s, expected %s for PROJECT_ID %d / interface %d",
		tostring(ns.flavour), expectFlavour, pid, toc)
else
	out(string.format("  (correct for PROJECT_ID %d / interface %d)", pid, toc))
end

if not ns.ready then fail("ns.ready was never set; OnReady callbacks did not run") end
if not ns.Index or ns.Index.total == 0 then fail("the lore index is empty") end

out(string.format("Index: %d entries total (%d zones, %d locales, %d instances)",
	ns.Index.total, ns.Index.zones, ns.Index.subs, ns.Index.instances))

for _, cap in ipairs({ "timer", "map", "settings", "secrets", "backdrop" }) do
	out(string.format("  capability %-10s %s", cap, tostring(ns.has[cap])))
end

-- ---------------------------------------------------------------------------
-- 3. Data quality
-- ---------------------------------------------------------------------------

section("Data quality")

local HOOK_MAX = 120     -- the toast is one line; longer than this wraps badly
local PARA_MIN = 60      -- a paragraph shorter than this is a stub
local PARA_MAX = 900
local LORE_MAX_PARAS = 5

local seenNames = {}
local counts = { zone = 0, sub = 0, instance = 0 }
local foreverCount, spoilerCount = 0, 0
local hookTotal, paraTotal = 0, 0

ns.EachEntry(function(e)
	counts[e.kind] = (counts[e.kind] or 0) + 1

	-- name / key
	if not e.key then fail("%s has no key", tostring(e.name)) end
	local nameKey = (e.kind or "?") .. "|" .. tostring(e.key) .. "|" .. tostring(e.parent or "")
	if seenNames[nameKey] then
		fail("duplicate entry: %s (%s) registered twice with the same parent", e.name, e.kind)
	end
	seenNames[nameKey] = true

	-- hook
	if #e.hook > HOOK_MAX then
		warn("hook is %d chars (max %d) for %s: %s", #e.hook, HOOK_MAX, e.name, e.hook:sub(1, 50) .. "...")
	end
	if e.hook:sub(-1) == "." or e.hook:sub(-1) == "!" or e.hook:sub(-1) == "?" then
		-- fine, just noting style consistency
	end
	hookTotal = hookTotal + #e.hook

	-- lore
	if #e.lore > LORE_MAX_PARAS then
		warn("%s has %d lore paragraphs (max %d)", e.name, #e.lore, LORE_MAX_PARAS)
	end
	for i = 1, #e.lore do
		local p = e.lore[i]
		paraTotal = paraTotal + #p
		if #p < PARA_MIN then
			warn("%s lore[%d] is only %d chars: %q", e.name, i, #p, p)
		end
		if #p > PARA_MAX then
			warn("%s lore[%d] is %d chars (max %d), consider splitting", e.name, i, #p, PARA_MAX)
		end
	end

	-- structural
	if e.kind == "zone" and not e.continent then
		warn("zone %s has no continent", e.name)
	end
	if e.kind == "sub" then
		local pk = ns.U.Key(e.parent)
		if not (pk and (ns.Zones[pk] or ns.Instances[pk])) then
			warn("%s has parent %q which is not a registered zone", e.name, tostring(e.parent))
		end
	end
	if e.readMore then
		for i = 1, #e.readMore do
			if type(e.readMore[i]) ~= "string" then
				fail("%s readMore[%d] is not a string", e.name, i)
			end
		end
	end
	if e.didYouKnow and #e.didYouKnow > 500 then
		warn("%s didYouKnow is %d chars", e.name, #e.didYouKnow)
	end

	-- the spoiler contract: everything from Forever must be gated
	if e.era == "forever" then
		foreverCount = foreverCount + 1
		if not e.spoiler then
			fail("%s is era 'forever' but spoiler is not true, so it would show by default", e.name)
		end
	end
	if e.spoiler then spoilerCount = spoilerCount + 1 end
end)

local total = ns.Index.total
out(string.format("Checked %d entries: %d zones, %d locales, %d instances",
	total, counts.zone or 0, counts.sub or 0, counts.instance or 0))
out(string.format("Average hook %d chars, average lore paragraph %d chars",
	math.floor(hookTotal / math.max(total, 1)),
	math.floor(paraTotal / math.max(total, 1))))
out(string.format("Forever entries: %d (all spoiler-gated: %s)",
	foreverCount, foreverCount == spoilerCount and "yes" or "NO"))

-- Spoiler gating must actually hide them while the option is off.
ns.db.showForeverContent = false
local leaked = 0
ns.EachEntry(function(e)
	if e.spoiler and ns.IsVisible(e) then leaked = leaked + 1 end
end)
if leaked > 0 then fail("%d spoiler entries are visible with showForeverContent off", leaked) end

ns.db.showForeverContent = true
local gatedVisible = 0
ns.EachEntry(function(e) if e.spoiler and ns.IsVisible(e) then gatedVisible = gatedVisible + 1 end end)
if gatedVisible ~= spoilerCount then
	fail("only %d/%d spoiler entries become visible when opted in", gatedVisible, spoilerCount)
end
ns.db.showForeverContent = false
out("Spoiler gating: hides " .. spoilerCount .. " entries off, reveals them on")

-- ---------------------------------------------------------------------------
-- 3b. Prose style
--
-- These are the phrasings this database was deliberately edited to get rid of.
-- Keeping the check in the validator means a later batch of entries, written by
-- hand or generated, cannot quietly reintroduce them. BANNED patterns fail the
-- build; RATE patterns are allowed up to a budget per 10,000 words, because a
-- couple of uses is voice and twenty is a tic.
-- ---------------------------------------------------------------------------

section("Prose style")

-- Lua patterns, not regexes: no alternation, so each phrasing is listed.
local BANNED = {
	{ "fair summary",            "the 'is a fair summary/indicator/...' verdict clause" },
	{ "fair indicator",          "same family" },
	{ "fair comment",            "same family" },
	{ "fair measure",            "same family" },
	{ "fair picture",            "same family" },
	{ "fair illustration",       "same family" },
	{ "which is the point",      "'...,  which is the point'" },
	{ "that is the point",       "'...,  that is the point'" },
	{ "in miniature",            "'X is Y in miniature'" },
	{ "which tells you",         "'which tells you how/what...'" },
	{ "not a coincidence",       "'which is not a coincidence'" },
	{ "not accidental",          "same" },
	{ "not incidental",          "same" },
	{ "nobody is winning",       "'a fight nobody is winning'" },
	{ "most literal sense",      "'in the most literal sense'" },
	{ "fullest sense",           "'in the fullest sense'" },
	{ "by a wide margin",        "'by a wide margin'" },
	{ "grim reminder",           "'a grim reminder'" },
	{ "testament to",            "'a testament to'" },
	{ "speaks to",               "'speaks to'" },
	{ "hallmark",                "'hallmark of'" },
	{ "tapestry",                "'rich tapestry'" },
	{ "nestled",                 "'nestled in'" },
	{ "veritable",               "'a veritable'" },
	{ "myriad",                  "'myriad'" },
	{ "\226\128\148",            "em dash (use a comma, colon or full stop)" },
}

-- { pattern, label, max per 10k words }
local RATE = {
	{ ",%s+and it is",     "', and it is'",                 4 },
	{ ",%s+and it was",    "', and it was'",                4 },
	{ ",%s+and they are",  "', and they are'",              4 },
	{ ",%s+and they were", "', and they were'",             4 },
	{ ",%s+which",         "', which' clause",             12 },
	{ ",%s+so%s",          "', so' clause",                 8 },
	{ "simply",            "'simply'",                      6 },
	{ "genuine",           "'genuine' / 'genuinely'",       3 },
	{ "entirely",          "'entirely'",                    3 },
	{ "effectively",       "'effectively'",                 3 },
	{ "considerably",      "'considerably'",                3 },
	{ "largely",           "'largely'",                     3 },
	{ "a great deal",      "'a great deal'",                3 },
	{ "a reminder",        "'a reminder'",                  3 },
	{ "the usual",         "'the usual X'",                 3 },
}

-- Gather the prose: hooks, lore paragraphs and curiosities only. Reading the
-- entries rather than the files means code comments cannot pollute the counts.
local proseParts = {}
ns.EachEntry(function(e)
	proseParts[#proseParts + 1] = e.hook
	for i = 1, #e.lore do proseParts[#proseParts + 1] = e.lore[i] end
	if e.didYouKnow then proseParts[#proseParts + 1] = e.didYouKnow end
end)
local prose = table.concat(proseParts, " ")

local words = 0
for _ in string.gmatch(prose, "%S+") do words = words + 1 end
local per10k = words / 10000

local function countPattern(p)
	local n = 0
	for _ in string.gmatch(prose, p) do n = n + 1 end
	return n
end

local lower = string.lower(prose)
local bannedHits = 0
for i = 1, #BANNED do
	local phrase, why = BANNED[i][1], BANNED[i][2]
	local n = 0
	for _ in string.gmatch(lower, phrase) do n = n + 1 end
	if n > 0 then
		bannedHits = bannedHits + n
		fail("banned phrasing %q appears %d time(s): %s", phrase, n, why)
	end
end

out(string.format("%d words of prose checked against %d banned phrasings (%d hits)",
	words, #BANNED, bannedHits))

local overBudget = 0
for i = 1, #RATE do
	local p, label, budget = RATE[i][1], RATE[i][2], RATE[i][3]
	local n = countPattern(p)
	local rate = n / per10k
	if rate > budget then
		overBudget = overBudget + 1
		warn("%s used %d times (%.1f per 10k words, budget %d) -- becoming a tic",
			label, n, rate, budget)
	end
end
out(string.format("%d rate-limited phrasings checked, %d over budget", #RATE, overBudget))

-- A run of three or more sentences in one paragraph all opening "The " is the
-- rhythm that makes generated prose recognisable. Catch it per paragraph.
local runOffenders = 0
ns.EachEntry(function(e)
	for i = 1, #e.lore do
		local run, worst = 0, 0
		for sentence in string.gmatch(e.lore[i], "[^%.!?]+[%.!?]") do
			local trimmed = string.gsub(sentence, "^%s+", "")
			if string.sub(trimmed, 1, 4) == "The " then
				run = run + 1
				if run > worst then worst = run end
			else
				run = 0
			end
		end
		if worst >= 3 then
			runOffenders = runOffenders + 1
			warn("%s lore[%d] has %d consecutive sentences opening 'The '", e.name, i, worst)
		end
	end
end)
out(string.format("sentence-opening runs: %d paragraphs with 3+ consecutive 'The '", runOffenders))

-- ---------------------------------------------------------------------------
-- 4. Location resolution
-- ---------------------------------------------------------------------------

section("Location resolution")

-- { zone, subzone, expected entry name, options }
local cases = {
	{ "Elwynn Forest",      "Goldshire",            "Goldshire" },
	{ "Elwynn Forest",      "Northshire Abbey",     "Northshire Abbey" },
	{ "Elwynn Forest",      "",                     "Elwynn Forest" },
	{ "Elwynn Forest",      "Some Unwritten Copse", "Elwynn Forest" },
	{ "Westfall",           "Sentinel Hill",        "Sentinel Hill" },
	{ "Dun Morogh",         "Kharanos",             "Kharanos" },
	{ "Tirisfal Glades",    "Brill",                "Brill" },
	{ "The Barrens",        "The Crossroads",       "The Crossroads" },
	{ "Durotar",            "Razor Hill",           "Razor Hill" },
	{ "Mulgore",            "Bloodhoof Village",    "Bloodhoof Village" },
	{ "Teldrassil",         "Dolanaar",             "Dolanaar" },
	{ "Ashenvale",          "Astranaar",            "Astranaar" },
	{ "Stormwind City",     "Trade District",       "Trade District" },
	{ "Ironforge",          "The Great Forge",      "The Great Forge" },
	{ "Orgrimmar",          "Valley of Strength",   "Valley of Strength" },
	{ "Thunder Bluff",      "Elder Rise",           "Elder Rise" },
	{ "Thunder Bluff",      "",                     "Thunder Bluff" },
	{ "Darnassus",          "Temple of the Moon",   "Temple of the Moon" },
	{ "Undercity",          "The Apothecarium",     "The Apothecarium" },
	{ "Silithus",           "Cenarion Hold",        "Cenarion Hold" },
	{ "Un'Goro Crater",     "Marshal's Refuge",     "Marshal's Refuge" },
	{ "Deadwind Pass",      "Karazhan",             "Karazhan" },
	{ "Burning Steppes",    "Blackrock Mountain",   "Blackrock Mountain" },
	{ "Feralas",            "Dire Maul",            "Dire Maul" },
	{ "Moonglade",          "Nighthaven",           "Nighthaven" },
}

local passed, failed = 0, 0
for i = 1, #cases do
	local zone, sub, expect = cases[i][1], cases[i][2], cases[i][3]
	mock.moveTo({ zone = zone, realzone = zone, subzone = sub, minimap = sub })
	local got = ns.Detect.entry and ns.Detect.entry.name or "(nothing)"
	if got == expect then
		passed = passed + 1
	else
		failed = failed + 1
		fail("at %s / %q expected %q but resolved %q", zone, sub, expect, got)
	end
end

-- Instances resolve from the instance name, not the parent zone.
local instanceCases = {
	{ "The Deadmines",   "The Deadmines" },
	{ "Shadowfang Keep", "Shadowfang Keep" },
	{ "Wailing Caverns", "Wailing Caverns" },
	{ "Molten Core",     "Molten Core" },
	{ "Naxxramas",       "Naxxramas" },
	{ "Scholomance",     "Scholomance" },
	{ "The Stockade",    "The Stockade" },
	{ "Ragefire Chasm",  "Ragefire Chasm" },
	{ "Blackwing Lair",  "Blackwing Lair" },
	{ "Alterac Valley",  "Alterac Valley" },
}
for i = 1, #instanceCases do
	local name, expect = instanceCases[i][1], instanceCases[i][2]
	mock.moveTo({
		zone = name, realzone = name, subzone = "",
		inInstance = true, instanceType = "party", instanceName = name,
	})
	local got = ns.Detect.entry and ns.Detect.entry.name or "(nothing)"
	if got == expect then
		passed = passed + 1
	else
		failed = failed + 1
		fail("inside instance %q expected %q but resolved %q", name, expect, got)
	end
end

-- A Forever zone must stay silent until opted in, then resolve.
mock.moveTo({ zone = "Mount Hyjal", realzone = "Mount Hyjal", subzone = "" })
if ns.Detect.entry then
	fail("Mount Hyjal resolved to %q with Forever content turned off", ns.Detect.entry.name)
else
	passed = passed + 1
end

ns.db.showForeverContent = true
mock.moveTo({ zone = "Riverglades", realzone = "Riverglades", subzone = "Powderfuse Port" })
if ns.Detect.entry and ns.Detect.entry.name == "Powderfuse Port" then
	passed = passed + 1
else
	failed = failed + 1
	fail("Powderfuse Port did not resolve with Forever content on (got %q)",
		ns.Detect.entry and ns.Detect.entry.name or "nothing")
end
ns.db.showForeverContent = false

-- Exhaustive sweep: for EVERY registered locale, stand in its declared parent
-- zone with its own name as the subzone and assert it resolves to itself. This
-- is what catches an entry whose `parent` does not match the zone the client
-- actually reports, which would otherwise just silently fall back to the zone.
ns.db.showForeverContent = true
local sweepOK, sweepBad = 0, 0
local badList = {}
local checked = {}
ns.EachEntry(function(e)
	if e.kind ~= "sub" or checked[e] then return end
	checked[e] = true
	-- Skip the ones that are really instances: inside them the client reports
	-- the instance name as the zone, which the instance branch handles.
	mock.moveTo({ zone = e.parent, realzone = e.parent, subzone = e.name, minimap = e.name })
	local got = ns.Detect.entry
	if got == e then
		sweepOK = sweepOK + 1
	else
		sweepBad = sweepBad + 1
		if #badList < 12 then
			badList[#badList + 1] = string.format("%s (in %s) -> %s",
				e.name, tostring(e.parent), got and got.name or "nothing")
		end
	end
end)
ns.db.showForeverContent = false

if sweepBad > 0 then
	fail("%d of %d locales do not resolve from their own parent zone: %s",
		sweepBad, sweepOK + sweepBad, table.concat(badList, "; "))
end
out(string.format("Exhaustive sweep: %d/%d locales resolve from their declared parent",
	sweepOK, sweepOK + sweepBad))

out(string.format("%d resolution checks passed, %d failed", passed, failed))

-- ---------------------------------------------------------------------------
-- 5. Toast, panel and repeat suppression
-- ---------------------------------------------------------------------------

section("Behaviour")

ns.db.onlyFirstVisit = false
ns.db.repeatCooldown = 900
ns.db.seen, ns.db.lastShown = {}, {}

mock.moveTo({ zone = "Duskwood", realzone = "Duskwood", subzone = "Darkshire" })
if not ns.Toast:IsShown() then fail("no toast shown on arriving at Darkshire") else out("Toast shows on arrival") end

-- Walking away and straight back must not re-announce inside the cooldown.
mock.moveTo({ zone = "Duskwood", realzone = "Duskwood", subzone = "Raven Hill" })
ns.Toast:Hide()
mock.moveTo({ zone = "Duskwood", realzone = "Duskwood", subzone = "Darkshire" })
if ns.Toast:IsShown() then
	fail("Darkshire re-announced inside the repeat cooldown")
else
	out("Repeat cooldown suppresses a re-entry")
end

-- Combat suppression, then release on PLAYER_REGEN_ENABLED.
ns.db.seen, ns.db.lastShown = {}, {}
ns.Toast:Hide()
mock.inCombat = true
mock.moveTo({ zone = "Redridge Mountains", realzone = "Redridge Mountains", subzone = "Lakeshire" })
if ns.Toast:IsShown() then fail("toast shown during combat with suppressInCombat on") end
mock.inCombat = false
mock.fire("PLAYER_REGEN_ENABLED")
mock.advance(1)
if ns.Toast:IsShown() then
	out("Combat suppression holds the toast, then releases it")
else
	warn("toast was not released after combat ended")
end

-- Panel opens, renders and closes without error.
ns.Toast:Hide()
local okPanel, panelErr = pcall(function()
	ns.Panel:Show(ns.FindZone("Elwynn Forest"), false)
end)
if not okPanel then
	fail("panel failed to render Elwynn Forest: %s", tostring(panelErr))
elseif not ns.Panel:IsShown() then
	fail("panel did not show")
else
	out("Panel renders a zone with its child list")
end

-- Render every single entry through the panel. This is the check that catches
-- a malformed entry that only breaks when it is actually displayed.
ns.db.showForeverContent = true
local rendered, renderFails = 0, 0
ns.EachEntry(function(e)
	local ok, err = pcall(function() ns.Panel:Show(e, false) end)
	if ok then
		rendered = rendered + 1
	else
		renderFails = renderFails + 1
		fail("panel failed on %s: %s", e.name, tostring(err))
	end
end)
ns.Panel:Hide()
ns.db.showForeverContent = false
out(string.format("Rendered all %d entries in the panel (%d failures)", rendered, renderFails))

-- Toast every entry too, since it sizes itself from the hook text.
local toasted, toastFails = 0, 0
ns.db.showForeverContent = true
ns.EachEntry(function(e)
	local ok, err = pcall(function() ns.Toast:Show(e) end)
	if ok then toasted = toasted + 1 else
		toastFails = toastFails + 1
		fail("toast failed on %s: %s", e.name, tostring(err))
	end
end)
ns.Toast:Hide()
ns.db.showForeverContent = false
out(string.format("Rendered all %d entries in the toast (%d failures)", toasted, toastFails))

-- ---------------------------------------------------------------------------
-- 5b. Minimap geometry, flight paths and source links
-- ---------------------------------------------------------------------------

local U = ns.U

section("Minimap geometry")

-- The first version hardcoded an 80px radius, which put the button inside the
-- border ring on any minimap that was not the default size. Check the button
-- clears the edge across a range of sizes.
ns.db.minimapButton = true
local geomFail = 0
for _, width in ipairs({ 100, 140, 180, 240 }) do
	Minimap:SetWidth(width)
	Minimap:SetHeight(width)
	for _, angle in ipairs({ 0, 45, 135, 215, 300 }) do
		ns.db.minimapAngle = angle
		ns.db.minimapOffset = 10
		ns.Minimap:Reposition()
		local btn = _G.ForAllTheNerdsMinimapButton
		local _, _, _, x, y = btn:GetPoint()
		local dist = math.sqrt(x * x + y * y)
		local want = width / 2 + 10
		if math.abs(dist - want) > 0.5 then
			geomFail = geomFail + 1
			fail("minimap button at width %d angle %d sits %.1f from centre, wanted %.1f",
				width, angle, dist, want)
		end
		if dist <= width / 2 then
			geomFail = geomFail + 1
			fail("minimap button at width %d angle %d is INSIDE the minimap edge", width, angle)
		end
	end
end
out(string.format("button clears the edge at 4 minimap sizes x 5 angles (%d failures)", geomFail))

-- The distance slider must actually move it.
Minimap:SetWidth(140) ; Minimap:SetHeight(140)
ns.db.minimapAngle = 215
local function buttonDistance()
	ns.Minimap:Reposition()
	local _, _, _, x, y = _G.ForAllTheNerdsMinimapButton:GetPoint()
	return math.sqrt(x * x + y * y)
end
ns.db.minimapOffset = 0
local near = buttonDistance()
ns.db.minimapOffset = 40
local far = buttonDistance()
if far - near < 39 then
	fail("the minimap distance setting does not move the button (%.1f -> %.1f)", near, far)
else
	out(string.format("distance setting moves it %.0fpx to %.0fpx from centre", near, far))
end
ns.db.minimapOffset = 10

section("Flight paths")

-- Flying over somewhere must not announce it AND must not record it as seen,
-- or "only the first time I ever visit" would be spent on places the player
-- never stood in.
ns.db.suppressOnTaxi = true
ns.db.onlyFirstVisit = false
ns.db.seen, ns.db.lastShown = {}, {}
ns.Toast:Hide()

mock.onTaxi = true
mock.moveTo({ zone = "Arathi Highlands", realzone = "Arathi Highlands", subzone = "Refuge Pointe" })
local taxiOK = true
if ns.Toast:IsShown() then
	taxiOK = false
	fail("a toast was shown while on a flight path")
end
if U.Count(ns.db.seen) > 0 then
	taxiOK = false
	fail("%d place(s) were recorded as seen while flying over them", U.Count(ns.db.seen))
end
if U.Count(ns.db.lastShown) > 0 then
	taxiOK = false
	fail("the repeat-cooldown stamp was written during a flyover")
end

-- Several more hops, to be sure nothing accumulates.
for _, hop in ipairs({ "Hammerfall", "Stromgarde Keep", "Go'Shek Farm" }) do
	mock.moveTo({ zone = "Arathi Highlands", realzone = "Arathi Highlands", subzone = hop })
end
if U.Count(ns.db.seen) > 0 then
	taxiOK = false
	fail("flying over four places recorded %d of them", U.Count(ns.db.seen))
end
if taxiOK then
	out("four flyovers: nothing announced, nothing recorded")
end

-- Landing must then announce where you actually are.
mock.onTaxi = false
mock.fire("PLAYER_CONTROL_GAINED")
mock.advance(2.5)
if ns.Toast:IsShown() then
	out("landing announces the place you are actually standing in")
else
	fail("nothing was announced after landing (PLAYER_CONTROL_GAINED)")
end
ns.Toast:Hide()

-- With the option off, a flyover behaves like ordinary travel.
ns.db.suppressOnTaxi = false
ns.db.seen, ns.db.lastShown = {}, {}
mock.onTaxi = true
mock.moveTo({ zone = "Badlands", realzone = "Badlands", subzone = "Kargath" })
if ns.Toast:IsShown() then
	out("with the option off, flyovers announce as before")
else
	warn("suppressOnTaxi=false did not restore announcements")
end
mock.onTaxi = false
ns.Toast:Hide()
ns.db.suppressOnTaxi = true

section("Gap logging")

-- The database is not exhaustive, so the addon records the names the client
-- gives for places it has nothing written for. Those strings are then the
-- worklist, correctly spelled, which is better than a list written by hand.
ns.db.logUnknown = true
ns.db.unknown = {}
ns.db.showForeverContent = false

-- A real Elwynn subzone with no entry.
mock.moveTo({ zone = "Elwynn Forest", realzone = "Elwynn Forest", subzone = "Thunder Falls" })
local list = ns.UnknownList()
if #list == 1 and list[1].sub == "Thunder Falls" and list[1].zone == "Elwynn Forest" then
	out("an unwritten subzone is recorded, even though the zone entry was shown instead")
else
	fail("an unwritten subzone was not recorded (%d entries)", #list)
end

-- Revisiting counts rather than duplicating.
mock.moveTo({ zone = "Duskwood", realzone = "Duskwood", subzone = "Darkshire" })
mock.moveTo({ zone = "Elwynn Forest", realzone = "Elwynn Forest", subzone = "Thunder Falls" })
list = ns.UnknownList()
if #list == 1 and list[1].count >= 2 then
	out(string.format("revisits increment the count (now %d) rather than duplicating", list[1].count))
else
	fail("revisiting produced %d entries with count %s", #list, list[1] and list[1].count)
end

-- Places that DO have an entry must never be recorded.
for _, place in ipairs({ { "Elwynn Forest", "Goldshire" }, { "Westfall", "Sentinel Hill" },
                         { "The Barrens", "The Crossroads" }, { "Ironforge", "The Great Forge" } }) do
	mock.moveTo({ zone = place[1], realzone = place[1], subzone = place[2] })
end
list = ns.UnknownList()
if #list == 1 then
	out("places that do have entries are not recorded as gaps")
else
	local names = {}
	for i = 1, #list do names[#names + 1] = tostring(list[i].sub) end
	fail("written-up places were logged as gaps: %s", table.concat(names, ", "))
end

-- A Forever zone hidden by the spoiler setting is not a gap; it has an entry.
mock.moveTo({ zone = "Mount Hyjal", realzone = "Mount Hyjal", subzone = "" })
mock.moveTo({ zone = "Riverglades", realzone = "Riverglades", subzone = "Powderfuse Port" })
list = ns.UnknownList()
if #list == 1 then
	out("spoiler-hidden Forever entries are not mistaken for gaps")
else
	fail("%d gaps after visiting hidden Forever zones, expected 1", #list)
end

-- An entirely unknown zone is recorded as a whole-zone gap.
mock.moveTo({ zone = "Somewhere Unwritten", realzone = "Somewhere Unwritten", subzone = "" })
local whole = false
for _, r in ipairs(ns.UnknownList()) do
	if r.zone == "Somewhere Unwritten" and r.sub == nil then whole = true end
end
if whole then
	out("an unknown zone is recorded with no subzone")
else
	fail("an unknown zone was not recorded")
end

-- The switch has to actually stop it.
ns.db.logUnknown = false
ns.db.unknown = {}
mock.moveTo({ zone = "Elwynn Forest", realzone = "Elwynn Forest", subzone = "Maclure Vineyards" })
if #ns.UnknownList() == 0 then
	out("turning the setting off stops the recording")
else
	fail("gaps were recorded with logUnknown off")
end
ns.db.logUnknown = true
ns.db.unknown = {}

section("Source links")

-- Every reference in the database has to produce a usable address.
local refs, badRefs, worstRef = 0, 0, nil
ns.db.showForeverContent = true
ns.EachEntry(function(e)
	if not e.readMore then return end
	for i = 1, #e.readMore do
		refs = refs + 1
		local ref = e.readMore[i]
		local url = U.WikiURL(ref)
		local title = U.WikiTitle(ref)
		local bad = nil
		if type(url) ~= "string" then bad = "no url"
		elseif not string.match(url, "^https://") then bad = "not https"
		elseif string.find(url, " ", 1, true) then bad = "contains a space"
		elseif string.find(url, "'", 1, true) then bad = "unescaped apostrophe"
		elseif title == ref then bad = "prefix was not stripped"
		end
		if bad then
			badRefs = badRefs + 1
			worstRef = worstRef or string.format("%q -> %s (%s)", ref, tostring(url), bad)
		end
	end
end)
ns.db.showForeverContent = false
if badRefs > 0 then
	fail("%d of %d references produced a bad address, e.g. %s", badRefs, refs, worstRef)
else
	out(string.format("all %d references produce a valid https address", refs))
end

-- Encoding spot-checks, including the apostrophes that most titles here have.
local cases = {
	{ "Wowpedia: Elwynn Forest",   "https://warcraft.wiki.gg/wiki/Elwynn_Forest" },
	{ "Wowpedia: Zul'Gurub",       "https://warcraft.wiki.gg/wiki/Zul%27Gurub" },
	{ "Wowpedia: C'Thun",          "https://warcraft.wiki.gg/wiki/C%27Thun" },
	{ "Warcraft Wiki: Grim Batol", "https://warcraft.wiki.gg/wiki/Grim_Batol" },
}
local encFail = 0
for i = 1, #cases do
	local got = U.WikiURL(cases[i][1])
	if got ~= cases[i][2] then
		encFail = encFail + 1
		fail("URL for %q was %q, expected %q", cases[i][1], tostring(got), cases[i][2])
	end
end
out(string.format("%d encoding cases checked (%d failures)", #cases, encFail))

-- The Fandom switch has to change the host and nothing else.
ns.db.useFandomWiki = true
local fandom = U.WikiURL("Wowpedia: Dire Maul")
ns.db.useFandomWiki = false
if fandom ~= "https://wowpedia.fandom.com/wiki/Dire_Maul" then
	fail("the Wowpedia setting produced %q", tostring(fandom))
else
	out("the Wowpedia/Fandom setting switches host only")
end

-- Clicking a reference must open the address window with the text selected.
local linkOK, linkErr = pcall(function()
	ns.Panel:Show(ns.FindZone("Elwynn Forest"), false)
	ns.Panel:ShowURL("https://warcraft.wiki.gg/wiki/Elwynn_Forest", "Elwynn Forest")
end)
if not linkOK then
	fail("the address window failed: %s", tostring(linkErr))
else
	local box = mock.focusedEditBox
	if not box then
		fail("the address window did not focus its edit box")
	elseif box:GetText() ~= "https://warcraft.wiki.gg/wiki/Elwynn_Forest" then
		fail("the address box holds %q", box:GetText())
	elseif not box.__highlighted then
		fail("the address was not selected, so Ctrl+C would copy nothing")
	else
		out("address window opens focused with the URL selected")
	end
	-- Typing over it must restore the address rather than corrupt it.
	box:SetText("oops")
	if box:GetText() ~= "https://warcraft.wiki.gg/wiki/Elwynn_Forest" then
		fail("editing the address box was not reverted (now %q)", box:GetText())
	else
		out("edits to the address box revert")
	end
end
ns.Panel:Hide()

-- ---------------------------------------------------------------------------
-- 6. Slash commands
-- ---------------------------------------------------------------------------

section("Slash commands")

local handler = _G.SlashCmdList and _G.SlashCmdList["FORALLTHENERDS"]
if not handler then
	fail("the /ftn handler was never registered")
else
	local commands = {
		"", "help", "here", "list", "list Kalimdor", "list Eastern Kingdoms",
		"stats", "gaps", "gaps clear", "gaps off", "gaps on", "where", "card off", "card on", "chat on", "chat off",
		"forever on", "forever off", "on", "off", "on",
		"unlock", "reset", "debug on", "debug off", "forget",
		"Goldshire", "goldshire", "GOLDSHIRE", "Stratholme", "karazhan",
		"ruins", "hive", "a place that does not exist at all",
		"config",
	}
	local cmdFails = 0
	for i = 1, #commands do
		mock.clearPrinted()
		local ok, err = pcall(handler, commands[i])
		if not ok then
			cmdFails = cmdFails + 1
			fail("/ftn %q errored: %s", commands[i], tostring(err))
		end
	end
	out(string.format("Ran %d slash command variants (%d errors)", #commands, cmdFails))
end

-- Options page: open it and refresh, which is where template mismatches show up.
local okOpt, optErr = pcall(function()
	ns.Options:Open()
	ns.Options:Refresh()
end)
if not okOpt then
	fail("options page failed: %s", tostring(optErr))
else
	out("Options page builds, opens and refreshes"
		.. (mock.settingsRegistered and " (registered with the Settings API)" or ""))
end

-- Minimap button
local okMini, miniErr = pcall(function()
	ns.db.minimapButton = true
	ns.Minimap:Refresh()
	local b = _G.ForAllTheNerdsMinimapButton
	if b and b.__scripts.OnEnter then b.__scripts.OnEnter(b) end
	if b and b.__scripts.OnClick then b.__scripts.OnClick(b, "LeftButton") end
	if b and b.__scripts.OnClick then b.__scripts.OnClick(b, "RightButton") end
	ns.db.minimapButton = false
	ns.Minimap:Refresh()
	ns.db.minimapButton = true
end)
if not okMini then
	fail("minimap button failed: %s", tostring(miniErr))
else
	out("Minimap button builds, tooltips and handles both clicks")
end

-- ---------------------------------------------------------------------------
-- 7. Coverage
-- ---------------------------------------------------------------------------

section("Coverage")

local byContinent = {}
ns.EachEntry(function(e)
	local c = e.continent or (e.parent and "(via parent)") or "(none)"
	byContinent[c] = (byContinent[c] or 0) + 1
end)
local cnames = {}
for c in pairs(byContinent) do cnames[#cnames + 1] = c end
table.sort(cnames)
for i = 1, #cnames do
	out(string.format("  %-22s %d entries", cnames[i], byContinent[cnames[i]]))
end

-- Zones with few or no child locales are the obvious places to expand next.
local thin = {}
for i = 1, #ns.zoneOrder do
	local z = ns.zoneOrder[i]
	local kids = ns.Index.children[z.key]
	local n = kids and #kids or 0
	if n < 3 then thin[#thin + 1] = string.format("%s (%d)", z.name, n) end
end
if #thin > 0 then
	note("zones with fewer than 3 locales written up: %s", table.concat(thin, ", "))
end

if mock.missing then
	local m = {}
	for k in pairs(mock.missing) do m[#m + 1] = k end
	table.sort(m)
	if #m > 0 then
		note("API the addon called that the mock only stubbed generically: %s", table.concat(m, ", "))
	end
end

-- ---------------------------------------------------------------------------
-- Result
-- ---------------------------------------------------------------------------

section("Result")

for i = 1, #notes do out("  note  " .. notes[i]) end
for i = 1, #warnings do out("  WARN  " .. warnings[i]) end
for i = 1, #errors do out("  FAIL  " .. errors[i]) end

out("")
out(string.format("%d errors, %d warnings, %d notes", #errors, #warnings, #notes))

if #errors > 0 then
	out("VALIDATION FAILED")
	os.exit(1)
end
out("VALIDATION PASSED")
os.exit(0)
