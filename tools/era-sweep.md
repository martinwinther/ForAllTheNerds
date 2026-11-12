# The vanilla-era sweep

IN PROGRESS. Next: P4, claim review, 25 entries per run.

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

**P1. The term ledger, `tools/era-terms.tsv`. DONE 2026-11-12.**
1,615 rows: 1,485 `vanilla`, 58 `forever`, 39 `out-of-era`, 21 `history` (real
before WoW, absent from in-game text and still in scope) and 12 `fragment`
(capitalised but not a proper noun). The 39 out-of-era rows carry the 26 terms
the hand-written blacklist held. P2 can retire it. See the log for the
extraction rule and for the six errors the pass turned up.

**P2. Gate validate.lua on the ledger. DONE 2026-11-12.**
Fail when entry prose holds a term missing from the ledger, or one whose
verdict is `out-of-era`. Read `hook`, `lore` and `didYouKnow` only. Entry names
and `readMore` stay exempt, because the 1.12 client really does have an area
called the Southern Barrens; an entry may carry that name without telling the
player about the chasm that is not there yet. Match proper nouns case
sensitively where the same words are ordinary English, so "the northern
Barrens" passes and "the Northern Barrens" does not. Retire the hand-written
list once the ledger covers all 26 of its terms.

**P3. Transport check. DONE 2026-11-12.**
Every boat, ferry, zeppelin and flight claim in the prose was checked against
`TaxiNodes` for `wow_classic_era` and the `transports` table of the 1.12
database. Five were wrong. See the log.

**P4. Claim review, 25 entries per run. NEXT, 0 of 919 covered.**
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

Note for whoever reaches P5: **P0 and P1 already shipped in 1.2.6**, released on
2026-11-12 at Martin's explicit instruction, mid-sweep. Their player-facing
lines are in the changelog under `## 1.2.6`, so do not write them again. P5
covers what P2 to P4 turn up, and `tools/era-audit.md` has not been updated for
any of it yet.

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

### 2026-11-12, P1

Built `tools/era-terms.tsv`, 1,615 rows, and fixed the six era errors the
building of it turned up.

**How the terms were taken.** A term is a run of capitalised words joined by
single spaces, optionally crossing "of" or "of the". Any punctuation between
two words ends the run, which is what keeps a comma-separated list of names
from becoming one long term. A leading article is dropped and so is a trailing
possessive. A word capitalised only because a sentence began with it is thrown
out, unless the same word appears capitalised mid-sentence somewhere in the
corpus. Two mistakes are worth remembering: joining runs across a bare "the"
welded separate names together, and matching the dump without undoing
mysqldump's backslash escapes failed on every name with an apostrophe, which is
a large share of them.

**How the verdicts were reached.** A term is `vanilla` if it appears in the
1.12 game text, or as a whole word in a `wow_classic_era` AreaTable name, or as
the singular of either, or if every capitalised part of it does. That settled
1,485 of them without a judgement call. 92 were left: the 58 used only by
Forever entries are `forever`, and the remaining 34 were decided one at a time
against the wiki and written into the ledger with their evidence.

**The six errors.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| The Damsel's Luck | The Brashtide Crew are aboard | Captain Stillwater has her and the crew are Bloodsail. The Brashtide are worgen pirates of a later expansion |
| Sishir Canyon | On the road to the Ruins of Eldre'thar | Those ruins were added in patch 4.0.3a. The canyon runs off the Stonetalon road and leads nowhere named |
| Fray Island | The Southsea held it under Cap'n Garvey before Klannoc Macleod | Garvey is patch 4.0.3a. At 1.12 the island is Klannoc's and the test is the Affray |
| Thorn Hill | The Razormane hold it under a quilboar named Tortusk | Tortusk is patch 4.0.3a. The hill is a 1.12 area with no named leader in the game's text |
| Gnomeregan, Deeprun Tram, Steelgrill's Depot | Sicco Thermaplugg | At 1.12 he is Mekgineer Thermaplugg, with no given name anywhere in the game's text |
| The Sludgewerks | A whole entry for a Venture Company works | A Bilgewater base in northern Stonetalon, in neither the Classic Era nor the Forever client. The entry is deleted |

Four of the six are the same mistake as the Headland and Captain Dreadbeard: a
character or crew from a later expansion standing in a place that does exist at
1.12. The wiki leads that produced them all describe the Northern Barrens,
which is itself a blacklisted term.

**Two other things the pass found.** `Skywatcher Plateau` is entirely Forever
content, the Skyborne arriving from Zephras Isle, but it carried no `era` tag,
and `Data/Schema.lua` defaults a missing one to `vanilla`. It is the only one of
the 74 Forever entries that was missing `era = "forever", spoiler = true`. And
our prose spelled Menethil Harbor the British way five times against eleven the
game's way. The five were normalised.

