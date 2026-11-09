# Places with no source

Names the client reports that have nothing written about them anywhere
reachable. They stay on the checklist in `tools/coverage.md`, because the game
does name them and somebody standing there gets nothing. Do not research them
again without a new source.

This file is written by hand. `tools/coverage.md` is generated, and the
generator used to delete this table every time it ran, which is why the two
are now separate files.

| Place | Zone | Why |
|---|---|---|
| Mantle Rock | Mulgore | Never left the World of Warcraft beta |
| Mok'Gordun | Feralas | Never left the beta; likely an early name for the Gordunni Outpost |
| Ironclad Prison | Dustwallow Marsh | Never left the beta; named only in the non-canon RPG |
| Zane's Eye Crater | Thousand Needles | Never left the World of Warcraft beta |
| Gornia | Thousand Needles | Never left the beta; the wiki only speculates it was an ogre settlement |
| Valley of the Bloodfuries | Stonetalon Mountains | Never left the beta; possibly an early name for the Charred Vale |
| Ironforge Submarine Facility | Dun Morogh | A Forever area (id 16741). Zero mentions anywhere on the wiki |
| Moggle Point | Dustwallow Marsh | Never left the World of Warcraft beta |
| The Whipple Estate | Duskwood | Never left the beta; a house owned by the Whipple family, and nothing more |
| Bucklebree Farm | Silverpine Forest | Never left the World of Warcraft beta |
| O'Breen's Camp | Arathi Highlands | Never left the beta; likely Shakes O'Breen's unnamed camp at Faldir's Cove |
| Pillar of Assimilation | Un'Goro Crater | A Forever area (id 16986). Zero mentions anywhere on the wiki |
| The Rumble Cage | Tanaris | Never left the World of Warcraft beta; a planned Tanaris subzone, removed |
| The Sanctum | Arathi Highlands | No article under that name |
| The World Tree | Duskwood | No article under that name |
| Broken Spear Village | Desolace | Never left the World of Warcraft beta |
| Poacher's Den | Burning Steppes | A Forever area (id 16739) that shares a name with a Season of Discovery quest. Nothing written about the Forever one |
| Blackwater Shipwrecks | Arathi Highlands | Never left the beta; probably the water around two wrecks on the Drowned Reef |
| Vanndir Encampment | Azshara | Never left the World of Warcraft beta |
| West Point Tower | Dustwallow Marsh | Never left the beta; likely Lost Point, Theramore's westernmost tower |
| Stormwind Mountains | Elwynn Forest | Never left the World of Warcraft beta |
| Brave Wind Mesa | Mulgore | Never left the World of Warcraft beta |
| Fire Stone Mesa | Mulgore | Never left the World of Warcraft beta |
| Skyline Ridge | Mulgore | Never left the World of Warcraft beta |
| The Searing Basin | Searing Gorge | A test-only instance, never part of the live game |
| Shell Beach | Stranglethorn Vale | Never left the World of Warcraft beta |
| Sunken Hollow | Stranglethorn Vale | A Forever area (id 17853). Zero mentions anywhere on the wiki |
| Not Used Deadmines | Westfall | A development leftover, as the name says |
| Scalding Ridge | Thousand Needles | A Forever area (id 17052). Zero mentions anywhere on the wiki, searched by source text |
| The Eventide | Dalaran | A Forever area (id 17824) inside Forever's Dalaran. The one Eventide article is the Wrath-era Dalaran plaza and is a different place |
| Stomping Grounds | Un'Goro Crater | A Forever area (id 16637) that shares a name with a Dragonblight quest. Nothing written about the Un'Goro one |
| Martsirt | The Hinterlands | A Forever area (id 16740). Zero mentions anywhere on the wiki |

## Near misses, written anyway

| Place | What happened |
|---|---|
| Legashi Encampment | The wiki spells it Legash. Written from the established satyr lore rather than from a page for that exact name. |
| School of Necromancy | This is Scholomance, which the addon already had. Registered as an alias of it rather than written twice. |
| Algaz Gate | This is Dun Algaz, already written up in Data/Locales.lua. Registered as an alias. |
| The Cemetary | This is Raven Hill Cemetery, already written up. Registered as an alias, misspelling included, since that is what the client reports. |

## Out of era rather than out of sources

| Place | Zone | Why |
|---|---|---|
| Caverns of Time | Tanaris | The area is in the client's AreaTable, but the Caverns are Burning Crusade content and everything in them is later still. Out of scope by the same rule that keeps Outland and Gilneas out. |

## How to check a name properly

Two mistakes were made here and both are worth not repeating.

**Check the area id before deciding what a name is.** Anything numbered 16000
or higher is Forever's own, not vanilla. Eleven names in this file were filed
as beta leftovers or as name clashes with later content when they are in fact
new Forever places: Camp Gev'rek, Gloomrise, Scalding Ridge, Martsirt, the
Ironforge Submarine Facility, the Pillar of Assimilation, the Stomping
Grounds, Poacher's Den, Sunken Hollow, Dragonmaw Retreat and the Drunken
Dwarf. `tools/area-gaps.tsv` has the id in column two.

**A missing page is not a missing source.** The wiki documents Forever from
the NPC and quest side first and the place articles come later, so a place
with no article of its own is often described on half a dozen other pages.
Shadowvale has no page and is described in full on the Whispering Forest
article. Camp Gev'rek has no page and is described on the Earthen Ring's.

The way to settle it is the wiki's own API, which answers both questions
cheaply:

    /api.php?action=query&format=json&formatversion=2&titles=A|B|C
    /api.php?action=query&list=search&srsearch=insource:"NAME"&format=json

The first says which names have articles. The second finds every page whose
source mentions the name, with a snippet. A zero-hit `insource` result is a
real answer: nobody has written anything about that place anywhere. That is
what the rows above now record, and it took eight searches to establish.

Do not use `index.php?search=`, the human search page. Cloudflare challenges
it and challenges are not to be worked around. The API answers without one.

## Worth re-checking

The wiki is days old on Forever's content and is still being written. On
2026-11-09 a re-check turned up a new `Category:Riverglades subzones` holding
ten pages, three of them new, and the API sweep described above turned up four
more places on top of those. Checking again later is worth the calls.

## Forever

Forever's remaining areas are the same problem at larger scale: the subzone
articles do not exist, `Category:Zephras Isle` holds four pages in total, and
nine DB2 tables were checked without turning up a word of description.
`tools/forever-areas.tsv` has the detail. What describes a place in this game
is quest text and NPC dialogue, and both live on the server.
