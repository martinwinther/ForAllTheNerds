local addonName, ns = ...

-- ===========================================================================
-- Commands.lua -- /ftn and /forallthenerds
-- ===========================================================================

local U, T = ns.U, ns.Theme

local function hex(c, s) return U.Hex(c, s) end
local GOLD, ACCENT, DIM = T and T.color.gold or "ffd100", "8ab4f8", "9a9a9a"

local function line(cmd, desc)
	U.Print("%s  %s", hex(ACCENT, cmd), hex(DIM, desc))
end

local function showHelp()
	U.Print("lore and history for wherever you are standing.")
	line("/ftn",               "read about where you are")
	line("/ftn <place>",        "look up any place by name")
	line("/ftn list",           "list every zone with an entry")
	line("/ftn list <continent>", "...for one continent")
	line("/ftn config",         "open the settings")
	line("/ftn on | off",       "turn the addon on or off")
	line("/ftn card on | off",  "turn the arrival card on or off")
	line("/ftn chat on | off",  "also print the one-liner to chat")
	line("/ftn forever on|off", "include Forever's new zones (background only)")
	line("/ftn unlock",         "park a card on screen so you can drag it")
	line("/ftn reset",          "put the card and panel back in the middle")
	line("/ftn stats",          "how much you have discovered")
	line("/ftn where",          "print what the client thinks this place is called")
	if ns.Index then
		U.Print(hex(DIM, string.format("%d places written up: %d zones, %d locales, %d instances.",
			ns.Index.total, ns.Index.zones, ns.Index.subs, ns.Index.instances)))
	end
end

local function showHere()
	local d = ns.Detect
	if not d then return end
	if d.entry then
		ns.Panel:Show(d.entry, false)
		return
	end
	-- Nothing written for this exact spot. Offer the containing zone instead.
	if d.zoneEntry and ns.IsVisible(d.zoneEntry) then
		U.Print("nothing written for %s yet, so here is %s.",
			hex(GOLD, d.subName or "this spot"), hex(GOLD, d.zoneEntry.name))
		ns.Panel:Show(d.zoneEntry, false)
		return
	end
	local where = d.subName or d.zoneName or "wherever this is"
	U.Print("no entry for %s yet.", hex(GOLD, where))
	if d.zoneName and ns.FindZone(d.zoneName) and not ns.IsVisible(ns.FindZone(d.zoneName)) then
		U.Print(hex(DIM, "There is an entry, but it is one of Forever's new zones. Turn it on with /ftn forever on."))
	end
end

