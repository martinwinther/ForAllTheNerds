<img src="media/logo-256.png" alt="ForAllTheNerds" width="128" align="right">

# ForAllTheNerds

A **World of Warcraft: Forever** addon that tells you the lore and history of
wherever you are standing: not just the zone, but the town, the ruin, the mine
and the dungeon.

Walk into Goldshire and you get Goldshire. Walk into Northshire Abbey and you
get the brotherhood who first turned the Light into a weapon, and why the
masonry you are standing on started a rebellion in Westfall.

**757 places written up**: 50 zones, 685 towns and landmarks, 22 dungeons,
raids and battlegrounds.

---

## Lore scope

Everything is written to **patch 1.12 and earlier**, plus the pre-WoW history
from Warcraft I–III and the novels: the War of the Ancients, the Sundering,
Arathor, the War of the Three Hammers, the fall of Lordaeron, the Battle of
Mount Hyjal.

Nothing from The Burning Crusade onward. It is written in the present tense of
vanilla: Varian is missing, Dalaran is a crater, and Stormwind is being
governed by a regency that keeps making decisions nobody can account for.

**No spoilers.** Entries explain the standing situation and the history behind
it, never how a questline resolves or what is at the bottom of the dungeon you
are about to walk into. "The Scarlet Crusade's leadership is not what it claims
to be" is as far as it goes.

**Forever's new zones are off by default.** Mount Hyjal, Riverglades,
Shen'dralas and Zephras Isle have entries, but they are gated behind
`/ftn forever on`, and even then they are background only: where the place
sits, who lives there, and the older history the name reaches back to. Turn
them on if you want to walk into Hyjal already knowing what Nordrassil was and
what the night elves spent to kill Archimonde.

---

## Install

1. Quit the game.
2. Copy the `ForAllTheNerds` folder into your Forever install's
   `Interface/AddOns` directory. You should end up with
   `.../Interface/AddOns/ForAllTheNerds/ForAllTheNerds.toc`.
3. Start the game and check ForAllTheNerds is ticked in the character-select
   AddOns list.

> **Which folder?** Forever installs alongside retail and Classic rather than
> replacing them, and it has its own game folder under your World of Warcraft
> directory. Community notes from the beta reported `_classic_beta_`; the live
> build's folder name is **not something I have been able to verify**. Open your
> World of Warcraft directory, find the one with a Forever executable in it, and
> use that folder's `Interface/AddOns`. If `/ftn` does nothing in game, you
> almost certainly put it in the wrong one.

The addon declares `## Interface: 16001, 11509`, so the same folder also loads
on Classic Era, where the vanilla lore applies unchanged.

---

## Using it

Walk around. A small card appears when you arrive somewhere, with one line
about the place. Click it for the full write-up; right-click to dismiss it.

| command | what it does |
|---|---|
| `/ftn` | read about where you are |
| `/ftn <place>` | look anything up by name, e.g. `/ftn stratholme` |
| `/ftn list` | every zone with an entry |
| `/ftn list Kalimdor` | just one continent |
| `/ftn config` | settings |
| `/ftn card off` | stop the arrival card; `/ftn` still works |
| `/ftn chat on` | also print the one-liner to chat, so you can scroll back |
| `/ftn forever on` | include Forever's new zones |
| `/ftn unlock` | park a card on screen and drag it where you want |
| `/ftn stats` | how much of the world you have been told about |
| `/ftn forget` | make everywhere count as new again |
| `/ftn where` | print the exact strings the client reports for this spot |
| `/ftn npcs` | the characters you have targeted, and the zone each stands in |
| `/ftn areas` | ask the client for every place name it knows, and what has no entry |

There is a minimap button too: left-click reads about where you are,
right-click opens the settings.

`/ftn where` is the one worth knowing about if you want to add entries; see
below.

### Settings worth changing

- **Only the first time I ever visit**: off by default. Turn it on and each
  place speaks up once per character, ever, instead of once every 15 minutes.
- **Stay quiet while I am in combat**: on by default. The card is held back
  and shown when the fight ends.
- **Open the full panel instead of the card**: for when you are reading rather
  than levelling.
- **...for full zones / towns / dungeons**: three separate switches. Keep the landmark detail and silence the zone-level entries once you know
  them.
- **Stay quiet on flight paths**: on by default. A taxi route crosses dozens of
  places in minutes; none are announced and, more importantly, none are recorded
  as visited, so a flyover does not spend a place's first visit.
- **Minimap button position and distance**: two sliders, or just drag the
  button. The radius is measured from the minimap rather than assumed, and clears the border at any minimap size.
