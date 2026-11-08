# Changelog

## Unreleased

**Added**

- Eight more places in Ashenvale: Xavian, the Zoram Strand, Kargathia Keep, the
  Ruins of Ordil'Aran, Bloodtooth Camp, Silverwind Refuge, Forest Song and the
  Shady Nook. Ashenvale was the emptiest zone in the game and now has five left.
- Seven more in Stranglethorn Vale: Yojamba Isle, the Battle Ring, the Wild
  Shore, the three Bloodsail frigates moored off it, and the Venture Co.
  Operations Center.
- Six more in Mulgore and Tirisfal Glades: the Bael'dun Digsite, Kodo Rock and
  the Skywatcher Plateau; Gunther's Retreat, the Gallows' End Tavern and the
  Crusader Outpost.
- Twelve more across Feralas, Dustwallow Marsh, Azshara and Durotar: both of the
  Twin Colossals, Oneiros, the Writhing Deep, Woodpaw Den and Shalzaru's Lair;
  the Foothold Citadel and Swamplight Manor; the Ruined Reaches, Rethress
  Sanctum and the Legashi Encampment; and the Shrine of the Dormant Flame.
- Eleven more in the Barrens, Thousand Needles and Tirisfal Glades: the
  Mor'shan Rampart and Base Camp, the Gold Road, Fray Island, the Raptor
  Grounds and Honor's Stand; Splithoof Hold, the Tahonda Ruins and the Rustmaul
  Dig Site; and Stillwater Pond. The Barrens has one place left unwritten.
- Bandarion Keep in Tirisfal Glades, which is Forever's own addition to an old
  zone, so it is hidden with the rest of the Forever material until you turn
  that on.
- Twenty-eight more across eighteen zones, taking the total to 903 places.
  Among them the Ruins of Andorhal, Northdale, Roland's Doom, the Master's
  Cellar, Deadman's Crossing, the Maker's Terrace, Stonewatch Keep and Tower,
  Wildhammer Keep, the Harborage, both halves of the Stonefield and Maclure
  feud, the Ruins of Kel'Theril, Aldrassil, the Oracle Glade, the Shrine of the
  Deceiver, Bloodvenom Falls and the Pools of Vision.
- Twenty more, taking the total to 923 places. Among them the Darkspear Strand
  where the trolls came ashore, Spirit Rock and the Hidden Path above the orc
  starting valley, Dandred's Fold, Hillsbrad town, the Bones of Grakkarond,
  Tidefury Cove, Forlorn Rowe, the Stonewrought Pass and the Dawning Isles.
- Nineteen more, taking the total to 942 places. Among them Ariden's Camp,
  Render's Rock, Galardell Valley, the Silverwing Outpost, the Falfarren River,
  both ends of the Talondeep Path, Slither Rock, Baradin Bay, the Brill Town
  Hall and the Misty Reed Post.
- Twenty-five more, taking the total to 967 places. Among them the Foothill
  Caverns, the Drowned Reef, both ends of South Gate Pass, the Northshire
  River, Dustwind Cave, the Ravaged Twilight Camp, Windshear Mine, Gunstan's
  Post, the Moon Horror Den and the Southern Barrens.
- Walking into Scholomance, Dun Algaz or Raven Hill Cemetery now works
  whichever name the game reports. The client calls them the School of
  Necromancy, the Algaz Gate, and simply "The Cemetary".

## 1.2.2

**Added**

- 41 more places in Forever's new zones, taking the total from 757 to 798.
  Mount Hyjal, Riverglades, Shen'dralas and Zephras Isle all have proper
  write-ups now instead of a zone entry and a handful of locations. Background
  only, like the rest of the Forever material, and still hidden until you turn
  them on.
- The Zephras Isle write-up was wrong and has been redone. The Skyborne are
  exiles from Eldre'Thalas, which is Dire Maul, and the wind spirits who raised
  their island into the sky have since disappeared.
