# Places with no source

Every name the client reports that this addon has nothing for. They stay on the
checklist in `tools/coverage.md`, because the game does name them.

Written by hand. `tools/coverage.md` is generated, and the generator used to
delete this table every time it ran, which is why the two are separate files.

**Last verified 2026-11-09**, every row, against warcraft.wiki.gg through its
API. The method is at the bottom of this file. Each row says what the check
actually returned rather than what it was assumed to be. Forty-three rows, all
forty-three checked individually this time instead of inherited.

## Never left the World of Warcraft beta

Twenty areas. Each has an article on the wiki saying in as many words that it
was a planned subzone removed before release. Nobody has ever stood in one of
them. These will never change.

| Place | Zone | Area id | What the wiki says |
|---|---|---|---|
| Stormwind Mountains | Elwynn Forest | 80 | Planned subzone, removed |
| The Whipple Estate | Duskwood | 244 | A house owned by the Whipples, a family who would have turned worgen at night. Never implemented |
| Shell Beach | Stranglethorn Vale | 303 | Planned beach in northern Stranglethorn, removed |
| Blackwater Shipwrecks | Arathi Highlands | 322 | Planned subzone around Faldir's Cove, removed |
| O'Breen's Camp | Arathi Highlands | 323 | Planned subzone around Faldir's Cove, removed |
| Skyline Ridge | Mulgore | 399 | Planned subzone, removed |
| Valley of the Bloodfuries | Stonetalon Mountains | 466 | Planned subzone, removed. The Charred Vale article suggests this was its earlier name |
| Brave Wind Mesa | Mulgore | 471 | Planned subzone, removed |
| Fire Stone Mesa | Mulgore | 472 | Planned subzone, removed |
| Mantle Rock | Mulgore | 473 | Planned subzone, removed |
| Moggle Point | Dustwallow Marsh | 500 | Planned subzone, removed |
| West Point Tower | Dustwallow Marsh | 505 | Planned subzone, removed. Likely Lost Point, Theramore's westernmost tower |
| Ironclad Prison | Dustwallow Marsh | 515 | Planned subzone, removed. See the borderline case below |
| Bucklebree Farm | Silverpine Forest | 926 | Planned farmstead, removed |
| Mok'Gordun | Feralas | 1104 | Planned subzone, removed. An ogre toponym; the Gordunni Outpost article points at it |
| Vanndir Encampment | Azshara | 1217 | Planned camp, removed |
| Broken Spear Village | Desolace | 2217 | Planned village, removed |
| Gornia | Thousand Needles | 2238 | Planned subzone, removed |
| Zane's Eye Crater | Thousand Needles | 2239 | Planned subzone, removed |
| The Rumble Cage | Tanaris | 2857 | Planned subzone, removed |

## Nothing under that name

| Place | Zone | Area id | What the search returned |
|---|---|---|---|
| The World Tree | Duskwood | 13 | Twenty-three mentions of a world tree, every one of them Nordrassil, Teldrassil, Vordrassil or Shaladrassil. Nothing about anything in Duskwood |

## Development and test leftovers

| Place | Zone | Area id | What the wiki says |
|---|---|---|---|
| Not Used Deadmines | Westfall | 1518 | Nothing anywhere, and the name says what it is |
| The Searing Basin | Searing Gorge | 15159 | A test instance, tagged as such, populated by joke characters and Gurgthock. Never part of the live game |

## Out of era rather than out of sources

| Place | Zone | Area id | Why |
|---|---|---|---|
| Caverns of Time | Tanaris | 2300 | In the client's AreaTable, but the Caverns are Burning Crusade content and everything inside them is later still. Out by the same rule that keeps Outland and Gilneas out |

## Forever areas with no mention anywhere

Nine areas. An `insource` search for each name returns zero pages across the
whole wiki: no article, no NPC, no quest, no item, not even a list entry. These
need a new source or somebody reading them in the client.

| Place | Zone | Area id |
|---|---|---|
| Stomping Grounds | Un'Goro Crater | 16637 |
| Martsirt | The Hinterlands | 16740 |
| Ironforge Submarine Facility | Dun Morogh | 16741 |
| Forlorn Gardens | Shen'dralas | 16742 |
| Pillar of Assimilation | Un'Goro Crater | 16986 |
| Scalding Ridge | Thousand Needles | 17052 |
| Twilight Hollow | Riverglades | 17847 |
| Hyjal Crater | Hyjal Crater | 17852 |
| Sunken Hollow | Stranglethorn Vale | 17853 |

Forlorn Gardens earns one extra note: the Shen'dralas zone article lists the
zone's areas and does not include it at all.

## Forever areas that exist only as a name in a list