- **Link to Wowpedia instead of Warcraft Wiki**: references link to
  warcraft.wiki.gg by default, since that is where the lore was verified.

---

## How it works

WoW addons cannot fetch anything at runtime: no HTTP, no `io`, no `require`.
So the lore is a hand-written Lua database that ships inside the addon, and the
engine is just matching and presentation.

```
ForAllTheNerds.toc        Interface 16001, 11509
Util.lua                  secret-value guards, UTF-8 helpers, URL building, timers
Core.lua                  saved variables, capability probe, bootstrap
Detect.lua                zone resolution and the decision to speak
Commands.lua              /ftn
Data/Schema.lua           ns.Zone / ns.SubsOf / ns.Instance + lookup
Data/EasternKingdoms.lua  }
Data/Kalimdor.lua         }
Data/Cities.lua           }  the lore itself
Data/Dungeons.lua         }
Data/Locales.lua          }
Data/Forever.lua          the four new zones, spoiler-gated
Data/Index.lua            dedupe, counts, parent/child index
UI/Theme.lua              colours, fonts, frame helpers
UI/Toast.lua              the arrival card
UI/Panel.lua              the write-up, child list and the copy-address window
UI/Minimap.lua            minimap button
UI/Options.lua            settings page

.pkgmeta                  what the release packager ships and what it leaves out
.github/workflows/        tag-triggered release to CurseForge
LICENSE  CHANGELOG.md  INSTALL.md  PUBLISHING.md

tools/
  mock_wow.lua            a stand-in WoW API
  validate.lua            loads the whole addon outside the game and checks it
  build-zip.sh            build a CurseForge-ready zip by hand
  generate.py             coverage, worklist, AI prompt builder, skeletons
  prompt.md               the house style the generator feeds to the model
  places.tsv              the worklist
```

The addon files sit at the repository root rather than in a subfolder. That is
the standard WoW addon layout and it is what the release packager expects; see
[PUBLISHING.md](PUBLISHING.md).

### Entries are keyed by name, not by map ID

`GetZoneText()` and `GetSubZoneText()` are what the addon matches on. That is
deliberate: subzones like Goldshire have never had map IDs, and Forever's new
zones have map IDs nobody outside Blizzard has catalogued. Matching strings
means a new entry needs nothing but the name the client prints.

Subzone lookups require the entry's declared `parent` to be the zone you are
actually in, so a name shared between two zones cannot mismatch.

### Resolution order

1. If you are inside an instance, the instance entry.
2. The subzone, if there is an entry whose parent is this zone.
3. The minimap label, same check. It is sometimes finer-grained than
   `GetSubZoneText()`.
4. The zone itself.
5. Nothing, and `/ftn` offers the containing zone instead.

### Forever API notes

Forever is **not** Classic. It shares the modern Mainline API surface, which
shaped a few decisions:

- Every string read from the client goes through `U.Safe`, which rejects
  Midnight-style **secret values** as well as missing APIs. Nothing here touches
  the combat log, unit health or anything else in that family, so the addon has
  no exposure to those restrictions.
- `C_Timer`, the `Settings` API and `BackdropTemplate` are **probed, not
  assumed**. The options page registers with `Settings.RegisterCanvasLayoutCategory`
  where it exists, falls back to `InterfaceOptions_AddCategory`, and hosts
  itself in its own window if neither is there.
- Lua is a modified 5.1: no `goto`, no bitwise operators, no `io`/`os`/`require`.
  The UTF-8 clipping helper walks lead bytes by hand rather than using `%z`,
  which differs between 5.1 and later versions.
- Every file opens with `local addonName, ns = ...`.
- Flavour detection compares `WOW_PROJECT_ID` against `WOW_PROJECT_CAMELOT`
  and falls back to the interface version, because early Forever builds reported
  project id 1 before 18 existed. Nothing branches on flavour alone.

---

## Fact-checking

