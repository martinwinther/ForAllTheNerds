# The vanilla-era sweep

IN PROGRESS. Next: P1, the term ledger.

One bounded chunk per run. The point of the sweep is to replace a blacklist of
era mistakes somebody happened to think of with a ledger that fails on anything
unproven. `tools/era-audit.md` records the six errors already found and how
they got in. Read it before touching an entry, and do not repeat that analysis
here.

The corpus is 921 vanilla entries and 73 Forever ones, from `lua
tools/dump-prose.lua`. Only the vanilla ones are in scope. A Forever entry is
judged against Forever's own sources and is correctly absent from every 1.12
oracle. Never flag it for that.

Scope is patch 1.12 and earlier, Warcraft I to III, pre-WoW history, and
Forever's own content. Nothing from The Burning Crusade onward. When a claim
cannot be supported from a vanilla source, delete it rather than rewording it
into something vaguer and keeping it.

## Why a ledger and not a longer list

The "Era scope" section of `tools/validate.lua` is a blacklist of 26 terms. It
can only fail on a term somebody already knew was wrong, so the Auberdine line
below sat in the data untouched: nothing in the list says Azuremyst. A ledger
inverts the test. Every proper noun our prose uses has to be proven vanilla
before the build passes, and a new one fails until somebody files it.

## The checklist

One status line each. Do one item per run, verify it, commit it, stop.

**P0. The Auberdine boat line. DONE 2026-11-10.**
The entry claimed boats to Rut'theran Village, Menethil Harbor and "the
Azuremyst route north". The third arrives in patch 2.0.1. It now names the two
boats the 1.12 game has, and cites the Classic articles. See the log.

**P1. The term ledger, `tools/era-terms.tsv`. NOT STARTED.**
One row per proper noun our own prose uses, with columns `term`, `verdict`,
`evidence`, `source`. The verdicts are `vanilla`, `forever`, `out-of-era`,
`history` (real before WoW, absent from in-game text and still in scope) and
`fragment` (capitalised but not a proper noun). A few hundred rows, filled from
the oracles below, cheapest first. This file is our own analysis of the terms
our own prose uses, and it is committed.

**P2. Gate validate.lua on the ledger. NOT STARTED.**
Fail when entry prose holds a term missing from the ledger, or one whose
verdict is `out-of-era`. Read `hook`, `lore` and `didYouKnow` only. Entry names
and `readMore` stay exempt, because the 1.12 client really does have an area
called the Southern Barrens; an entry may carry that name without telling the
player about the chasm that is not there yet. Match proper nouns case
sensitively where the same words are ordinary English, so "the northern
Barrens" passes and "the Northern Barrens" does not. Retire the hand-written
list once the ledger covers all 26 of its terms.

**P3. Transport check. NOT STARTED.**
Our entries make many "boats to X" and "flight path to Y" claims. `TaxiNodes`
and `TaxiPath` for product `wow_classic_era` settle them exactly. Check every
such claim and fix what is wrong. P0 is one instance of this, found by hand.

**P4. Claim review, 25 entries per run. NOT STARTED, 0 of 921 covered.**
The only tier that catches a sentence where every word is vanilla and the state
is not, as at the Headland. For each vanilla entry, read the `(Classic)`
article for its place and ask one question: does the entry assert anything that
article does not support, or that it places in a later era? No questline
spoilers in a fix: name a place and who holds it, not how a quest resolves.
Record the entries covered in the log below. The next run then continues
instead of restarting.

**P5. Write it up. NOT STARTED.**
Once P0 to P4 are done, put the findings into `tools/era-audit.md`, add the
player-facing lines to the `Unreleased` section of the changelog, and stop. Do
not tag and do not publish: releases are Martin's call.

## Oracles, in order of preference

1. `cmangos/classic-db`, `Full_DB/ClassicDB_1_12_1_z2815.sql.gz`, about 12 MB.
   The 1.12.1 world database. `creature_template` is every creature,
   `gameobject_template` every object, `quest_template` every quest's full
   text, plus `creature_ai_texts` and `questgiver_greeting`. Any proper noun
   appearing in that corpus is vanilla by definition. It covers in-game text
   alone, so pre-WoW history is mostly absent and absence proves nothing.
2. wago.tools, product `wow_classic_era`. `AreaTable` for every place name the
   vanilla client knows, `TaxiNodes` and `TaxiPath` for the transport network,
   plus `Map`, `Faction` and `ChrRaces`. Classic Era carries Season of
   Discovery and anniversary additions. Read it as vanilla plus a little.
