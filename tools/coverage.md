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

**849 written, 134 empty, 86% covered.** 38 zones have gaps; 25 are complete.

134 checklist lines below, 132 distinct names: a few sit in two zones, and each needs its own entry, because the resolver matches a subzone against its declared parent.

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
| Durotar | 21 | 6 | 77% |
| Dustwallow Marsh | 21 | 6 | 77% |
| Alterac Mountains | 18 | 5 | 78% |
| Ashenvale | 37 | 5 | 88% |
| Silithus | 16 | 5 | 76% |
| Silverpine Forest | 19 | 5 | 79% |
| Stranglethorn Vale | 40 | 5 | 88% |
| Tirisfal Glades | 25 | 5 | 83% |
| Arathi Highlands | 20 | 4 | 83% |
| Azshara | 26 | 4 | 86% |
| Dun Morogh | 22 | 4 | 84% |
| Duskwood | 17 | 4 | 80% |
| Mount Hyjal | 7 | 4 | 63% |
| Stonetalon Mountains | 16 | 4 | 80% |
| Tanaris | 21 | 4 | 84% |
| Thousand Needles | 19 | 4 | 82% |
| Wetlands | 23 | 4 | 85% |
| Zephras Isle | 24 | 4 | 85% |
| Desolace | 18 | 3 | 85% |
| Feralas | 31 | 3 | 91% |
| Loch Modan | 14 | 3 | 82% |
| Redridge Mountains | 14 | 3 | 82% |
| Swamp of Sorrows | 12 | 3 | 80% |
| The Hinterlands | 19 | 3 | 86% |
| Burning Steppes | 12 | 2 | 85% |
| Deadwind Pass | 9 | 2 | 81% |
| Elwynn Forest | 24 | 2 | 92% |
| Searing Gorge | 11 | 2 | 84% |
| Un'Goro Crater | 11 | 2 | 84% |
| Westfall | 17 | 2 | 89% |
| Badlands | 17 | 1 | 94% |
| Hillsbrad Foothills | 14 | 1 | 93% |
| Hyjal Crater | 0 | 1 | 0% |
| Shen'dralas | 6 | 1 | 85% |
| The Barrens | 36 | 1 | 97% |
| Winterspring | 18 | 1 | 94% |
| Blackrock Depths | 1 | 0 | 100% |
| Blackrock Mountain | 1 | 0 | 100% |
| Blackrock Spire | 1 | 0 | 100% |
| Blasted Lands | 10 | 0 | 100% |
| Darkshore | 17 | 0 | 100% |
| Darnassus | 6 | 0 | 100% |
| Dun Algaz | 1 | 0 | 100% |
| Eastern Plaguelands | 28 | 0 | 100% |
| Felwood | 19 | 0 | 100% |
| Gates of Ahn'Qiraj | 1 | 0 | 100% |
| Ironforge | 1 | 0 | 100% |
| Lordamere Lake | 1 | 0 | 100% |
| Moonglade | 6 | 0 | 100% |
| Onyxia's Lair | 1 | 0 | 100% |
| Orgrimmar | 1 | 0 | 100% |
| Southfury River | 1 | 0 | 100% |
| Stormwind City | 3 | 0 | 100% |
| Teldrassil | 17 | 0 | 100% |
| Thandol Span | 1 | 0 | 100% |
| The Temple of Atal'Hakkar | 1 | 0 | 100% |
| Thoradin's Wall | 1 | 0 | 100% |
| Thunder Bluff | 5 | 0 | 100% |
| Undercity | 1 | 0 | 100% |
| Western Plaguelands | 18 | 0 | 100% |
| Whelgar's Excavation Site | 1 | 0 | 100% |

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

### Durotar — 6 empty of 27

- [ ] Darkspear Strand
- [ ] Dustwind Cave
- [ ] Hidden Path
- [ ] Jaggedswine Farm
- [ ] Razorwind Canyon
- [ ] Spirit Rock

### Dustwallow Marsh — 6 empty of 27

- [ ] Bloodfen Burrow
- [ ] Dustwallow Bay
- [ ] Ironclad Prison
- [ ] Moggle Point
- [ ] Tidefury Cove
- [ ] West Point Tower

### Alterac Mountains — 5 empty of 23

- [ ] Dandred's Fold
- [ ] Gavin's Naze
- [ ] The Eventide
- [ ] The Foothill Caverns
- [ ] The Headland

### Ashenvale — 5 empty of 42

- [ ] Falfarren River
- [ ] Moonwell
- [ ] Silverwing Outpost
- [ ] The Talondeep Path
- [ ] Warsong Labor Camp

### Silithus — 5 empty of 21

