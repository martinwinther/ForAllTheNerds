#!/usr/bin/env python3
"""P5 of tools/audit-prompt.md: does the linked article describe this place?

Every readMore reference, against warcraft.wiki.gg. Two questions, and the
second is the one that matters:

  1. Does the page exist? validate.lua only checks that a reference produces a
     valid https address, so a reference to a page nobody ever wrote passes the
     build and ships as a dead link. The first run of this found six.
  2. Is it about the right thing? A page can exist and be wrong. There is an
     article called Eastwind Shore and it is in the Grizzly Hills, while the
     Riverglades has its own. A name match is not a place match.

Run from the repository root. Needs the network, so it is not in CI:

    python3 -I tools/check-refs.py

Exit status is 1 if any reference is dead, 0 otherwise. Everything else it
prints is a lead for a human, not a verdict.

THE (CLASSIC) TRAP, AND WHY IT IS NOT A RULE. era-audit.md's most reliable tell
is that a real `Foo (Classic)` article means the bare `Foo` is the retail one.
For readMore that is true only sometimes, and the first run of this probe found
71 bare titles with a real (Classic) article. Switching all 71 would have been
wrong for most:

  QUEST     switch. The vanilla quest has different objectives, levels and
            text from the retail one. 16 of 21 were real switches; the other 5
            were NPC or faction names where the (Classic) page is a
            coincidentally-named quest, like Southsea Freebooters.
  ZONE      leave. Stranglethorn Vale (Classic)'s own hatnote sends you to the
            bare title "for lore and history", which is what this addon wants.
            The (Classic) page is the zone snapshot.
  INSTANCE  leave, same reasoning.
  NPC       leave, and emphatically. Kel'Thuzad (Classic) is the raid encounter
            at 14k; the bare page is the character at 73k.

So this script classifies the (Classic) hits by the type of the (Classic) page
and leaves the judgement to the reader.

A KNOWN LIMITATION, recorded so it is not rediscovered as a finding. Three
vanilla names redirect to pages titled for a later era and no vanilla-specific
page exists: The People's Militia to Westfall Brigade, Sandfury to Farraki
tribe, and Zandalar tribe to Zandalari Empire. The reader lands on the right
subject under the wrong era's name. Nothing to fix on our side.
"""

import json
import re
import subprocess
import sys
import time
import unicodedata
import urllib.parse

API = "https://warcraft.wiki.gg/api.php"
AGENT = "ForAllTheNerds-era-sweep/1.0"
DRIFTED = {"The People's Militia", "Sandfury", "Zandalar tribe"}


def api(params):
    url = API + "?" + urllib.parse.urlencode(params)
    r = subprocess.run(["curl", "-sL", "-A", AGENT, "--max-time", "120", url],
                       capture_output=True, text=True)
    try:
        return json.loads(r.stdout)
    except Exception:
        return {}


def norm(s):
    s = unicodedata.normalize("NFKD", s).lower()
    return re.sub(r"[^a-z0-9]+", "", s)


def references():
    """entry, parent, era, title -- straight from the real resolver."""
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
    for i = 1, #(e.readMore or {}) do
        -- io.write, not print: mock_wow swaps print for WoW's chat version.
        io.write(e.name, "\t", e.readMore[i], "\n")
    end
end)
'''
    r = subprocess.run(["lua", "-"], input=lua, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit("could not load the addon: %s" % r.stderr.strip())
    out = []
    for line in r.stdout.splitlines():
        p = line.split("\t")
        if len(p) == 2:
            out.append((p[0], p[1].replace("Wowpedia: ", "", 1)))
    return out


def fetch(titles):
    """title -> ('MISSING'|'REDIRECT'|'ARTICLE', target-or-body)"""
    state = {}
    for i in range(0, len(titles), 50):
        d = api({"action": "query", "prop": "revisions", "rvprop": "content",
                 "rvslots": "main", "format": "json",
                 "titles": "|".join(titles[i:i + 50])})
        for _, p in d.get("query", {}).get("pages", {}).items():
            if "missing" in p:
                state[p["title"]] = ("MISSING", None)
                continue
            c = p["revisions"][0]["slots"]["main"]["*"]
            if c.lstrip().lower().startswith("#redirect"):
                m = re.search(r"\[\[([^\]|#]+)", c)
                state[p["title"]] = ("REDIRECT", m.group(1).strip() if m else "?")
            else:
                state[p["title"]] = ("ARTICLE", c)
        time.sleep(0.2)
    return state


def classify(body):
    low = body.lower()
    for pat, name in ((r"\{\{\s*questbox", "QUEST"), (r"\{\{\s*npcbox", "NPC"),
                      (r"\{\{\s*infobox zone", "ZONE"),
                      (r"\{\{\s*infobox instance", "INSTANCE"),
                      (r"\{\{\s*infobox faction", "FACTION"),
                      (r"\{\{\s*disambig", "DISAMBIGUATION")):
        if re.search(pat, low):
            return name
    return "OTHER"


def main():
    refs = references()
    titles = sorted({t for _, t in refs})
    print("%d references, %d distinct titles" % (len(refs), len(titles)))
    state = fetch(titles)

    by_title = {}
    for entry, title in refs:
        by_title.setdefault(title, []).append(entry)

    dead = sorted(t for t in titles if state.get(t, ("MISSING",))[0] == "MISSING")
    if dead:
        print("\nDEAD, these ship as broken links:")
        for t in dead:
            print("   %-40s cited by %s" % (t, ", ".join(by_title[t])))
    else:
        print("\nno dead references")

    dis = sorted(t for t in titles
                 if state.get(t, ("", ""))[0] == "ARTICLE"
                 and classify(state[t][1]) == "DISAMBIGUATION")
    if dis:
        print("\nDISAMBIGUATION pages, which make the reader choose:")
        for t in dis:
            print("   %-40s cited by %s" % (t, ", ".join(by_title[t])))

    drift = []
    for t in sorted(titles):
        kind, target = state.get(t, ("", ""))
        if kind != "REDIRECT":
            continue
        a, b = norm(t), norm(target or "")
        if a not in b and b not in a and t not in DRIFTED:
            drift.append((t, target))
    if drift:
        print("\nredirects to an apparently unrelated page, worth an eye:")
        for t, target in drift:
            print("   %-40s -> %s" % (t, target))

    bare = [t for t in titles if "(" not in t]
    hits = fetch([t + " (Classic)" for t in bare])
    groups = {}
    for t, (kind, body) in hits.items():
        if kind != "ARTICLE":
            continue          # a (Classic) redirect settles nothing
        groups.setdefault(classify(body), []).append(t)
    if groups:
        print("\n(Classic) articles exist for these bare titles. Only QUEST is")
        print("normally a switch; see this file's header before changing any.")
        for kind in sorted(groups):
            print("  %s (%d): %s" % (kind, len(groups[kind]),
                                     ", ".join(sorted(groups[kind])[:6])
                                     + (" ..." if len(groups[kind]) > 6 else "")))
    return 1 if dead else 0


if __name__ == "__main__":
    sys.exit(main())
