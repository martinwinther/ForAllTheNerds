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

**809 written, 174 empty, 82% covered.** 45 zones have gaps; 18 are complete.

174 checklist lines below, 172 distinct names: a few sit in two zones, and each needs its own entry, because the resolver matches a subzone against its declared parent.

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
| The Barrens | 30 | 7 | 81% |
| Thousand Needles | 16 | 7 | 69% |
| Tirisfal Glades | 23 | 7 | 76% |
| Dun Morogh | 20 | 6 | 76% |
| Durotar | 21 | 6 | 77% |
| Dustwallow Marsh | 21 | 6 | 77% |
| Stonetalon Mountains | 14 | 6 | 70% |
| Alterac Mountains | 18 | 5 | 78% |
| Ashenvale | 37 | 5 | 88% |
| Deadwind Pass | 6 | 5 | 54% |
| Duskwood | 16 | 5 | 76% |
| Redridge Mountains | 12 | 5 | 70% |
| Silithus | 16 | 5 | 76% |
| Silverpine Forest | 19 | 5 | 79% |
| Stranglethorn Vale | 40 | 5 | 88% |
| Arathi Highlands | 20 | 4 | 83% |
| Azshara | 26 | 4 | 86% |
| Elwynn Forest | 22 | 4 | 84% |
| Mount Hyjal | 7 | 4 | 63% |
| Swamp of Sorrows | 11 | 4 | 73% |
| Tanaris | 21 | 4 | 84% |
| The Hinterlands | 18 | 4 | 81% |
| Wetlands | 23 | 4 | 85% |
| Zephras Isle | 24 | 4 | 85% |
| Desolace | 18 | 3 | 85% |
| Felwood | 16 | 3 | 84% |
| Feralas | 31 | 3 | 91% |
| Loch Modan | 14 | 3 | 82% |
| Western Plaguelands | 15 | 3 | 83% |
| Westfall | 16 | 3 | 84% |
| Badlands | 16 | 2 | 88% |
| Burning Steppes | 12 | 2 | 85% |
| Searing Gorge | 11 | 2 | 84% |
| Teldrassil | 15 | 2 | 88% |
| Un'Goro Crater | 11 | 2 | 84% |
| Winterspring | 17 | 2 | 89% |
| Darkshore | 16 | 1 | 94% |
| Eastern Plaguelands | 27 | 1 | 96% |
| Hillsbrad Foothills | 14 | 1 | 93% |
| Hyjal Crater | 0 | 1 | 0% |
| Shen'dralas | 6 | 1 | 85% |
| Stormwind City | 2 | 1 | 66% |
| Thunder Bluff | 4 | 1 | 80% |
| Blackrock Depths | 1 | 0 | 100% |
| Blackrock Mountain | 1 | 0 | 100% |
| Blackrock Spire | 1 | 0 | 100% |
| Blasted Lands | 10 | 0 | 100% |
| Darnassus | 6 | 0 | 100% |
| Dun Algaz | 1 | 0 | 100% |
| Gates of Ahn'Qiraj | 1 | 0 | 100% |
| Ironforge | 1 | 0 | 100% |
| Lordamere Lake | 1 | 0 | 100% |
| Moonglade | 6 | 0 | 100% |
| Onyxia's Lair | 1 | 0 | 100% |
| Orgrimmar | 1 | 0 | 100% |
| Southfury River | 1 | 0 | 100% |
| Thandol Span | 1 | 0 | 100% |
| The Temple of Atal'Hakkar | 1 | 0 | 100% |
| Thoradin's Wall | 1 | 0 | 100% |
| Undercity | 1 | 0 | 100% |
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

### The Barrens — 7 empty of 37

- [ ] Fray Island
- [ ] Gold Road
- [ ] Honor's Stand
- [ ] Mor'shan Base Camp
- [ ] Raptor Grounds
- [ ] Southern Barrens
- [ ] The Mor'shan Rampart

### Thousand Needles — 7 empty of 23

- [ ] Gornia
- [ ] Scalding Ridge
- [ ] Splithoof Hold
- [ ] Tahonda Ruins
- [ ] The Rustmaul Dig Site
- [ ] The Weathered Nook
- [ ] Zane's Eye Crater

### Tirisfal Glades — 7 empty of 30