Every lore claim was checked against [Warcraft Wiki](https://warcraft.wiki.gg).
Ten claims were wrong or unsupported and have been corrected. Nine are listed
below. The tenth is left out on purpose: the text it corrected was removed
altogether in the spoiler pass, and describing the correction would give away
what that text gave away.

| Claim | Correction |
|---|---|
| The Stonemasons' Guild rebuilt Northshire Abbey | Archbishop Alonsus Faol oversaw the rebuilding. The Stonemasons rebuilt Stormwind City, not the Abbey |
| The Northshire clerics are the ancestors of every paladin order | Unsupported. The wiki says they lacked martial training; Faol founded the Silver Hand, with Uther named first paladin |
| The Lion's Pride Inn is named for Lothar | Unsupported. "Lion of Azeroth" is Lothar's epithet, but nothing ties it to the inn's name |
| The Dark Irons held Grim Batol | They never did. Khardros's Wildhammers founded it; Modgud cursed it during the War of the Three Hammers and they abandoned it as unlivable |
| Nethergarde Keep was built by the Kirin Tor | Commissioned by Khadgar, funded by the Alliance of Lordaeron, and built by the Stonemasons' Guild under Edwin VanCleef |
| Magni founded the Explorers' League | He "helped to create" it; Magni and Brann are both named founding members |
| Un'Goro's pylons are titan work | No source attributes them to anyone. The titan connection to the crater itself is post-vanilla lore; both are now left unexplained |
| The Scarlet Monastery was the Church's premier training ground | It was a cathedral of the Church and a seminary for paladins, Stromgarde's especially |
| VanCleef hired Venture Company goblins | The source says only "the goblins" |

Two details were added because the check turned them up and they are too good to
leave out: Nethergarde was built by VanCleef's masons, which is a quiet piece of
foreshadowing for anyone who has seen Westfall, and Stratholme was the Knights of
the Silver Hand's headquarters.

A second pass over the 98 entries added later corrected seven more claims. Three
of those entries were wrong because they were written from notes in
`tools/places.tsv` that I had guessed at during the first pass and never
checked: Thorn Hill is a Razormane quilboar settlement rather than a Horde
watchpost, Agama'gor is a Bristleback quilboar settlement rather than standing
stones, and the Vile Reef holds murlocs in sunken Gurubashi ruins (the naga
reading is RPG-only and non-canon). Hetaera's Clutch turned out to be a drowned
temple of Elune, which was better than what I had written. The Ravencrest
Monument's link to Kur'talos Ravencrest and Staghelm Point's to Fandral are both
wiki speculation rather than established lore, and both entries now say so.

**If you use the worklist, check its notes.** The `notes` column is a prompt for
the writer, not a source. Three of mine were wrong and they propagated straight
into finished entries.

Where a detail is only established in a later expansion, it is out of scope and
has been removed rather than kept; the Un'Goro titan material is the main case.

## Prose

The lore was written, then edited against itself. <!-- lint-prose:off -->
A first pass measured
repeated phrasing across all 42,000 words of prose written at that point and
found the usual
generated-text tells: 78 uses of ", and it is", 166 sentence-final
", which is ..." verdict clauses, and an eight-strong family of "which is a
fair summary / fair indicator / fair comment of ..." constructions. Those were
rewritten individually rather than substituted, and the replacements were then
re-measured to make sure one tic had not simply become another (it had: ", so"
spiked to 41 and was thinned back to 13).

`tools/validate.lua` now enforces the result, so a later batch of entries cannot
quietly reintroduce them:

- **26 banned phrasings** fail the build outright, including the "fair summary"
  family, "which is the point", "in miniature", "which tells you", "not a
  coincidence", "in the most literal sense", "a grim reminder", "a testament
  to", "nestled", "tapestry" and em dashes.
- **15 rate-limited phrasings** warn above a budget per 10,000 words, because a
  couple of uses is voice and twenty is a tic.
- **Rhythm**: it warns on any paragraph with three or more consecutive sentences
  opening "The ".

`tools/prompt.md` carries the same list, so generated entries are held to it too.
<!-- lint-prose:on -->

`tools/lint-prose.py` applies the same list to anything else written for the
project, such as the CurseForge description and release notes:

```bash
python3 tools/lint-prose.py curseforge-description.md README.md
```

## Source links

Each entry's `readMore` list holds strings like `"Wowpedia: Elwynn Forest"`.
No API will open a browser from inside WoW. The panel renders
each reference as a clickable row that pops the full address in a focused edit
box with the text already selected, ready for Ctrl+C. `U.WikiURL` builds the
address, percent-encoding the title properly, since a good share of these have an
apostrophe in them (`Zul'Gurub` becomes `Zul%27Gurub`). Addresses point at
warcraft.wiki.gg, which is where the lore was actually checked; a setting
switches them to wowpedia.fandom.com. The validator asserts that all 210
references produce a valid https address.

## Adding places

The database will never be complete. The workflow is built for growing it.

**1. Get the exact strings.** Stand in the place and run `/ftn where`. It prints
what `GetZoneText`, `GetSubZoneText` and `GetMinimapZoneText` actually return.
Those strings are the keys. Spelling matters.

**2. Add it to the worklist.** `tools/places.tsv` is tab separated:

```
kind    name    parent    faction    levels    notes
sub     Iris Lake    Ashenvale    Contested        Lake in eastern Ashenvale
```

`notes` is what you already know. It gets fed to the model so it works from
facts instead of inventing them.

**3. See what is outstanding.**

```bash
python3 tools/generate.py coverage
python3 tools/generate.py missing --parent Ashenvale
```

**4. Generate.** This builds a prompt containing the full house style from
`tools/prompt.md` plus the places you selected:

```bash
python3 tools/generate.py prompt --parent Ashenvale --limit 8 > /tmp/batch.md
```

Paste that into Claude (or anything else), and append the Lua it returns to a
file in `ForAllTheNerds/Data/`. Add new files to the `.toc`. If you would rather
write them yourself:

```bash
python3 tools/generate.py skeleton --parent Ashenvale >> ForAllTheNerds/Data/Custom.lua
```

**5. Validate.** This is the part that matters.

```bash
lua tools/validate.lua
```

---

## Validation

`tools/validate.lua` loads the entire addon outside the game against a
stand-in WoW API and then:

- runs every data file and reports which one failed, with the Lua error
- checks the TOC declares interface 16001 and the saved variables
- runs quality rules over all 757 entries: hook length, stub paragraphs,
  over-long paragraphs, duplicate registrations, subzone parents that are not
  real zones, and that **every** Forever entry is spoiler-gated
- asserts the spoiler gate actually hides them, and reveals them when opted in
- walks every single locale, stands in its declared parent zone, and asserts it
  resolves to itself, 685/685
- renders every entry through both the toast and the panel, which is what
  catches an entry that only breaks when displayed
- exercises repeat suppression, combat suppression and the release afterwards
- runs all 31 slash command variants, the options page and the minimap button
- lints the prose for banned phrasings, over-budget phrasings and "The "-opening
  sentence runs (see **Prose** above)

It needs a Lua interpreter (`brew install lua`). Environment switches strip
client capabilities so the fallback paths get exercised honestly:

```bash
lua tools/validate.lua                                  # Forever, everything present
FTN_VERBOSE=1 lua tools/validate.lua                    # show the addon's own output
FTN_NO_TEMPLATES=1 lua tools/validate.lua               # no UI templates
FTN_NO_SETTINGS=1 FTN_LEGACY_OPTIONS=1 lua tools/validate.lua
FTN_NO_SETTINGS=1 lua tools/validate.lua                # no options API at all
FTN_PROJECT_ID=2 FTN_TOC=11509 lua tools/validate.lua   # Classic Era
FTN_PROJECT_ID=1 FTN_TOC=120105 lua tools/validate.lua  # retail
```

All eight configurations pass with zero errors and zero warnings.

---

## What is not verified

Being straight about this, because it affects what you should check first:

- **It has not been run in the live game.** Every code path is exercised by the
  mock, which is not the same thing. The most likely failure is a zone or
  subzone string that differs from what I used as a key. `/ftn where` is there
  precisely for that.
- **The AddOns folder name for live Forever.** See the install note above.
- **Interface 16001 and the `_Forever.toc` suffix** come from
  warcraft.wiki.gg's TOC format page, which also lists `_Camelot.toc` as an
  older alias with a note that the name may change. A single unsuffixed `.toc`
  with a comma-delimited interface line avoids the question entirely, which is
  what this addon ships.
- **The four new zones' geography** (level ranges, borders, Powderfuse Port,
  Krol'dok Stronghold, Darkwhisper Gorge as the approach to Hyjal) comes from
  community guide sites, not official sources. The *lore* in those entries is
  established Warcraft history and has been checked; the *geography* may need
  correcting. Hyjal Summit is reported as a 20-player raid but the exact
  instance name is unconfirmed, so it is a TODO in `places.tsv` rather than a
  guess in the data.
- **A handful of judgement calls on scope.** The four Elemental Lords and the
  titans' campaign against them sit in Warcraft RPG material contemporaneous
  with vanilla rather than in the 1.12 client, and are used as background for
  Skywall and the Molten Core. The Badlands' desolation is presented as an
  Explorers' League theory, which is what it is, rather than as fact.
- **Pre-1.12 subzone naming.** A handful of locales in the database are
  landmarks rather than named subzones, so they may never be reported by
  `GetSubZoneText()`. They are still reachable through `/ftn <name>` and the
  "Places inside" list on each zone's panel.

---

## Publishing

[PUBLISHING.md](PUBLISHING.md) covers getting this onto CurseForge, which does
already carry Forever as its own flavour at game version 1.60.1. Manual upload
works today; `.github/workflows/release.yml` automates it on a version tag.

## Licence

MIT. The lore is paraphrased from Warcraft's published material; the write-ups
themselves are original prose.
