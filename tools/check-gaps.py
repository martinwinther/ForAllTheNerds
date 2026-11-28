#!/usr/bin/env python3
"""Check the two gap files against each other AND against the addon itself.

coverage.md is generated from the addon and the client's area list. no-source.md
is written by hand and says why each gap is still a gap. The two drift the
moment a place is written up and the hand-written file is not updated, and a
stale reason is worse than no reason at all.

Checking them only against each other is not enough, and this is not
hypothetical: on 2026-11-28 four places that had been written up were still
listed as empty in coverage.md, three of them with a no-source.md row saying
there was nothing to write from. The check passed, because both files had gone
stale in the same direction at the same time, and the two agreed with each
other about a world neither of them had looked at. So the third comparison
below loads the addon and asks it what it actually has.

Run from the repository root:

    python3 -I tools/check-gaps.py

Exit status is 0 when the two agree and 1 when they do not. The near-miss and
borderline sections are commentary and are not counted.
"""

import os
import re
import sys

# python3 -I implies -P, so the script's own directory is not on sys.path and a
# plain `import addon_entries` fails. CI runs this with -I, so put it there.
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import addon_entries  # noqa: E402

COMMENTARY = ("Near miss", "borderline")


def checklist(path="tools/coverage.md"):
    return {m.group(1).strip() for m in re.finditer(r"^- \[ \] (.+)$", open(path).read(), re.M)}


def documented(path="tools/no-source.md"):
    names = set()
    for section in re.split(r"\n## ", open(path).read())[1:]:
        title = section.split("\n", 1)[0]
        if any(word in title for word in COMMENTARY):
            continue
        for line in section.split("\n"):
            if not line.startswith("| ") or line.startswith(("| Place", "|---")):
                continue
            names.add(line.split("|")[1].strip())
    return names


def zoned_checklist(path="tools/coverage.md"):
    """Every open gap as (name, zone), from the `### Zone -- N empty of M` heads."""
    out, zone = [], None
    for line in open(path):
        head = re.match(r"^### (.+?)\s+[-\u2014]+\s+\d+ empty of \d+\s*$", line)
        if head:
            zone = head.group(1).strip()
        gap = re.match(r"^- \[ \] (.+)$", line)
        if gap:
            out.append((gap.group(1).strip(), zone))
    return out


def already_written(gaps_with_zones):
    """Open gaps the addon already answers to, in the same zone.

    The zone has to match. coverage.md says so itself: a few subzone names sit
    in two zones and each needs its own entry, because the resolver matches a
    subzone against its declared parent. A name-only check would call those
    written when they are not.
    """
    index = addon_entries.by_name()
    hits = []
    for name, zone in gaps_with_zones:
        for e in index.get(addon_entries.norm(name), []):
            here = addon_entries.norm(e["parent"]) == addon_entries.norm(zone)
            top = e["kind"] != "sub" and addon_entries.norm(e["name"]) == addon_entries.norm(zone)
            if here or top:
                hits.append((name, zone, e))
                break
    return hits


def main():
    gaps, noted = checklist(), documented()
    missing, stale = sorted(gaps - noted), sorted(noted - gaps)
    for name in missing:
        print(f"  NOT EXPLAINED  {name} is an open gap with no row in no-source.md")
    for name in stale:
        print(f"  STALE          {name} has a row in no-source.md but is no longer a gap")
    written = already_written(zoned_checklist())
    for name, zone, e in written:
        print(f"  ALREADY WRITTEN  {name} is listed as empty under {zone}, "
              f"but the addon has an entry for it ({e['name']}, era {e['era']})")
    print(f"\n{len(gaps)} open gaps, {len(noted)} explained, "
          f"{len(missing) + len(stale) + len(written)} disagreements")
    if missing or stale or written:
        print("CHECK FAILED")
        return 1
    print("CHECK PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
