-- Dump every entry's prose with its era, so names in it can be checked against
-- a 1.12 creature list. Forever entries are tagged so they can be excluded:
-- Forever invents its own characters and they are correctly absent from 1.12.
local ADDON = "ForAllTheNerds"
package.path = "tools/?.lua;" .. package.path
local mock = require("mock_wow")
mock.install()

local files = {}
for line in io.lines(ADDON .. ".toc") do
	local f = line:match("^([%w_/\\%.]+%.lua)%s*$")
	if f then files[#files + 1] = (f:gsub("\\", "/")) end
end
local ns = {}
for i = 1, #files do assert(loadfile(files[i]))(ADDON, ns) end
if ns.db then ns.db.showForeverContent = true end

local seen = {}
ns.EachEntry(function(e)
	if seen[e] then return end
	seen[e] = true
	local parts = { e.hook or "" }
	for i = 1, #(e.lore or {}) do parts[#parts + 1] = e.lore[i] end
	if e.didYouKnow then parts[#parts + 1] = e.didYouKnow end
	local prose = table.concat(parts, " "):gsub("[\t\n]", " ")
	io.write(e.name, "\t", e.era or "vanilla", "\t", prose, "\n")
end)
