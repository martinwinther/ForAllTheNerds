#!/usr/bin/env python3
"""Check the characters named in vanilla entries against a real 1.12 NPC list.

Why this exists. The Southern Barrens and Gold Road entries described the Great
Divide, a chasm the Cataclysm opened. The Headland entry described a Stormpike
training camp with three named instructors, all of them Cataclysm. Southbreak
Shore named Captain Dreadbeard, also Cataclysm. Every one of those came from
reading a retail wiki page, where one article covers a place in every expansion
it has existed in, and taking the present tense at face value.

tools/validate.lua catches the named ones: it fails the build on a list of
out-of-era terms. It cannot catch a character who simply does not exist yet,
because there is nothing distinctive about the name. That needs data.

cmangos/classic-db publishes the 1.12.1 world database, and its
`creature_template` table is the list of every creature in the game at patch
1.12.1. A character named in a vanilla entry who is not in that table either
belongs to history, which is in scope, or does not exist yet, which is not.
The check cannot tell those apart, so it prints a list to read rather than a
pass or a fail. Roughly thirty names come back and most are dead kings.

    python3 -I tools/check-era.py --download     # fetch the DB to a temp dir
    python3 -I tools/check-era.py --db /path/to/ClassicDB_1_12_1_z2815.sql.gz

The dump is GPL-3.0 and this addon is MIT, so it is never committed and never
redistributed: it is downloaded, read, and left in a temporary directory.
Forever entries are skipped, because Forever's characters are its own and are
correctly absent from a 1.12 table.
"""

import argparse
import collections
import gzip
import os
import re
import subprocess
import sys
import tempfile
import urllib.request

DB_URL = (
    "https://raw.githubusercontent.com/cmangos/classic-db/master/"
    "Full_DB/ClassicDB_1_12_1_z2815.sql.gz"
)

TITLES = (
    "Captain|Commander|General|Instructor|Drill Sergeant|Sergeant|Lieutenant|"
    "Warlord|Chieftain|High Chieftain|Marshal|Master|Mistress|Apothecary|"
    "Magister|Archmage|Brother|Sister|Father|Lady|Lord|King|Queen|Prince|"
    "Princess|Baron|Bishop|Deathguard|Deputy|Sheriff|Overlord|Taskmaster|"
    "Foreman|Innkeeper|Elder|Farseer|Warchief|Priestess|High Priestess|Seer|"
    "Scout|Ranger|Huntsman|Doctor|Witch Doctor|Professor|Warden|Keeper"
)


def creature_names(path):
    """Every creature name in the 1.12.1 world database."""
    names = set()
    with gzip.open(path, "rt", encoding="utf8", errors="replace") as handle:
        for line in handle:
            if not line.startswith("INSERT INTO `creature_template`"):
                continue
            body = line[line.index("VALUES") + 6:]
            for row in body.split("),("):
                quoted = re.findall(r"'((?:[^'\\]|\\.)*)'", row)
                if quoted:
                    names.add(quoted[0])
    return names


def entry_prose():
    """(entry name, era, prose) for every entry, via the mock client."""
    out = subprocess.run(
        ["lua", "tools/dump-prose.lua"], capture_output=True, text=True, check=True
    ).stdout
    for line in out.splitlines():
        parts = line.split("\t", 2)
        if len(parts) == 3:
            yield parts[0], parts[1], parts[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", help="path to the ClassicDB .sql.gz")
    parser.add_argument("--download", action="store_true", help="fetch it to a temp dir")
    args = parser.parse_args()

    path = args.db
    tmp = None
    if args.download:
        tmp = tempfile.mkdtemp(prefix="ftn-classicdb-")
        path = os.path.join(tmp, "classicdb.sql.gz")
        print(f"Downloading the 1.12.1 world database to {path}")
        urllib.request.urlretrieve(DB_URL, path)
    if not path:
        parser.error("pass --db with a path, or --download to fetch it")
    if not os.path.exists(path):
        parser.error(f"no such file: {path}")

    names = creature_names(path)
    print(f"{len(names)} creature names in the 1.12.1 world database")
    lowered = {n.lower() for n in names}
    # "Twilight Lord Everun" is in the table and the prose says so, but the
    # title pattern only catches "Lord Everun". A candidate that is the tail of
    # a real name is that same character, so it is not a finding.
    suffixes = {n.lower() for n in names}

    def is_known(candidate):
        low = candidate.lower()
        if low in lowered:
            return True
        return any(full.endswith(" " + low) for full in suffixes)

    titled = re.compile(f"(?:{TITLES})" + r"\s+[A-Z][\w']+(?:\s+[A-Z][\w']+)?")
    flagged = collections.defaultdict(list)
    checked = 0
    for name, era, prose in entry_prose():
        if era == "forever":
            continue
        checked += 1
        for candidate in sorted(set(titled.findall(prose))):
            candidate = candidate.strip()
            if is_known(candidate):
                continue
            words = candidate.split()
            # A possessive or a swallowed extra word still names the real NPC.
            if len(words) > 2 and is_known(" ".join(words[:-1])):
                continue
            if is_known(candidate.rstrip("'s")):
                continue
            flagged[candidate].append(name)

    print(f"{checked} vanilla entries read\n")
    if not flagged:
        print("No titled character in a vanilla entry is missing from 1.12.")
        return 0
    print(f"{len(flagged)} titled names are not in the 1.12 table. Read them:")
    print("a dead king is fine, a captain standing on a beach is not.\n")
    for candidate in sorted(flagged):
        where = ", ".join(sorted(flagged[candidate])[:3])
        print(f"  {candidate:38} {where}")
    if tmp:
        print(f"\nThe database is in {tmp} and is not to be committed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
