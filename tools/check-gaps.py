#!/usr/bin/env python3
"""Check that tools/no-source.md accounts for every gap in tools/coverage.md.

coverage.md is generated from the addon and the client's area list. no-source.md
is written by hand and says why each gap is still a gap. The two drift the
moment a place is written up and the hand-written file is not updated, and a
stale reason is worse than no reason at all.

Run from the repository root:

    python3 -I tools/check-gaps.py

Exit status is 0 when the two agree and 1 when they do not. The near-miss and
borderline sections are commentary and are not counted.
"""

import re
import sys

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


def main():
    gaps, noted = checklist(), documented()
    missing, stale = sorted(gaps - noted), sorted(noted - gaps)
    for name in missing:
        print(f"  NOT EXPLAINED  {name} is an open gap with no row in no-source.md")
    for name in stale:
        print(f"  STALE          {name} has a row in no-source.md but is no longer a gap")
    print(f"\n{len(gaps)} open gaps, {len(noted)} explained, {len(missing) + len(stale)} disagreements")
    if missing or stale:
        print("CHECK FAILED")
        return 1
    print("CHECK PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
