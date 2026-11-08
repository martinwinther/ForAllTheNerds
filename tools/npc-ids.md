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

## Route 3: the game files, and why they are not the answer

Worth writing down, because it looks like the obvious route and is not.

Spawn positions are **not in the client**. They are server-side. That is the
whole reason emulator projects had to reconstruct them, and that reconstruction
is what route 2 is. The one thing most wanted from an NPC, where it stands,
therefore cannot come from an installed copy of the game at any version.

What the client genuinely holds is the area table, and that is reachable through
the official API without touching a file: `C_Map.GetAreaInfo(areaID)` returns
the subzone name for an `AreaTable.db2` id. It is present on Forever 1.60.1 and
on Classic Era from 1.13.2, and its only predicate is `AllowedWhenUntainted`, with
no secret-value predicate, leaving the names plainly readable. `/ftn areas` walks
the id range and reports every name the client knows, split into what has an
entry and what does not.

That is strictly better than reading files for this purpose: no extraction
tooling, no CASC listfile, nothing to keep out of the repository, and no
question about the terms of use. It also covers Forever's four new zones, where
no outside source reaches.

Two things left unestablished, so do not assume either way:

- Whether `Creature.db2` in a modern client carries creature **names**. The
  wowdev wiki page for it has no schema content at all. In vanilla the names
  came from the server, not the client.
- Whether a `GetAreaInfo` loop reaches every area. The wiki documents no id
  range and no result for an unused id. The scan assumes nothing and skips
  anything that is not a plain string. MapDumper, a Forever addon
  published in September 2026, collects names the same way, which says the
  approach works in practice rather than that it is exhaustive.

## Route 4: the data sites

Two of them, with opposite answers. Check before fetching.

**Wowhead: no, though the rule is narrower than it first looks.** Its
`robots.txt` opens with one `Disallow: /` block naming 28 agents, `ClaudeBot`,
`anthropic-ai`, `Claude-Web`, `GPTBot`, `CCBot`, `Scrapy`, `Bytespider` and
`Diffbot` among them. The tooling used here answers to those names, which is
why nothing here fetches it.

Three details are worth being accurate about, because "Wowhead blocks bots" is
not what the file says:

- There is **no `User-agent: *` section at all**, so the file is silent about
  clients it does not name rather than blocking them.
- `Claude-SearchBot` is treated as a different thing entirely: `Crawl-delay: 1`
  and 3,198 `Disallow` lines that contain **no** bare `Disallow: /`. Folded
  across its 92 language and flavour prefixes those come to 13 path shapes:
  `/account`, `/error-static-cdn`, `/list`, `/random`, `/search` and
  `/site-achievement/*`. Account pages and dynamic query pages are closed;
  ordinary content pages are not. So the distinction being drawn is bulk
  harvesting against search-time retrieval, not pages against machines.
- `robots.txt` governs fetching, not what may be done with what was fetched.
  Wowhead's terms are a separate matter, and bulk extraction for
  redistribution is a different question from reading one page.

None of which gets us anywhere, because **Wowhead has no public API to block**.
What it once offered was an undocumented, item-only endpoint, with nothing for
creatures. `robots.txt` never mentions an API and carries no `Allow` line.

**Blizzard's own API is the sanctioned one**, and it does have creature routes:
`/data/wow/creature/{creatureId}` and `/data/wow/search/creature` with a
`name.en_US` parameter, under the `static-classic1x-{region}` namespace for
Classic Era. It needs OAuth client credentials from the Battle.net developer
portal, so it cannot be tried from here without an account.

Worth knowing before spending an evening on it: it is a name-and-identity
service, not a placement one. It returns the name, type, family and display
ids, and **no zone** -- the same server-side reason `Creature.db2` has none.
Its terms also restrict redistributing what comes back. So it would confirm the
name-to-id mapping that route 2 already produced, from Blizzard rather than
from a reconstruction, and add nothing about where anything stands. Whether a
Forever namespace is exposed at all is unverified.

**wago.tools: yes, and it invites it.** Its `robots.txt` blocks the HTML DB2
browser and then opens `/api/` and `/db2/{table}/csv` explicitly, with a
`/llms.txt` written for automated readers that says to use those routes instead
of pages. It serves the game's own DB2 tables per build.

`/api/builds` lists 15 products. The two that matter:

| Product | Build |
|---|---|
| `wowf` | 1.60.1.70862 -- Forever |
| `wow_classic_era` | 1.15.9.70576 |

Read on 2026-11-08. `/db2/{table}/csv?product=wowf` then returns that table.

### What this settles

**`Creature.db2` is not an NPC source, and now we know why.** It does carry
`Name_lang` and `Title_lang`, which closes the earlier open question. It holds
**189 rows**. Against roughly ten thousand creatures in the 1.12 world database,
the client clearly ships names for a tiny handful and gets the rest from the
server. Client-side data cannot give the roster at any version.

**`AreaTable` is the prize instead.** For `wowf` it has 1,404 named areas.
Matched against the addon's 759 entries by name, 868 rows already have one and
536 do not. Narrowed to Forever's own zones it is 68 areas, 8 written up and 60
missing:

| Zone | Missing |
|---|---|
| Zephras Isle | 27 |
| Riverglades | 18 |
| Mount Hyjal | 9 |
| Shen'dralas | 5 |
| Hyjal Crater | 1 |

Those 60 are in `tools/forever-areas.tsv` with their area ids. The highest area
id in the table is 17853, which is why `/ftn areas` defaults to a 20,000
ceiling.

### Keeping it the right side of the line

The CSV is Blizzard's client data, served by a route whose owner permits it.
The same discipline as route 2 applies: the download stays out of the
repository. What is committed is the derived worklist, the place names this
addon sets out to write about and will print on screen anyway.

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