Eight areas. Each is named on its zone's article, in the list of subregions,
and nowhere else. A name in a list is not a source: no description, no NPC
placed there, no quest that mentions it.

| Place | Zone | Area id | Everything that exists |
|---|---|---|---|
| Nightclaw Cavern | Zephras Isle | 16720 | The Zephras Isle subregion list. See the near miss below |
| Eastwind Shore | Riverglades | 16728 | The Riverglades subregion list |
| Elbrim's Farm | Riverglades | 16734 | The Riverglades subregion list |
| Turner's Logging Camp | Riverglades | 16736 | The Riverglades subregion list |
| Southern Watch | Riverglades | 16744 | The Riverglades subregion list |
| Elderwild | Mount Hyjal | 16848 | The Mount Hyjal list, plus two leatherworking patterns named after it |
| Dae'gun | Mount Hyjal | 16866 | The Mount Hyjal list, one line calling it the area's ruins, and one noting Forever puts it where retail's Verdant Thicket is |
| Forlorn Pit | Riverglades | 17809 | The Riverglades subregion list |

## Forever areas whose name belongs to other-era content

Two areas. Searching the name returns plenty and none of it is about the
Forever place.

| Place | Zone | Area id | What the search returned |
|---|---|---|---|
| Poacher's Den | Burning Steppes | 16739 | Fourteen pages, all the Season of Discovery warrior quest of that name |
| The Eventide | Dalaran | 17824 | Fifty-five pages, all the Wrath-era plaza in Dalaran. Forever's Dalaran is a different city and nothing describes an Eventide in it |

## Near misses, written anyway

| Place | What happened |
|---|---|
| Legashi Encampment | The wiki spells it Legash. Written from the established satyr lore rather than from a page for that exact name. |
| School of Necromancy | This is Scholomance, which the addon already had. Registered as an alias of it rather than written twice. |
| Algaz Gate | This is Dun Algaz, already written up in Data/Locales.lua. Registered as an alias. |
| The Cemetary | This is Raven Hill Cemetery, already written up. Registered as an alias, misspelling included, since that is what the client reports. |

## Near miss, not written

| Place | What happened |
|---|---|
| Nightclaw Cavern | Zephras Isle has a druid order called the Nightclaw Druids and they are based in Shadowgale Forest, not in any cavern. A shared name on the same island is suggestive and it is all there is, so the cavern stays on the list rather than being written from a guess. |

## One borderline case

**Ironclad Prison** in Dustwallow Marsh has lore, and it is excluded anyway.
The Theramore Isle article describes offenders being tried at the Foothold
Citadel and imprisoned in Ironclad Prison, and the wiki carries the detail
under an "In the RPG" heading. The Warcraft RPG is not canon and the area
itself never left the beta, so writing it would mean treating non-canon
material as lore for a place that was cut. Excluded on that basis, and the call
is reversible if the rule changes.

## How to check a name properly

Two mistakes were made here before this file was rebuilt, and both are worth
not repeating.

**Check the area id before deciding what a name is.** Anything numbered 16000
or higher is Forever's own, not vanilla. Eleven names in this file had been
filed as beta leftovers or as clashes with later content when they are in fact
new Forever places. `tools/area-gaps.tsv` has the id in column two and
`tools/forever-areas.tsv` has the rest.

**A missing page is not a missing source.** The wiki documents Forever from the
NPC and quest side first, so a place with no article of its own is often
described across half a dozen other pages. Shadowvale has no article and is
described in full on the Whispering Forest one. Camp Gev'rek has no article and
is described on the Earthen Ring's. The Ruins of Ban'aethal has no article and
the Skyborne article tells its whole story. The Sanctum in Stromgarde Keep does
have an article, under the disambiguated title `Sanctum (Stromgarde Keep)`,
which a check of the bare name misses.

The wiki's API answers all of this cheaply:

    /api.php?action=query&format=json&formatversion=2&titles=A|B|C
    /api.php?action=query&list=search&srsearch=insource:"NAME"&format=json

The first says which names have articles, up to fifty names in one call, and
reports `missing` for the rest. The second finds every page whose source text
mentions the name, with a snippet of the context. A zero-hit `insource` result
is a real answer: nobody has written anything about that place anywhere. When a
name is a common phrase, add a second term, `insource:"NAME" insource:"ZONE"`,
or the result drowns in noise.

Do not use `index.php?search=`, the human search page. Cloudflare challenges it
and challenges are not to be worked around. The API answers without one.

## Worth re-checking

The wiki is days old on Forever's content and is still being written. A
re-check on 2026-11-09 turned up a new `Category:Riverglades subzones` holding
ten pages, three of them new, and a full API sweep the same day turned up ten
more places that had sources nobody had looked for. The seventeen Forever rows
above are the ones to try again later. The twenty beta rows never will be.
