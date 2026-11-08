# Is anything missing?

A sweep of every top-level area the client knows about, against every name the
addon answers to. Run on 2026-11-09 against `AreaTable` for product `wowf`
(Forever, build 1.60.1.70862), fetched as CSV from wago.tools.

The question it answers: are there whole places, not subzones, that this addon
has nothing for.

## Method

`AreaTable` has 1,404 named areas. The 189 with `ParentAreaID = 0` are the
top-level ones, which is what `GetZoneText` returns. Those were matched against
a dump of the addon loaded under `tools/mock_wow.lua`, taking entry names
**and aliases**.

The aliases matter. A name-only dump reported the Sunken Temple as missing,
because the addon registers it as the Temple of Atal'Hakkar with Sunken Temple
as an alias. Four of the first run's sixty "missing" areas were that mistake.

## Result

Of 189 top-level areas, 27 have no entry once dev leftovers are dropped
(`***On Map Dungeon***`, `DELETE ME`, `UNUSED *`, `Designer Island`,
`Programmer Isle`, `GM Island`, test maps, and the `Blue Whelpling Inn
Prototype`). Every one of the 27 is accounted for:

**Post-vanilla, correctly absent (17).** Caverns of Time, Old Hillsbrad
Foothills, The Black Morass, Elsewhen, Outland, Gilneas, Ruins of Gilneas,
Battle for Gilneas, Shark-Infested Waters, Scarlet Enclave, The Burning of
Andorhal, Kul Tiras, Storm Cliffs, Darkspear Islands, Karazhan Crypts, Emerald
Forest, The Verdant Fields. The lore stops at patch 1.12, so these stay out.

**Open ocean (4).** Three rows named The Great Sea, one The Veiled Sea. Water,
not places.

**Cut or unreachable at 1.12 (3).** Azshara Crater, Gillijim's Isle, Island of
Doctor Lapidis. Present in the data, never finished, not somewhere a player
stands.

**Forever, still open (3).** Hyjal Crater, Excavation Site - Bael Modan,
Half-Pint Tavern. No wiki article exists for any of them; see
`tools/forever-areas.tsv`.

**Nothing unclassified.**

## What the sweep found and fixed

Four real, reachable vanilla locations had no entry, and now do:

| Area id | Place | Why it was worth having |
|---|---|---|
| 2257 | Deeprun Tram | Mentioned in six other entries, written up in none |
| 3478 | Gates of Ahn'Qiraj | The addon had Ahn'Qiraj, the Ruins and the Temple, not the wall across the front |
| 2918 | Champions' Hall | Reachable, and gave nothing on arrival |
| 2917 | Hall of Legends | The same, on the Horde side |

All four are registered as zones rather than subzones, because the client lists
them with `ParentAreaID = 0`.

None of the four has a child area in `AreaTable`: nothing points at 2257, 3478,
2918 or 2917 as a parent. So `tools/validate.lua` exempts them from its
"fewer than 3 locales" note, which they would otherwise trip forever. The
exemption is by name and narrow, and the check still fires for a zone that is
genuinely thin.

## The subzones, which the first sweep did not cover

The sweep above only looked at the 189 top-level areas. That was too narrow to
answer "is anything missing", because 1,215 of the 1,404 named areas are
children, and `GetSubZoneText` returns those.

Swept on the same data: **396 child areas have no entry**, after dev leftovers.
Accounted for as:

| | Count |
|---|---|
| Inside a dungeon or instance | 78 |
| Battleground internals (Alterac Valley, Arathi Basin, Warsong Gulch) | 37 |
| On a post-vanilla map (Gilneas, Scarlet Enclave, Caverns of Time) | 26 |
| Open water | 18 |
| Wrath death-knight content inside Eastern Plaguelands | 6 |
| **In scope: the vanilla overworld, both continents** | **231** |

The 231 are in `tools/area-gaps.tsv`, under 44 parent zones. Ashenvale has 15,
Stranglethorn Vale 14, Tirisfal Glades 13.

They are not building interiors. A sample of what is in there: Darrowshire,
Ravenholdt Manor, the Old Dalaran Ruins, the Shady Rest Inn, Uldum, the Temple
of Zin-Malor, the Shrine of the Fallen Warrior, Bael Modan, The Maul, Fenris
Keep, Stonewatch Keep, the Tower of Arathor, Menethil Keep, Anvilmar, the
Agamand Family Crypt, Faol's Rest, Emberstrife's Den, Forest Song, Dream Bough
and Oneiros. Several of those carry more vanilla lore than places already
written up.

Treat 231 as an upper bound. Some will be spelling variants of entries that
exist, and a name match cannot tell: "The Cemetary" in Duskwood against Raven
Hill Cemetery, for instance. `/ftn areas` in game uses the real resolver and
settles each one properly.

## Re-running it

The addon dump needs aliases or the answer is wrong. Load the addon against
`tools/mock_wow.lua`, walk `ns.EachEntry`, and emit `e.name` plus every entry
in `e.aliases`. Then compare, normalised, against the `ParentAreaID = 0` rows
of `AreaTable`.

`/ftn areas` does the same job from inside the game, across every area rather
than only the top-level ones, and uses the real resolver instead of a name
match.