**Settled by P2.** Terms taken out of the prose are matched case
sensitively, which gives "the northern Barrens" passing and "the Northern
Barrens" failing. A fifth column, `match`, was added for the out-of-era rows
alone: 37 of the 39 are `ci` and are also scanned for in any case, keeping the
reach the blacklist had, and the two whose lower-cased form is ordinary English,
Great Divide and Northern Barrens, are `cs`.

**One check that did not work.** Every vanilla entry name was matched against
the AreaTable of both clients, looking for more entries like the Sludgewerks.
It returned 45, but most are plainly vanilla city districts such as the Mage
Quarter, Grommash Hold and Tinker Town, which simply are not AreaTable rows
under those names. The check cannot tell a phantom entry from a district.
Nothing was concluded from it. `/ftn areas` uses the real resolver and is the
way to answer that question.

Next: P2.

### 2026-11-12, P2

`tools/validate.lua` now gates on the ledger and the hand-written `OUT_OF_ERA`
blacklist is gone. The section reads the prose of each entry, takes the proper
nouns out of it by the rule P1 used, and fails on any term the ledger does not
carry or that it marks `out-of-era`. It reports 991 entries, 7,664 proper nouns
matched against 1,615 rows.

The extraction rule is ported to Lua from the Python that built the ledger, and
the build passing is the proof the port agrees: anything the Lua reads that the
Python did not would not be in the ledger, and would fail.

**Broken deliberately, four ways, before committing.** Each was injected into
the Thorn Hill entry and then reverted:

| Injected | Result |
|---|---|
| `The Sporeggar Enclave is here.` | FAIL, uses "Sporeggar Enclave", which tools/era-terms.tsv does not carry |
| `This is in the Northern Barrens.` | FAIL, mentions "Northern Barrens", with the row's evidence |
| `The cataclysm reshaped it.` | FAIL, mentions "Cataclysm", caught by the case-insensitive scan |
| `This sits in the northern Barrens, which is a direction.` | passes, as it must |

The first is the one the blacklist could never do. "Sporeggar Enclave" is not on
any list of known-bad terms, and it fails because nothing proves it.

**A blind spot this turned up, which P2 did not cause.** Loading the addon
outside the validator yields 993 entries. Inside it, every count says 991, the
index's own line included, and the two that are missing are Forever's versions
of Darnassus and Thunder Bluff. So no check in that file has ever read them,
not this one and not the blacklist before it. Forcing `showForeverContent` on
does not bring them back, so the cause is at load time and is not the spoiler
gate. Both are Forever entries, judged against Forever's own sources, which is
why nobody noticed. Worth its own look rather than a guess.

Next: P3.

### 2026-11-12, P3

Checked every transport claim in the prose. Two oracles: `TaxiNodes` for
`wow_classic_era`, 87 rows, for anything flown, and the `transports` table of
the 1.12 database, 9 rows, for anything that floats or is a zeppelin. The flight
table carries Season of Discovery paths, plainly labelled `S03`, and a few
pseudo-nodes, so it needs reading rather than trusting.

The route claims came to 29 sentences across 24 entries, of which 7 are
Forever's airships and were left alone. Two mechanical passes were clean: every
entry claiming a flight path is a node, and every entry claiming there is none
is not a node.

Five claims were wrong.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Silverwind Refuge | A Horde outpost with an inn and a flight master, night elf corpses outside | Night elf ground under Sentinel Velene Starstrike. The Horde seize it in patch 4.0.3a, and the 1.12 quest text calls it "the Alliance outpost" |
| Valley of Strength | Has the bank, the auction house and the zeppelin towers | The towers are outside the gates in Durotar. The 1.7.0 notes fix a bug where standing in the tower flagged you as being in the Valley of Strength |
| Jaguero Isle | Reachable only by swimming or by boat | No boat runs there. Swimming only |
| Booty Bay | Runs boats to Ratchet and ships further afield | One passenger route, to Ratchet |
| Rut'theran Village | The boats to Auberdine | One ship, the Moonspray |

Silverwind Refuge is the worst of them and the most instructive. Its whole entry
had been written from the retail lead, down to the corpses, and it had
`faction = "Horde"` on a place the Alliance holds in this period, so the entry
was miscoloured in game as well as wrong in prose. Its `readMore` pointed at the
article whose lead describes the Horde outpost; it now points at Velene
Starstrike, whose Classic section is tagged as such.

**The gate earned its keep immediately.** The rewritten entry named Sentinel
Velene Starstrike, which the ledger did not carry, and the build failed until
the row was filed with its evidence from the 1.12 quest text. That is P2 working
on live prose rather than on a test.

**A gap in my own first pass, worth remembering.** The mechanical check looked
for "flight path" and missed "flight master", which is how Silverwind Refuge
survived it. Reading the sentences that the route filter had discarded is what
caught it. A keyword check is only as good as its keywords, which is the same
lesson as the blacklist.

Next: P4.
