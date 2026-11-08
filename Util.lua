local addonName, ns = ...

-- ===========================================================================
-- Util.lua -- dependency-free helpers. Loads first.
--
-- WoW: Forever shares Midnight's "secret values" behaviour: some API calls
-- return values that are tainted and must not be read directly. We never
-- touch combat or unit data, but zone strings are cheap to guard, so every
-- string that comes out of the game client goes through Safe().
-- ===========================================================================

local U = {}
ns.U = U

-- Cache the globals we use. Lua here is a modified 5.1: no goto, no bitwise
-- operators, no _ENV, and no io/os/require/dofile.
local type, tostring, tonumber = type, tostring, tonumber
local gsub, lower, format, rep = string.gsub, string.lower, string.format, string.rep
local sort, concat = table.sort, table.concat
local issecretvalue = issecretvalue -- nil on Classic Era, present on Forever

-- ---------------------------------------------------------------------------
-- Secret-value guards
-- ---------------------------------------------------------------------------

-- Safe(v) -> string or nil. Returns nil for secret, non-string or empty input.
function U.Safe(v)
	if v == nil then return nil end
	if issecretvalue and issecretvalue(v) then return nil end
	if type(v) ~= "string" then return nil end
	if v == "" then return nil end
	return v
end

-- SafeNum(v) -> number or nil.
function U.SafeNum(v)
	if v == nil then return nil end
	if issecretvalue and issecretvalue(v) then return nil end
	if type(v) ~= "number" then return nil end
	return v
end

-- SafeBool(v) -> true, false or nil. nil means "could not be read": either the
-- value was secret or it was not a boolean. Callers that are deciding whether
-- something is safe to record must treat nil as "no", never as false.
function U.SafeBool(v)
	if v == nil then return nil end
	if issecretvalue and issecretvalue(v) then return nil end
	if type(v) ~= "boolean" then return nil end
	return v
end

-- Call a possibly-absent API and guard the first return value as a string.
-- U.CallStr(GetSubZoneText) -> string or nil
function U.CallStr(fn, ...)
	if type(fn) ~= "function" then return nil end
	local ok, result = pcall(fn, ...)
	if not ok then return nil end
	return U.Safe(result)
end

function U.CallNum(fn, ...)
	if type(fn) ~= "function" then return nil end
	local ok, result = pcall(fn, ...)
	if not ok then return nil end
	return U.SafeNum(result)
end

-- U.CallBool(UnitIsPlayer, "target") -> true, false or nil.
-- nil covers every way the answer can be unavailable: the function is missing,
-- the call errored, the return was secret, or it was not a boolean.
function U.CallBool(fn, ...)
	if type(fn) ~= "function" then return nil end
	local ok, result = pcall(fn, ...)
	if not ok then return nil end
	return U.SafeBool(result)
end

-- ---------------------------------------------------------------------------
-- Strings
-- ---------------------------------------------------------------------------

function U.Trim(s)
	if type(s) ~= "string" then return nil end
	s = gsub(s, "^%s+", "")
	s = gsub(s, "%s+$", "")
	if s == "" then return nil end
	return s
end

-- Normalise a zone or subzone name into a lookup key.
-- "The Barrens" -> "the barrens"; curly quotes and NBSP folded to plain ASCII.
function U.Key(s)
	s = U.Safe(s)
	if not s then return nil end
	s = gsub(s, "\194\160", " ")     -- non-breaking space
	s = gsub(s, "\226\128\153", "'") -- right single quote
	s = gsub(s, "\226\128\152", "'") -- left single quote
	s = gsub(s, "%s+", " ")
	s = U.Trim(s)
	if not s then return nil end
	return lower(s)
end

-- Count graphemes well enough for width maths. WoW strings are UTF-8; this
-- counts lead bytes rather than bytes so accented zone names do not over-wrap.
function U.Len(s)
	if type(s) ~= "string" then return 0 end
	local n = 0
	for _ in string.gmatch(s, "[^\128-\191]") do n = n + 1 end
	return n
end

-- Truncate to n characters, appending an ellipsis if it was cut.
-- Walks UTF-8 lead bytes by hand rather than using a pattern, because the
-- escape needed to match a zero byte differs between Lua 5.1 (%z) and later
-- versions (\0), and this has to run unchanged on the game client.
function U.Clip(s, n)
	if type(s) ~= "string" then return "" end
	if U.Len(s) <= n then return s end
	local byteLen = #s
	local count, i, cut = 0, 1, byteLen
	while i <= byteLen do
		local b = string.byte(s, i)
		local size = 1
		if b >= 240 then size = 4
		elseif b >= 224 then size = 3
		elseif b >= 192 then size = 2 end
		count = count + 1
		if count > n - 1 then
			cut = i - 1
			break
		end
		i = i + size
	end
	return string.sub(s, 1, cut) .. "..."
end

function U.Capitalise(s)
	if type(s) ~= "string" or s == "" then return s end
	return string.upper(string.sub(s, 1, 1)) .. string.sub(s, 2)
end

-- ---------------------------------------------------------------------------
-- Wiki references
--
-- Every entry's `readMore` list holds strings like "Wowpedia: Elwynn Forest".
-- The game cannot open a browser, so the best we can do is turn those into a
-- real address and hand it over in a box the player can copy out of.
-- ---------------------------------------------------------------------------