3. warcraft.wiki.gg through its API, for anything the first two leave open. A
   `Foo (Classic)` article existing means the bare `Foo` is the retail one and
   is the wrong source. A `{{Patch X.Y.Z|added=}}` section dates a thing
   exactly, and an earliest patch of 2.0.1 or later is out of era. Era section
   templates and "Added in patch" categories do the same job. The API takes 50
   titles per call:
   `/api.php?action=query&prop=revisions&rvprop=content&rvslots=main&titles=A|B|C`
   and `/api.php?action=query&list=search&srsearch=insource:"NAME"`. Use the
   built-in browser. Do not use `index.php?search=`, which Cloudflare
   challenges, and do not work around a challenge.

Neither dump is ever committed, nor any bulk extract of one. cmangos is
GPL-3.0 and this addon is MIT, and the wago CSVs are not ours either. Download
to a temporary directory, read it, leave it there. Never fetch Wowhead: its
robots.txt disallows our agents.

`tools/dump-prose.lua` dumps every entry's prose with its era tag.
`tools/check-era.py` already checks titled characters against the 1.12 table.

## Before every commit

`lua tools/validate.lua`, and the same across the nine client configs the
matrix in `.github/workflows/ci.yml` lists. All must pass. `python3 -I
tools/lint-prose.py` on every file touched, clean. `python3 -I
tools/check-gaps.py` passes. RHYTHM findings on `Data/*.lua` are pre-existing
false positives from reading Lua as prose, so check the count did not rise
rather than chasing them. Break any new check deliberately, confirm it fails
with the expected message, restore it, and say so in the commit message. Work
on dev, never push main, never tag.

Every run ends by appending to the log below: the date, what it did, what it
found, what is next, and for P4 the entries covered so far.

## Log

### 2026-11-10

Created this file from the plan. Nothing in the data changed, and no entry was
read for content yet. `lua tools/validate.lua` passes on all nine client
configs in the CI matrix, `python3 -I tools/check-gaps.py` passes, and the
prose linter is clean on this file.

Next: P0, the Auberdine boat line.

### 2026-11-10, P0

Fixed the Auberdine entry in `Data/Kalimdor.lua`. Its first lore paragraph
claimed boats to Rut'theran Village, Menethil Harbor "and the Azuremyst route
north". It now names the two boats that exist at 1.12 and carries a `readMore`,
which it had none of before.

Two oracles were checked independently and they agree:

- The `transports` table of the 1.12.1 world database lists every moving
  transport in the game, nine rows in all. Two of them touch Auberdine: 176244
  `Moonspray`, "Teldrassil and Auberdine", and 176310 `Serenity's Shore`,
  "Menethil Harbor and Auberdine". Nothing sails to Azuremyst.
- The wiki's `Auberdine` article carries `{{Classic only|patch=4.0.3a}}`. No
  `Auberdine (Classic)` article exists, which makes the bare title the right
  source here. It names `The Bravery` to Menethil Harbor and `The Moonspray` to
  Rut'theran Village, and puts `Elune's Blessing` to Azuremyst Isle in the
  Burning Crusade section.

Cited `Wowpedia: Auberdine` and `Wowpedia: Moonspray`. Both lead with the
pre-Cataclysm state. `The Bravery` was deliberately left out: its article is
era-tagged, but its lead describes the Stormwind Harbor route the ship was
moved to in patch 3.0.2, and handing the player a retail lead is the trap this
sweep exists to close.

**One assumption P1 must not inherit.** The plan said any proper noun in the
cmangos corpus is vanilla by definition. That does not hold for the whole dump.
`npc_text` and `page_text` carry rows that are not in the 1.12 game: a draenei
celebration line naming Azuremyst and Bloodmyst, and several more naming the
Exodar. Treat `creature_template`, `gameobject_template`, `quest_template`,
`creature_ai_texts` and `questgiver_greeting` as authoritative. A hit in
`npc_text` or `page_text` proves nothing by itself.

Noted for P3: `tools/validate.lua` already has a "Flight paths" section at line
792. The transport check has somewhere to live and does not need a new one.

The rest of `Data/` was swept for the same family of names. One hit, and it is
right: Sylvanas was Ranger-General of Silvermoon before Arthas killed her,
which is Third War history and in scope.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and
`lint-prose.py` on `Data/Kalimdor.lua` holds at the same eight pre-existing
RHYTHM findings as the previous commit. No new check was added, so nothing
needed breaking deliberately.

Next: P1, the term ledger.
