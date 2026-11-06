#!/usr/bin/env python3
"""
tools/generate.py -- helper for growing the ForAllTheNerds lore database.

The addon ships a hand-written Lua database because WoW addons cannot fetch
anything at runtime. This script is the workflow around that: it tells you what
is missing, builds a ready-to-paste prompt in the project's house style, and
emits Lua skeletons when you would rather write entries yourself.

No third-party packages. Python 3.8+.

  # What does the database already cover?
  python3 tools/generate.py coverage

  # Which places in places.tsv have no entry yet?
  python3 tools/generate.py missing

  # Build a prompt for the next 12 missing places, paste it into Claude
  python3 tools/generate.py prompt --limit 12 > /tmp/batch.md

  # ...or for specific places
  python3 tools/generate.py prompt --place "Tyr's Hand" --place "Terrordale"

  # Emit Lua skeletons to fill in by hand
  python3 tools/generate.py skeleton --limit 5 >> Data/Custom.lua

  # Re-run the Lua validator
  python3 tools/generate.py check
"""

import argparse
import os
import re
import subprocess
import sys
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
DATA_DIR = os.path.join(ROOT, "Data")
PLACES_TSV = os.path.join(HERE, "places.tsv")
PROMPT_MD = os.path.join(HERE, "prompt.md")


# ---------------------------------------------------------------------------
# Reading what already exists
#
# We parse the Lua with regexes rather than running it. That is good enough
# because we only need the `name = "..."` of each registered entry and the
# `ns.SubsOf("Parent", {` grouping, and it keeps this script dependency-free.
# validate.lua is the thing that actually loads and checks the data.
# ---------------------------------------------------------------------------

NAME_RE = re.compile(r'^\s*(?:\{\s*)?name\s*=\s*"((?:[^"\\]|\\.)*)"', re.M)
SUBSOF_RE = re.compile(r'(?:ns\.)?SubsOf\s*\(\s*"((?:[^"\\]|\\.)*)"')
ZONE_RE = re.compile(r'(?:ns\.)?Zone\s*\{')
INSTANCE_RE = re.compile(r'(?:ns\.)?Instance\s*\{')


def lua_files():
    if not os.path.isdir(DATA_DIR):
        return []
    return sorted(
        os.path.join(DATA_DIR, f)
        for f in os.listdir(DATA_DIR)
        if f.endswith(".lua")
    )


def existing_entries():
    """Return {normalised name: (display name, kind, source file)}."""
    found = {}
    for path in lua_files():
        with open(path, encoding="utf-8") as fh:
            text = fh.read()

        # Walk the file line by line so we know which construct each `name =`
        # belongs to, and which SubsOf block we are inside.
        kind = None
        for line in text.splitlines():
            if ZONE_RE.search(line):
                kind = "zone"
            elif INSTANCE_RE.search(line):
                kind = "instance"
            elif SUBSOF_RE.search(line):
                kind = "sub"

            m = NAME_RE.match(line)
            if m:
                display = m.group(1)
                found.setdefault(norm(display), (display, kind or "?", os.path.basename(path)))
    return found


def norm(s):
    s = s.replace("’", "'").replace(" ", " ")
    s = re.sub(r"\s+", " ", s).strip().lower()
    return s


# ---------------------------------------------------------------------------
# The wanted-places list
# ---------------------------------------------------------------------------

def read_places():
    """places.tsv: kind<TAB>name<TAB>parent<TAB>faction<TAB>levels<TAB>notes"""
    if not os.path.exists(PLACES_TSV):
        return []
    rows = []
    with open(PLACES_TSV, encoding="utf-8") as fh:
        for lineno, raw in enumerate(fh, 1):
            line = raw.rstrip("\n")
            if not line.strip() or line.lstrip().startswith("#"):
                continue
            parts = line.split("\t")
            while len(parts) < 6:
                parts.append("")
            kind, name, parent, faction, levels, notes = (p.strip() for p in parts[:6])
            if not name:
                sys.stderr.write(f"places.tsv:{lineno}: row has no name, skipped\n")
                continue
            rows.append({
                "kind": kind or "sub",
                "name": name,
                "parent": parent,
                "faction": faction,
                "levels": levels,
                "notes": notes,
            })
    return rows


