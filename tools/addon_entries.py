#!/usr/bin/env python3
"""Load every entry the addon defines, by running the addon.

Both tools/check-gaps.py and tools/check-names.py need the same thing: the real
entry list, with aliases, as the addon itself sees it after Schema.lua has run.
Parsing the Lua by regular expression does not work -- a first attempt at it
matched 61 of the 978 entries and reported a clean result, which is the worst
kind of wrong. Load the addon and ask it.

Needs a Lua interpreter on PATH. Which name it goes by varies: a Mac with
Homebrew has `lua`, and the Ubuntu runner installs `lua5.4` and provides no
`lua` at all, so the candidates below are tried in order. Set FTN_LUA to pick
one explicitly.
"""

import os
import shutil
import subprocess
import sys
import unicodedata

CANDIDATES = ("lua", "lua5.4", "lua5.3", "luajit")


def interpreter():
    named = os.environ.get("FTN_LUA")
    if named:
        if not shutil.which(named):
            sys.exit("FTN_LUA is set to %r, which is not on PATH" % named)
        return named
    for name in CANDIDATES:
        if shutil.which(name):
            return name
    sys.exit("no Lua interpreter on PATH; tried " + ", ".join(CANDIDATES))

# io.write, not print: tools/mock_wow.lua replaces the global print with WoW's
# chat version, so print output goes into mock.printed and never reaches stdout.
_LUA = r'''
local ADDON = "ForAllTheNerds"
package.path = "tools/?.lua;" .. package.path
local mock = require("mock_wow"); mock.install()
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
    io.write(e.name, "\t", e.kind or "?", "\t", e.parent or "", "\t",
        e.era or "vanilla", "\t", table.concat(e.aliases or {}, "|"), "\n")
end)
'''


def norm(s):
    """Casefold and flatten the quote characters, the way U.Key does."""
    s = unicodedata.normalize("NFKC", s or "")
    for a, b in (("’", "'"), ("‘", "'"), ("“", '"'), ("”", '"')):
        s = s.replace(a, b)
    return " ".join(s.split()).casefold()


def load():
    """Return a list of dicts: name, kind, parent, era, aliases."""
    r = subprocess.run([interpreter(), "-"], input=_LUA, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit("could not load the addon: %s" % r.stderr.strip())
    out = []
    for line in r.stdout.splitlines():
        p = line.split("\t")
        if len(p) >= 5:
            out.append(dict(name=p[0], kind=p[1], parent=p[2], era=p[3],
                            aliases=[a for a in p[4].split("|") if a]))
    if not out:
        sys.exit("the addon loaded but reported no entries")
    return out


def by_name(entries=None):
    """Map every name and alias the addon answers to onto the entries holding it."""
    index = {}
    for e in (entries if entries is not None else load()):
        for n in [e["name"]] + e["aliases"]:
            index.setdefault(norm(n), []).append(e)
    return index


if __name__ == "__main__":
    es = load()
    print("%d entries, %d names and aliases" % (len(es), len(by_name(es))))
