# Changelog

## Unreleased

**Added**

- `/ftn areas` asks the game for every place name it knows and says which of
  them have nothing written for them yet. Unlike `/ftn gaps` it does not wait
  for you to walk anywhere; it covers the whole world in one go, Forever's new
  zones included.

- `/ftn npcs` notes the characters you target or hover over, together with the
  zone and the spot they were standing in, and the game's own id number for
  each. It is groundwork for writing up
  characters: the point is to build the list from who is actually in the world
  rather than from a list made somewhere else. Only NPCs are recorded, never
  other players or their pets. Nothing is sent anywhere, `/ftn npcs clear`
  empties the list, and it can be turned off in the settings.

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