def select_places(args, have):
    rows = read_places()

    if args.place:
        wanted = {norm(p) for p in args.place}
        chosen = [r for r in rows if norm(r["name"]) in wanted]
        # Allow naming a place that is not in the TSV at all.
        for p in args.place:
            if norm(p) not in {norm(r["name"]) for r in chosen}:
                chosen.append({"kind": "sub", "name": p, "parent": "",
                               "faction": "", "levels": "", "notes": ""})
        return chosen

    pending = [r for r in rows if norm(r["name"]) not in have]
    if args.parent:
        pending = [r for r in pending if norm(r["parent"]) == norm(args.parent)]
    if args.limit:
        pending = pending[: args.limit]
    return pending


# ---------------------------------------------------------------------------
# Commands
# ---------------------------------------------------------------------------

def cmd_coverage(args):
    have = existing_entries()
    by_kind = defaultdict(int)
    by_file = defaultdict(int)
    for _, (_, kind, src) in have.items():
        by_kind[kind] += 1
        by_file[src] += 1

    print(f"{len(have)} entries in {len(by_file)} data files\n")
    print("by kind:")
    for kind in sorted(by_kind):
        print(f"  {kind:10s} {by_kind[kind]}")
    print("\nby file:")
    for src in sorted(by_file):
        print(f"  {src:28s} {by_file[src]}")

    rows = read_places()
    if rows:
        pending = [r for r in rows if norm(r["name"]) not in have]
        print(f"\nplaces.tsv lists {len(rows)} places, {len(pending)} still without an entry")
    return 0


def cmd_missing(args):
    have = existing_entries()
    rows = read_places()
    if not rows:
        print("places.tsv is empty or missing; nothing to compare against.")
        return 0

    pending = [r for r in rows if norm(r["name"]) not in have]
    if args.parent:
        pending = [r for r in pending if norm(r["parent"]) == norm(args.parent)]

    if not pending:
        print("Nothing missing. Everything in places.tsv has an entry.")
        return 0

    grouped = defaultdict(list)
    for r in pending:
        grouped[r["parent"] or "(no parent)"].append(r)

    print(f"{len(pending)} places without an entry:\n")
    for parent in sorted(grouped):
        print(f"  {parent}")
        for r in grouped[parent]:
            extra = f"  -- {r['notes']}" if r["notes"] else ""
            print(f"      {r['name']}{extra}")
    return 0


def cmd_prompt(args):
    have = existing_entries()
    chosen = select_places(args, have)
    if not chosen:
        sys.stderr.write("nothing to generate; everything selected already has an entry\n")
        return 1

    try:
        with open(PROMPT_MD, encoding="utf-8") as fh:
            house_style = fh.read()
    except FileNotFoundError:
        sys.stderr.write(f"missing {PROMPT_MD}\n")
        return 2

    print("# Task")
    print()
    print("Write ForAllTheNerds lore entries for the places listed at the bottom of")
    print("this message. Follow the house style below exactly. Return Lua only.")
    print()
    print("---")
    print()
    print(house_style.rstrip())
    print()
    print("---")
    print()
    print("# Places to write")
    print()

    grouped = defaultdict(list)
    for r in chosen:
        grouped[(r["kind"], r["parent"])].append(r)

    for (kind, parent) in sorted(grouped, key=lambda k: (k[1], k[0])):
        rows = grouped[(kind, parent)]
        if kind == "sub" and parent:
            print(f"## Locales inside {parent}  (use `ns.SubsOf(\"{parent}\", {{ ... }})`)")
        elif kind == "zone":
            print("## Zones  (use `ns.Zone{ ... }`)")
        elif kind == "instance":
            print("## Instances  (use `ns.Instance{ ... }`)")
        else:
            print(f"## {kind} entries")
        print()
        for r in rows:
            bits = []
            if r["faction"]:
                bits.append(f"faction {r['faction']}")
            if r["levels"]:
                bits.append(f"levels {r['levels']}")
            meta = f" ({', '.join(bits)})" if bits else ""
            print(f"- **{r['name']}**{meta}")
            if r["notes"]:
                print(f"  - known facts to work from: {r['notes']}")
        print()

    # Tell the model what we already have, so it does not repeat a neighbour's
    # material or contradict an existing entry.
    parents = sorted({r["parent"] for r in chosen if r["parent"]})
    if parents:
        print("# Already written, do not repeat or contradict")
        print()
        for parent in parents:
            if norm(parent) in have:
                print(f"- The zone entry for **{parent}** already exists; do not rewrite it.")
            written = sorted(
                display for _, (display, kind, _) in have.items()
                if kind == "sub"
            )
            # Only mention siblings that are plausibly in this zone, which we
            # cannot know from the regex parse, so list nothing rather than
            # mislead. The zone entry note above is the useful part.
            del written
        print()

    print(f"Write {len(chosen)} entr{'y' if len(chosen) == 1 else 'ies'}. Lua only, no commentary.")
    return 0


