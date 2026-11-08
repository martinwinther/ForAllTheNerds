# Zone coverage, and what is still empty

Generated from the client's own `AreaTable` (product `wowf`, build
1.60.1.70862, via wago.tools) matched against every name the addon answers
to, aliases included. Dev leftovers, open water, battleground internals,
post-vanilla maps and the Wrath death-knight areas inside Eastern
Plaguelands are all excluded; `tools/area-sweep.md` lists what was dropped
and why.

Some names on the checklist have no source at all and cannot be written
without inventing lore. Those are listed in `tools/no-source.md`, along with
three near misses that were written from adjacent sources instead. The
checklist will not reach zero.

**922 written, 61 empty, 93% covered.** 28 zones have gaps; 35 are complete.

61 checklist lines below, 61 distinct names: a few sit in two zones, and each needs its own entry, because the resolver matches a subzone against its declared parent.

How this relates to the other two files. `tools/area-gaps.tsv` is the machine
list of vanilla subzones only. This file is the superset: it adds Forever's
remaining areas and the top-level ones. `tools/forever-areas.tsv` covers
Forever's four zones on their own.

Regenerate with the recipe at the end. `/ftn areas` in game does the same
check with the real resolver and is the authority when the two disagree.

## Where the gaps are

| Zone | Written | Empty | Covered |
|---|---:|---:|---:|
| Riverglades | 11 | 9 | 55% |
| Mulgore | 19 | 7 | 73% |
| Mount Hyjal | 7 | 4 | 63% |
| Zephras Isle | 24 | 4 | 85% |
| Arathi Highlands | 21 | 3 | 87% |
| Dustwallow Marsh | 24 | 3 | 88% |
| Thousand Needles | 20 | 3 | 86% |
| Alterac Mountains | 21 | 2 | 91% |
| Duskwood | 19 | 2 | 90% |
| Stranglethorn Vale | 43 | 2 | 95% |
| Tanaris | 23 | 2 | 92% |
| Tirisfal Glades | 28 | 2 | 93% |
| Un'Goro Crater | 11 | 2 | 84% |
| Wetlands | 25 | 2 | 92% |
| Ashenvale | 41 | 1 | 97% |
| Azshara | 29 | 1 | 96% |
| Burning Steppes | 13 | 1 | 92% |
| Desolace | 20 | 1 | 95% |
| Dun Morogh | 25 | 1 | 96% |
| Elwynn Forest | 25 | 1 | 96% |
| Feralas | 33 | 1 | 97% |
| Hyjal Crater | 0 | 1 | 0% |
| Searing Gorge | 12 | 1 | 92% |
| Shen'dralas | 6 | 1 | 85% |
| Silverpine Forest | 23 | 1 | 95% |
| Stonetalon Mountains | 19 | 1 | 95% |
| The Hinterlands | 21 | 1 | 95% |
| Westfall | 18 | 1 | 94% |
| Badlands | 18 | 0 | 100% |
| Blackrock Depths | 1 | 0 | 100% |
| Blackrock Mountain | 1 | 0 | 100% |
| Blackrock Spire | 1 | 0 | 100% |
| Blasted Lands | 10 | 0 | 100% |
| Darkshore | 17 | 0 | 100% |
| Darnassus | 6 | 0 | 100% |
| Deadwind Pass | 11 | 0 | 100% |
| Dun Algaz | 1 | 0 | 100% |
| Durotar | 27 | 0 | 100% |
| Eastern Plaguelands | 28 | 0 | 100% |
| Felwood | 19 | 0 | 100% |
| Gates of Ahn'Qiraj | 1 | 0 | 100% |
| Hillsbrad Foothills | 15 | 0 | 100% |
| Ironforge | 1 | 0 | 100% |
| Loch Modan | 17 | 0 | 100% |
| Lordamere Lake | 1 | 0 | 100% |
| Moonglade | 6 | 0 | 100% |
| Onyxia's Lair | 1 | 0 | 100% |
| Orgrimmar | 1 | 0 | 100% |
| Redridge Mountains | 17 | 0 | 100% |
| Silithus | 21 | 0 | 100% |
| Southfury River | 1 | 0 | 100% |
| Stormwind City | 3 | 0 | 100% |
| Swamp of Sorrows | 15 | 0 | 100% |
| Teldrassil | 17 | 0 | 100% |
| Thandol Span | 1 | 0 | 100% |
| The Barrens | 37 | 0 | 100% |
| The Temple of Atal'Hakkar | 1 | 0 | 100% |
| Thoradin's Wall | 1 | 0 | 100% |
| Thunder Bluff | 5 | 0 | 100% |
| Undercity | 1 | 0 | 100% |
| Western Plaguelands | 18 | 0 | 100% |
| Whelgar's Excavation Site | 1 | 0 | 100% |
| Winterspring | 19 | 0 | 100% |

