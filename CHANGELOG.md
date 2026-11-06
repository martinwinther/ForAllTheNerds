# Changelog

## 1.2.0

**Added**

- The addon now notes places the game names that it has nothing written for,
  and `/ftn gaps` lists them. The database covers every zone but only part of
  the smaller places inside them, and the names it was built from were put
  together by hand. Letting the client report the gaps gives exactly the
  strings it uses, correctly spelled, for places somebody has actually stood
  in. Nothing is sent anywhere; the list lives in your saved variables.
  `/ftn gaps clear` empties it and the setting can be turned off.
- `/ftn stats` mentions how many gaps have been recorded.

## 1.1.0

**Fixed**

- The minimap button sat inside the minimap's border ring. The radius was
  hardcoded at 80 pixels, which is only correct for a default-sized minimap;
  it is now measured from the minimap frame itself. Squared-off minimaps are
  handled too, via `GetMinimapShape`.

**Added**

- Two sliders for the minimap button in `/ftn config`: position around the edge
  and distance from the centre. The button was already draggable in 1.0.0, but
  nothing said so; its tooltip now does.
- Flight paths are silent. A taxi route crosses dozens of places in a couple of
  minutes, and 1.0.0 announced every one of them and recorded them as visited,
  which spent the "only the first time I ever visit" flag on places you had
  never stood in. Nothing is announced or recorded during a flight now, and the
  place you actually land in is announced when you dismount. There is a setting
  to restore the old behaviour.
- Source references are clickable. The game cannot open a browser, so clicking
  one shows the full web address in a focused box with the text already
  selected, ready to copy. Addresses point at warcraft.wiki.gg, where the lore
  was verified; a setting switches them to wowpedia.fandom.com.

## 1.0.0

First release. 626 places written up: 50 zones, 562 towns, ruins and landmarks,
and 14 dungeons, raids and battlegrounds.

- A fading card on arrival with one line about the place, click for the full
  write-up.
- `/ftn` for where you are, `/ftn <name>` to look anything up, `/ftn list` to
  browse by continent.
- Lore cutoff at patch 1.12 plus Warcraft I-III and pre-WoW history. No content
  from The Burning Crusade onward, and no questline spoilers.
- Forever's four new zones are included but hidden behind `/ftn forever on`, and
  written as background only.
- Settings for when it speaks up, how long the card lingers, repeat
  suppression, combat suppression and text size.