def lua_escape(s):
    return s.replace("\\", "\\\\").replace('"', "'")


def cmd_skeleton(args):
    have = existing_entries()
    chosen = select_places(args, have)
    if not chosen:
        sys.stderr.write("nothing to generate\n")
        return 1

    grouped = defaultdict(list)
    for r in chosen:
        grouped[(r["kind"], r["parent"])].append(r)

    print("-- Generated skeletons from tools/generate.py. Fill in hook and lore,")
    print("-- then run: lua tools/validate.lua")
    print("-- Entries with an empty hook or lore are REJECTED at load time by")
    print("-- Data/Schema.lua, so an unfinished stub cannot ship by accident.")
    print()

    for (kind, parent) in sorted(grouped, key=lambda k: (k[1], k[0])):
        rows = grouped[(kind, parent)]
        if kind == "sub" and parent:
            print(f'ns.SubsOf("{lua_escape(parent)}", {{')
            for r in rows:
                print("\t{")
                print(f'\t\tname = "{lua_escape(r["name"])}",', end="")
                if r["faction"]:
                    print(f' faction = "{lua_escape(r["faction"])}",', end="")
                if r["levels"]:
                    print(f' levels = "{lua_escape(r["levels"])}",', end="")
                print()
                print('\t\thook = "",')
                print("\t\tlore = {")
                print('\t\t\t"",')
                print("\t\t},")
                if r["notes"]:
                    print(f"\t\t-- notes: {r['notes']}")
                print("\t},")
            print("})")
            print()
        else:
            fn = "ns.Instance" if kind == "instance" else "ns.Zone"
            for r in rows:
                print(f"{fn}{{")
                print(f'\tname = "{lua_escape(r["name"])}",', end="")
                if r["parent"]:
                    print(f' continent = "{lua_escape(r["parent"])}",', end="")
                if r["faction"]:
                    print(f' faction = "{lua_escape(r["faction"])}",', end="")
                if r["levels"]:
                    print(f' levels = "{lua_escape(r["levels"])}",', end="")
                print()
                print('\thook = "",')
                print("\tlore = {")
                print('\t\t"",')
                print("\t},")
                if r["notes"]:
                    print(f"\t-- notes: {r['notes']}")
                print("}")
                print()
    return 0


def cmd_check(args):
    lua = None
    for candidate in ("lua", "lua5.4", "lua5.3", "lua5.1", "luajit", "lua-5.5", "lua5.5"):
        try:
            subprocess.run([candidate, "-v"], capture_output=True, check=False)
            lua = candidate
            break
        except FileNotFoundError:
            continue
    if not lua:
        sys.stderr.write(
            "no lua interpreter found. Install one (brew install lua) to run the validator.\n"
        )
        return 2

    print(f"running: {lua} tools/validate.lua")
    result = subprocess.run([lua, os.path.join("tools", "validate.lua")], cwd=ROOT)
    return result.returncode


def main():
    ap = argparse.ArgumentParser(
        description="Grow the ForAllTheNerds lore database.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    sub = ap.add_subparsers(dest="cmd")

    def add_selectors(p):
        p.add_argument("--place", action="append", default=[],
                       help="a specific place name; repeatable")
        p.add_argument("--parent", help="only places inside this zone")
        p.add_argument("--limit", type=int, default=12,
                       help="how many places to include (default 12)")

    sub.add_parser("coverage", help="what the database already contains")

    p = sub.add_parser("missing", help="places in places.tsv with no entry yet")
    p.add_argument("--parent", help="only places inside this zone")

    add_selectors(sub.add_parser("prompt", help="build an AI prompt for a batch"))
    add_selectors(sub.add_parser("skeleton", help="emit Lua stubs to fill in"))
    sub.add_parser("check", help="run the Lua validator")

    args = ap.parse_args()
    if not args.cmd:
        ap.print_help()
        return 0

    return {
        "coverage": cmd_coverage,
        "missing": cmd_missing,
        "prompt": cmd_prompt,
        "skeleton": cmd_skeleton,
        "check": cmd_check,
    }[args.cmd](args)


if __name__ == "__main__":
    sys.exit(main())