local function doSearch(query)
	local hits = ns.Search(query, 14)
	if #hits == 0 then
		U.Print("nothing found for %s.", hex(GOLD, query))
		-- Was it hidden behind the spoiler setting?
		local anyHidden = false
		ns.EachEntry(function(e)
			if not anyHidden and e.spoiler and string.find(U.Key(e.name) or "", U.Key(query) or "", 1, true) then
				anyHidden = true
			end
		end)
		if anyHidden then
			U.Print(hex(DIM, "There is a match among Forever's new zones. Turn those on with /ftn forever on."))
		end
		return
	end
	if #hits == 1 then
		ns.Panel:Show(hits[1], false)
		return
	end
	U.Print("%d matches for %s:", #hits, hex(GOLD, query))
	for i = 1, #hits do
		local e = hits[i]
		local where = e.parent and (" " .. hex(DIM, "in " .. e.parent)) or ""
		U.Print("  %s%s  %s", hex(ACCENT, e.name), where,
			hex(DIM, "(" .. (T.kindLabel[e.kind] or e.kind) .. ")"))
	end
	U.Print(hex(DIM, "Type the name more exactly to open one."))
end

local function doList(continent)
	local continents = ns.Index and ns.Index.continents
	if not continents then return end

	local wanted = continent and U.Key(continent) or nil
	local printedAny = false

	local names = U.Keys(continents, true)
	for i = 1, #names do
		local cname = names[i]
		if not wanted or U.Key(cname) == wanted or string.find(U.Key(cname), wanted, 1, true) then
			local list = continents[cname]
			local visible = {}
			for j = 1, #list do
				if ns.IsVisible(list[j]) then visible[#visible + 1] = list[j] end
			end
			if #visible > 0 then
				printedAny = true
				U.Print("%s %s", hex(GOLD, cname), hex(DIM, "(" .. #visible .. ")"))
				for j = 1, #visible do
					local z = visible[j]
					local kids = ns.Index.children[z.key]
					local kidCount = kids and #kids or 0
					U.Print("  %s %s", hex(ACCENT, z.name),
						hex(DIM, (z.levels or "") .. (kidCount > 0 and ("  +" .. kidCount .. " places") or "")))
				end
			end
		end
	end

	if not printedAny then
		U.Print("no continent matching %s. Try: %s",
			hex(GOLD, continent or "?"), hex(DIM, table.concat(names, ", ")))
	end
end

local function doWhere()
	U.Print("what the client reports for this spot:")
	local function show(label, value)
		U.Print("  %s %s", hex(DIM, label), value and hex(ACCENT, value) or hex(DIM, "(nothing)"))
	end
	show("GetZoneText()       ", U.CallStr(GetZoneText))
	show("GetSubZoneText()    ", U.CallStr(GetSubZoneText))
	show("GetMinimapZoneText()", U.CallStr(GetMinimapZoneText))
	show("GetRealZoneText()   ", U.CallStr(GetRealZoneText))
	if type(IsInInstance) == "function" then
		local ok, inInstance, instType = pcall(IsInInstance)
		if ok then
			show("IsInInstance()      ", tostring(inInstance) .. " / " .. tostring(instType))
		end
	end
	if ns.has.map then
		local id = U.CallNum(C_Map.GetBestMapForUnit, "player")
		show("uiMapID             ", id and tostring(id) or nil)
	end
	local d = ns.Detect
	show("matched entry       ", d and d.entry and d.entry.name or nil)
	U.Print(hex(DIM, "If a place has no entry, these are the exact strings a new entry needs to match."))
end

local function doStats()
	local db = ns.db
	if not db then return end
	local total = ns.Index and ns.Index.total or 0
	local found = db.stats and db.stats.discovered or 0
	local read = db.stats and db.stats.read or 0
	local pct = total > 0 and math.floor(found / total * 100 + 0.5) or 0
	U.Print("you have been announced at %s of %s places (%d%%), and opened %s write-ups.",
		hex(GOLD, tostring(found)), hex(GOLD, tostring(total)), pct, hex(GOLD, tostring(read)))
	if not db.showForeverContent then
		U.Print(hex(DIM, "Forever's new zones are not counted while they are turned off."))
	end
end

-- on/off style arguments
local function parseToggle(arg, current)
	if arg == "on" or arg == "yes" or arg == "1" then return true end
	if arg == "off" or arg == "no" or arg == "0" then return false end
	return not current
end

local function handler(msg)
	msg = U.Trim(msg or "") or ""
	local cmd, rest = msg:match("^(%S+)%s*(.-)$")
	cmd = cmd and string.lower(cmd) or nil
	rest = U.Trim(rest or "")

	if not ns.db then
		U.Print("still loading, try again in a moment.")
		return
	end

	if not cmd then
		if ns.Panel and ns.Panel:IsShown() then ns.Panel:Hide() else showHere() end
		return
	end

	if cmd == "help" or cmd == "?" then
		showHelp()

	elseif cmd == "here" or cmd == "this" then
		showHere()

	elseif cmd == "list" then
		doList(rest ~= "" and rest or nil)

	elseif cmd == "config" or cmd == "options" or cmd == "settings" then
		ns.Options:Open()

	elseif cmd == "on" then
		ns.db.enabled = true
		U.Print("enabled.")

	elseif cmd == "off" then
		ns.db.enabled = false
		if ns.Toast then ns.Toast:Hide() end
		U.Print("disabled. %s", hex(DIM, "/ftn on to turn it back on; /ftn <place> still works."))

	elseif cmd == "card" or cmd == "toast" then
		ns.db.autoToast = parseToggle(rest, ns.db.autoToast)
		U.Print("arrival card %s.", ns.db.autoToast and "on" or "off")

	elseif cmd == "chat" then
		ns.db.chatEcho = parseToggle(rest, ns.db.chatEcho)
		U.Print("chat echo %s.", ns.db.chatEcho and "on" or "off")

	elseif cmd == "forever" or cmd == "new" then
		ns.db.showForeverContent = parseToggle(rest, ns.db.showForeverContent)
		if ns.db.showForeverContent then
			U.Print("Forever's new zones are now included. %s",
				hex(DIM, "Background only - no questline spoilers."))
		else
			U.Print("Forever's new zones are hidden again.")
		end
		if ns.Detect then ns.Detect:Update(false) end

	elseif cmd == "unlock" or cmd == "move" then
		if ns.Toast then
			ns.Toast:ShowPlacement()
			U.Print("drag the card where you want it, then right-click it.")
		end

	elseif cmd == "reset" then
		ns.db.toastPoint = { point = "TOP", x = 0, y = -220 }
		ns.db.panelPoint = { point = "CENTER", x = 0, y = 0 }
		ns.db.minimapAngle = 215
		ns.db.minimapOffset = 10
		if ns.Minimap then ns.Minimap:Refresh() end
		U.Print("positions reset. %s", hex(DIM, "Reload the UI to move frames that are already on screen."))

	elseif cmd == "stats" then
		doStats()

	elseif cmd == "where" or cmd == "debugzone" then
		doWhere()

	elseif cmd == "debug" then
		ns.db.debug = parseToggle(rest, ns.db.debug)
		U.Print("debug output %s.", ns.db.debug and "on" or "off")

	elseif cmd == "forget" then
		ns.db.seen = {}
		ns.db.lastShown = {}
		ns.db.stats = { discovered = 0, read = ns.db.stats and ns.db.stats.read or 0 }
		U.Print("visit history cleared. Everywhere counts as new again.")

	else
		-- Anything else is a place name.
		doSearch(msg)
	end
end

SLASH_FORALLTHENERDS1 = "/ftn"
SLASH_FORALLTHENERDS2 = "/forallthenerds"
SlashCmdList["FORALLTHENERDS"] = handler

ns.OnReady(function()
	U.Print("loaded. %s", hex(DIM, "/ftn to read about where you are, /ftn help for everything else."))
end)