- [ ] Bandarion Keep
- [ ] Brill Town Hall
- [ ] Shadowvale
- [ ] Stillwater Pond
- [ ] The North Coast
- [ ] Whispering Forest
- [ ] Whispering Shore

### Dun Morogh — 6 empty of 26

- [ ] Ironband's Compound
- [ ] Ironforge Submarine Facility
- [ ] North Gate Outpost
- [ ] South Gate Outpost
- [ ] South Gate Pass
- [ ] Steelgrill's Depot

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

### Stonetalon Mountains — 6 empty of 20

- [ ] Boulderslide Cavern
- [ ] Greatwood Vale
- [ ] Sishir Canyon
- [ ] The Talondeep Path
- [ ] Valley of the Bloodfuries
- [ ] Windshear Mine

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

### Deadwind Pass — 5 empty of 11

- [ ] Ariden's Camp
- [ ] Deadman's Crossing
- [ ] Grosh'gok Compound
- [ ] Sleeping Gorge
- [ ] The Master's Cellar

### Duskwood — 5 empty of 21

- [ ] Forlorn Rowe
- [ ] Roland's Doom
- [ ] The Cemetary
- [ ] The Whipple Estate
- [ ] The World Tree

### Redridge Mountains — 5 empty of 17

- [ ] Galardell Valley
- [ ] Redridge Canyons
- [ ] Render's Rock
- [ ] Stonewatch Keep
- [ ] Stonewatch Tower

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

### Elwynn Forest — 4 empty of 26

- [ ] Northshire River
- [ ] Stormwind Mountains
- [ ] The Maclure Vineyards
- [ ] The Stonefield Farm

### Mount Hyjal — 4 empty of 11

- [ ] Cradle of Tranquility
- [ ] Dae'gun
- [ ] Elderwild
- [ ] Mourning's Rest

### Swamp of Sorrows — 4 empty of 15

- [ ] Misty Reed Post
- [ ] Misty Reed Strand
- [ ] Stagalbog Cave
- [ ] The Harborage

### Tanaris — 4 empty of 25

- [ ] Caverns of Time
- [ ] Gunstan's Post
- [ ] Southbreak Shore
- [ ] The Rumble Cage

### The Hinterlands — 4 empty of 22

- [ ] Featherbeard's Hovel
- [ ] Martsirt
- [ ] Shindigger's Camp
- [ ] Wildhammer Keep

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

### Felwood — 3 empty of 19

- [ ] Bloodvenom Falls
- [ ] Jadefire Glen
- [ ] Shrine of the Deceiver

### Feralas — 3 empty of 34

- [ ] High Wilderness
- [ ] Mok'Gordun
- [ ] Wildwind Lake

### Loch Modan — 3 empty of 17

- [ ] Algaz Gate
- [ ] South Gate Pass
- [ ] Stoutlager Inn

### Western Plaguelands — 3 empty of 18

- [ ] Chillwind Camp
- [ ] Ruins of Andorhal
- [ ] School of Necromancy

### Westfall — 3 empty of 19

- [ ] Lighthouse
- [ ] Not Used Deadmines
- [ ] Stendel's Pond

### Badlands — 2 empty of 18

- [ ] Camp Wurg
- [ ] The Maker's Terrace

### Burning Steppes — 2 empty of 14

- [ ] Poacher's Den
- [ ] Slither Rock

### Searing Gorge — 2 empty of 13

- [ ] Stonewrought Pass
- [ ] The Searing Basin

### Teldrassil — 2 empty of 17

- [ ] Aldrassil
- [ ] The Oracle Glade

### Un'Goro Crater — 2 empty of 13

- [ ] Pillar of Assimilation
- [ ] Stomping Grounds

### Winterspring — 2 empty of 19

- [ ] Moon Horror Den
- [ ] The Ruins of Kel'Theril

### Darkshore — 1 empty of 17

- [ ] Twilight Shore

### Eastern Plaguelands — 1 empty of 28

- [ ] Northdale

### Hillsbrad Foothills — 1 empty of 15

- [ ] Hillsbrad

### Hyjal Crater — 1 empty of 1

- [ ] Hyjal Crater

### Shen'dralas — 1 empty of 7

- [ ] Forlorn Gardens

### Stormwind City — 1 empty of 3

- [ ] Stormwind Harbor

### Thunder Bluff — 1 empty of 5

- [ ] The Pools of Vision

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