-- Percent-encode an article title for a wiki path. Spaces become underscores;
-- everything outside the unreserved set is escaped byte by byte, which is the
-- correct encoding for the UTF-8 the client gives us. Apostrophes matter here:
-- a good share of these titles have one (Zul'Gurub, C'Thun, Kel'Thuzad).
function U.UrlEncode(s)
	if type(s) ~= "string" then return "" end
	s = gsub(s, " ", "_")
	s = gsub(s, "[^%w_%-%.~]", function(ch)
		return format("%%%02X", string.byte(ch))
	end)
	return s
end

-- "Wowpedia: Elwynn Forest" -> "Elwynn Forest"
function U.WikiTitle(ref)
	if type(ref) ~= "string" then return nil end
	local title = string.match(ref, "^%s*[Ww]owpedia%s*:%s*(.+)$")
		or string.match(ref, "^%s*[Ww]arcraft%s+[Ww]iki%s*:%s*(.+)$")
		or ref
	return U.Trim(title)
end

-- The wiki the lore in this addon was actually checked against is
-- warcraft.wiki.gg, which is where the editors moved. Anyone who prefers the
-- older Fandom host can switch in the settings.
function U.WikiURL(ref)
	local title = U.WikiTitle(ref)
	if not title then return nil end
	local encoded = U.UrlEncode(title)
	if ns.db and ns.db.useFandomWiki then
		return "https://wowpedia.fandom.com/wiki/" .. encoded
	end
	return "https://warcraft.wiki.gg/wiki/" .. encoded
end

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

function U.Count(t)
	if type(t) ~= "table" then return 0 end
	local n = 0
	for _ in pairs(t) do n = n + 1 end
	return n
end

function U.Keys(t, sorted)
	local out = {}
	if type(t) ~= "table" then return out end
	for k in pairs(t) do out[#out + 1] = k end
	if sorted then sort(out, function(a, b) return tostring(a) < tostring(b) end) end
	return out
end

-- Shallow-copy defaults into target for any key target is missing.
-- Recurses into subtables so nested option groups pick up new defaults
-- across addon versions without wiping what the user already set.
function U.ApplyDefaults(target, defaults)
	if type(target) ~= "table" or type(defaults) ~= "table" then return target end
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			if type(target[k]) ~= "table" then target[k] = {} end
			U.ApplyDefaults(target[k], v)
		elseif target[k] == nil then
			target[k] = v
		end
	end
	return target
end

function U.CopyList(t)
	local out = {}
	if type(t) ~= "table" then return out end
	for i = 1, #t do out[i] = t[i] end
	return out
end

-- ---------------------------------------------------------------------------
-- Colour
-- ---------------------------------------------------------------------------

-- U.Hex("ffd100", "text") -> "|cffffd100text|r"
function U.Hex(hex, text)
	return "|cff" .. hex .. tostring(text) .. "|r"
end

function U.RGB(hex)
	local r = tonumber(string.sub(hex, 1, 2), 16) or 255
	local g = tonumber(string.sub(hex, 3, 4), 16) or 255
	local b = tonumber(string.sub(hex, 5, 6), 16) or 255
	return r / 255, g / 255, b / 255
end

-- ---------------------------------------------------------------------------
-- Timers. C_Timer is present on Forever (Mainline API surface) and on
-- Classic Era 1.15+, but probe anyway and fall back to an OnUpdate driver.
-- ---------------------------------------------------------------------------

local fallbackDriver, fallbackQueue

local function ensureDriver()
	if fallbackDriver then return end
	fallbackQueue = {}
	fallbackDriver = CreateFrame("Frame")
	fallbackDriver:SetScript("OnUpdate", function(_, elapsed)
		local i = 1
		while i <= #fallbackQueue do
			local job = fallbackQueue[i]
			job.left = job.left - elapsed
			if job.left <= 0 then
				table.remove(fallbackQueue, i)
				pcall(job.fn)
			else
				i = i + 1
			end
		end
	end)
end

function U.After(seconds, fn)
	if type(fn) ~= "function" then return end
	if C_Timer and type(C_Timer.After) == "function" then
		C_Timer.After(seconds, fn)
		return
	end
	ensureDriver()
	fallbackQueue[#fallbackQueue + 1] = { left = seconds, fn = fn }
end

-- ---------------------------------------------------------------------------
-- Output
-- ---------------------------------------------------------------------------

local PREFIX = "|cff8ab4f8For|r|cffd4a257All|r|cff8ab4f8The|r|cffd4a257Nerds|r"

function U.Print(msg, ...)
	if select("#", ...) > 0 then
		local ok, formatted = pcall(format, msg, ...)
		if ok then msg = formatted end
	end
	print(PREFIX .. ": " .. tostring(msg))
end

function U.Debug(msg, ...)
	if not (ns.db and ns.db.debug) then return end
	if select("#", ...) > 0 then
		local ok, formatted = pcall(format, msg, ...)
		if ok then msg = formatted end
	end
	print("|cff888888[ftn]|r " .. tostring(msg))
end

function U.Rule(n)
	return "|cff3a3a3a" .. rep("-", n or 40) .. "|r"
end
