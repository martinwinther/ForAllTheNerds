#!/usr/bin/env python3
"""P1 of tools/audit-prompt.md: does the client have this name at all?

Every entry name and alias, matched against the AreaTable of the client that
entry belongs to. A miss means the client would never report that string, so
the entry can only ever be reached by looking it up by name.

This is the probe that would have caught the Dalaran crater on day one. The
entry was called Dalaran Crater, which is the area's name from Wrath onward;
the vanilla client's one area here is called Dalaran.

Run from the repository root. The tables are never committed, so pass them:

    python3 -I tools/check-names.py --vanilla AreaTable.csv --forever AreaTable-wowf.csv

    curl -sS -o AreaTable.csv      'https://wago.tools/db2/AreaTable/csv?product=wow_classic_era'
    curl -sS -o AreaTable-wowf.csv 'https://wago.tools/db2/AreaTable/csv?product=wowf'

Exit status is 0 when every testable entry matches and 1 when any does not. It
is not in CI, for the same reason check-era.py is not: it needs a download.

WHAT THIS CANNOT TEST, and why saying so matters more than the hits do. The
first run of this probe reported 64 names before these exclusions and 15 after.
Reporting the 64 would have buried the real finding in its own noise.

  instances      not subzone areas; resolved by instance name
  city interiors wow_classic_era's AreaTable has no row containing "district"
                 or "quarter" anywhere in it, and Stormwind City has exactly
                 one child area, the Valley of Heroes
  removed areas  a match proves the client's AreaTable carries the name, not
                 that the client will ever report it. Row 323, O'Breen's Camp,
                 is a planned Arathi subzone the wiki records as removed. This
                 probe passes it and a player may never see the string.
  quest-named    a place can be named in quest text without being an area:
   landmarks     the Un'Goro pylons, the Gates of Uldum, the Lion's Pride Inn.
                 Those are listed in ALLOWED below with the quest that names
                 them, because an exclusion without a reason rots.
"""

import argparse
import csv
import re
import subprocess
import sys
import unicodedata

CITY_PARENTS = {
    "stormwind city", "ironforge", "orgrimmar", "darnassus",
    "undercity", "thunder bluff",
}

# Named in 1.12 game text but carrying no AreaTable row. Each needs a source,
# so that this list cannot quietly become a place to hide a failure.
ALLOWED = {
    "Eastern Pylon":    "quest 4288's siblings; run 32 settled the pylon names",
    "Northern Pylon":   "quest 4288's siblings; run 32 settled the pylon names",
    "Western Pylon":    "quest 4288, title 'The Western Pylon'",
    "Gates of Uldum":   "named in quest 2946",
    "Lion's Pride Inn": "named in quest 69",
    "Stormwind Gates":  "named in quest 1861",
    # A second Scarlet tower, inside the Scarlet Palisade in western Tirisfal.
    # The wiki carries it at its own title and distinguishes it from Crusader
    # Outpost, Captain Vachon's tower in the east. Neither the palisade nor this
    # tower has an AreaTable row. P1's first run nearly merged the two.
    "Crusader's Outpost": "warcraft.wiki.gg, distinguished from Crusader Outpost",
    # The tree, not a subzone. Neither client registers an area for it, and the
    # only subzone of that name belongs to the Burning Crusade's Hyjal Summit
    # instance and is out of era. The entry is about the tree's history.
    "Nordrassil": "warcraft.wiki.gg; the only Nordrassil subzone is out of era",
}


def norm(s):
    s = unicodedata.normalize("NFKD", s).lower()
    return re.sub(r"[^a-z0-9]+", "", s)


def areas(path):
    out = {}
    with open(path, encoding="utf-8") as fh:
        for row in csv.DictReader(fh):
            name = (row.get("AreaName_lang") or "").strip().strip('"')
            if name:
                out.setdefault(norm(name), name)
    return out


def entries():
    """name, kind, parent, era, aliases, straight from the real resolver."""
    lua = r'''
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
    -- io.write, not print: mock_wow replaces print with WoW's chat version and
    -- the output goes into mock.printed instead of stdout.
    io.write(e.name, "\t", e.kind or "?", "\t", e.parent or "", "\t",
        e.era or "vanilla", "\t", table.concat(e.aliases or {}, "|"), "\n")
end)
'''
    r = subprocess.run(["lua", "-"], input=lua, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit("could not load the addon: %s" % r.stderr.strip())
    out = []
    for line in r.stdout.splitlines():
        p = line.split("\t")
        if len(p) >= 5:
            out.append(dict(name=p[0], kind=p[1], parent=p[2], era=p[3],
                            aliases=[a for a in p[4].split("|") if a]))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--vanilla", required=True, help="AreaTable csv, product wow_classic_era")
    ap.add_argument("--forever", required=True, help="AreaTable csv, product wowf")
    args = ap.parse_args()

    tables = {"vanilla": areas(args.vanilla), "forever": areas(args.forever)}
    print("client area names: %d vanilla, %d forever"
          % (len(tables["vanilla"]), len(tables["forever"])))

    rows = entries()
    skipped = {"instance": 0, "city interior": 0, "allowed": 0}
    leads = []
    for e in rows:
        if e["kind"] == "instance":
            skipped["instance"] += 1
            continue
        if norm(e["parent"]) in {norm(p) for p in CITY_PARENTS}:
            skipped["city interior"] += 1
            continue
        if e["name"] in ALLOWED:
            skipped["allowed"] += 1
            continue
        table = tables.get(e["era"], tables["vanilla"])
        if not any(norm(c) in table for c in [e["name"]] + e["aliases"]):
            leads.append(e)

    print("%d entries, %d not testable %s" % (len(rows), sum(skipped.values()), skipped))
    if not leads:
        print("\nevery testable entry matches an area its client knows")
        return 0

    print("\n%d entries whose name and aliases match no area in their own client:\n"
          % len(leads))
    for e in sorted(leads, key=lambda e: (e["era"], e["name"])):
        print("  %-26s %-8s %-22s %s"
              % (e["name"], e["era"], e["parent"] or "-",
                 "aliases: " + ", ".join(e["aliases"]) if e["aliases"] else "no alias"))
    print("\nEach of these is a LEAD. Before writing any of them up, feed the")
    print("client's own string through ns.FindSubIn and see what answers: the")
    print("first run found seven of them were a second entry sitting beside a")
    print("correctly named one, which is not what the raw list looked like.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
