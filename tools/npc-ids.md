# Getting NPC ids without doing it by hand

`tools/characters.tsv` was built from the wiki, and the wiki cannot answer the
two questions that decide whether a candidate is worth writing up: does this
NPC exist in the game, and where does it stand. There are two automatic ways to
answer. They answer different things, and both are worth having.

## Route 1: the client itself

`/ftn npcs` records the creature id along with the name and zone. It comes out
of `UnitGUID`:

    Creature-0-1465-0-2105-448-000043F59F
                             ^^^ the creature id. 448 is Hogger.

What this is good for: it is the only thing that can say what exists **in
Forever**, how Forever spells it, and which zone it really stands in. No
outside database covers Forever's own zones at all. Shen'dralas, Zephras Isle,
Riverglades and Mount Hyjal can only be answered this way.

What it costs: you have to walk past them. It also yields no id where the
client makes unit identity secret. A later sighting back-fills it.

## Route 2: the 1.12.1 world database

[cmangos/classic-db](https://github.com/cmangos/classic-db) is a content
database for World of Warcraft client patch 1.12, which is exactly this addon's
era. One file, `Full_DB/ClassicDB_1_12_1_z2815.sql.gz`, about 12 MB.

Two tables matter:

| Table | Gives |
|---|---|
| `creature_template` | `Entry` (the creature id), `Name`, `SubName`, `MinLevel`, `MaxLevel`, `Rank`, `NpcFlags` |
| `creature` | one row per spawn: `id`, `map`, `position_x/y/z` |

Measured on 2026-11-08: 10,384 templates, 10,066 of them named, and 7,422
distinct ids with at least one spawn across 66,310 spawn rows.

Joined against the 234 candidates in `characters.tsv` by name:

    spawned in the 1.12 world     84
    defined but never placed       5
    not in the database at all   145

### What that join does and does not prove

It **does** settle existence and identity. For the 84 it returns a real id, the
`<title>` under the name, the rank, the level and the map, which is better than
anything the wiki offers and needs no judgement.

It **does not** settle scope, and reading it that way would throw out good
entries. This addon covers patch 1.12 and earlier *plus* Warcraft I-III and the
pre-WoW history. Cenarius, Khadgar, Thoras Trollbane, Queen Azshara and Huln
Highmountain are all absent from the 1.12 database and all legitimately in
scope: they are history, not NPCs you can walk up to. The group worth dropping
is the narrower one whose lore is World-of-Warcraft-era and who still have no
1.12 NPC. Sorting the 145 into those two piles by keyword does not work --
"World of Warcraft" contains "Warcraft", so a naive era-keyword list files
Veronica Nials as ancient history. That part needs reading.

There is also no zone in it. `creature` carries `map` and raw coordinates, not
an area name, so zone attribution needs the client's own area tables on top.
Route 1 gives the zone directly, which is the better answer.

Finally it is a reconstruction, not Blizzard's data, so it can carry entries
that were never live. Malfurion Stormrage has a template row and no spawn.

### Licence, which matters here

`cmangos/classic-db` is **GPL-3.0**. This addon is MIT. Two separate things
follow:

- **Using it offline is fine.** The GPL restricts distribution, not use.
  Reading the dump on your own machine to check a list against it, or to look
  up an id, carries no obligation.
- **Do not commit the dump or a bulk extract, and do not ship either.**
  `tools/` is excluded from the zip by `.pkgmeta`, and nothing here reaches
  players. This repository is public, though, and that is still distribution.
  A wholesale table copied into an MIT repository is the thing to avoid.

There is a second restriction worth knowing about, separate from the GPL. The
EU grants databases a *sui generis* right against extracting a substantial part
of their contents. It applies to factual data that copyright would not protect. Denmark is in scope. A handful of ids checked one at a time is not a
substantial part; a copy of `creature_template` is.

So: keep the dump out of the repository, use it as a check rather than a
source, and write the prose from facts as the lore files already do.

## Reproducing the join

The dump goes in a directory of its own, and the scripts stay out of it, since
the download is untrusted:

```bash
curl -sLo "$D/classicdb.sql.gz" https://raw.githubusercontent.com/cmangos/classic-db/master/Full_DB/ClassicDB_1_12_1_z2815.sql.gz
```

The two parsers used for the numbers above read `INSERT INTO creature_template`
and `INSERT INTO creature` straight out of the gzip stream, splitting the
`VALUES` tuples with quote and escape handling rather than a regex. Column
positions come from the `CREATE TABLE` in the same file; line N of that
statement is index N-2. Getting that off by one silently reports
`HealthMultiplier` in place of `Rank`, and a rank of 500 is the symptom.