## The checklist

Tick as they go in. Ordered by how many a zone needs, so the top of the list
is where the most ground is gained per sitting.

### Riverglades — 9 empty of 20

- [ ] Ashwood's Fall
- [ ] Eastwind Shore
- [ ] Elbrim's Farm
- [ ] Forlorn Pit
- [ ] Southern Watch
- [ ] Terral's Watch
- [ ] Turner's Logging Camp
- [ ] Twilight Hollow
- [ ] Wheeler's Grange

### Mulgore — 7 empty of 26

- [ ] Brave Wind Mesa
- [ ] Camp Gev'rek
- [ ] Fire Stone Mesa
- [ ] Galak Camp
- [ ] Gloomrise
- [ ] Mantle Rock
- [ ] Skyline Ridge

### Mount Hyjal — 4 empty of 11

- [ ] Cradle of Tranquility
- [ ] Dae'gun
- [ ] Elderwild
- [ ] Mourning's Rest

### Zephras Isle — 4 empty of 28

- [ ] Bandit Hideout
- [ ] Nightclaw Cavern
- [ ] Rohashi Spires
- [ ] Ruins of Ban'aethal

### Arathi Highlands — 3 empty of 24

- [ ] Blackwater Shipwrecks
- [ ] O'Breen's Camp
- [ ] The Sanctum

### Dustwallow Marsh — 3 empty of 27

- [ ] Ironclad Prison
- [ ] Moggle Point
- [ ] West Point Tower

### Thousand Needles — 3 empty of 23

- [ ] Gornia
- [ ] Scalding Ridge
- [ ] Zane's Eye Crater

### Alterac Mountains — 2 empty of 23

- [ ] Gavin's Naze
- [ ] The Eventide

### Duskwood — 2 empty of 21

- [ ] The Whipple Estate
- [ ] The World Tree

### Stranglethorn Vale — 2 empty of 45

- [ ] Shell Beach
- [ ] Sunken Hollow

### Tanaris — 2 empty of 25

- [ ] Caverns of Time
- [ ] The Rumble Cage

### Tirisfal Glades — 2 empty of 30

- [ ] Shadowvale
- [ ] Whispering Forest

### Un'Goro Crater — 2 empty of 13

- [ ] Pillar of Assimilation
- [ ] Stomping Grounds

### Wetlands — 2 empty of 27

- [ ] Dragonmaw Retreat
- [ ] The Drunken Dwarf

### Ashenvale — 1 empty of 42

- [ ] Warsong Labor Camp

### Azshara — 1 empty of 30

- [ ] Vanndir Encampment

### Burning Steppes — 1 empty of 14

- [ ] Poacher's Den

### Desolace — 1 empty of 21

- [ ] Broken Spear Village

### Dun Morogh — 1 empty of 26

- [ ] Ironforge Submarine Facility

### Elwynn Forest — 1 empty of 26

- [ ] Stormwind Mountains

### Feralas — 1 empty of 34

- [ ] Mok'Gordun

### Hyjal Crater — 1 empty of 1

- [ ] Hyjal Crater

### Searing Gorge — 1 empty of 13

- [ ] The Searing Basin

### Shen'dralas — 1 empty of 7

- [ ] Forlorn Gardens

### Silverpine Forest — 1 empty of 24

- [ ] Bucklebree Farm

### Stonetalon Mountains — 1 empty of 20

- [ ] Valley of the Bloodfuries

### The Hinterlands — 1 empty of 22

- [ ] Martsirt

### Westfall — 1 empty of 19

- [ ] Not Used Deadmines

## Regenerating

```
curl -sS -o AreaTable.csv 'https://wago.tools/db2/AreaTable/csv?product=wowf'
curl -sS -o Map.csv 'https://wago.tools/db2/Map/csv?product=wowf'
```

Then load the addon against `tools/mock_wow.lua`, walk `ns.EachEntry` and
emit `e.name` plus every `e.aliases` entry, and match normalised names
against the AreaTable rows. The aliases are not optional: a name-only dump
reported the Sunken Temple as missing, because it is registered as the
Temple of Atal'Hakkar.