- [ ] Bones of Grakkarond
- [ ] Ravaged Twilight Camp
- [ ] The Swarming Pillar
- [ ] Twilight Post
- [ ] Twilight's Run

### Silverpine Forest — 5 empty of 24

- [ ] Bucklebree Farm
- [ ] North Tide's Run
- [ ] South Tide's Run
- [ ] The Dawning Isles
- [ ] The Shining Strand

### Stranglethorn Vale — 5 empty of 45

- [ ] Shell Beach
- [ ] Southern Savage Coast
- [ ] Spirit Den
- [ ] Sunken Hollow
- [ ] The Crystal Shore

### Tirisfal Glades — 5 empty of 30

- [ ] Brill Town Hall
- [ ] Shadowvale
- [ ] The North Coast
- [ ] Whispering Forest
- [ ] Whispering Shore

### Arathi Highlands — 4 empty of 24

- [ ] Blackwater Shipwrecks
- [ ] O'Breen's Camp
- [ ] The Drowned Reef
- [ ] The Sanctum

### Azshara — 4 empty of 30

- [ ] Legashi Stronghold
- [ ] Scalebeard's Cave
- [ ] Thalassian Vanguard Camp
- [ ] Vanndir Encampment

### Dun Morogh — 4 empty of 26

- [ ] Ironforge Submarine Facility
- [ ] North Gate Outpost
- [ ] South Gate Outpost
- [ ] South Gate Pass

### Duskwood — 4 empty of 21

- [ ] Forlorn Rowe
- [ ] The Cemetary
- [ ] The Whipple Estate
- [ ] The World Tree

### Mount Hyjal — 4 empty of 11

- [ ] Cradle of Tranquility
- [ ] Dae'gun
- [ ] Elderwild
- [ ] Mourning's Rest

### Stonetalon Mountains — 4 empty of 20

- [ ] Greatwood Vale
- [ ] The Talondeep Path
- [ ] Valley of the Bloodfuries
- [ ] Windshear Mine

### Tanaris — 4 empty of 25

- [ ] Caverns of Time
- [ ] Gunstan's Post
- [ ] Southbreak Shore
- [ ] The Rumble Cage

### Thousand Needles — 4 empty of 23

- [ ] Gornia
- [ ] Scalding Ridge
- [ ] The Weathered Nook
- [ ] Zane's Eye Crater

### Wetlands — 4 empty of 27

- [ ] Baradin Bay
- [ ] Deepwater Tavern
- [ ] Dragonmaw Retreat
- [ ] The Drunken Dwarf

### Zephras Isle — 4 empty of 28

- [ ] Bandit Hideout
- [ ] Nightclaw Cavern
- [ ] Rohashi Spires
- [ ] Ruins of Ban'aethal

### Desolace — 3 empty of 21

- [ ] Broken Spear Village
- [ ] Scrabblescrew's Camp
- [ ] Shadowbreak Ravine

### Feralas — 3 empty of 34

- [ ] High Wilderness
- [ ] Mok'Gordun
- [ ] Wildwind Lake

### Loch Modan — 3 empty of 17

- [ ] Algaz Gate
- [ ] South Gate Pass
- [ ] Stoutlager Inn

### Redridge Mountains — 3 empty of 17

- [ ] Galardell Valley
- [ ] Redridge Canyons
- [ ] Render's Rock

### Swamp of Sorrows — 3 empty of 15

- [ ] Misty Reed Post
- [ ] Misty Reed Strand
- [ ] Stagalbog Cave

### The Hinterlands — 3 empty of 22

- [ ] Featherbeard's Hovel
- [ ] Martsirt
- [ ] Shindigger's Camp

### Burning Steppes — 2 empty of 14

- [ ] Poacher's Den
- [ ] Slither Rock

### Deadwind Pass — 2 empty of 11

- [ ] Ariden's Camp
- [ ] Sleeping Gorge

### Elwynn Forest — 2 empty of 26

- [ ] Northshire River
- [ ] Stormwind Mountains

### Searing Gorge — 2 empty of 13

- [ ] Stonewrought Pass
- [ ] The Searing Basin

### Un'Goro Crater — 2 empty of 13

- [ ] Pillar of Assimilation
- [ ] Stomping Grounds

### Westfall — 2 empty of 19

- [ ] Lighthouse
- [ ] Not Used Deadmines

### Badlands — 1 empty of 18

- [ ] Camp Wurg

### Hillsbrad Foothills — 1 empty of 15

- [ ] Hillsbrad

### Hyjal Crater — 1 empty of 1

- [ ] Hyjal Crater

### Shen'dralas — 1 empty of 7

- [ ] Forlorn Gardens

### The Barrens — 1 empty of 37

- [ ] Southern Barrens

### Winterspring — 1 empty of 19

- [ ] Moon Horror Den

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
