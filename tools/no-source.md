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
| Camp Gev'rek | Mulgore | No article on warcraft.wiki.gg |
| Galak Camp | Mulgore | No article on warcraft.wiki.gg |
| Shadowvale | Tirisfal Glades | No article on warcraft.wiki.gg |
| Mok'Gordun | Feralas | Never left the beta; likely an early name for the Gordunni Outpost |
| Ironclad Prison | Dustwallow Marsh | Never left the beta; named only in the non-canon RPG |
| Zane's Eye Crater | Thousand Needles | Never left the World of Warcraft beta |
| Gornia | Thousand Needles | Never left the beta; the wiki only speculates it was an ogre settlement |
| Valley of the Bloodfuries | Stonetalon Mountains | Never left the beta; possibly an early name for the Charred Vale |
| Dragonmaw Retreat | Wetlands | No article on warcraft.wiki.gg |
| Ironforge Submarine Facility | Dun Morogh | No article on warcraft.wiki.gg |
| Moggle Point | Dustwallow Marsh | Never left the World of Warcraft beta |
| The Whipple Estate | Duskwood | Never left the beta; a house owned by the Whipple family, and nothing more |
| Bucklebree Farm | Silverpine Forest | Never left the World of Warcraft beta |
| O'Breen's Camp | Arathi Highlands | Never left the beta; likely Shakes O'Breen's unnamed camp at Faldir's Cove |
| Pillar of Assimilation | Un'Goro Crater | No article on warcraft.wiki.gg |
| The Rumble Cage | Tanaris | No article on warcraft.wiki.gg |
| The Sanctum | Arathi Highlands | No article under that name |
| The World Tree | Duskwood | No article under that name |
| Broken Spear Village | Desolace | Never left the World of Warcraft beta |
| Poacher's Den | Burning Steppes | The only article under that name is a Season of Discovery quest, not this place |
| Blackwater Shipwrecks | Arathi Highlands | Never left the beta; probably the water around two wrecks on the Drowned Reef |
| Vanndir Encampment | Azshara | Never left the World of Warcraft beta |
| West Point Tower | Dustwallow Marsh | Never left the beta; likely Lost Point, Theramore's westernmost tower |
| Stormwind Mountains | Elwynn Forest | Never left the World of Warcraft beta |
| Brave Wind Mesa | Mulgore | Never left the World of Warcraft beta |
| Fire Stone Mesa | Mulgore | Never left the World of Warcraft beta |
| Skyline Ridge | Mulgore | Never left the World of Warcraft beta |
| The Searing Basin | Searing Gorge | A test-only instance, never part of the live game |
| Shell Beach | Stranglethorn Vale | Never left the World of Warcraft beta |
| Sunken Hollow | Stranglethorn Vale | No article on warcraft.wiki.gg |
| Not Used Deadmines | Westfall | A development leftover, as the name says |
| Gloomrise | Mulgore | No article on warcraft.wiki.gg |
| Scalding Ridge | Thousand Needles | No article on warcraft.wiki.gg |
| The Eventide | Alterac Mountains | The only Eventide article is the Dalaran plaza, which is Wrath content and a different place |
| Stomping Grounds | Un'Goro Crater | The only article under that name is a Dragonblight quest |
| The Drunken Dwarf | Wetlands | No article on warcraft.wiki.gg |
| Martsirt | The Hinterlands | No article on warcraft.wiki.gg |

## Near misses, written anyway

| Place | What happened |
|---|---|
| Legashi Encampment | The wiki spells it Legash. Written from the established satyr lore rather than from a page for that exact name. |
| Whispering Forest | The faerie ring and its seven Fey-Drunk Darters could not be dated. If it is Cataclysm content it has no business in a 1.12 addon, so the place is still on the list. |
| Warsong Labor Camp | Not the same place as the Warsong Lumber Camp, and the wiki warns against exactly that confusion. Still on the list rather than written up wrong. |
| School of Necromancy | This is Scholomance, which the addon already had. Registered as an alias of it rather than written twice. |
| Algaz Gate | This is Dun Algaz, already written up in Data/Locales.lua. Registered as an alias. |
| The Cemetary | This is Raven Hill Cemetery, already written up. Registered as an alias, misspelling included, since that is what the client reports. |
| Gavin's Naze | The Stormpike siege engines on that hill could not be dated and read as Cataclysm. Left on the list rather than written from a source I could not place in 1.12. |

## Out of era rather than out of sources

| Place | Zone | Why |
|---|---|---|
| Caverns of Time | Tanaris | The area is in the client's AreaTable, but the Caverns are Burning Crusade content and everything in them is later still. Out of scope by the same rule that keeps Outland and Gilneas out. |

## Worth re-checking

The wiki is five days old on Forever's content and it is being written as we
go. On 2026-11-09 a re-check found a new `Category:Riverglades subzones` with
ten pages, three of them not there before: Ashwood's Fall, Terral's Watch and
Wheeler's Grange, all now written up.

So the Forever rows below are not permanent. Checking the four zone categories
again takes one browser call each and has already paid off once. The beta
leftovers above it will never change.

## Forever

Forever's remaining areas are the same problem at larger scale: the subzone
articles do not exist, `Category:Zephras Isle` holds four pages in total, and
nine DB2 tables were checked without turning up a word of description.
`tools/forever-areas.tsv` has the detail. What describes a place in this game
is quest text and NPC dialogue, and both live on the server.
