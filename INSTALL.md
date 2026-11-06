# Installing ForAllTheNerds on your gaming PC

This file is inside the zip so it travels with the addon.

## Already running 1.0.0? Upgrading is a straight replace

Quit the game, delete the old `ForAllTheNerds` folder from `Interface\AddOns`,
and drop this one in its place. **Your settings survive**: they live in
`WTF\Account\...\SavedVariables`, not in the addon folder, and the new options
pick up their defaults automatically.

### New in 1.1.0

- **The minimap button sits outside the border properly.** 1.0.0 hardcoded an
  80-pixel radius, which was only right for a default-sized minimap. It now
  measures the minimap and places the button relative to that, and it handles
  squared-off minimaps too.
- **Two sliders for it** in `/ftn config`: position round the edge, and distance
  from the centre. You can also just drag the button, which 1.0.0 allowed
  without telling you; the tooltip now says so.
- **It stays quiet on flight paths.** A taxi route crosses dozens of places in a
  couple of minutes. None of them are announced now, and none are recorded as
  visited, so flying over somewhere no longer uses up its first visit. When you
  land, the place you are actually standing in is announced. There is a setting
  if you want the old behaviour back.
- **Source references are clickable.** The game cannot open a browser, so
  clicking one gives you the full web address in a box with the text already
  selected: press Ctrl+C and paste it. Addresses point at warcraft.wiki.gg,
  which is where the lore was checked; there is a setting to use
  wowpedia.fandom.com instead.

## 1. Find your WoW: Forever game folder

Forever installs **alongside** retail and Classic rather than replacing them, so
your World of Warcraft directory holds several game folders side by side. On
Windows that directory is usually:

```
C:\Program Files (x86)\World of Warcraft\
```

Inside it you will see per-version folders. Retail is `_retail_`, Classic Era is
`_classic_era_`. **I could not verify what Forever's folder is called** — beta
builds reported `_classic_beta_` and the live name may differ.

Do not guess. Let the launcher tell you:

1. Open the Battle.net launcher.
2. Select **World of Warcraft**, and pick **Forever** in the version dropdown
   above the Play button.
3. Click the **cog icon** next to Play, then **Show in Explorer**.

Explorer opens the exact folder for that version. That is the one you want.

## 2. Drop the addon in

Inside that game folder, go to `Interface\AddOns`. If `Interface` or `AddOns`
does not exist yet, create them — a fresh install has no addons and no folders
for them.

Extract the zip so you end up with **exactly** this:

```
<game folder>\Interface\AddOns\ForAllTheNerds\ForAllTheNerds.toc
```

The most common mistake is one folder too deep:
`...\AddOns\ForAllTheNerds\ForAllTheNerds\ForAllTheNerds.toc` will not load. The
`.toc` file must sit directly inside a folder named `ForAllTheNerds`.

## 3. Turn it on

The game caches the addon list at launch, so **quit the game completely** if it
is running, then start it again.

At the character-select screen, click **AddOns** in the bottom-left corner.
ForAllTheNerds should be listed. Tick it, and make sure the dropdown is set to
**All** rather than a single character.

If it appears greyed out as out of date, tick **Load out of date AddOns** and
tell me the interface number the game reports — it means the client wants
something other than the 16001 the addon declares, and that is a one-line fix.

## 4. Check it works

Log in and type:

```
/ftn
```

You should get the write-up for wherever you are standing. Walk into Goldshire
or Northshire Abbey and a small card should appear on its own.

If `/ftn` does nothing at all, the addon did not load. In order of likelihood:
the folder is nested one level too deep, it went into the wrong game folder, or
the game was not fully restarted.

Other useful commands:

| command | what it does |
|---|---|
| `/ftn help` | everything it can do |
| `/ftn config` | settings |
| `/ftn stratholme` | look anything up by name |
| `/ftn forever on` | include Forever's four new zones (background only, no plot spoilers) |
| `/ftn where` | print the exact zone strings the client reports |

## 5. The one thing I need from you

Forever's new zones are thin: Mount Hyjal has two entries, Riverglades one,
Shen'dralas and Zephras Isle none. No reliable subzone names for them exist
outside the game, and inventing spellings would produce entries that never
match.

When you are in one of those zones, stand in a named spot and run:

```
/ftn where
```

It prints what `GetZoneText` and `GetSubZoneText` actually return. Send me those
strings and I can write proper entries against them.