- 29 more places across the old world, found by checking every area name the
  game knows against what was written: Darrowshire, Faol's Rest, Fenris Keep,
  Anvilmar, Ravenholdt Manor, the Old Dalaran Ruins and Menethil Keep in the
  Eastern Kingdoms; the Temple of Zin-Malor, Bael Modan, the Shady Rest Inn,
  Emberstrife's Den, Uldum, the Dream Bough, the Maul, the Valley of Spears,
  Kolkar Village and the Den in Kalimdor. Then Shadow Grave, the Agamand Family
  Crypt, the Terrorweb Tunnel, the Tower of Arathor, Blackwater Cove and the
  Ruins of Jubuwal; and Demon Fall Ridge, the Dor'Danil Barrow Den, the Shrine
  of the Fallen Warrior, the Twilight Outpost, Ghost Walker Post and the Razor
  Hill Barracks.
- Four places that were missing and should not have been: the Deeprun Tram, the
  Gates of Ahn'Qiraj, Champions' Hall and the Hall of Legends. The Tram was
  mentioned in six other write-ups and had none of its own, and the addon had
  Ahn'Qiraj, its Ruins and its Temple but not the wall across the front of them.
- Every zone in the game now has at least three places written up. Forever's
  four were the last ones short.
- `/ftn areas` asks the game for every place name it knows and says which of
  them have nothing written for them yet. Unlike `/ftn gaps` it does not wait
  for you to walk anywhere; it covers the whole world in one go, Forever's new
  zones included.
- `/ftn npcs` notes the characters you target or hover over, together with the
  zone and the spot they were standing in, and the game's own id number for
  each. It is groundwork for writing characters up: the point is to build the
  list from who is actually in the world rather than from a list made somewhere
  else. Only NPCs are recorded, never other players or their pets. Nothing is
  sent anywhere, `/ftn npcs clear` empties the list, and it can be turned off
  in the settings.

## 1.2.1

**Fixed**

- The settings page ran off the bottom of the window and the controls that did
  not fit were drawn across the screen. It scrolls now.
- On some clients the settings page came up completely empty.

## 1.2.0

**Added**

- 123 more towns, ruins and landmarks, taking the total from 626 places to 757.
  Every zone now has at least nine written up, except Forever's four new zones.
- Entries for Forever's nine new dungeons: Hall of Thanes, Ruins of Lordaeron,
  Excavation Site, City of Dalaran, The Drowned City, Krol'dok Stronghold,
  Alcaz Prison, Blackmaw Hold and Shaper's Terrace. Background only, like the
  rest of the Forever material.
- `/ftn gaps` lists places you have stood in that have nothing written for them
  yet. It is there so the missing ones can be found and filled in. Nothing is
  sent anywhere, `/ftn gaps clear` empties the list, and the whole thing can be
  turned off in the settings.
- `/ftn stats` says how many of those have piled up.
- Walking into a place whose only entry is hidden by the Forever setting now
  tells you so, instead of showing nothing at all.

**Fixed**

- Removed some potential spoilers.
- Dungeons were listed as having nothing written for them even when they did.

## 1.1.0

**Fixed**

- The minimap button sat inside the minimap's border instead of outside it.
  Squared-off minimaps are handled properly too.

**Added**

- Two sliders in `/ftn config` for the minimap button: where it sits around the
  edge, and how far out. It was always draggable as well, which nothing told
  you; the tooltip now does.
- Flight paths are quiet. A taxi route crosses dozens of places in a couple of
  minutes, and 1.0.0 announced every one of them and counted them as visited,
  which used up the "only the first time I ever visit" flag on places you had
  never actually stood in. Nothing is announced or counted while you are flying,
  and the place you land in is announced when you dismount. There is a setting
  to put the old behaviour back.
- Source references are clickable. The game will not open a browser, so
  clicking one gives you the full web address in a box with the text already
  selected, ready to copy. They point at warcraft.wiki.gg; a setting switches
  them to wowpedia.fandom.com.

## 1.0.0

First release. 626 places written up: 50 zones, 562 towns, ruins and landmarks,
and 14 dungeons, raids and battlegrounds.

- A fading card on arrival with one line about the place, click for the full
  write-up.
- `/ftn` for where you are, `/ftn <name>` to look anything up, `/ftn list` to
  browse by continent.
- Lore stops at patch 1.12, and goes back through Warcraft I-III and the
  pre-WoW history. Nothing from The Burning Crusade onward, and no questline
  spoilers.
- Forever's four new zones are included but hidden behind `/ftn forever on`, and
  written as background only.
- Settings for when it speaks up, how long the card lingers, repeat
  suppression, combat suppression and text size.
