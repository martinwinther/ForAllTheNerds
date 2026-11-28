SWEEP COMPLETE

# The vanilla-era sweep

**Finished on 2026-11-25. There is no next run, and the loop that was driving
this can be stopped.** P0 through P5 are all done. All 907 surviving vanilla
entries were reviewed across 37 runs, the ranking is spent, every run's
player-facing changelog lines are written, run 37's under the 1.2.21 heading,
and the findings are written up in `tools/era-audit.md`.

Read `tools/era-audit.md` first, and `tools/audit-prompt.md` if you are looking
for the next error rather than a past one. It is the account of what the sweep found: the
nine classes of error, how each got in, what now stops it and, more usefully,
what no gate can catch. This file is the working log behind it, run by run, and
is where to look for any single entry.

What the sweep did to the corpus, measured rather than tallied from the runs:
921 vanilla records before, 907 after, with 692 of the 906 that survived both
ends changed and 214 left exactly as they were. Eleven records left the vanilla
corpus, five as places that do not exist in this period and six as duplicates,
and three moved from vanilla to Forever. See run 19 for counting details and
run 34 for the recount that corrected run 33's total.

One bounded chunk per run was the rule while this ran. The point of the sweep
was to replace a blacklist of era mistakes somebody happened to think of with a
ledger that fails on anything unproven, and that is now in place at 2,480 rows.

The current corpus is 915 vanilla entries and 74 Forever ones, from `lua
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

**P4. Claim review, 25 entries per run. DONE 2026-11-24, all 907 surviving entries covered.**
The only tier that catches a sentence where every word is vanilla and the state
is not, as at the Headland. For each vanilla entry, read the `(Classic)`
article for its place and ask one question: does the entry assert anything that
article does not support, or that it places in a later era? No questline
spoilers in a fix: name a place and who holds it, not how a quest resolves.
Record the entries covered in the log below. The next run then continues
instead of restarting.

**P5. Write it up. DONE 2026-11-25.**
`tools/era-audit.md` is rewritten from the four original errors to the whole
sweep: the corpus arithmetic, nine classes of error with examples, the ways in
that the first pass had not seen, what the ledger and `check-era.py` now stop,
and a section on what no gate can catch. The player-facing changelog lines were
written release by release, run 37's last, under the 1.2.21 heading. Nothing was
tagged or published for P5 itself.

Note for whoever reaches P5: **P0 and P1 shipped in 1.2.6, P2, P3 and P4 runs 1
to 3 in 1.2.7, runs 4 to 8 in 1.2.8, runs 9 and 10 in 1.2.9, runs 11 and 12
in 1.2.10, runs 13 and 14 in 1.2.11, runs 15 and 16 in 1.2.12, runs 17 and 18
in 1.2.13, runs 19 and 20 in 1.2.14, runs 21 and 22 in 1.2.15, run 23 in 1.2.16,
runs 24 to 28 in 1.2.17, runs 29 to 32 in 1.2.18, runs 33 and 34 in 1.2.19 and
runs 35 and 36 in 1.2.20 and run 37 in 1.2.21**, all released mid-sweep at
Martin's explicit instruction. Their player-facing lines are already in the
changelog under those sixteen headings, so do not write them again. That is the
changelog half of P5 finished for every run. **What is left of P5 is
`tools/era-audit.md` alone**, still not updated for anything since the original
four errors.

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

`lua tools/validate.lua`, and the same across the client configs the matrix in
`.github/workflows/ci.yml` lists, six of them since 1.2.21 dropped three. All must pass. `python3 -I
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

### 2026-11-12, P4, run 1 of about 37

Reviewed 25 entries against the article for each place. Seven were wrong.

**How the 25 were chosen.** Alphabetical order would spend most runs on places
nothing ever happened to. Instead all 912 distinct vanilla entry names were
fetched from the wiki in batches of 50 and scored for the markers that mean a
place changed later, and so that its article's lead describes a state we do not
cover: a 4.0.3a patch note, "after the Cataclysm" or a "now" state in the lead,
a cata section, a Classic-only tag. 378 of the 912 carry at least one. This run
took the top 25 by score. The scan is cheap and any run can recompute it; what
it must not do is re-review the entries listed below.

Of the 25, Auberdine, Booty Bay and Fray Island had already been corrected in
earlier runs, which is a good sign about the ranking.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Southshore | A port on Lordamere Lake's southern coast | It is on Baradin Bay, as our own Baradin Bay entry already said. Lordamere Lake is inland, well to the north |
| Andorhal | A four-cornered battlefield of Scourge, Forsaken, Scarlet Crusade and Argent Dawn | Araj the Summoner's headquarters, with Scarlet Crusade patrols on the roads north. The Forsaken and the Argent Dawn come to Andorhal later |
| Darkshire | Lord Ello Ebonlocke commands the Night Watch | He is the Mayor of Darkshire. Commander Althea Ebonlocke is Leader of The Night Watch, both titles straight out of the 1.12 creature data |
| Dun Modr | Taken by Dark Iron and Syndicate forces | Dark Iron. The Syndicate is not there |
| Sandsorrow Watch | A Horde post | A neutral camp in a tower, with Sandfury trolls holding the ground around it |
| Wavestrider Beach | Wreckage and naga, and a paragraph on the naga being former highborne | Steeljaw snappers. No naga on this coast in this period |
| Bolgan's Hole | A cave held by whatever got there first, in a zone whose only settlements are Nijel's Point and Shadowprey Village | A cave inside Gelkis Village holding the Gelkis khan, Khan Shaka. Desolace also has Ghost Walker Post |

Two of the seven were caught by our own data disagreeing with itself. The
Baradin Bay entry lists Southshore on the bay while the Southshore entry put it
on a lake, and Desolace's "only settlements" claim sat next to an entry for
Ghost Walker Post. A pass looking only for internal contradictions would be
worth a run of its own.

**Three that looked wrong and were not.** Grim Batol's claim that the red
dragonflight watches the approaches holds up: the 1.12 quest text has the reds
hunting the Dragonmaw, who fled the fortress into the mountains. Forest Song
reads as nearly empty, which is right for this period, and the draenei outpost
in the article's lead arrives in patch 2.0.1. Raptor Grounds matches its article
sentence for sentence, Northwatch Hold and the huts included.

**The gate again.** The rewrites named five things the ledger did not carry, and
the build failed until each was filed: Commander Althea Ebonlocke, Gelkis
Village, Ghost Walker Post, Khan Shaka and Steeljaw. The ledger is 1,621 rows.
Note that Ghost Walker Post is one of our own entry names, which the gate
exempts, so it only needed a row once another entry's prose mentioned it.

**Entries covered so far (25).** Andorhal, Angerfang Encampment, Apocryphan's
Rest, Bashal'Aran, Beggar's Haunt, Bolgan's Hole, Dalson's Tears, Darkshire,
Deadwood Village, Dun Modr, Echo Ridge Mine, Forest Song, Grim Batol, Jerod's
Landing, Mardenholde Keep, Raptor Grounds, Sandsorrow Watch, Shadra'Alor,
Shok'Thokar, Southshore, Stonetalon Peak, Stranglethorn Vale, Uther's Tomb,
Wavestrider Beach, Windshear Crag.

Next: P4, the next 25 by the same ranking.

### 2026-11-12, P4, run 2 of about 37

Reviewed 25 entries against the article for each place. Ten carried a claim the
article does not support, and two more entries outside the 25 carried the same
errors and were fixed with them.

**The ranking was recomputed, and it is not run 1's.** The scan scores each
vanilla entry name for the markers that mean a place changed later: a 4.0.3a
patch note and a `Classic only` tag are worth 2 each, "Cataclysm" or
"Shattering" in the lead 2, a cata or later section 1, a "now" state in the
lead 1, a `Patch 2.0.0` or later template 1, and the existence of a
`Foo (Classic)` article 3. 511 of 913 names score above zero. That last marker
is new this run and it is the strongest tell in `tools/era-audit.md`, so this
run's top 25 is zones and major settlements rather than run 1's small places.
Write the formula down rather than the ordering: any run can recompute it, and
what must not happen is re-reviewing an entry already listed below.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Western Plaguelands | Andorhal is a four-way battleground of Scourge, Forsaken, Scarlet Crusade and Argent Dawn | Run 1 fixed this same error in the Andorhal entry itself. Andorhal is the Scourge's town under Araj the Summoner, with the Scarlet Crusade striking from Hearthglen |
| Teldrassil | Malfurion Stormrage and the dragonflights opposed the planting | Malfurion was missing. The 1.12 "Crown of the Earth" text has Staghelm taking over *because* Shan'do Stormrage never returned, and Nozdormu and Alexstrasza refusing their blessings afterwards |
| Teldrassil | The tree is "perhaps a few decades old" | Grown after the Third War, by the 1.12 account |
| Feathermoon Stronghold | Sits on Sardor Isle | Sardor Isle (1120) and Feathermoon Stronghold (1116) are separate sibling areas of Feralas. The 1.12 quest text sends you out to Sardor Isle for naga and back to Feathermoon |
| Sardor Isle | The island Feathermoon Stronghold is built on | Held by Hatecrest naga. Found by the Feathermoon fix, not among the 25 |
| Un'Goro Crater | Marshal's Refuge is a joint expedition of dwarves and gnomes | Marshal Expeditions under the human Williden Marshal, mixed human, gnome, dwarf and goblin |
| Mulgore | Tauren druids were trained by Cenarius himself | The 1.12 Cenarion text calls the tauren "young in the ways of Cenarius". Tauren druidism is recent and came through the Cenarion Circle |
| Tirisfal Glades | Tirisfal means "the trust of the fallen" in an older tongue | Unsupported, and the wiki's etymology ("Tyr's Fall", vrykul, Chronicle 2016) is itself out of era, so the clause is gone. The Guardians of Tirisfal naming is sourced and stays |
| Arathi Highlands | Stromgarde's garrison holds out under "Commander Trollbane's heirs" | Prince Galen Trollbane, Thoras Trollbane's son, in the militia-held districts. Nobody holds a rank called Commander Trollbane |
| Shadowfang Keep | Silverlaine's keep "was offered as a base" to the Dalaran mages | Unsupported. Arugal's worgen turned on the wizards and besieged the keep |
| Wetlands | Khardros Wildhammer killed Modgud "for" the curse she laid | She laid it as she died, after he struck her down. The entry had cause and effect the wrong way round |
| Tanaris | "Uldum, Uldaman and Uldum's unexplored siblings all share a naming pattern, and all three are titan installations" | Two are known in this period, Uldum and Uldaman. The sentence named two and counted three, and the third it was reaching for is Ulduar, which arrives in patch 3.0.2 |

**One fix that is precision, not an era error, and should be read as such.**
Darkshore called Althalaxx "the Shadow Council's tower". A journal taken off the
cultists in the 1.12 chain does tie them to the Shadow Council, so that was not
wrong. But the tower's occupants are the Cult of the Dark Strand under Athrikus
Narassin, and the 1.12 text has the Sentinels saying outright that they have
never heard of the group. Naming the cult is what the game actually tells the
player. The Tower of Althalaxx sub-entry had the same imprecision and got the
same treatment. Counted separately from the eight above.

**Four that looked wrong and were not.** Alterac Mountains puts Dalaran's crater
in the zone, and the Classic Era AreaTable agrees: Dalaran (279) is a child of
Alterac Mountains, so the Hillsbrad quest that sends you there is crossing a
border. Silithus has Fandral's son Valstann dying in the War of the Shifting
Sands, which looked like 4.2 material and is not: the in-game Prophecy of C'Thun,
told by Geologist Larksbane at Cenarion Hold, names him and has Rajaxx execute
him in front of his father. The Wetlands call Dun Modr "a contested wreck" and
the article has Rhag Garmason trying to take the town back off the Dark Iron.
Tarren Mill's inn is real: Innkeeper Shay is in the 1.12 creature table.

**A hole in the ledger's compositional rule.** The gate passed "Commander
Trollbane" for two releases because P1's rule marks a term vanilla when *every
capitalised part of it* is vanilla, and Commander and Trollbane both are. That
rule will pass any invented title or name built out of real words, which is a
narrower version of the blacklist problem the ledger was meant to fix. The row
is deleted, and no prose uses the term now. There are 99 other rows resting on
that rule, which `awk -F'\t' '$3=="every part named in 1.12 sources"'` counts,
and they deserve a pass of their own. The commit that landed this run said 49,
which was a guess written before the count was run. The number is 99.

**Broken deliberately.** Deleting a row only helps if the gate then fails on the
term, so "Commander Trollbane held it before." was injected into Arathi
Highlands: FAIL, uses "Commander Trollbane", which tools/era-terms.tsv does not
carry. Reverted. No new check was added this run.

**The gate earned its keep again.** The rewrites named seven things the ledger
did not carry and the build failed until each was settled: Thoras Trollbane,
Williden Marshal, Athrikus Narassin, Latronicus Moonspear and Ruins of Solarsal
were filed with their 1.12 evidence, and two were the extractor reading prose
rather than names. "Thinning" was a sentence-initial gerund and "Feathermoon"
a bare surname left stranded by a comma, so both sentences were reworded instead
of filing junk rows. The ledger is 1,625 rows. Gates: the validator passes on
all nine configs, `check-gaps.py` passes, and RHYTHM on the three touched data
files went 12/8/2 to 11/8/2, which is down by one.

**One deviation from the brief, deliberate.** The brief says to reach the wiki
API through the built-in browser. The ranking scan wants 38 API calls whose
replies are megabytes of wikitext, and the browser pane cannot fetch a local
file, so feeding it 913 titles means writing them all into the conversation. The
pane was opened and confirmed first: `api.php` answers it same-origin, and a
cross-origin fetch from a local page is blocked. The bulk scan then went through
`curl` against `api.php`, which returns 200 unchallenged, with a script doing the
scoring. No challenge was met and none was worked around; `index.php?search=` was
never touched. Reading individual articles for the review itself stayed on the
API as the brief intends. If `curl` is ever challenged, stop and use the pane.

**Entries covered so far (50).** Alterac Mountains, Andorhal, Angerfang
Encampment, Apocryphan's Rest, Arathi Highlands, Azshara, Bashal'Aran, Beggar's
Haunt, Blasted Lands, Bolgan's Hole, Dalson's Tears, Darkshire, Darkshore,
Deadwood Village, Dun Modr, Durotar, Dustwallow Marsh, Eastern Plaguelands, Echo
Ridge Mine, Feathermoon Stronghold, Felwood, Feralas, Forest Song, Grim Batol,
Hearthglen, Hillsbrad Foothills, Jerod's Landing, Mardenholde Keep, Mulgore,
Raptor Grounds, Sandsorrow Watch, Shadowfang Keep, Shadra'Alor, Shok'Thokar,
Silithus, Silverpine Forest, Southshore, Stonetalon Peak, Stranglethorn Vale,
Tanaris, Tarren Mill, Teldrassil, Theramore Isle, Tirisfal Glades, Un'Goro
Crater, Uther's Tomb, Wavestrider Beach, Western Plaguelands, Wetlands,
Windshear Crag.

Fixed alongside but not reviewed as entries of their own, so still open for a
later run: Sardor Isle, Tower of Althalaxx.

Next: P4, the next 25 by the same ranking.

### 2026-11-12, P4, run 3 of about 36

Reviewed 25 entry names against the article for each place, 26 entries in all
because two distinct entries are called Darnassus. Six carried a claim the
article does not support. A seventh came out of the compositional-rule audit
flagged in run 2, and it is the more important find of the two.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Valley of Honor | Contains the Ring of Valor "where orcs settle things" | The Ring of Valor is the Orgrimmar arena and arrives in patch 3.0.2. At 1.12 the quarter trains out of the Hall of the Brave and the Hunter's Hall, both of them 1.12 objects |
| Emberstrife's Den | What Neltharion "did with the Dragon Soul" | Dragon Soul is the name Cataclysm gives the artefact. The sources this addon covers call it the Demon Soul, which our own Wetlands entry already cites |
| Brambleblade Ravine | A warren "dug into the southern hills" | It is east of Camp Narache in Mulgore, under Chief Sharptusk Thornmantle, and it is where the Rite of Strength sends young tauren |
| Winterspring | Mazthoril is "the cave beneath Frostsaber Rock" | Mazthoril is the deep icy cavern in the middle of the zone near Lake Kel'Theril. Frostsaber Rock is a separate area out west, where the frostsaber pride is |
| Nesingwary's Expedition | Hemet "has made a career of it across the world" | Stranglethorn is the only camp he has in this period. The others arrive in patches 2.0.1 and 3.0.2 |
| Deadwind Pass | "Almost nothing lives in it" | Ogres are most of the population and are set on clearing out everyone else, with harpies in the gullies. The murdered village in the south is real and unexplained, which the entry had right |
| Loch Modan | The Explorers' League "has dig sites all over the valley", Ironband's being "the largest" | One dig, Ironband's Excavation Site in the east, with troggs in it and Prospector Ironband recruiting for Uldaman from it |

**The compositional hole is real and it was live.** Run 2 deleted the
"Commander Trollbane" row and flagged 99 others resting on "every part named in
1.12 sources". Two of those 99 were wrong in the same way, and both were being
used by prose that shipped:

- `Ring of Valor` was in the ledger as **vanilla**, because Ring and Valor are
  each vanilla words. That is exactly why the Valley of Honor entry could
  describe a Wrath arena through two releases of the gate.
- `Dragon Soul` was in the ledger as **vanilla** for the same reason, and the
  row for `Demon Soul` beside it carried the same compositional evidence even
  though neither name appears anywhere in 1.12 game text.

Both rows were rewritten rather than added, which matters: the first attempt
passed a new `out-of-era` row to an add-if-absent script, the term was already
present, and the row was silently dropped. The build still passed and the claim
was still in the prose. **Deleting or re-verdicting a ledger row is not done
until the gate has been seen to fail on the term.** `Ring of Valor` is now
`out-of-era` with `ci`, `Dragon Soul` likewise, and `Demon Soul` is `history`
with the 2004 novel as its evidence.

**Broken deliberately, three ways.** `The Ring of Valor stands here.` into the
Valley of Honor: FAIL, mentions "Ring of Valor", with the patch in the evidence.
`Orcs duel in the ring of valor.`: same FAIL, which is the `ci` column doing its
job. `Dragon Soul` back into Emberstrife's Den: FAIL, mentions "Dragon Soul".
All three reverted. No new check was added; two rows changed verdict.

**A quirk of the extractor, found while testing and worth knowing.** The first
injection read `The ring of valor is here.` and the build failed on something
else entirely: `Valor's Rest uses "Rest"`. The rule that throws away a word
capitalised only at the start of a sentence asks whether that word is ever seen
lower-cased *anywhere in the corpus*. Lower-casing "valor" in one entry
therefore made "Valor's" look like an ordinary word in another, and the Silithus
entry's own name was stripped down to "Rest". So a legitimate future edit that
lower-cases a word which begins some other entry's name will fail the build
naming the wrong entry. It is not a false pass, but it is a confusing failure.

**The remaining 96 compositional rows are still their own pass.** Filtering them
by "whole phrase absent from both the 1.12 text and the AreaTable" returns all
of them, so that filter decides nothing. They are mostly legitimate possessive
constructions our prose builds ("Thrall's Horde", "Forsaken Tirisfal") and
pre-WoW names. `Wild God` and `Old Ironforge` looked like later coinages and are
used only by `Data/Forever.lua`, which is judged against Forever's own sources
and must not be flagged for it. `Champions' Hall` is one of our own entry names
and is the 1.12 honor-system building. The pass needs a per-row judgement, not a
filter.

**Four that looked wrong and were not.** The Great Lift really is tauren-built.
Menethil Harbor really is a dwarven-built port named for Terenas Menethil II,
and the Dragonmaw really did besiege it under Nek'rosh. The Deadwind village
really was murdered with no agreed culprit. Mazthoril really is a blue
dragonflight holding, just not where we put it.

**The gate took ten rows this run.** Ajeck Rouack, Barnil Stonepot, Bristlebacks,
Chief Sharptusk Thornmantle, Hall of the Brave, Hunter's Hall, Lake Kel'Theril,
Rite of Strength and Rites of the Earthmother were filed with their 1.12
evidence. Sir S. J. Erlgadin was dropped from the prose instead: the initials
break the run of capitalised words, so his name extracts as "Sir S" and
"Erlgadin" and would have cost two junk rows. The ledger is 1,634 rows. Gates:
the validator passes on all nine configs, `check-gaps.py` passes, and RHYTHM on
the touched data files is unchanged at 0/11/8.

**Entries covered so far (75).** Alterac Mountains, Andorhal, Angerfang
Encampment, Apocryphan's Rest, Arathi Highlands, Auberdine, Azshara,
Bashal'Aran, Beggar's Haunt, Blasted Lands, Bolgan's Hole, Brambleblade Ravine,
Camp E'thok, Chillwind Camp, Dalson's Tears, Darkshire, Darkshore, Darnassus,
Deadwind Pass, Deadwood Village, Dun Garok, Dun Modr, Durotar, Dustwallow Marsh,
Eastern Plaguelands, Echo Ridge Mine, Feathermoon Stronghold, Felwood, Feralas,
Forest Song, Frostmane Hold, Grim Batol, Hearthglen, Hillsbrad Foothills,
Jerod's Landing, Loch Modan, Mardenholde Keep, Menethil Harbor, Moonbrook,
Mulgore, Nesingwary's Expedition, Pyrewood Village, Raptor Grounds, Raven Hill,
Refuge Pointe, Sandsorrow Watch, Shadowfang Keep, Shadra'Alor, Shok'Thokar,
Silithus, Silverpine Forest, Southshore, Stonetalon Peak, Stonewrought Dam,
Stranglethorn Vale, Talrendis Point, Tanaris, Tarren Mill, Teldrassil, Theramore
Isle, Thousand Needles, Tirisfal Glades, Tyr's Hand, Un'Goro Crater, Uther's
Tomb, Valley of Honor, Valley of Wisdom, Valormok, Wavestrider Beach, Western
Plaguelands, Westfall, Wetlands, Windshear Crag, Winterspring, Yojamba Isle.

Still open from run 2, fixed but never reviewed as entries of their own: Sardor
Isle, Tower of Althalaxx. Emberstrife's Den was fixed this run and is in the
same position.

Next: P4, the next 25 by the same ranking.

### 2026-11-13, P4, run 4 of about 35

Reviewed 25 entries. Seven asserted something no source in this period supports.
None of the seven was a later-expansion name this time. They were inventions:
sentences that sound like lore, are not contradicted by any term in the ledger,
and are simply made up. That is the failure mode left once the era terms are
under control, and the gate cannot see it at all.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Purgation Isle | The Scarlet Crusade has made it a private site, doing what the Church would not sanction | No Scarlet Crusade on it. It is a cemetery island of condemned dead who all served the Light, paladins, clerics, monks and mages, human and dwarf, and the ogre necromancer Kormok raised them |
| Mirage Raceway | Two rival goblin outfits, "the Bloodsail-adjacent racing concerns of Gadgetzan and Steamwheedle interests" | The goblin Pozzik and the gnome Fizzle Brassbolts built it out of a goblin-against-gnome rivalry, with a camp each at opposite ends. The Bloodsail are Stranglethorn pirates and have nothing to do with it |
| Camp Wurg | Boss Tho'grun "did not sit in any of them, he patrolled between the four" | Kargath's orcs hired him to fetch the Sign of the Earth and he kept it. His band wanders, and the quest text says to try Camp Boff |
| Hammerfall | The Doomhammer "had belonged to his father Durotan's clan" | Orgrim was Blackrock clan and inherited the hammer from his own father. The 1.12 text has it exactly: Thrall "bears the armor and hammer of Orgrim" |
| Burning Steppes | The Dark Iron capital "sank into the mountain and became Blackrock Depths" | Thaurissan was a surface colony the thane destroyed by summoning Ragnaros. The Dark Irons' seat is inside the mountain under Emperor Dagran Thaurissan, and it did not get there by sinking |
| Kodo Rock | The obscurity is deliberate, and the first lesson is "to attend to one particular stone until you can find it" | It is a shaman shrine where young tauren drink the Earth Sapta, which must be taken in a holy place and nowhere else, binding the shaman's spirit to its element |
| Duskwood | The zone "was called Grand Hamlet's county" | Grand Hamlet is the old name of Darkshire, the town, which the same entry says two paragraphs later. No source gives the zone that name |

**Kodo Rock is the one to learn from.** The entry had the shape of the truth and
none of the content. A shaman shrine where you drink a brew that binds your
spirit to the earth is in the 1.12 quest text, in the shaman's own words, and
what we had printed instead was an invented parable about finding a rock. The
same goes for Tho'grun, who is a mercenary who took the money and kept the key,
and for Purgation Isle, where the real thing on the island is better than the
Scarlet Crusade we put there. Checking an entry against its article catches the
wrong fact. It does not prompt anyone to ask whether a right-sounding sentence
came from anywhere, and these seven did not.

**Four that looked wrong and were not.** Doomhammer really was run down by a
charging knight's lance while Thrall's diversion covered the retreat, which is
*Lord of the Clans* and in scope. The Scarlet Monastery really was a seminary for
paladins in training, Stromgarde's especially, which two 1.12 quests give. All
four Badlands ogre camps are real AreaTable rows, Wurg included, so Camp Wurg is
not another Sludgewerks. Dandred's Fold really is Aliden Perenolde's manor on the
shores of Lordamere Lake with Elysa and the pendant, which the 1.12 quest chain
spells out.

**A flaw in this run's own ranking, worth fixing before run 5.** The scan scores
the existence of a `Foo (Classic)` article at 3, and it counts a redirect as an
article. `Scarlet Monastery (Classic)` is a redirect to `Scarlet Monastery`, so
that entry was scored as though it had a separate Classic article and its fetched
"article" was the one-line redirect. Any run recomputing the ranking should
resolve redirects before scoring, and should re-fetch the real title when the
content starts with `#REDIRECT`.

**The gate took nine rows.** Boss Tho'grun, Camp Boff, Earth Sapta, Fizzle
Brassbolts, Hillsbrad Foothills, Kormok, Orgrim, Pozzik and Sign of the Earth,
each with its 1.12 evidence. The filing script now asserts that none of the nine
is already present, because last run an add-if-absent script silently dropped a
row whose term existed and the build still passed. All nine were genuinely new.
The ledger is 1,643 rows. No check was added and no row changed verdict, so
nothing needed breaking deliberately. Gates: the validator passes on all nine
configs, `check-gaps.py` passes, and RHYTHM on the two touched data files is
unchanged at 11/8.

**Entries covered so far (100).**
Alterac Mountains, Andorhal, Angerfang Encampment, Apocryphan's Rest, Arathi
Highlands, Ashenvale, Auberdine, Azshara, Badlands, Bashal'Aran, Beggar's
Haunt, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Brambleblade Ravine,
Bramblescar, Burning Steppes, Camp E'thok, Camp Taurajo, Camp Wurg, Cathedral
Square, Chillwind Camp, Dalson's Tears, Dandred's Fold, Darkshire, Darkshore,
Darnassus, Deadwind Pass, Deadwood Village, Desolace, Dun Garok, Dun Modr,
Durotar, Duskwood, Dustwallow Marsh, Eastern Plaguelands, Echo Ridge Mine,
Elwynn Forest, Feathermoon Stronghold, Felwood, Feralas, Forest Song,
Frostmane Hold, Gallows' End Tavern, Grim Batol, Haldarr Encampment, Hall of
Legends, Hammerfall, Hearthglen, Hillsbrad Foothills, Iris Lake, Jerod's
Landing, Jintha'Alor, Kodo Rock, Loch Modan, Lordamere Internment Camp,
Mardenholde Keep, Menethil Harbor, Mirage Raceway, Moonbrook, Mulgore,
Nesingwary's Expedition, Purgation Isle, Pyrewood Village, Raptor Grounds,
Raven Hill, Redridge Mountains, Refuge Pointe, Ruins of Andorhal, Sandsorrow
Watch, Scarlet Monastery, Shadowfang Keep, Shadra'Alor, Shok'Thokar, Silithus,
Silverpine Forest, Southshore, Stonetalon Peak, Stonewrought Dam,
Stranglethorn Vale, Talrendis Point, Tanaris, Tarren Mill, Teldrassil,
Theramore Isle, Thousand Needles, Tirisfal Glades, Tyr's Hand, Un'Goro Crater,
Uther's Tomb, Valley of Honor, Valley of Wisdom, Valormok, Wavestrider Beach,
Western Plaguelands, Westfall, Wetlands, Windshear Crag, Winterspring, Yojamba
Isle.

Still open, fixed in an earlier run but never reviewed as entries of their own:
Sardor Isle, Tower of Althalaxx, Emberstrife's Den.

Next: P4, the next 25 by the same ranking, with redirects resolved first.

### 2026-11-13, P4, run 5 of about 34

Fixed the ranking first, as run 4 asked. It was worse than run 4 thought, and it
had been hiding 137 entries from every run so far. Then reviewed 25 entries and
found seven bad claims.

**The ranking bug, in full, because it cost four runs.** The scan passed
`redirects=0` to the wiki API meaning "do not follow redirects". A MediaWiki API
boolean is true whenever the parameter is **present**, whatever its value, so
that switched redirect following *on*. The API then returns the target page keyed
under the target's title, so looking the result up by the title we asked for
found nothing and the entry scored `-1 MISSING`. **137 of our 913 vanilla entry
names are redirects on the wiki**, so 137 entries sat at the bottom of the
ranking and could never be selected. Removing the parameter is what turns
following off, and then the API hands back the redirect page itself, which is the
only way to tell "has its own Classic article" from "redirects to the retail
one". The scan now omits the parameter and classifies by content:

| | before | after |
|---|---|---|
| entries scoring above zero | 511 | 589 |
| real `(Classic)` articles | 59 | 55 |
| `(Classic)` titles that are only redirects | counted as articles, +3 each | 4, scoring nothing |
| entry names that are redirects | 137, all scored MISSING | 137, scored on their target |

Eight of this run's 25 were entries the old ranking could not reach. Among them
were the Greymane Wall and the Harborage, which carried two of the seven errors.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Searing Gorge | Emperor Dagran Thaurissan summoned Ragnaros "to fight for him", and the blast sank his capital into the depths as Blackrock Depths | The thane Thaurissan did it by accident, reaching for power to save a kingdom he was losing, and it destroyed the capital rather than sinking it. Dagran is the emperor holding the seat inside the mountain now, and Moira is his wife, not the summoner's |
| Blackwater Cove | A pirate anchorage worked by the Blackwater Raiders | It is the inlet Booty Bay is built around and the far end of the Ratchet boat. The Blackwater Raiders are Baron Revilgaz's people and run the port, as our own Booty Bay entry says |
| The Greymane Wall | Genn Greymane withdrew Gilneas "rather than commit to the Second War" | Gilneas fought that war and left the Alliance after it, over taxes paying for the orc internment camps and Nethergarde Keep. The Silverpine Forest entry said the same thing and is fixed with it |
| The Harborage | Magtoor's Lost Ones "hold to the Holy Light" | Unsupported for this period. What keeps them from going feral is draenethyst, crystals sacred to them that the feral ones stole into the Fallow Sanctuary, and Magtoor says he has not the force to take them back |
| Southern Barrens | "The Bristleback have fought the tauren across this country" | The Bristleback are Mulgore's, at Brambleblade Ravine, as our own entry has said since run 4. The Kraul is Charlga Razorflank's, and the 1.12 text has the tauren driven off land they held holy |
| The Shimmering Flats | A bed "the Sundering drained", with a "low-grade argument" over digging rights | A dried lake bed with a wrecked ship in it as the evidence, no Sundering in any source. The dwarves held the Rustmaul Dig Site until a Horde party under Moktar Krin came at them, and then everyone was driven out by a silithid hive |
| The Talondeep Path | "A tunnel that nobody is watching", with nobody waiting | The tunnel is empty, but Mystral Lake at the Ashenvale end has come alive and its elementals attack anyone on the path. Traffic between the zones is at a standstill and Splintertree Post is sending people to deal with it |

**Three of the seven contradicted our own data,** which is becoming the most
reliable smell in this sweep: Blackwater Cove against Booty Bay, Southern Barrens
against Brambleblade Ravine, and Searing Gorge against the Burning Steppes fix
made last run. A pass that only looks for entries disagreeing with each other is
still worth a run of its own, and it would now have three more hits to its name.

**Five rows filed:** Blackwater Cove, Charlga Razorflank, Fallow Sanctuary,
Razorflank and Rustmaul Dig Site. Two terms the rewrites wanted are in no 1.12
source at all, `Gilnean` and a bare `Greymane`, so those sentences were reworded
instead of given rows. Note that an entry's own name is exempt only from being
read as the entry's title: Blackwater Cove's prose naming Blackwater Cove still
needed the row. The filing script asserts no term is already present, so a row
cannot be silently dropped the way `Ring of Valor` was in run 3. The ledger is
1,648 rows.

**One warning worth recording.** The rewrites pushed `, which` to 108 uses
against a budget of 12 per 10,000 words and the validator called it a tic. Four
of the new sentences were reworded to get back under. The prose budgets are doing
real work on this sweep's output, because a corrected sentence tends to want a
subordinate clause to carry the correction.

No check was added and no row changed verdict, so nothing needed breaking
deliberately. Gates: the validator passes on all nine configs, `check-gaps.py`
passes, and RHYTHM on the two touched data files is unchanged at 11/8.

**Entries covered so far (125).**
Alterac Mountains, Andorhal, Angerfang Encampment, Apocryphan's Rest, Arathi
Highlands, Ashenvale, Auberdine, Azshara, Badlands, Bashal'Aran, Beggar's
Haunt, Blackfathom Deeps, Blackwater Cove, Blackwing Lair, Blasted Lands,
Bloodvenom Post, Bolgan's Hole, Booty Bay, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Burning Steppes,
Caer Darrow, Camp E'thok, Camp Taurajo, Camp Wurg, Cathedral Square, Chillwind
Camp, Cleft of Shadow, Crown Guard Tower, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darnassus, Deadwind Pass, Deadwood Village, Desolace,
Dun Garok, Dun Modr, Durotar, Duskwood, Dustwallow Marsh, Eastern Plaguelands,
Echo Ridge Mine, Elwynn Forest, Feathermoon Stronghold, Felwood, Feralas,
Forest Song, Frostmane Hold, Gallows' End Tavern, Grim Batol, Haldarr
Encampment, Hall of Legends, Hammerfall, Hearthglen, Hillsbrad Foothills, Iris
Lake, Jerod's Landing, Jintha'Alor, Kodo Rock, Loch Modan, Lordamere
Internment Camp, Mardenholde Keep, Menethil Harbor, Mirage Raceway, Moonbrook,
Mulgore, Nesingwary's Expedition, Purgation Isle, Pyrewood Village, Raptor
Grounds, Raven Hill, Redridge Mountains, Refuge Pointe, Ruins of Andorhal,
Sandsorrow Watch, Scarlet Monastery, Searing Gorge, Shadowfang Keep,
Shadra'Alor, Shok'Thokar, Silithus, Silverpine Forest, Southern Barrens,
Southshore, Stonetalon Mountains, Stonetalon Peak, Stonewrought Dam,
Stranglethorn Vale, Sun Rock Retreat, Swamp of Sorrows, Talrendis Point,
Tanaris, Tarren Mill, Teldrassil, The Forgotten Pools, The Greymane Wall, The
Harborage, The Park, The Shimmering Flats, The Talondeep Path, The Weathered
Nook, Theramore Isle, Thousand Needles, Tiragarde Keep, Tirisfal Glades, Tyr's
Hand, Un'Goro Crater, Uther's Tomb, Valley of Fangs, Valley of Honor, Valley
of Wisdom, Valormok, Wavestrider Beach, Western Plaguelands, Westfall,
Wetlands, Windshear Crag, Winterspring, Yojamba Isle, Zul'Gurub.

Still open, fixed in an earlier run but never reviewed as entries of their own:
Sardor Isle, Tower of Althalaxx, Emberstrife's Den, Silverpine Forest.

**Correction, same day, from Martin.** The Mor'Ladim fix above said he "lies at
Forlorn Rowe", which replaced one wrong claim with another. He is a roaming elite
and there is a quest to put him down, both of which the 1.12 text is explicit
about: "Mor'Ladim wanders throughout Duskwood, following a strange and meandering
path through the cemetery", he is "attacking Watchmen on patrol and killing
people", "some of our strongest Watchers have been lost to Mor'Ladim", and the
objective reads "Kill Mor'Ladim, then return his skull to Commander Althea
Ebonlocke". Forlorn Rowe is where the Watch *buried* him, "out past the house on
the hill", not where he is. The entry now says he walks the circuit and that the
grave is empty.

The lesson is narrower than it looks. It came from reading the wiki infobox's
`location` field as a statement about where a creature stands, when for a roamer
it names a spawn area or, here, a grave. Plain words in the 1.12 quest text had
the answer, and that text was read for the backstory only. When an entry is about
a creature rather than a place, read what the game says the creature *does*, not
just who it was. One row filed for it, `Watchmen`, which is in the 1.12 line
quoted above.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-13, P4, run 6 of about 33

Reviewed 25 entries. Seven named the wrong occupant, the wrong wildlife or the
wrong place. This was the run where the entries were not vague, they were
specific and specifically wrong, which is easier to catch and worse to ship.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Hiri'watha | Vilebranch ground, with a paragraph on the Vilebranch holding Jintha'Alor and its outlying sites | Witherbark. The 1.12 quest naming it says "hunt Witherbark trolls... one of their smaller villages, Hiri'watha or Zun'watha". The Vilebranch are the other forest trolls, in the south |
| Ruins of Mathystra | Furbolg-held, "complicated by the fact that furbolgs used to be friends" | The Stormscale naga hold it. Highborne relics are scattered through it and ghost sabers are on the site. No furbolgs |
| Isle of Dread | Gorillas and great cats, "the mainland jungle" sort | Chimaera. The chimaerok of this island are the whole point of it, and their meat is the best food on the market |
| High Rise | The residential and trade mesa: dwellings, traders, craftspeople | That is the lower and middle rise. The High Rise is the top of the central mesa, and the 1.12 text is plain: Cairne Bloodhoof "dwells atop the highest mesa in Thunder Bluff", and a tauren finishing the Rites is sent up to him |
| Shadowsong Shrine | Highborne-era work "in Azshara's interior", unremarkable | A ruin-covered hill in **western** Azshara, haunted by Highborne Apparitions and Highborne Lichlings that range over the ground around it, in those words, from the 1.12 quest for the place |
| Northwatch Hold | "A Kul Tiras and Stormwind position" | Theramore and Kul Tiras. Stormwind is not in it, and the entry's own next sentence is about Theramore |
| Raven Hill Cemetery | Mor'Ladim "was a father looking for his daughter before he died and has not entirely stopped" | Morgan Ladimore went to fight in Lordaeron, came home to a wasted county and no family to find, went mad, killed innocents, and took his own life when he understood. The body was raised afterwards, and it walks: see the correction below |

**A phantom entry that turned out not to be one.** `High Rise` is absent from
the 1.12 game text and absent from the Classic Era AreaTable, where Thunder
Bluff has only Elder Rise, Spirit Rise, Hunter Rise and the Pools of Vision. That
is the Sludgewerks signature, and it is also the signature P1 warned about: city
districts such as the Mage Quarter are real and have no AreaTable row either. The
wiki settles it. The capitalised "High Rise" is sourced to a 2010 novel, but the
lower-case "high rise" is sourced to the Bluffwatchers' own direction text, which
is in-game and in period. The place is real, the name is usable, and only the
content was wrong. Worth remembering before deleting a city district on AreaTable
evidence alone.

**The extractor quirk from run 3 bit a real edit, exactly as predicted.** Taking
the word "traders" out of the High Rise prose made the build fail on a different
entry: `The Drunken Dwarf uses "Traders"`. The rule that discards a word
capitalised only at the start of a sentence asks whether that word is ever seen
lower-cased *anywhere in the corpus*, and High Rise held the corpus's only
lower-case "traders". Remove it and a sentence-initial "Traders" elsewhere stops
looking ordinary. Run 3 wrote this down as a confusing failure waiting to happen;
here it is. It was filed as a row rather than worked around, because "Traders" is
the plural of a 1.12 name.

**Two that looked wrong and were not.** Magistrate Burnside really does lead
Hillsbrad town, and the 1.12 Horde quest against him names the town council, the
Hillsbrad Proclamation and the town registry, so there is more there for a later
pass. Bayne really is a Tirisfal darkhound; whether he was at Stillwater Pond
before patch 4.0.6 moved him to Calston Estate could not be settled with the
tables to hand, so that claim was left alone rather than guessed at either way.

**Ten rows filed:** Forlorn Rowe, Highborne Apparitions, Highborne Lichlings,
Jarod Shadowsong, Morgan Ladimore, Shadowsong, Shadowsong Shrine, Stormscale,
Traders and Zun'watha. Maiev is in no 1.12 source at all, so she came out of the
Shadowsong sentence rather than being filed; Jarod is in the creature table and
stayed. A bare `Rites` was reworded away. `, which` went over its rate budget
again and two more sentences were reworded to get under, which is now a reliable
side effect of correcting prose. The ledger is 1,658 rows.

No check was added and no row changed verdict, so nothing needed breaking
deliberately. Gates: the validator passes on all nine configs, `check-gaps.py`
passes, and RHYTHM on the four touched data files is unchanged at 0/11/8/2.

**Entries covered so far (150).**
Alterac Mountains, Andorhal, Angerfang Encampment, Apocryphan's Rest, Arathi
Highlands, Ashenvale, Auberdine, Azshara, Badlands, Bashal'Aran, Beggar's
Haunt, Blackfathom Deeps, Blackwater Cove, Blackwing Lair, Blasted Lands,
Bloodvenom Post, Bolgan's Hole, Booty Bay, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Burning Steppes,
Caer Darrow, Camp E'thok, Camp Taurajo, Camp Wurg, Cathedral Square, Chillwind
Camp, Cleft of Shadow, Crown Guard Tower, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darnassus, Deadwind Pass, Deadwood Village, Desolace,
Dreadmaul Hold, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustwallow Marsh, Eastern Plaguelands, Echo Ridge Mine, Elwynn
Forest, Emerald Sanctuary, Feathermoon Stronghold, Felwood, Feralas, Forest
Song, Fray Island, Freewind Post, Frostmane Hold, Gadgetzan, Gallows' End
Tavern, Grim Batol, Haldarr Encampment, Hall of Legends, Hammerfall,
Hearthglen, High Rise, Hillsbrad, Hillsbrad Foothills, Hiri'watha, Iris Lake,
Isle of Dread, Jerod's Landing, Jintha'Alor, Kodo Rock, Land's End Beach,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Mardenholde Keep,
Menethil Harbor, Mirage Raceway, Molten Core, Moonbrook, Mulgore, Nesingwary's
Expedition, Northwatch Hold, Onyxia's Lair, Purgation Isle, Pyrewood Village,
Raptor Grounds, Raven Hill, Raven Hill Cemetery, Rebel Camp, Redridge
Mountains, Refuge Pointe, Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of
Andorhal, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Scarlet
Monastery, Searing Gorge, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor,
Shok'Thokar, Silithus, Silverpine Forest, Sorrowmurk, Southern Barrens,
Southshore, Stillwater Pond, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stranglethorn Vale, Sun Rock Retreat, Swamp of Sorrows,
Talrendis Point, Tanaris, Tarren Mill, Teldrassil, The Forgotten Pools, The
Greymane Wall, The Harborage, The Park, The Shimmering Flats, The Talondeep
Path, The Weathered Nook, Theramore Isle, Thousand Needles, Tiragarde Keep,
Tirisfal Glades, Tyr's Hand, Un'Goro Crater, Uther's Tomb, Valley of Fangs,
Valley of Honor, Valley of Wisdom, Valormok, Wavestrider Beach, Western
Plaguelands, Westfall, Wetlands, Windshear Crag, Winterspring, Yojamba Isle,
Zul'Gurub.

Still open, fixed in an earlier run but never reviewed as entries of their own:
Sardor Isle, Tower of Althalaxx, Emberstrife's Den, Silverpine Forest.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-13, P4, run 7 of about 32

Reviewed 25 entries. Six carried a bad claim and a seventh finding is a mistake
this sweep made itself in run 5. Ten of the 25 were "The X" entries that the
ranking could not reach before run 5 fixed it, and three of the six errors were
in those ten.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Weazel's Crater | "Two rival goblin outfits race here", on a bed "drained when the Sundering tore this part of Kalimdor apart" | Both of these were corrected elsewhere in runs 4 and 5 and left standing here: it is a goblin against a gnome, Pozzik against Fizzle Brassbolts, and the Flats are a dried lake bed with a wrecked ship as the evidence |
| The Decrepit Ferry | Nothing left that floats, nobody running a service, Fenris Keep "worgen-held" | The boat is there and it is loaded: "heaped within this boat is a pile of wrapped corpses", with the dock on Fenris Isle visible across the lake. The Scourge hold the shore and the Rot Hide are in it. No worgen |
| Addle's Stead | A burned farm "in the eastern woods", "a nest of things that used to be farmhands" | South-western Duskwood, south of Raven Hill and west of the Vul'Gol Ogre Mound. What walks there are Forlorn Spirits, taken for Defias dead, and Defias agents were seen gathering at the farm |
| Temple of Arkkoran | A temple "dedicated to a sea creature the naga revere" | A temple of Elune the night elves no longer hold, with the sea giant Arkkoroc on the top level and murlocs and makrura guarding the way up. No naga in it |
| The Rustmaul Dig Site | Moktar Krin's party "killed every one of them", then the silithid drove the raiders off | Both sides were driven off when the digging opened the nest. This also contradicted our own Shimmering Flats entry, written in run 5, which says everybody left |
| The Hinterlands | "Their neighbours are the Vilebranch forest trolls" | The Vilebranch hold the east and south, and the Witherbark keep villages of their own, as our own Hiri'watha entry has said since run 6 |

**A correction to run 5, found by run 7.** Run 5 took the Bristleback out of the
Southern Barrens entry and said in the log that "the Bristleback are Mulgore's, at
Brambleblade Ravine". They are also the Barrens': Agama'gor, off the road west of
Camp Taurajo, is a large Bristleback settlement, and the Blood Shards their mobs
drop are what Mangletooth trades for. The original sentence was defensible and the
stated reason for deleting it was wrong. The Bristleback are back in the entry.

What went wrong is worth having in writing, because it is the same shape as the
Mor'Ladim error Martin caught: a correct new fact was used to justify a deletion
it did not actually license. Finding that the Bristleback are in Mulgore does not
establish that they are *only* in Mulgore. Before deleting a claim, check whether
the evidence contradicts it or merely fails to mention it. Absence of a tribe from
one quest chain is not absence from a zone.

**The extractor quirk, now in both directions.** Run 6 recorded that removing a
lower-cased word can make the build fail naming a different entry. This run hit
the inverse: adding "Vul'Gol Ogre Mound" put a capitalised "Ogre" mid-sentence
into the corpus for the first time, which stopped a sentence-initial "Ogre" in The
Maul and in Brackenwall Village from being discarded as an ordinary word, and both
failed. Either direction of change to how a word appears anywhere can move the
verdict on a term in an unrelated entry. Filed `Ogre` rather than worked around.

**Two that looked wrong and were not.** Warden Thelwater really is inside the
Stockade, not posted at the door, so "the warden is still inside" stands. The
Sludgewerks really is gone from `Data/` and correctly filed out-of-era; the
`The Sludg...` that turned up in a rhythm trace is The Sludge Fen, a real Barrens
area.

**Four rows filed:** Arkkoroc, Forlorn Spirits, Ogre and Vul'Gol Ogre Mound.
`Shattered Strand` is in neither the 1.12 text nor the AreaTable, so it came out
of the prose rather than being filed on wiki evidence alone. The ledger is 1,663
rows. `, which` hit its budget again and one sentence was reworded. RHYTHM on
`Data/Kalimdor.lua` rose from 8 to 9 and was brought back to 8: the run crossed
entry boundaries, because the linter reads the whole Lua block as prose, and the
sentence that completed it was a run 6 rewrite of Northwatch Hold.

No check was added and no row changed verdict, so nothing needed breaking
deliberately. Gates: the validator passes on all nine configs, `check-gaps.py`
passes, and RHYTHM on the three touched data files is unchanged at 11/8/2.

**Entries covered so far (175).**
Addle's Stead, Aerie Peak, Agama'gor, Alterac Mountains, Andorhal, Angerfang
Encampment, Apocryphan's Rest, Arathi Highlands, Ashenvale, Auberdine,
Azshara, Badlands, Bashal'Aran, Beggar's Haunt, Blackfathom Deeps, Blackwater
Cove, Blackwing Lair, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Booty
Bay, Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brill, Burning Steppes, Caer Darrow, Camp E'thok, Camp Taurajo, Camp
Wurg, Cathedral Square, Chillwind Camp, Cleft of Shadow, Crown Guard Tower,
Dalson's Tears, Dandred's Fold, Darkshire, Darkshore, Darnassus, Deadwind
Pass, Deadwood Village, Desolace, Dreadmaul Hold, Dun Garok, Dun Modr, Dun
Morogh, Durnholde Keep, Durotar, Duskwood, Dustwallow Marsh, Eastern
Plaguelands, Echo Ridge Mine, Elwynn Forest, Emerald Sanctuary, Feathermoon
Stronghold, Felwood, Feralas, Forest Song, Fray Island, Freewind Post,
Frostmane Hold, Gadgetzan, Gallows' End Tavern, Grim Batol, Haldarr
Encampment, Hall of Legends, Hammerfall, Hearthglen, High Rise, Hillsbrad,
Hillsbrad Foothills, Hiri'watha, Iris Lake, Isle of Dread, Jerod's Landing,
Jintha'Alor, Kodo Rock, Land's End Beach, Light's Hope Chapel, Loch Modan,
Lordamere Internment Camp, Mardenholde Keep, Menethil Harbor, Mirage Raceway,
Molten Core, Moonbrook, Mulgore, Nesingwary's Expedition, Northwatch Hold,
Onyxia's Lair, Purgation Isle, Pyrewood Village, Raptor Grounds, Raven Hill,
Raven Hill Cemetery, Rebel Camp, Redridge Mountains, Refuge Pointe,
Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Mathystra,
Rut'theran Village, Sandsorrow Watch, Scarlet Monastery, Searing Gorge,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shok'Thokar, Silithus,
Silverpine Forest, Sorrowmurk, Southern Barrens, Southshore, Stillwater Pond,
Stonetalon Mountains, Stonetalon Peak, Stonewrought Dam, Stormwind City,
Stormwind Keep, Stranglethorn Vale, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talrendis Point, Tanaris, Tarren Mill, Teldrassil, Temple of
Arkkoran, Thalanaar, The Bulwark, The Charred Vale, The Deadmines, The
Decrepit Ferry, The Drag, The Farstrider Lodge, The Forgotten Pools, The
Greymane Wall, The Harborage, The Hinterlands, The Park, The Rustmaul Dig
Site, The Shimmering Flats, The Stockade, The Tainted Scar, The Talondeep
Path, The Weathered Nook, Theramore Isle, Thousand Needles, Tiragarde Keep,
Tirisfal Glades, Tyr's Hand, Uldum, Un'Goro Crater, Uther's Tomb, Valley of
Fangs, Valley of Honor, Valley of Spirits, Valley of Strength, Valley of
Wisdom, Valley of the Watchers, Valormok, Wavestrider Beach, Weazel's Crater,
Western Plaguelands, Westfall, Wetlands, Whitereach Post, Windbreak Canyon,
Windshear Crag, Winterspring, Yojamba Isle, Zul'Gurub.

Still open, fixed in an earlier run but never reviewed as entries of their own:
Sardor Isle, Tower of Althalaxx, Emberstrife's Den, Silverpine Forest, Agama'gor.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-13, P4, run 8 of about 31

Reviewed 25 entries. Six carried a bad claim. Two of the six were our own entries
disagreeing with each other, which is now the fourth run in a row where that was
the most productive thing to look for.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Camp Boff | "Three ogre camps sit across the Badlands: Boff, Kosh and Cagg" | Four. Wurg is the fourth, as the AreaTable has it and as our own Camp Wurg entry has said since run 4. Boff is also the one the Dustbelcher mercenary band travels through, which is why Kargath sends people there |
| Brill Town Hall | "One of only two town halls the Forsaken are known to operate anywhere. The other is the Defiler's Den" | The Defiler's Den is in Arathi Basin. It is a battleground location named for the Horde side there, not a Forsaken town hall |
| Field of Giants | Bones, and "the usual explanation involves the age before the Sundering" | No source offers that explanation. What is on the field now is silithid, with mounds and eggs, and the Horde at the Crossroads is studying them because they "seem to have intelligence to them, more so than any normal animal" |
| Blackthorn Ridge | Quilboar ground with the tribe unnamed | Razormane, a short way north of Razorfen Kraul, and the orc shaman Brine is camped on the ridge above a notably clean pool. She is the only thing there that is not quilboar |
| Hetaera's Clutch | Hydras that are "the children of Hetaera", and "nobody has studied the building" | Hetaera herself roams it, three-headed. Lord Arkkoroc at the Temple of Arkkoran calls her a false god claiming to rule the oceans and wants all three heads brought to him |
| Gates of Ahn'Qiraj | Fandral "shattered it rather than take it" | Anachronos put the scepter in his hands. He took it and then broke it, which is a different thing from refusing it |

**Hetaera's Clutch is the useful one.** The Temple of Arkkoran was corrected in run
7 to put the sea giant Arkkoroc at the top of it. Arkkoroc's own 1.12 quest text
is what names Hetaera, calls her a false god and sends people to the clutch, so
the two entries are a pair and neither of them knew it. Where a fix names a
character, the other places that character talks about are worth a look in the
same run.

**The extractor quirk, fourth instance, and the first I caused with a single
word.** Writing "he took it and then broke it in his rage" put a lower-case "rage"
into the corpus for the first time, which made a sentence-initial "Rage Scar Hold"
elsewhere lose its first word and fail as "Scar Hold". The sentence was reworded
rather than filing a junk row. Four instances now, in both directions, from adding
or removing a single ordinary word. It is not a bug in the ledger and it does not
let anything through; it just reports the wrong entry, so read the failing term
rather than the entry name when a failure makes no sense.

**Two that looked wrong and were not.** The Deeprun Tram really is partly
underwater, so "a flooded cavern with glass walls" in one entry and "under the
sea" in another are both defensible. All the places in this tranche resolved to
real AreaTable rows in the zones our entries put them in, Hetaera's Clutch in
Azshara included, which was the one that looked most like a Blackfathom Deeps room.

**Two rows filed:** Brine and Lord Arkkoroc. The ledger is 1,665 rows. No check was
added and no row changed verdict, so nothing needed breaking deliberately. Gates:
the validator passes on all nine configs, `check-gaps.py` passes, and RHYTHM on the
three touched data files is unchanged at 11/8/2.

**Entries covered so far (200).**
Addle's Stead, Aerie Peak, Agama'gor, Alterac Mountains, Ambermill, Andorhal,
Angerfang Encampment, Apocryphan's Rest, Arathi Highlands, Ashenvale,
Auberdine, Azshara, Badlands, Ban'Thallow Barrow Den, Bashal'Aran, Beggar's
Haunt, Beren's Peril, Blackfathom Deeps, Blackthorn Ridge, Blackwater Cove,
Blackwing Lair, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Booty Bay,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall Village,
Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Boff, Camp E'thok,
Camp Taurajo, Camp Wurg, Cathedral Square, Chillwind Camp, Cleft of Shadow,
Coldridge Valley, Crown Guard Tower, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadwind Pass, Deadwood
Village, Deeprun Tram, Desolace, Dire Maul, Draco'dar, Dragonmaw Gates,
Dreadmaul Hold, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustwallow Marsh, Dwarven District, Eastern Plaguelands, Echo Ridge
Mine, Elwynn Forest, Emerald Sanctuary, Feathermoon Stronghold, Felwood,
Feralas, Field of Giants, Flame Crest, Forest Song, Fray Island, Freewind
Post, Frostmane Hold, Frostwhisper Gorge, Gadgetzan, Gallows' End Tavern,
Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gol'Bolar Quarry, Gold
Coast Quarry, Grim Batol, Grommash Hold, Haldarr Encampment, Hall of Legends,
Hammerfall, Hearthglen, Hetaera's Clutch, High Rise, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Iris Lake, Isle of Dread, Itharius's
Cave, Jerod's Landing, Jintha'Alor, Kodo Rock, Land's End Beach, Light's Hope
Chapel, Loch Modan, Lordamere Internment Camp, Mardenholde Keep, Menethil
Harbor, Mirage Raceway, Molten Core, Moonbrook, Mulgore, Nesingwary's
Expedition, Northwatch Hold, Onyxia's Lair, Purgation Isle, Pyrewood Village,
Raptor Grounds, Raven Hill, Raven Hill Cemetery, Rebel Camp, Redridge
Mountains, Refuge Pointe, Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of
Andorhal, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Scarlet
Monastery, Searing Gorge, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor,
Shok'Thokar, Silithus, Silverpine Forest, Sorrowmurk, Southern Barrens,
Southshore, Stillwater Pond, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stormwind City, Stormwind Keep, Stranglethorn Vale, Sun Rock
Retreat, Swamp of Sorrows, Tahonda Ruins, Talrendis Point, Tanaris, Tarren
Mill, Teldrassil, Temple of Arkkoran, Thalanaar, The Bulwark, The Charred
Vale, The Deadmines, The Decrepit Ferry, The Drag, The Farstrider Lodge, The
Forgotten Pools, The Greymane Wall, The Harborage, The Hinterlands, The Park,
The Rustmaul Dig Site, The Shimmering Flats, The Stockade, The Tainted Scar,
The Talondeep Path, The Weathered Nook, Theramore Isle, Thousand Needles,
Tiragarde Keep, Tirisfal Glades, Tyr's Hand, Uldum, Un'Goro Crater, Uther's
Tomb, Valley of Fangs, Valley of Honor, Valley of Spirits, Valley of Strength,
Valley of Wisdom, Valley of the Watchers, Valormok, Wavestrider Beach,
Weazel's Crater, Western Plaguelands, Westfall, Wetlands, Whitereach Post,
Windbreak Canyon, Windshear Crag, Winterspring, Yojamba Isle, Zul'Gurub.

Still open, rewritten in an earlier run but never reviewed as entries of their
own: Sardor Isle, Tower of Althalaxx, Emberstrife's Den.

This line has been wrong twice and both corrections are worth keeping. It once
listed The Maul, Brackenwall Village, Rage Scar Hold and The Drunken Dwarf: their
prose was never touched, they only came up because the extractor quirk made them
fail the build, and filing a ledger row is not a rewrite. It also went on listing
Silverpine Forest and Agama'gor after they had been reviewed in the ordinary way,
in runs 2 and 8. Check this list against the covered list before trusting it.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-14, P4, run 9 of about 30

The scratchpad had been cleared, so the oracles were rebuilt from scratch first.
That turned out to be worth doing for its own sake: the ranking recomputed to
exactly run 5's numbers, 589 scoring above zero, 55 real `(Classic)` articles, 4
`(Classic)` redirects, 137 entry names that are redirects and 14 missing. The
formula written into this log reproduces faithfully.

This run's 25 were the three entries rewritten in earlier runs but never reviewed
in their own right, plus 22 by ranking. Sardor Isle, the Tower of Althalaxx and
Emberstrife's Den all held up on review, which is the answer to whether a rewrite
made in passing needs a second look: these three did not.

**The creature helper exists now, and it works.** After the Mor'Ladim error the
log said to check what the game says a creature *does*. `tools/..` is the wrong
place for it, so it lives in the scratchpad as `creature.py`: give it names and it
reports level, rank and MovementType from `creature_template`, and whether quest
text names it. On the case that caused the error:

    Mor'Ladim   id=522  level=35-35  rank=ELITE  movement=RANDOM (roams freely)
                named in quest text: yes

One lookup. Two things learned building it. The corpus has mysqldump's backslash
escapes stripped so that names with apostrophes grep correctly, which also makes
it unparseable as SQL, because a row reads `'Mor'Ladim'`; column lookups therefore
have to read `db.sql`, which is still escaped. And `mkcorpus.py` now keeps the
`CREATE TABLE` statements, without which `rank` is just the 34th number in a row
of 87.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Northridge Lumber Camp | Overrun by the Scourge, "the loggers still working" | The Scarlet Crusade **runs** the mill and their timber comes from it. Both the Alliance and the Horde send people to wreck it, and the method is termites |
| Quel'Danil Lodge | "Relations have soured badly", the lodge left "isolated and hostile to visitors" | It is the Hinterlands high elves' centre of communication, and its ambassadors are working to build relationships with other races, trading what they know about the Witherbark. Hostile to arrivals, yes; idle and sulking, no |
| Scholomance | Kel'Thuzad "acquired the estate by promising them immortality and then murdering them for it" | The promise is right and the order is not. The Barovs believed him and **handed the keep over**, and the cultists killed them afterwards. Caer Darrow said he acquired it by murdering them, wrong in its own way, and is fixed with it |
| Kolkar Crag | "A centaur camp in northern Durotar, raiding down from the Barrens" | A craggy gorge in **southern** Durotar. The Barrens is below it, not above |
| Kargath | Kargath Bladefist "was held in a gladiator pit and severed his own hand to escape" | The arena story is Warlords-era, the Gorian Empire's pits at Highmaul. What stands is that he cut off his own hand, put a blade in its place, and gave both his name and his clan's |
| Maraudon | "Theradras kept his remains" | The 1.12 quest text says the centaur killed Zaetar and "now hold Zaetar's remains". Theradras is in the caverns, and she is an elemental force of earth "related to the Old Gods" |
| Scalebeard's Cave | Scalebeard "prefers to be out hunting in the Great Sea" | Nothing says that. He is a rare, stationary, non-aggressive turtle who is simply not there most of the time, which is a spawn timer and not a hunting trip |

**Scalebeard is the clearest case of the helper earning its place.** The entry
explained a rare spawn with a story about where the turtle goes. Three fields
settle it: rare, stationary, not named in any quest text. There is nothing to
explain, and the entry now says so instead of inventing a reason.

**Two that looked wrong and were not.** Misty Reed Post attributes to Tok'Kar the
hope that the picket might "one day get a burrow, or at least a tower". That is
his line, word for word, from the gossip on `Lack of Surplus`, and the quest turns
in to him. Old Town's SI:7 is in the 1.12 text 28 times.

**A bookkeeping correction, twice over.** The "still open, rewritten but never
reviewed" list in this log was wrong in both directions. It listed The Maul,
Brackenwall Village, Rage Scar Hold and The Drunken Dwarf, whose prose was never
touched: they only came up because the extractor quirk made them fail the build,
and filing a ledger row is not a rewrite. It also kept listing Silverpine Forest
and Agama'gor after they had been reviewed in the ordinary way, in runs 2 and 8.
Check that list against the covered list before trusting it. With this run the
list is empty.

No rows were filed, no check was added and no row changed verdict, so nothing
needed breaking deliberately. The ledger is 1,665 rows. Gates: the validator
passes on all nine configs, `check-gaps.py` passes, and RHYTHM on the four touched
data files is unchanged at 1/11/8/2.

**Entries covered so far (225).**
Addle's Stead, Aerie Peak, Agama'gor, Alterac Mountains, Ambermill, Andorhal,
Angerfang Encampment, Apocryphan's Rest, Arathi Highlands, Ashenvale,
Auberdine, Azshara, Badlands, Ban'Thallow Barrow Den, Bashal'Aran, Beggar's
Haunt, Beren's Peril, Blackfathom Deeps, Blackthorn Ridge, Blackwater Cove,
Blackwing Lair, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Booty Bay,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall Village,
Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Boff, Camp E'thok,
Camp Taurajo, Camp Wurg, Cathedral Square, Chillwind Camp, Cleft of Shadow,
Coldridge Valley, Crown Guard Tower, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadwind Pass, Deadwood
Village, Deeprun Tram, Desolace, Dire Maul, Draco'dar, Dragonmaw Gates,
Dreadmaul Hold, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustwallow Marsh, Dwarven District, Eastern Plaguelands, Echo Ridge
Mine, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Feathermoon
Stronghold, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song, Fray
Island, Freewind Post, Frostmane Hold, Frostwhisper Gorge, Gadgetzan, Gallows'
End Tavern, Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gol'Bolar
Quarry, Gold Coast Quarry, Grim Batol, Grommash Hold, Haldarr Encampment, Hall
of Legends, Hammerfall, Hearthglen, Hetaera's Clutch, High Rise, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Iris Lake, Isle of Dread,
Itharius's Cave, Jerod's Landing, Jintha'Alor, Kargath, Kharanos, Kodo Rock,
Kolkar Crag, Kolkar Village, Lakeshire, Land's End Beach, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Magram Village,
Malden's Orchard, Maraudon, Mardenholde Keep, Menethil Harbor, Mirage Flats,
Mirage Raceway, Misty Reed Post, Misty Valley, Molten Core, Moonbrook,
Mulgore, Nesingwary's Expedition, Nighthaven, North Tide's Hollow, Northridge
Lumber Camp, Northshire Vineyards, Northwatch Hold, Old Town, Onyxia's Lair,
Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Raptor Grounds, Raven
Hill, Raven Hill Cemetery, Ravenholdt Manor, Rebel Camp, Redridge Mountains,
Refuge Pointe, Render's Valley, Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of
Andorhal, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Sardor
Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing Gorge,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shok'Thokar, Silithus,
Silverpine Forest, Sorrowmurk, Southern Barrens, Southshore, Stillwater Pond,
Stonetalon Mountains, Stonetalon Peak, Stonewrought Dam, Stormwind City,
Stormwind Keep, Stranglethorn Vale, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talrendis Point, Tanaris, Tarren Mill, Teldrassil, Temple of
Arkkoran, Thalanaar, The Bulwark, The Charred Vale, The Deadmines, The
Decrepit Ferry, The Drag, The Farstrider Lodge, The Forgotten Pools, The
Greymane Wall, The Harborage, The Hinterlands, The Park, The Rustmaul Dig
Site, The Shimmering Flats, The Stockade, The Tainted Scar, The Talondeep
Path, The Weathered Nook, Theramore Isle, Thousand Needles, Tiragarde Keep,
Tirisfal Glades, Tower of Althalaxx, Tyr's Hand, Uldum, Un'Goro Crater,
Uther's Tomb, Valley of Fangs, Valley of Honor, Valley of Spirits, Valley of
Strength, Valley of Wisdom, Valley of the Watchers, Valormok, Wavestrider
Beach, Weazel's Crater, Western Plaguelands, Westfall, Wetlands, Whitereach
Post, Windbreak Canyon, Windshear Crag, Winterspring, Yojamba Isle, Zul'Gurub.

Nothing is open from an earlier run.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-14, P4, run 10 of about 29

Reviewed 25 entries. One had to be deleted, four more carried a bad claim, and
two of those four were this sweep's own corrections not carried across.

**An entry deleted: Whisperwind Grove.** Its only patch template is 4.0.3a, it is
absent from the Classic Era AreaTable, and it is absent from the 1.12 game text.
Felwood's groves in this period are Emerald Sanctuary, Talonbranch Glade,
Jadefire Glen and Morlos'Aran; Whisperwind Grove is the Emerald Circle's
Cataclysm capital and the Circle's bases in our period are Emerald Sanctuary and
Wildheart Point. This is the Sludgewerks case again, and the corpus is now 918
vanilla entries.

**Third live instance of the compositional-rule hole.** The ledger carried
`Whisperwind Grove` as **vanilla**, on "every part named in 1.12 sources", because
Whisperwind and Grove are each vanilla words. Ring of Valor and Dragon Soul were
the first two, in run 3. That rule has now let through a Wrath arena, a Cataclysm
artefact name and a whole Cataclysm town. The remaining rows resting on it still
deserve a pass of their own, and this is the third time that has been written
down.

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| The High Seat | "Three thrones and only one occupant", the chamber remembering three clans | Three thrones are the Council of Three Hammers, which exists because Magni is petrified in Cataclysm. Here Magni sits in his own throne room and rules alone |
| Anvilmar | "The hall the dwarves lived in before Ironforge" | The hall at the north end of Coldridge Valley is the first settlement a new dwarf reaches. Nothing identifies it as Modimus Anvilmar's seat, and the wiki marks even the naming as speculation. The Modimus history is in scope and stays; the identification does not |
| Valley of Spears | "Theradras keeps his remains in Maraudon to this day" | The centaur hold Zaetar's remains, which run 9 established from the 1.12 quest text and fixed in the Maraudon entry. This entry kept the old version |
| Isle of Dread | The chimaerok "have the place to themselves" | Written by run 6, and wrong. Shalzaru's Lair is cut into the island's northern end and the Hatecrest naga are in it, which our own Shalzaru's Lair entry says |

**Two of the four were ours, and that is the pattern now.** Run 7 found run 5's
Bristleback error, run 9 found run 6's Isle of Dread error only indirectly, and
this run found both the Maraudon fix and the Isle of Dread fix had not been
carried across to the entries that repeat them. A correction is not finished when
the entry it was found in is fixed. Grep the other entries for the claim before
closing it out, because the sweep keeps catching itself.

**Broken deliberately, two ways.** A re-verdicted row is not done until the gate
fails on the term, so `Whisperwind Grove is north of here.` and
`The grove at whisperwind grove is north of here.` were both injected into a
Felwood entry. Each failed naming the patch and the evidence, the second
exercising the `ci` column. Reverted.

**Two that looked wrong and were not.** Thalassian Base Camp is careful where the
article is not: the article calls its elves blood elves, which is a 2.0.1
reclassification, and our entry says Thalassian out of Quel'Thalas. Stonewrought
Pass really does run from Dustfire Valley to the Valley of Kings, and Franclorn
Forgewright, a Dark Iron, really did design both it and the Stonewrought Dam.

**One row filed and one re-verdicted:** `Shalzaru's Lair` as an AreaTable row, and
`Whisperwind Grove` from vanilla to out-of-era. The ledger is 1,666 rows. Gates:
the validator passes on all nine configs, `check-gaps.py` passes with the entry
deleted, and RHYTHM on the four touched data files is unchanged at 0/11/8/2.

**Entries covered so far (250).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Alterac Mountains,
Alterac Valley, Ambermill, Andorhal, Angerfang Encampment, Anvilmar,
Apocryphan's Rest, Arathi Highlands, Ashenvale, Auberdine, Azshara, Badlands,
Ban'Thallow Barrow Den, Bashal'Aran, Beggar's Haunt, Beren's Peril,
Blackfathom Deeps, Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blasted
Lands, Bloodvenom Post, Bolgan's Hole, Booty Bay, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town Hall,
Burning Steppes, Caer Darrow, Camp Boff, Camp E'thok, Camp Taurajo, Camp Wurg,
Cathedral Square, Chillwind Camp, Cleft of Shadow, Coldridge Valley, Crown
Guard Tower, Dalson's Tears, Dandred's Fold, Darkshire, Darkshore, Darkwhisper
Gorge, Darnassus, Deadwind Pass, Deadwood Village, Deeprun Tram, Desolace,
Dire Maul, Draco'dar, Dragonmaw Gates, Dreadmaul Hold, Dun Garok, Dun Modr,
Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustwallow Marsh, Dwarven
District, Eastern Plaguelands, Echo Ridge Mine, Elwynn Forest, Emberstrife's
Den, Emerald Sanctuary, Feathermoon Stronghold, Felwood, Feralas, Field of
Giants, Flame Crest, Forest Song, Fray Island, Freewind Post, Frostmane Hold,
Frostwhisper Gorge, Gadgetzan, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gol'Bolar Quarry, Gold Coast Quarry, Grim Batol,
Grommash Hold, Haldarr Encampment, Hall of Legends, Hammerfall, Hearthglen,
Hetaera's Clutch, High Rise, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills,
Hiri'watha, Iris Lake, Isle of Dread, Itharius's Cave, Jerod's Landing,
Jintha'Alor, Kargath, Kharanos, Kodo Rock, Kolkar Crag, Kolkar Village,
Lakeshire, Land's End Beach, Lethlor Ravine, Light's Hope Chapel, Loch Modan,
Lordamere Internment Camp, Magram Village, Malden's Orchard, Maraudon,
Mardenholde Keep, Menethil Harbor, Mirage Flats, Mirage Raceway, Misty Reed
Post, Misty Valley, Molten Core, Moonbrook, Mulgore, Nesingwary's Expedition,
Nighthaven, North Tide's Hollow, Northridge Lumber Camp, Northshire Vineyards,
Northwatch Hold, Old Town, Onyxia's Lair, Purgation Isle, Pyrewood Village,
Quel'Danil Lodge, Raptor Grounds, Raven Hill, Raven Hill Cemetery, Ravenholdt
Manor, Rebel Camp, Redridge Mountains, Refuge Pointe, Render's Valley,
Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Mathystra,
Rut'theran Village, Sandsorrow Watch, Sardor Isle, Scalebeard's Cave, Scarlet
Monastery, Scholomance, Searing Gorge, Seradane, Shadowfang Keep, Shadowsong
Shrine, Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine
Forest, Sishir Canyon, Sorrowmurk, South Gate Outpost, Southern Barrens,
Southern Gold Road, Southshore, Splintertree Post, Stillwater Pond, Stonard,
Stonetalon Mountains, Stonetalon Peak, Stonewrought Dam, Stonewrought Pass,
Stormwind City, Stormwind Keep, Stranglethorn Vale, Sun Rock Retreat, Swamp of
Sorrows, Tahonda Ruins, Talrendis Point, Tanaris, Tarren Mill, Teldrassil,
Temple of Arkkoran, Thalanaar, Thalassian Base Camp, Thandol Span, The
Bulwark, The Charred Vale, The Dead Field, The Deadmines, The Decrepit Ferry,
The Drag, The Farstrider Lodge, The Forgotten Coast, The Forgotten Pools, The
Greymane Wall, The Harborage, The High Seat, The Hinterlands, The Park, The
Rustmaul Dig Site, The Screeching Canyon, The Shimmering Flats, The Stockade,
The Tainted Scar, The Talon Den, The Talondeep Path, The Weathered Nook,
Theramore Isle, Thondroril River, Thousand Needles, Tiragarde Keep, Tirisfal
Glades, Tower of Althalaxx, Trade District, Tyr's Hand, Uldum, Un'Goro Crater,
Uther's Tomb, Valley of Fangs, Valley of Honor, Valley of Spears, Valley of
Spirits, Valley of Strength, Valley of Trials, Valley of Wisdom, Valley of the
Watchers, Valormok, Warrior's Terrace, Wavestrider Beach, Weazel's Crater,
Western Plaguelands, Westfall, Wetlands, Whisperwind Grove, Whitereach Post,
Windbreak Canyon, Windshear Crag, Winterfall Village, Winterspring, Yojamba
Isle, Zul'Gurub.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-15, P4, run 11 of about 29

Reviewed 25 entries and found far more than any earlier run: fifteen carried a
bad claim and six more carried an unsupported one. The 25 were the top of the
recomputed ranking, which is zones and landmarks with strong later-era markers,
and three of them turned out to be entries whose whole subject was wrong.

**Three entries described the wrong thing entirely.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| The Dry Hills | "Gnoll country", a gnoll population working the western roads | Witchwing harpy ground. Darsok Swiftdagger sends players against Witchwing harpies, roguefeathers and slayers there, and Serena Bloodfeather leads them. No gnoll tribe is attested anywhere in the Barrens |
| Forlorn Ridge | A ridge of ruins in the south, picked over by satyrs | The mountain that dominates western Azshara. Not a ruin, not a satyr camp: Azshara's satyrs are at the Haldarr and Legash encampments and its ruins are on the coast |
| Solliden Farmstead | "What is walking the fields now got up without its mind" | The farmers are alive. Tirisfal Farmer, Tirisfal Farmhand and Farmer Solliden are all Humanoid on faction 67 in `creature_template`, one of the few places in Tirisfal where the native farmers survived the plague, and the Forsaken send recruits to steal their pumpkins |

**Twelve more with a claim that a vanilla source contradicts.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Valley of Heroes | Statues of the Second War's commanders, Lothar's "the centrepiece" | Five statues, and the 1.12 `gameobject_template` names every one: Kurdran Wildhammer, General Turalyon, Ranger Captain Alleria Windrunner, Danath Trollbane and Archmage Khadgar of the Kirin Tor. The Alliance Expedition's leaders, not the Second War's, and there is no Lothar among them. Alleria was missing from our list and Lothar was in it |
| Ragefire Chasm | The Burning Blade cult | A different cult: the Searing Blade, "a sect of the Shadow Council hidden in caverns below Orgrimmar", plus the Ragefire troggs. The Burning Blade is Durotar's, and quest 5761 names both in one sentence to distinguish them |
| Blackrock Spire | Rend holds the lower halls, Nefarian the upper, "whatever passes between them is their own business" | Thrall: "Rend dares make such grand claims because of the protection he is afforded by the black flight." Rend's own letter calls Nefarian "the master". The lower city is Wyrmthalak's, "taskmaster of the lesser city", and Rend is one of the dragon's generals in the spire above it |
| Faldir's Cove | Wrecks and treasure that "attracted the attention of pirates working this coast" | A Blackwater Raiders expedition out of Booty Bay after sunken elven treasure. Two of its three ships went onto the reef, the Daggerspine naga killed the survivors in the water, and the rest are stranded ashore with the naga massing. No pirates. Our own Drowned Reef entry already named both wrecks |
| Echo Isles | Zalazane "enslaving the minds of any troll who goes back" | The other direction: "From there he sends his trolls to the mainland, to hex our people and drag more of them under his sway." The claim that nobody in Sen'jin will discuss it is contradicted by the village's own quest text, which discusses little else |
| Felpaw Village | "The Felpaw tribe is in the same state as the Deadwood" | There is no Felpaw tribe. The village is the Deadwood's, under Chieftain Bloodmaw; Felpaw is what the local wolves, scavengers and ravagers are called, and they are Beasts. Nor do the Timbermaw regard the Deadwood as lost rather than enemy: they want them driven back and pay in recognition for their headdress feathers |
| Sorrow Hill | A mass burial ground, and Uther's tomb's proximity "a bitter joke the land is playing" | Andorhal's cemetery, named before the plague, with crypts and plain plots. The tomb was deliberately raised on the crown of the hill by the last of the townsfolk, so the proximity is the point rather than an accident, and High Priest Thel'danis guards it. In 1.12 the hill is the Scourge's first line on Andorhal's one unfortified road |
| The Jansen Stead | Golems "animated by something", blamed on "experimental Stormwind engineering abandoned in place" | Harvest Golem, Harvest Watcher and Harvest Reaper are all Mechanical in `creature_template`. The farmers were driven off by thieves, not simply gone, and the explanations on offer are goblin manufacture or the Defias having them built to clear Westfall out |
| Northfold Manor | A noble estate, "belonged to one of Stromgarde's noble families" | A farm on the northwestern edge of the Highlands, Stromgarde's before the Syndicate took it. The vanilla fact the entry missed is the demonic summoning traced to it, and the bloodstone amulet found on the ground |
| Terror Wing Path | A pass "on the approach to the mountain" | A valley at the eastern end of the Burning Steppes, the far end of the zone from Blackrock Mountain. Whelps and drakes, and Volchan roaming it on `MovementType` 1 |
| Eastvale Logging Camp | "The occasional orc scouting party out of the Redridge Mountains" | Wolves and bears. No orc appears anywhere near Elwynn in the 1.12 text, and the camp's trouble is delivery deadlines |
| Naxxramas | Floating there "unassailable" | The Argent Dawn attunes raiders into it, which is the opposite of unassailable, and the wings are the spider, plague, construct and military quarters with the frostwyrm lair above them. Our line counted the frostwyrm lair as one of the four and left the spider wing out |

**Six unsupported claims deleted rather than reworded.** Northshire Valley had
the Church choosing the valley for its steep sides and "good water" and teaching
there "for three generations"; the sourceable facts are the walled southern pass,
the river out to Crystal Lake and Marshal McBride's garrison. Temple of the Moon
had Elune's nature "genuinely unclear even to her own priesthood" and the Sisters
as "the oldest institution the night elves have". Razorfen Kraul had quilboar
cultivating the thorns, which grew where Agamaggan's blood fell, and a scale "no
other warren matches", when the Downs is the quilboar capital; Charlga Razorflank
ruling the Kraul was missing. Razorfen Downs had "the oldest of their sites".
Stratholme had the Scarlet rank and file "told very little by their own command",
and gave the city as the Silver Hand's seat when the sourced fact is that the
order was founded there. Ruins of Lordaeron had "nobody is spared the walk past
it" about a throne room that is not on the way in.

**Four cleared.** Orgrimmar holds up in full, including Doomhammer dying in the
Arathi Highlands, which is right: he fell at the internment camp that is now
Hammerfall. Ratchet, The Writhing Haunt and The Mage Quarter are all clean, and
Kel'Thuzad being expelled from Dalaran, which three entries assert, is sourced to
Antonidas stripping his rank and exiling him.

**The gameobject table is an oracle this sweep had not used.** The Valley of
Heroes finding came from `gameobject_template`, where the five statues carry the
names and titles the game gives them. Any entry about a monument, a sign, a grave
or a plaque can be settled the same way, and several in the corpus are.

**Fourteen rows filed, two already present.** The add-if-absent assertion caught
`Alleria Windrunner` and `Bloodfeather`, both already `vanilla`, which is the
check the log asks for working as intended. The ledger is 1,680 rows.

**Broken deliberately, twice.** Removing the `Searing Blade` row failed the build
naming Ragefire Chasm, and removing `Witchwing` failed it naming The Dry Hills,
each with the expected message. Restored and the file verified identical.

**The rate budget and the rhythm linter both bit.** The `, which` rate went to
12.2 per 10k against a budget of 12, and three new clauses were reworded rather
than the budget raised. The RHYTHM count on `Data/Kalimdor.lua` rose from 8 to 9,
and the new one was real: the Razorfen Downs rewrite had put three sentences in a
row opening "The ". Reworded, and the count is back to 8. Both of these are worth
expecting after any run that rewrites this many entries.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and
RHYTHM on the five touched data files is unchanged at 0/1/11/8/2.

**Entries covered so far (275).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Alterac Mountains,
Alterac Valley, Ambermill, Andorhal, Angerfang Encampment, Anvilmar,
Apocryphan's Rest, Arathi Highlands, Ashenvale, Auberdine, Azshara,
Badlands, Ban'Thallow Barrow Den, Bashal'Aran, Beggar's Haunt, Beren's
Peril, Blackfathom Deeps, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Booty
Bay, Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Boff,
Camp E'thok, Camp Taurajo, Camp Wurg, Cathedral Square, Chillwind Camp,
Cleft of Shadow, Coldridge Valley, Crown Guard Tower, Dalson's Tears,
Dandred's Fold, Darkshire, Darkshore, Darkwhisper Gorge, Darnassus,
Deadwind Pass, Deadwood Village, Deeprun Tram, Desolace, Dire Maul,
Draco'dar, Dragonmaw Gates, Dreadmaul Hold, Dun Garok, Dun Modr, Dun
Morogh, Durnholde Keep, Durotar, Duskwood, Dustwallow Marsh, Dwarven
District, Eastern Plaguelands, Eastvale Logging Camp, Echo Isles, Echo
Ridge Mine, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Faldir's
Cove, Feathermoon Stronghold, Felpaw Village, Felwood, Feralas, Field of
Giants, Flame Crest, Forest Song, Forlorn Ridge, Fray Island, Freewind
Post, Frostmane Hold, Frostwhisper Gorge, Gadgetzan, Gallows' End Tavern,
Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gol'Bolar Quarry, Gold
Coast Quarry, Grim Batol, Grommash Hold, Haldarr Encampment, Hall of
Legends, Hammerfall, Hearthglen, Hetaera's Clutch, High Rise, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Iris Lake, Isle of
Dread, Itharius's Cave, Jerod's Landing, Jintha'Alor, Kargath, Kharanos,
Kodo Rock, Kolkar Crag, Kolkar Village, Lakeshire, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment Camp,
Magram Village, Malden's Orchard, Maraudon, Mardenholde Keep, Menethil
Harbor, Mirage Flats, Mirage Raceway, Misty Reed Post, Misty Valley, Molten
Core, Moonbrook, Mulgore, Naxxramas, Nesingwary's Expedition, Nighthaven,
North Tide's Hollow, Northfold Manor, Northridge Lumber Camp, Northshire
Valley, Northshire Vineyards, Northwatch Hold, Old Town, Onyxia's Lair,
Orgrimmar, Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Ragefire
Chasm, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery, Ravenholdt
Manor, Razorfen Downs, Razorfen Kraul, Rebel Camp, Redridge Mountains,
Refuge Pointe, Render's Valley, Roguefeather Den, Ruins of Ahn'Qiraj, Ruins
of Andorhal, Ruins of Lordaeron, Ruins of Mathystra, Rut'theran Village,
Sandsorrow Watch, Sardor Isle, Scalebeard's Cave, Scarlet Monastery,
Scholomance, Searing Gorge, Seradane, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Sishir Canyon, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate
Outpost, Southern Barrens, Southern Gold Road, Southshore, Splintertree
Post, Stillwater Pond, Stonard, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Sun Rock Retreat, Swamp of Sorrows, Tahonda
Ruins, Talrendis Point, Tanaris, Tarren Mill, Teldrassil, Temple of
Arkkoran, Temple of the Moon, Terror Wing Path, Thalanaar, Thalassian Base
Camp, Thandol Span, The Bulwark, The Charred Vale, The Dead Field, The
Deadmines, The Decrepit Ferry, The Drag, The Dry Hills, The Farstrider
Lodge, The Forgotten Coast, The Forgotten Pools, The Greymane Wall, The
Harborage, The High Seat, The Hinterlands, The Jansen Stead, The Mage
Quarter, The Park, The Rustmaul Dig Site, The Screeching Canyon, The
Shimmering Flats, The Stockade, The Tainted Scar, The Talon Den, The
Talondeep Path, The Weathered Nook, The Writhing Haunt, Theramore Isle,
Thondroril River, Thousand Needles, Tiragarde Keep, Tirisfal Glades, Tower
of Althalaxx, Trade District, Tyr's Hand, Uldum, Un'Goro Crater, Uther's
Tomb, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of the Watchers, Valley of
Trials, Valley of Wisdom, Valormok, Warrior's Terrace, Wavestrider Beach,
Weazel's Crater, Western Plaguelands, Westfall, Wetlands, Whisperwind
Grove, Whitereach Post, Windbreak Canyon, Windshear Crag, Winterfall
Village, Winterspring, Yojamba Isle, Zul'Gurub.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-15, P4, run 12 of about 29

Reviewed 25 entries and corrected 21 of them. The score-4 band was exhausted by
run 11, so this run is the top of the score-3 band, taken alphabetically as the
formula's tie-break gives it. Three entries described the wrong occupants, one
described a road that does not exist, and one put a creature on a mountain it is
not on.

**A new way to answer "what is actually there", and it did most of the work.**
Until now a place's inhabitants were read off the wiki and spot-checked against
`creature_template`. The spawn tables answer it directly: `creature` and
`gameobject` carry map, x, y and z for every spawn in the game, so anchoring on a
named creature or a quest object and listing everything within a radius gives the
1.12 population of a place, with levels and quest objects included. It lives in
the scratchpad as `nearby.py`. On Alther's Mill, anchored on Lucius's Lockbox:

    6x Chatter  lvl 23    5x Greater Tarantula  lvl 19-20    3x Dire Condor  lvl 18-19
    objects: Practice Lockbox x5, Lucius's Lockbox, Battered Chest

That is the entry rewritten in one call, and it is also the end of the gnolls the
entry had taken the mill. Use it before writing anything about who holds a place.
**The z column matters too**, which is how the East Pillar error below was caught.

**Three entries had the wrong occupants.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Azurelode Mine | A silver mine "worked now by the Syndicate" with forced labour | An Alliance mine, worked and guarded: Foreman Bonds, 22 Hillsbrad Miners and 4 foremen on the spawn list, silver and tin veins. Quest 539 has the Forsaken reading it out of the stolen Hillsbrad town registry as "a prime source of iron ore for the Alliance armories" and sending a player to kill the foreman and his miners. No Syndicate anywhere near it |
| Dreadmaul Rock | "The Dreadmaul ogres hold this rock and work alongside the Blackrock orcs" | The Firegut clan holds it, with Gorgon'och and Hahk'Zor on it. The Dreadmaul are the Blasted Lands clan, as our own Dreadmaul Hold entry says, and the Blackrock alliance is a Cataclysm development. The Firegut "keep no allies except other ogres" |
| Alther's Mill | "Until the Redridge gnolls took it. It has not been retaken" | An abandoned mill with spiders and dire condors in it. The gnolls are in the Redridge Canyons, where our own entry for those puts them. What the mill is actually for in 1.12 is Alliance rogues, who crack a lockbox here for their certificate of thievery |

**Two entries sent the reader to the wrong place.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Dustfire Valley | "The route between the Searing Gorge and the Badlands", with travellers passing through | It runs north out of the Gorge to the gates of Stonewrought Pass and Loch Modan, and in this period those gates are locked and need a key, so it is a dead end. Our own Stonewrought Pass entry says both halves of that, which makes this the fourth finding that came from two of our entries disagreeing |
| Janeiro's Point | A point on Stranglethorn's eastern shore north of Grom'gol | A small island in the water just outside Booty Bay with the giant goblin statue on it. The sea giant Mok'rash is the only thing spawned there |

**The East Pillar, which is what the z column is for.** The entry had a pond at
the summit "with a giant makura in it called Diamond Head", and Gregan Brewspewer
up there watching it. In 1.12 Diamond Head sits at x -4748, y 2898, **z -39.7**,
underwater off the Feralas coast among the Coast Crawl makrura, about 1,300 yards
from the colossals; Gregan is at z 62.8, on the ground. The only thing on the
summit is Kalin Windflight at z 245.9, who sells the Colossal Parachute, and the
way up is Marli Wishrunner's teleport from the foot of the western colossal: "Do
consider how you will get down, though. This is a one way trip only." The wiki's
account is the retail one; the creature was moved later. A place's altitude is
checkable and nobody had checked it.

**Six more claims a vanilla source contradicts.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Furlbrow's Pumpkin Farm | "One of the last Westfall farms still being worked, by a couple too stubborn to leave" | The Furlbrows fled. They are camped on the road by the Jansen Stead and Farmer Furlbrow left his pocket watch in the farmhouse wardrobe. The fields hold Defias smugglers, harvest watchers and a Foe Reaper 4000 |
| Bay of Storms | "Naga ground", and "what comes ashore in this bay is her court" | The stretch of the Great Sea off Azshara's eastern coast, holding Scalebeard's Cave, Hetaera's Clutch and the Temple of Arkkoran. Hydras, a sea giant, murlocs and a very old turtle, as our own three entries for those places say. Contradicting ourselves again |
| Grove of the Ancients | A night elf strongpoint where "the Ancients there are both garrison and advisors" | One Ancient. Onu, an Ancient of Lore, sits in a ruined temple with two merchants and a sleeping druid, and quest 948 names him and the grove exactly. The grove of ancient protectors is Cataclysm |
| Chill Breeze Valley | A wolf-hunting ground north of the main road | Western Dun Morogh between Gnomeregan and Kharanos. Crag boars and wendigos, with Old Icebeard in a cave at the end holding Tundra MacGrann's stolen meat locker, which he cannot break open |
| Helm's Bed Lake | Dwarves fishing through the ice, interrupted by the Frostmane | A hole is kept open in the ice for fresh water. The trouble around the lake is Rockjaw troggs and a Dark Iron camp in a building to the south, with the body of the dwarf who went to look at it still lying there. No Frostmane |
| Ironstone Camp | A camp "worked by people who do not advertise what for" | Moktar Krin's Horde war party, sent against the Explorers' League at the Rustmaul dig and now fighting the silithid the digging let out. Our own Rustmaul Dig Site and Shimmering Flats entries both tell this story |

**Blackrock Mountain carried run 11's error.** It said Nefarian "plays the others
against each other" and that "none of these parties are allies", and that both
factions treat the mountain as somebody else's problem. Run 11 established from
Thrall's own words that the Dark Horde holds the Spire under the black flight's
protection, so the Dark Irons are fighting the dragon's orcs rather than a third
party; and Thrall sends champions after Rend while the Horde's warlord at Kargath
keeps a standing list of names in the lower spire. **This is the sixth time a
correction had to be carried across to a second entry.** Grep for the claim, not
just the entry.

**Five more trims.** Eastwall Tower invented sightlines and Scourge columns; in
1.12 both factions have an emissary at Light's Hope Chapel handing out orders to
seize and rebuild all four towers, and the capture banners are in the object
table. Gelkis Village put the clan's hills "near Maraudon" and had them thinking
themselves senior; Maraudon is Maraudine ground and the Gelkis ravine is in the
south-west. Camp Mojache put the Grimtotem at the Twin Colossals, 1,800 yards from
where the Feralas Grimtotem actually spawn, west of the camp. Gunstan's Post had
"a handful of dwarves and a dig"; Gunstan is alone with a campfire and a readable
book. Ironforge had Uldaman causing the Explorers' League, and the vanilla game
manual has it the other way round: Magni turned dwarven industry to archaeology
and helped create the League, and Uldaman came out of that.

**Bolgan's Hole, from an earlier run, said "Desolace's eastern rise".** Khan Shaka
spawns in the south-west. Fixed with the Gelkis entry rather than left for a later
run to find.

**Four cleared.** Cenarion Enclave is right that Fandral Staghelm leads the druids
from there in Malfurion's absence, and quest 933 confirms both the Circle of
Ancients and that Staghelm took over because Shan'do Stormrage never returned.
Dolanaar holds up, and quest 459 is the source for the furbolgs having been
peaceful neighbours before the Gnarlpine. Arathi Basin and Ethel Rethor are clean.

**Twenty-seven rows filed, one of them a `fragment`.** The ledger is 1,707 rows.
Two things worth knowing about why so many were needed. First, the
sentence-initial rule means a name that has only ever opened a sentence is invisible
to the gate, so moving `Khan Shaka` into the middle of a sentence made it a new
term. Second, **removing the only lower-cased "excavations" in the corpus made
`Excavations` a proper noun and failed the build naming the Dun Morogh entry**,
which is the corpus-global trap the log has warned about, seen live for the first
time. It is filed as a `fragment`.

**Broken deliberately, three ways.** Removing `Firegut` failed the build naming
Dreadmaul Rock, removing `Onu` failed it naming the Grove of the Ancients, and
removing `Excavations` failed it naming Dun Morogh, each with the expected message.
Restored, and the file verified identical.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and RHYTHM
on the four touched data files is 0/10/8/2 against 0/11/8/2 at the previous commit.
The `, which` rate went over again and five clauses were reworded back under.

**Entries covered so far (300).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Alterac Mountains,
Alterac Valley, Alther's Mill, Ambermill, Andorhal, Angerfang Encampment,
Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ashenvale,
Auberdine, Azshara, Azurelode Mine, Badlands, Ban'Thallow Barrow Den,
Bashal'Aran, Bay of Storms, Beggar's Haunt, Beren's Peril, Blackfathom
Deeps, Blackrock Mountain, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blasted Lands, Bloodvenom Post, Bolgan's Hole, Booty
Bay, Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Boff,
Camp E'thok, Camp Mojache, Camp Taurajo, Camp Wurg, Cathedral Square,
Cenarion Enclave, Chill Breeze Valley, Chillwind Camp, Cleft of Shadow,
Coldridge Valley, Crown Guard Tower, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadwind Pass, Deadwood
Village, Deeprun Tram, Desolace, Dire Maul, Dolanaar, Draco'dar, Dragonmaw
Gates, Dreadmaul Hold, Dreadmaul Rock, Dun Garok, Dun Modr, Dun Morogh,
Durnholde Keep, Durotar, Duskwood, Dustfire Valley, Dustwallow Marsh,
Dwarven District, East Pillar, Eastern Plaguelands, Eastvale Logging Camp,
Eastwall Tower, Echo Isles, Echo Ridge Mine, Elwynn Forest, Emberstrife's
Den, Emerald Sanctuary, Ethel Rethor, Faldir's Cove, Feathermoon
Stronghold, Felpaw Village, Felwood, Feralas, Field of Giants, Flame Crest,
Forest Song, Forlorn Ridge, Fray Island, Freewind Post, Frostmane Hold,
Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gallows' End
Tavern, Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gelkis
Village, Gol'Bolar Quarry, Gold Coast Quarry, Grim Batol, Grimtotem Post,
Grommash Hold, Grove of the Ancients, Gunstan's Post, Haldarr Encampment,
Hall of Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch,
High Rise, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha,
Iris Lake, Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave,
Jademir Lake, Janeiro's Point, Jangolode Mine, Jerod's Landing,
Jintha'Alor, Kargath, Kharanos, Kodo Rock, Kolkar Crag, Kolkar Village,
Lakeshire, Land's End Beach, Lethlor Ravine, Light's Hope Chapel, Loch
Modan, Lordamere Internment Camp, Magram Village, Malden's Orchard,
Maraudon, Mardenholde Keep, Menethil Harbor, Mirage Flats, Mirage Raceway,
Misty Reed Post, Misty Valley, Molten Core, Moonbrook, Mulgore, Naxxramas,
Nesingwary's Expedition, Nighthaven, North Tide's Hollow, Northfold Manor,
Northridge Lumber Camp, Northshire Valley, Northshire Vineyards, Northwatch
Hold, Old Town, Onyxia's Lair, Orgrimmar, Purgation Isle, Pyrewood Village,
Quel'Danil Lodge, Ragefire Chasm, Raptor Grounds, Ratchet, Raven Hill,
Raven Hill Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul,
Rebel Camp, Redridge Mountains, Refuge Pointe, Render's Valley,
Roguefeather Den, Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of
Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Sardor
Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing Gorge,
Seradane, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shok'Thokar, Silithus, Silverpine Forest, Sishir Canyon, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, Southern Barrens,
Southern Gold Road, Southshore, Splintertree Post, Stillwater Pond,
Stonard, Stonetalon Mountains, Stonetalon Peak, Stonewrought Dam,
Stonewrought Pass, Stormwind City, Stormwind Keep, Stranglethorn Vale,
Stratholme, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talrendis
Point, Tanaris, Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of the
Moon, Terror Wing Path, Thalanaar, Thalassian Base Camp, Thandol Span, The
Bulwark, The Charred Vale, The Dead Field, The Deadmines, The Decrepit
Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The Forgotten Coast,
The Forgotten Pools, The Greymane Wall, The Harborage, The High Seat, The
Hinterlands, The Jansen Stead, The Mage Quarter, The Park, The Rustmaul Dig
Site, The Screeching Canyon, The Shimmering Flats, The Stockade, The
Tainted Scar, The Talon Den, The Talondeep Path, The Weathered Nook, The
Writhing Haunt, Theramore Isle, Thondroril River, Thousand Needles,
Tiragarde Keep, Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's
Hand, Uldum, Un'Goro Crater, Uther's Tomb, Valley of Fangs, Valley of
Heroes, Valley of Honor, Valley of Spears, Valley of Spirits, Valley of
Strength, Valley of the Watchers, Valley of Trials, Valley of Wisdom,
Valormok, Warrior's Terrace, Wavestrider Beach, Weazel's Crater, Western
Plaguelands, Westfall, Wetlands, Whisperwind Grove, Whitereach Post,
Windbreak Canyon, Windshear Crag, Winterfall Village, Winterspring, Yojamba
Isle, Zul'Gurub.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-16, P4, run 13 of about 28

Reviewed 25 entries and corrected 22 of them. These were the score-3 band
continuing alphabetically from `Lake Falathim`, and the rate stayed where runs 11
and 12 put it. Four entries had the wrong occupants, two were in the wrong part
of their zone, and one was describing a place that is not what it says it is.

**`game_tele` is the lookup this sweep has been missing.** The dump carries a
table of 269 named world locations with coordinates, used by the server's own
teleport command. It covers only the large places, and it confirmed Marshal's
Refuge, Morgan's Vigil, Sentinel Hill and Talonbranch Glade to the yard against
anchors found independently, so the anchor method is sound. For the smaller
places the better trick turned out to be **objects named after the place**:
signposts. The sign reading "Maestra's Post" is at (3231, 233) and settled
that entry, and signposts also fixed Talonbranch Glade and Sentinel Hill.

**Four entries had the wrong occupants.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Lake Falathim | Ground "the Sentinels still hold without having to fight for it weekly" | Murloc water. Saltspittle puddlejumpers, oracles, warriors and muckdwellers are on the shore with the rare Mugglefin among them, and Teronis' Corpse is lying on the bank. No Sentinel is spawned anywhere near it |
| Pool of Tears | "The naga have taken an interest in the pool" | The green dragonflight. Quest 1448 is incredulous about it in so many words, "sunk beneath the Pool of Tears? And surrounded by the green dragonflight?", and the spawn list is scalebanes, wyrmkin and Somnus. No naga |
| Misty Pine Refuge | A seasonal hunting camp used by Ironforge's hunters | One house with a fire, three chairs and Father Gavin of the Argent Dawn in it, and nothing else within 140 yards. The Argent Dawn presence here is vanilla, not a later addition: only the refugees around him are |
| Ruins of Constellas | A ruin the night elves have "written Felwood off" and abandoned | Jadefire satyr ground under Xavathras, with a corrupted moonwell in it that is bringing forth more satyrs. The Emerald Circle is fighting for the place and says the land was once theirs, which our own Talonbranch Glade and Emerald Sanctuary entries already implied |

**Two were in the wrong part of the zone, one of them badly.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Maestra's Post | "A Sentinel camp on the southern border, watching the Barrens road", the night elves' position nearest the Mor'shan Rampart | The opposite corner of Ashenvale. The post is at (3185, 189), by the Darkshore border at the top of the forest, and the nearest Warsong spawn to it is most of the zone away. It is not a Sentinel camp either: it holds three people, and the one who matters is Delgren the Purifier, working against the Dark Strand at the Tower of Althalaxx |
| Splithoof Crag | "One of the centaur clans' holdings in the canyon's western end" | The Galak clan's stronghold, against the northern wall east of Darkcloud Pinnacle. Quest 1197 says so and warns that "the Galak centaur have great numbers here", and Splithoof Hold inside it guards a relic from the time of the centaurs' creation, kept in a flame |

**Quel'Lithien Lodge had the elves' politics backwards.** The entry said the
survivors "have grown bitter and dangerous" and "blame the humans who failed to
hold the line". In 1.12 the lodge carries faction template 1576, which is faction
269, the Silvermoon Remnant, friendly to the Alliance and hostile to the Horde;
its two protectors are on Alliance Generic. The Horde is the side that comes for
them, on Nathanos Blightcaller's orders, to take the Quel'Thalas Registry and
"leave them suffering". Aurora Skycaller, outside the lodge near Northpass Tower,
grieves for the elves rather than blaming anybody: "the elves, as a race, have
been shattered". The wretched, hostile version of this lodge is Cataclysm.

**Six more claims a vanilla source contradicts.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Lake Mennar | "One of the quieter spots in Azshara", unvisited rather than dangerous | Ringed by the blue dragonflight: blue scalebanes, draconic mageweavers and magelords, all elite and all above anything else in the zone. The water itself is clear, and that is the only part the entry had right |
| Marshal's Refuge | "Run jointly by Explorers' League dwarves and gnomish technicians" | Williden Marshal's own words are "I lead a non-aligned expedition troupe". Not the League. The camp also has a hippogryph master and Gadgetzan bruisers keeping order, so it is less cut off than the entry made it |
| Mosshide Fen | Gnolls who "tax the road through it, which is to say by ambush", and who dig up the Explorers' League's sites | Rethiel the Greenwarden's complaint is ecological and he says they lived here peacefully for years: they have grown too numerous, they trample the fen and they cut too much wood for their fires. The Wetlands dig, Whelgar's, is troubled by raptors, not gnolls |
| Night Web's Hollow | A spider cave "used as a first test for new Forsaken" | A gold mine the Forsaken cannot work. Executor Arren wants the gold, has no manpower to spare, and reckons on months of killing spiders before anyone can go in with torches. The spiders are level 3 |
| Northpass Tower | Four towers "worth holding for the view", giving "advantage over the zone's roads" | Both factions' emissaries at Light's Hope Chapel want all four captured and held as outposts, and the banners at each tower are for that. Northpass is the northernmost, on the road out towards Quel'Thalas, and shrines to Lordaeron stand at its foot |
| Sentinel Hill | "The militia is farmers, labourers and a handful of veterans" | A formed body: Captain Danuvin, four protectors, a quartermaster and a scout under Stoutmantle, and a recruit joins as a pledge sworn to the militia and to the Light. The entry was right about Stormwind, and Stoutmantle's letter to Lakeshire's magistrate says it for him |

**Roland's Doom had three claims and two of them are not in the game.** The entry
said the Scythe of Elune "was found afterwards by a man named Jitters", and that
the finding brought "in time the Dark Riders" down on Duskwood. Jitters in 1.12
is the terrified man at Raven Hill in the Morbent Fel chain and has nothing to do
with the Scythe, and **there is no creature called a Dark Rider anywhere in the
1.12 table**. The entry also had Velinde using the Scythe "against the Scourge
and worse"; quest 1022 and 1037 put her work in Felwood, against demons. What is
sourced is that the Nightbane worgen hold the mine under Gutspill, and that the
Carevins say the worgen were first found there.

**Two more trims.** Remtravel's Excavation said his expedition "has fallen apart
around him"; there is no expedition, he is alone with cracked golems and a stone
behemoth walking the site. Ruins of Aboraz explained its drowned lower levels
with "the Sundering raised the sea over ground that had been dry", which nothing
supports, and said nothing about Zanzil the Outcast, who holds the ruins with
risen dead and keeps a Darkspear hostage there.

**Rethress Sanctum put the blue dragonkin "at the pinnacle".** Azshara has no
pinnacle: its 29 subzones include Lake Mennar, and that is where they are. Fixed
with the Lake Mennar entry, so the two now agree.

**Three cleared, and each gained a fact it was missing.** Menethil Keep's history
is right and Captain Stoutfist holds the keep for Ironforge with the Menethil
sentries under him. Skull Rock's account of the Burning Blade is right, and the
cave itself is where the cultists burn their own flesh with searing collars to
attune to demonic power, which is what first put the Horde on to them. Southfury
River is right about the Durotar border and also divides Ashenvale from Azshara,
with three bridges over it.

**Thirty-four rows filed, none already present.** The ledger is 1,741 rows. Five
of the 39 the gate first asked for were extractor artefacts and were reworded
away instead: sentence-initial `Bones` and `Gold`, `Befouled` likewise,
`Astranaar's Sentinels` from a possessive, and `Father Gavin of the Argent Dawn`,
joined across "of the". One term was dropped rather than filed: `Silvermoon` on
its own cannot be proven from 1.12, since no quest text mentions it and the city
arrives in a later expansion, so the prose now carries only `Silvermoon Remnant`,
which is a faction row in the 1.12 client. **Note for later runs: a title that
follows a name splits the term**, so Delgren the Purifier needed both `Delgren`
and `Purifier`, and Rethiel the Greenwarden both halves too.

**Broken deliberately, three ways.** Removing `Slitherblade` failed the build
naming Ranazjar Isle, removing `Somnus` failed it naming the Pool of Tears, and
removing `Greenwarden` failed it naming Mosshide Fen, each with the expected
message. Restored, and the file verified identical by checksum.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and
RHYTHM on the three touched data files is unchanged at 8/10/2. The `, and it is`
rate went to 4.2 per 10k against a budget of 4, a warning rather than an error,
and the three clauses that caused it were reworded back under.

**Entries covered so far (325).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Alterac Mountains,
Alterac Valley, Alther's Mill, Ambermill, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Ban'Thallow
Barrow Den, Bashal'Aran, Bay of Storms, Beggar's Haunt, Beren's Peril,
Blackfathom Deeps, Blackrock Mountain, Blackrock Spire, Blackthorn
Ridge, Blackwater Cove, Blackwing Lair, Blasted Lands, Bloodvenom Post,
Bolgan's Hole, Booty Bay, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brill, Brill Town Hall, Burning Steppes,
Caer Darrow, Camp Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp
Wurg, Cathedral Square, Cenarion Enclave, Chill Breeze Valley, Chillwind
Camp, Cleft of Shadow, Coldridge Valley, Crown Guard Tower, Dalson's
Tears, Dandred's Fold, Darkshire, Darkshore, Darkwhisper Gorge,
Darnassus, Deadwind Pass, Deadwood Village, Deeprun Tram, Desolace, Dire
Maul, Dolanaar, Draco'dar, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul
Rock, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustfire Valley, Dustwallow Marsh, Dwarven District, East
Pillar, Eastern Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo
Isles, Echo Ridge Mine, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Faldir's Cove, Feathermoon Stronghold, Felpaw
Village, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostmane Hold, Frostwhisper
Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gallows' End Tavern, Garren's
Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gelkis Village, Gol'Bolar
Quarry, Gold Coast Quarry, Grim Batol, Grimtotem Post, Grommash Hold,
Grove of the Ancients, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High
Rise, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Iris
Lake, Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jademir
Lake, Janeiro's Point, Jangolode Mine, Jerod's Landing, Jintha'Alor,
Kargath, Kharanos, Kodo Rock, Kolkar Crag, Kolkar Village, Lake
Falathim, Lake Mennar, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment
Camp, Maestra's Post, Magram Village, Malden's Orchard, Maraudon,
Mardenholde Keep, Marshal's Refuge, Menethil Harbor, Menethil Keep,
Mirage Flats, Mirage Raceway, Misty Pine Refuge, Misty Reed Post, Misty
Valley, Molten Core, Moonbrook, Morgan's Vigil, Mosshide Fen, Mulgore,
Naxxramas, Nesingwary's Expedition, Night Web's Hollow, Nighthaven,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Onyxia's Lair, Orgrimmar, Pool of Tears, Purgation Isle, Pyrewood
Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar
Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery,
Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Rebel Camp, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Constellas, Ruins of
Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing
Gorge, Sentinel Hill, Seradane, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Sishir Canyon, Skull Rock, Solliden Farmstead, Sorrow
Hill, Sorrowmurk, South Gate Outpost, Southern Barrens, Southern Gold
Road, Southfury River, Southshore, Splintertree Post, Splithoof Crag,
Stillwater Pond, Stonard, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris, Tarren Mill,
Teldrassil, Temple of Arkkoran, Temple of the Moon, Terror Wing Path,
Thalanaar, Thalassian Base Camp, Thandol Span, The Bulwark, The Charred
Vale, The Dead Field, The Deadmines, The Decrepit Ferry, The Drag, The
Dry Hills, The Farstrider Lodge, The Forgotten Coast, The Forgotten
Pools, The Greymane Wall, The Harborage, The High Seat, The Hinterlands,
The Jansen Stead, The Mage Quarter, The Park, The Rustmaul Dig Site, The
Screeching Canyon, The Shimmering Flats, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Weathered Nook, The Writhing
Haunt, Theramore Isle, Thondroril River, Thousand Needles, Tiragarde
Keep, Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's Hand,
Uldum, Un'Goro Crater, Uther's Tomb, Valley of Fangs, Valley of Heroes,
Valley of Honor, Valley of Spears, Valley of Spirits, Valley of
Strength, Valley of the Watchers, Valley of Trials, Valley of Wisdom,
Valormok, Warrior's Terrace, Wavestrider Beach, Weazel's Crater, Western
Plaguelands, Westfall, Wetlands, Whisperwind Grove, Whitereach Post,
Windbreak Canyon, Windshear Crag, Winterfall Village, Winterspring,
Yojamba Isle, Zul'Gurub.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-16, P4, run 14 of about 27

Reviewed 25 entries. One is deleted, seventeen are corrected and seven held up.
The 25 were the rest of the score-3 band from `Tanner Camp` to `Zul'Farrak`, and
they included four of the corpus's biggest entries: the Barrens, Undercity,
Uldaman and Zul'Farrak. Three of those four came back clean, which is worth
knowing: the long zone and capital entries have held up better than the
one-paragraph landmarks.

**An entry deleted: The Red Reaches.** The wiki's own patch template says "Area
added" in 4.0.3a, and the 1.12 AreaTable confirms it: the Blasted Lands' areas in
this period are the Altar of Storms, Dreadmaul Hold, Dreadmaul Post, the Garrison
Armory, Nethergarde Keep, the Rise of the Defiler, Serpent's Coil, the Dark Portal
and the Tainted Scar. There is no Red Reaches, so the entry could never have come
up in either client. Its Rockpool murlocs and Bloodwash naga are Cataclysm too.
The corpus is now 917 vanilla entries. A row was filed as **out-of-era** with the
patch evidence, matched `ci`, because the lower-cased form is just as wrong.

**The worklist had kept the place alive.** `tools/places.tsv` still held a row for
The Red Reaches, and `tools/generate.py` reads that file to report which places
have no entry yet, so deleting the entry would have put the place straight back
on the list of work to do. The row is now commented out with the reason. **Run 10
left the same loose end**: the Whisperwind Grove row was still there, thirty-odd
entries after that entry was deleted for the same reason. Both are commented out
now. A deletion is not finished until the worklist says why.

**Four entries had the wrong occupants or the wrong owner.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| The Marris Stead | "A Scourge-held farm uncomfortably near the Argent Dawn's chapel", keeping pressure on Light's Hope | Nathanos Blightcaller's house. Sylvanas calls him the first of her champions and says he resides at the Marris Stead, roaming the wastes "slaying all Scourge and Alliance filth that cross his path". It is also 2,100 yards from Light's Hope Chapel, not next to it |
| The Twin Colossals | "Two enormous peaks in the north, with a Grimtotem camp between them" | Rexxar and Misha are camped at the foot of the western peak. The nearest Grimtotem spawn is 1,778 yards away, west of Camp Mojache, which is exactly what run 12 found when it corrected the Camp Mojache entry. **The eighth carry-across.** What is actually on the slopes is Northspring harpies, with groddoc apes and rage scar yetis below |
| The Venture Co. Base Camp | "A goblin logging operation... clear-cutting Stranglethorn for timber" | A strip mine. Twenty-five strip miners, surveyors, tinkerers and a foreman, with eight iron, eight silver and eight gold deposits inside the camp's radius. The Venture Co. loggers and deforesters are in Stonetalon, a continent away |
| The Noxious Glade | A blight pocket whose inhabitants "reflect that", mapped by the Argent Dawn | Scourge champions, the rank of undead that fought at Darrowshire, which is why anybody goes in: a champion that took part in the battle can be identified from its skull |

**The Ruins of Kel'Theril had the story backwards.** The entry said the Sundering
destroyed the city, and that the Highborne haunting it are "not a curse laid on
the place by somebody else, but the dead of the city refusing to leave it". The
1.12 quest that introduces the place says the opposite in plain words: "The story
behind Kel'Theril is one of a cursed race, bound to the place where they attempted
an unfortunate ritual... The highborne that you will find there once stole a
sacred artifact, believing that they could siphon its power for themselves... the
relic shattered in a huge explosion, driving the pieces below the ice of the
lake." The curse is real and it is theirs. The relic is the Crystal of Zin-Malor,
and the fragments are still under the ice, which is also the correction to the
entry's didYouKnow: the crystal was not simply "moved between" two ruins, it was
stolen, and the elf who can mend it is Aurora Skycaller, outside Quel'Lithien
Lodge. **Run 13 fixed that lodge, so the two entries now join up.**

**Eight more claims a vanilla source contradicts.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| The Barrens | "Before the Sundering this was lush country. The breaking of the continent took the water with it" | That it was lush forest is sourced, from the Wailing Caverns druids who want it back in those words. Nothing in 1.12 blames the Sundering for the drying, so the cause goes and the fact stays |
| The Stagnant Oasis | "Something in the water has gone wrong, and the wildlife around it reflects that" | Nothing is wrong with the water. There is a fissure under it, as at the Forgotten Pools, and the Crossroads druids' test was to drop dried, dead seeds into one: the seeds came up alive. The oasis also holds the Kolkar command tent, with Verog the Dervish working out of it |
| The Yorgen Farmstead | "How worgen reached this far south from Silverpine is an open question in Darkshire" | They did not come from Silverpine. The Carevins say the worgen were first found at the mine in Roland's Doom, appearing out of nowhere, which is what run 13 established. **The ninth carry-across**, and this one was predictable the moment Roland's Doom was fixed |
| Uldaman | "The troggs that infest the upper levels are the earthen experiment's failures" | Not in 1.12. The game's explanation is that the digging woke them: ancient urns and idols came out of the ground and "incited the troggs". The entry also missed the Dark Iron holding a League prospector hostage in the ruins for what he knows about titan golem-making |
| Whelgar's Excavation Site | A dig "turning up dragon bones", after "an unusually rich bed of very large bones" | A dig turning up titan script. Whelgar has the Goaz Stone, its translation breaks off in four places, and what he has read so far speaks of a divine plan, a doomed prophecy, and "Old Gods... Chained Beneath the Land" |
| Zul'Farrak | "A captured Alliance force held in the city" | Sergeant Bly's band, described in 1.12 as "his band of ill-reputed adventurers" who went in treasure hunting on their own account. Neutral to both factions, not anybody's force. The city also holds tablets of the prophecy of Mosh'aru |
| Thistleshrub Valley | "The Explorers' League puts it down to the titan work nearby" | Nothing supports that. What is sourced is the gnarled thistleshrubs and rootshapers, that they are big enough to keep Gadgetzan's prospectors out, and the cactus one goblin keeps sending other people in to get at |
| Thunder Ridge | "The Horde's shaman take an interest. Elemental disturbance of this kind usually means something has upset the balance nearby" | Unsupported. What is in the hollow is Fizzle Darkstorm, a goblin warlock of the Burning Blade, working in the open inside Durotar with his cultists. Orgrimmar's warriors send recruits up for the thunder lizards and their singed scales |

**Three more corrected in passing.** The Scarab Dais had the scepter "broken and
its pieces scattered, partly so that nobody could open the gates casually"; it
shattered after Fandral Staghelm's betrayal and the pieces were divided among the
four Aspects, each flight charged with keeping its share safe. The Temple Gardens
"hold a moonwell, the night elves' source of healing and renewal"; no moonwell
object is spawned anywhere in Darnassus, and what 1.12 does say is that the city's
druids keep their own well topped up with water carried in phials from the five
wells down in Teldrassil, the oldest under the Oracle Tree. The Pillar of Ash
claimed every army in the mountain's history had passed it, which nothing
supports.

**Seven held up.** Tanner Camp, whose Dark Iron work gangs turn out to be slaves
with taskmasters over them, the archaeologists among them taken for their
expertise; the Master's Cellar, with Unliving Residents and Caretakers, wailing
spectres and damned souls all present as named; the Sepulcher, which has the inn,
the bat handler, the apothecary and the garrison the entry claims and a good deal
more; Three Corners, where six Stormwind guards and nothing else is indeed a
handful; the Temple of Atal'Hakkar; West Pillar, which run 12's work on the East
Pillar left consistent; and Undercity, where Varimathras, Master Apothecary
Faranell of the Royal Apothecary Society and Lady Sylvanas Windrunner the Banshee
Queen are all exactly as the entry has them.

**Fifteen rows filed, none already present.** The ledger is 1,756 rows. The
corpus-global extractor rule bit **four times in one run**, in both directions.
Removing the Noxious Glade's lower-cased "pockets" made `Pockets` a proper noun in
the Mannoroc Coven and Fungal Vale entries, which is run 12's trap again; writing
"gnarled thistleshrubs" in lower case did the reverse, throwing `Thistleshrub`
out as a word never capitalised mid-sentence and leaving `Valley` standing on its
own as a term. Two were reworded away and `Valley` is filed as a `fragment`. The
rule to carry forward: **lower-casing a word is as disruptive as removing one**,
and the entries that break are never the ones being edited.

**Broken deliberately, five ways.** The new out-of-era row was tested both ways,
since a deleted entry is not done until the gate fails on its term: "The Red
Reaches are east of here." and "Nothing grows on the red reaches east of here."
both injected into the Tainted Scar entry, both failing with the patch evidence,
the second exercising the `ci` column. Then `Misha`, `Mosh'aru` and `Fizzle
Darkstorm` were each removed from the ledger and each failed the build naming the
right entry. Restored, and both files verified identical by checksum.

Gates: the validator passes on all nine configs, `check-gaps.py` passes with the
entry deleted at 43 gaps all explained, and RHYTHM on the four touched data files
is unchanged at 8/10/2/0. Both budget warnings this run were mine and were
reworded back under: the `, which` rate at 12.1 per 10k against a budget of 12,
and three consecutive sentences opening "The " in the rewritten Uldaman paragraph.

**Entries covered so far (350).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Alterac Mountains,
Alterac Valley, Alther's Mill, Ambermill, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Ban'Thallow
Barrow Den, Bashal'Aran, Bay of Storms, Beggar's Haunt, Beren's Peril,
Blackfathom Deeps, Blackrock Mountain, Blackrock Spire, Blackthorn
Ridge, Blackwater Cove, Blackwing Lair, Blasted Lands, Bloodvenom Post,
Bolgan's Hole, Booty Bay, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brill, Brill Town Hall, Burning Steppes,
Caer Darrow, Camp Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp
Wurg, Cathedral Square, Cenarion Enclave, Chill Breeze Valley, Chillwind
Camp, Cleft of Shadow, Coldridge Valley, Crown Guard Tower, Dalson's
Tears, Dandred's Fold, Darkshire, Darkshore, Darkwhisper Gorge,
Darnassus, Deadwind Pass, Deadwood Village, Deeprun Tram, Desolace, Dire
Maul, Dolanaar, Draco'dar, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul
Rock, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustfire Valley, Dustwallow Marsh, Dwarven District, East
Pillar, Eastern Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo
Isles, Echo Ridge Mine, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Faldir's Cove, Feathermoon Stronghold, Felpaw
Village, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostmane Hold, Frostwhisper
Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gallows' End Tavern, Garren's
Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gelkis Village, Gol'Bolar
Quarry, Gold Coast Quarry, Grim Batol, Grimtotem Post, Grommash Hold,
Grove of the Ancients, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High
Rise, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Iris
Lake, Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jademir
Lake, Janeiro's Point, Jangolode Mine, Jerod's Landing, Jintha'Alor,
Kargath, Kharanos, Kodo Rock, Kolkar Crag, Kolkar Village, Lake
Falathim, Lake Mennar, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment
Camp, Maestra's Post, Magram Village, Malden's Orchard, Maraudon,
Mardenholde Keep, Marshal's Refuge, Menethil Harbor, Menethil Keep,
Mirage Flats, Mirage Raceway, Misty Pine Refuge, Misty Reed Post, Misty
Valley, Molten Core, Moonbrook, Morgan's Vigil, Mosshide Fen, Mulgore,
Naxxramas, Nesingwary's Expedition, Night Web's Hollow, Nighthaven,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Onyxia's Lair, Orgrimmar, Pool of Tears, Purgation Isle, Pyrewood
Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar
Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery,
Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Rebel Camp, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Constellas, Ruins of
Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing
Gorge, Sentinel Hill, Seradane, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Sishir Canyon, Skull Rock, Solliden Farmstead, Sorrow
Hill, Sorrowmurk, South Gate Outpost, Southern Barrens, Southern Gold
Road, Southfury River, Southshore, Splintertree Post, Splithoof Crag,
Stillwater Pond, Stonard, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp,
Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of the Moon, Terror
Wing Path, Thalanaar, Thalassian Base Camp, Thandol Span, The Barrens,
The Bulwark, The Charred Vale, The Dead Field, The Deadmines, The
Decrepit Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The
Forgotten Coast, The Forgotten Pools, The Greymane Wall, The Harborage,
The High Seat, The Hinterlands, The Jansen Stead, The Mage Quarter, The
Marris Stead, The Master's Cellar, The Noxious Glade, The Park, The
Pillar of Ash, The Red Reaches, The Ruins of Kel'Theril, The Rustmaul
Dig Site, The Scarab Dais, The Screeching Canyon, The Sepulcher, The
Shimmering Flats, The Stagnant Oasis, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Twin Colossals, The Weathered Nook, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Ridge, Tiragarde Keep,
Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's Hand,
Uldaman, Uldum, Un'Goro Crater, Undercity, Uther's Tomb, Valley of
Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of
Spears, Valley of Spirits, Valley of Strength, Valley of the Watchers,
Valley of Trials, Valley of Wisdom, Valormok, Venture Co. Base Camp,
Warrior's Terrace, Wavestrider Beach, Weazel's Crater, West Pillar,
Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site,
Whisperwind Grove, Whitereach Post, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterspring, Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 by the corrected ranking.

### 2026-11-17, P4, run 15 of about 26

Reviewed 25 entries and corrected 18. These are the top of the score-2 band,
alphabetically from `Agmond's End` to `Deepwater Tavern`, the first run below the
score-3 band. The rate has not dropped with the score: the band-2 entries are
smaller and plainer, and the errors in them are mostly invented colour rather
than wrong eras.

**The scratchpad was cleared between runs, which cost an hour and taught
something.** All the tooling from runs 11 to 14 was gone: the dump parser, the
query tool, the wiki fetcher and the ranking. The tooling was rewritten from the
descriptions in this log, which is the argument for keeping those descriptions
specific. **The ranking had to be recomputed, and recomputing it exposed a bug in
the old one.** The remaining-candidates list was built with `comm -23` over two
files sorted by different collations, Python's `sorted()` on one side and `sort`
on the other, so the set difference was wrong. The recomputed ranking put The
Talondeep Path, The Bulwark and Darnassus at the top of the list: all three were
covered in run 11. Had the old file been trusted, this run would have reviewed
three entries twice and skipped three others. **Do the set difference in Python,
and sanity-check the top of any ranking against the covered list.**

**A problem outside this sweep's remit, recorded here for whoever wants it.** The
Dalaran Crater entry cannot fire. In both clients' area tables the area is called
plain `Dalaran`, area 279, and the entry is called `Dalaran Crater` with no
aliases. The name `Dalaran` is answered by a different entry: the Forever
instance `City of Dalaran`, whose aliases carry it. So a player standing in the
vanilla crater gets Forever's city entry, or on Classic Era nothing at all, and
the two entries' prose is nearly the same paragraph twice. Fixing it means
deciding which entry owns the name and in which client, which is a design call
and touches Forever content, so nothing was changed here beyond the entry's own
claims. `tools/coverage.md` does not show it as a gap, because the Forever entry
answers the name.

**Four entries described the wrong place or the wrong people.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Balnir Farmstead | A farm "still being worked, after a fashion, by the dead family that owned it", horses still bred, "quietly sad rather than horrifying" | A Scourge haven. The Forsaken call it exactly that and send patrols east from the Bulwark against what gathers there: bleeding horrors, wandering spirits and Fellicent's shade. Captain Vachon's friars and zealots raid from the ruined tower alongside. The only thing still growing is the Balnir snapdragons |
| Bathran's Haunt | A ruin held by satyrs, with two paragraphs on satyr origins | Forsaken ground. Apothecary Falthis is there with herbalists, seekers and thugs, and the night elf who hears of it says it is "very troubling indeed". The place is named for Bathran's Hair, a plant that grew in the ruins and cured ailments of the spirit |
| Bloodhoof Village | "Cairne Bloodhoof's own village", where "his people's everyday business happens", managing the Venture Company | Cairne rules from Thunder Bluff. Baine, his son, is the one in the village, and what is on his desk is the Palemane gnolls south and west of it and the dwarven quarry to the north-west. No Venture Co. NPC is within 160 yards |
| Camp Aparaje | "Tauren rather than orcish", a camp putting its effort into harpies and the Grimtotem | Three people: Denni'ka the butcher, Ken'zigla and an orc from Orgrimmar, with a campfire and a smoked meat rack. Troll and orc, not tauren. The Grimtotem part is right in substance, since the camp is ringed by them and a rescued tauren is walked back to it |

**Baradin Bay was drawn across half a continent.** The entry had it "off the
western side of the central Eastern Kingdoms, reaching from Dun Morogh's
north-west down the coast", with "Menethil Harbor on it, and so are Stromgarde
Keep and Southshore". The AreaTable puts Baradin Bay in the **Wetlands**:
Menethil is on it and nothing else is. Southshore is inland on Lordamere Lake and
Stromgarde is in the Arathi Highlands. The Kul Tiras history in the entry is
sound and stays.

**Nine more claims a vanilla source contradicts or cannot support.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Agmond's End | "The name suggests somebody died finding it" | The game says who and how. Agmond was a dwarf off the Badlands dig; the search found bloody smears where he had crawled, and the word "Murdaloc" scrawled in the sandstone where he stopped. Murdaloc is a Stonevault trogg, and the tribe holds the ground around the spot |
| Alcaz Island | "A very important prisoner", and neither faction able to get onto it in force | The Strashaz naga under Tidelord Rrurgaz, and Doctor Weavil with a flying machine and ten minions living among them. No prisoner is on the island in this period; the baskets of bloodkelp are what outsiders come for |
| Alexston Farmstead | The Defias using it as "a forward camp", garrisoning the countryside between farms | Pillagers working it over, one of three places the militia names along with the Gold Coast Quarry and Moonbrook. Sacks of oats are still stacked in it and the harvest watchers and a Foe Reaper are still walking the fields |
| Amberstill Ranch | Stock lost "to Frostmane raids and to the wildlife", and a standing arrangement with passers-by | The arrangement is one quest and one animal: Rudra Amberstill wants Vagash dealt with, an elite worg on the hillside. Four Amberstills work the ranch and Ultham Ironhorn teaches the riding. No Frostmane raid on the ranch is attested |
| Ameth'Aran | "The night elves know exactly who these ghosts were" | Records from the years around the Well's destruction are thin, which the Sentinels say themselves. What is known comes off two stone tablets lying in the ruins, and the Sentinel sent to read them was driven off by the spirits |
| Blackrock Depths | Moira "is now, by any reading, the Dark Iron empress" | Her 1.12 nameplate reads Princess Moira Bronzebeard, Princess of Ironforge, and what holds her at Thaurissan's side is a spell. The Horde is working the kidnapping from its own angle through a dwarf held in a cell down there |
| Blackwood Den | Furbolg corruption as "a single phenomenon rather than a series of local problems" | What 1.12 gives is specific: this is the camp the Sentinels name as Auberdine's biggest threat, the Cliffspring River is turning foul on its way to Mist's Edge, and the night elves looking into it suspect the Blackwood are not the root of it |
| Boulderslide Cavern | The crystal carries "a trace of earthen magic", and the kobolds "found something nobody else noticed" | A resonite cask stands deep in the cave with an earthen asleep inside it, by name: Goggeroc. The kobolds have been mining around a sleeping titan-made giant |
| Circle of West Binding | The Explorers' League wanting to survey all four, blocked by Stromgarde's collapse | Nothing supports that. What is there is a stone at the centre of each circle, three of them holding a burning, a cresting and a thundering key, all three meant for the stone at the Inner Binding |

**Three smaller fixes.** Corrahn's Dagger was "high ground in the Hillsbrad
hills"; it is in the Alterac Mountains, which is the zone the four ridges above
Hillsbrad belong to. Deathknell had Undercity's deathguards sorting the risen; it
is Undertaker Mordo in the crypt, and what he tells someone who wakes is that
they were nearly tossed into the fire with the others, who are still outside as
mindless and wretched zombies. The Dalaran Crater entry had the Violet Citadel
training Medivh, which 1.12 does not say of him, and missed that the Kirin Tor
outside the crater are summoners working with bound elemental slaves.

**The Bael'dun Digsite was right about the picks.** The entry said the Bloodhoof
answer was to take the diggers' pickaxes and break them, and quest 746 is exactly
that: Baine asks for five prospector's picks, smashed at a forge. Two details were
off: the diggers are Bael'dun diggers and appraisers rather than "the Bael Modan
expedition", which is Prospector Khazgorm's operation in the Barrens, and Baine's
second objection is practical, that the digging will enrage Mulgore's kodos.

**Seven held up.** Beezil's Wreck, Blackwolf River, Bogen's Ledge, Brackenwall
Village, Coldridge Pass, Deadeye Shore and the Deepwater Tavern, which gained one
fact: Archaeologist Flagongut has been holed up in it waiting on an escort out to
Whelgar's dig, which run 14 corrected.

**Twenty-one rows filed, none already present.** The ledger is 1,777 rows. Three
terms were extractor artefacts and were reworded away, all three sentence-initial:
`Sacks`, `Scrawled` and `Myrmidons`. Nothing filed as a fragment this run.

**Broken deliberately, three ways.** Removing `Goggeroc` failed the build naming
Boulderslide Cavern, `Tidelord Rrurgaz` naming Alcaz Island, and `Mordo` naming
Deathknell, each with the expected message. Restored and verified identical by
checksum.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and
RHYTHM on the four touched data files went **down**, from 8/10/2/1 to 7/9/2/1:
two pre-existing false positives were dissolved by rewrites and none added. The
`, which` rate warned at 12.3 per 10k against a budget of 12 and the clauses
responsible were reworded back under.

**Entries covered so far (375).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End, Alcaz
Island, Alexston Farmstead, Alterac Mountains, Alterac Valley, Alther's
Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Bael'dun
Digsite, Balnir Farmstead, Ban'Thallow Barrow Den, Baradin Bay,
Bashal'Aran, Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's
Haunt, Beren's Peril, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Spire, Blackthorn Ridge, Blackwater Cove, Blackwing
Lair, Blackwolf River, Blackwood Den, Blasted Lands, Bloodhoof Village,
Bloodvenom Post, Bogen's Ledge, Bolgan's Hole, Booty Bay, Boulderslide
Cavern, Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade
Ravine, Bramblescar, Brewnall Village, Brill, Brill Town Hall, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp
Mojache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Chill Breeze Valley, Chillwind Camp, Circle of West Binding, Cleft of
Shadow, Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Crown Guard
Tower, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkshire,
Darkshore, Darkwhisper Gorge, Darnassus, Deadeye Shore, Deadwind Pass,
Deadwood Village, Deathknell, Deeprun Tram, Deepwater Tavern, Desolace,
Dire Maul, Dolanaar, Draco'dar, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Rock, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep,
Durotar, Duskwood, Dustfire Valley, Dustwallow Marsh, Dwarven District,
East Pillar, Eastern Plaguelands, Eastvale Logging Camp, Eastwall Tower,
Echo Isles, Echo Ridge Mine, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Faldir's Cove, Feathermoon Stronghold, Felpaw
Village, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostmane Hold, Frostwhisper
Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gallows' End Tavern, Garren's
Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gelkis Village, Gol'Bolar
Quarry, Gold Coast Quarry, Grim Batol, Grimtotem Post, Grommash Hold,
Grove of the Ancients, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High
Rise, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Iris
Lake, Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jademir
Lake, Janeiro's Point, Jangolode Mine, Jerod's Landing, Jintha'Alor,
Kargath, Kharanos, Kodo Rock, Kolkar Crag, Kolkar Village, Lake
Falathim, Lake Mennar, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment
Camp, Maestra's Post, Magram Village, Malden's Orchard, Maraudon,
Mardenholde Keep, Marshal's Refuge, Menethil Harbor, Menethil Keep,
Mirage Flats, Mirage Raceway, Misty Pine Refuge, Misty Reed Post, Misty
Valley, Molten Core, Moonbrook, Morgan's Vigil, Mosshide Fen, Mulgore,
Naxxramas, Nesingwary's Expedition, Night Web's Hollow, Nighthaven,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Onyxia's Lair, Orgrimmar, Pool of Tears, Purgation Isle, Pyrewood
Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar
Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery,
Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Rebel Camp, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Constellas, Ruins of
Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing
Gorge, Sentinel Hill, Seradane, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Sishir Canyon, Skull Rock, Solliden Farmstead, Sorrow
Hill, Sorrowmurk, South Gate Outpost, Southern Barrens, Southern Gold
Road, Southfury River, Southshore, Splintertree Post, Splithoof Crag,
Stillwater Pond, Stonard, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp,
Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of the Moon, Terror
Wing Path, Thalanaar, Thalassian Base Camp, Thandol Span, The Barrens,
The Bulwark, The Charred Vale, The Dead Field, The Deadmines, The
Decrepit Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The
Forgotten Coast, The Forgotten Pools, The Greymane Wall, The Harborage,
The High Seat, The Hinterlands, The Jansen Stead, The Mage Quarter, The
Marris Stead, The Master's Cellar, The Noxious Glade, The Park, The
Pillar of Ash, The Red Reaches, The Ruins of Kel'Theril, The Rustmaul
Dig Site, The Scarab Dais, The Screeching Canyon, The Sepulcher, The
Shimmering Flats, The Stagnant Oasis, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Twin Colossals, The Weathered Nook, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Ridge, Tiragarde Keep,
Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's Hand,
Uldaman, Uldum, Un'Goro Crater, Undercity, Uther's Tomb, Valley of
Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of
Spears, Valley of Spirits, Valley of Strength, Valley of the Watchers,
Valley of Trials, Valley of Wisdom, Valormok, Venture Co. Base Camp,
Warrior's Terrace, Wavestrider Beach, Weazel's Crater, West Pillar,
Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site,
Whisperwind Grove, Whitereach Post, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterspring, Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 by the recomputed ranking, continuing the score-2 band.

### 2026-11-17, P4, run 16 of about 25

Reviewed 25 entries and corrected 11, with three more gaining a fact they were
missing. Continuing the score-2 band, alphabetically from `Diamondhead River` to
`Lake Everstill`. The clean rate is up, and the reason is visible in the band: a
third of these entries are rivers, lakes and mesas, where there is less to get
wrong than in a camp with people in it.

**Martin's call on the Dalaran name clash, recorded so no later run reopens it.**
Run 15 flagged that both clients call area 279 plain `Dalaran` and that the name
is answered by Forever's `City of Dalaran` instance rather than by the vanilla
`Dalaran Crater` entry. Forever is the version this addon is built for, so that
behaviour is correct and intended: **a player in the crater gets the Forever
entry, and nothing needs rewiring.** The vanilla entry keeps its own corrected
prose for the Classic Era build. Closed.

**Two of our own entries disagreed, and one of them was mine.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Galak Hold | "The hold is the Galak clan's seat" | Quest 1197 calls Splithoof Crag "the centaurs' stronghold", which is what run 14's Splithoof Crag entry now says in those terms. A clan has one seat. Galak Hold is a Galak position and the entry now says so, with the stronghold named |
| Kormek's Hut | "Between Nijel's Point in the north and Shadowprey Village on the coast there is nothing else" | Ghost Walker Post is in Desolace too, and this run reviewed it in the same batch. The claim is gone, and what replaces it is what the hut is actually for |

**The hut turned out to be the best find in the batch.** Kormek's Hut holds
Bibbly F'utzbuckle, a goblin who buys kodo bones ten at a time out of the
graveyard to the south. A caravan calls and takes them to Shadowprey Village, and
what becomes of them is furniture, musical instruments and blasting powder. He
says the bones are going to change the world forever. **That also fixed the Kodo
Graveyard entry**, which said only that "the bones are being harvested and the
site disturbed" without saying by whom or to what end. The two entries now carry
one story between them.

**Nine more claims a vanilla source contradicts or cannot support.**

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Jaguero Isle | "A shipwrecked Stormwind noblewoman is stuck there" | Princess Poobah is a troll. She speaks of her tribe and her ancestors and offers a place among her own people, and she is not shipwrecked: King Mukla of the Skymane keeps her in a shackle and carries the key |
| Direforge Hill | "A Dark Iron foothold in the highlands", with Ironforge doing nothing about it | The AreaTable puts the hill in the Wetlands. Balgaras the Foul holds it, a Dark Iron warlock the dwarves describe as a coward who sends his soldiers out and stays in camp, and there is a standing price on his ear, so something is being done |
| Gnomeregan | Thermaplugg's foreknowledge "said carefully and not too loudly" in Tinker Town, a rumour the gnomes would rather keep quiet | Mekkatorque says it outright. He trusted Thermaplugg, he was betrayed, the man is a madman and the king of nothing, and the task handed to volunteers is to kill the betrayer |
| Frostfire Hot Springs | Elemental activity as the explanation, with the Horde's shaman taking the interest | A researcher is camped on the springs trying to find the source of the water's qualities and getting nowhere, and the Winterfall furbolgs are drawn to the water, which is his other problem. No shaman is attested here |
| Gavin's Naze | Araga "wanders the length of Hillsbrad and surfaces about once a day" | Her MovementType is 0. She holds one spot among the ordinary mountain lions, in the Alterac Mountains rather than Hillsbrad. The same column settled Volchan in run 11, in the other direction |
| Falfarren River | "Bog beasts move under the surface near Felfire Hill" | There is no bog beast in 1.12 beyond an unspawned placeholder. The claim is gone |
| Grol'dom Farm | "The Razorfen quilboar raid it regularly, and the farm is as much a border post as a food source" | Nothing in 1.12 mentions Grol'dom Farm at all, so the raids go. What can be said is that the warrens are the farm's nearest neighbours, Razorfen Kraul to the south-west and the Downs beyond |
| Highperch | "The mesas' tops are the only safe nesting ground in the canyon. Wyverns and tauren both want them" | The wyverns and their nests are right, and the sourced detail is what is under the nests: egg shells, sun-scorched, which an armoursmith will pay for. The tauren claim is unsupported |
| Everlook | "Inn, flight path, auctioneer, bruisers" | All true and understated. Fifteen bruisers keep order, and there are two flight masters rather than one: a hippogryph master and a wind rider master, standing within sight of each other. That is the neutrality the entry is about |

**Two more additions.** Ghost Walker Post is a few braves, a macecrafter and a
leatherworker, with dying kodo walking past on their way south. And Magatha
Grimtotem sits on Elder Rise as elder crone. That is a strange seat for the
tribe that refused Cairne's alliance, the same tribe run 15's Camp Aparaje entry
has holding the ground around a Horde camp.

**Twelve held up.** Diamondhead River, Draenil'dur Village, Gold Road, Greenpaw
Village, Grom'gol Base Camp, Honor's Stand, Hunter Rise, Idlewind Lake, Jadefire
Run, Jaggedswine Farm and Lake Everstill, plus Elder Rise and Ghost Walker Post
on their existing claims. Two of these were corrected by the original audit in
`tools/era-audit.md`, the Gold Road and Honor's Stand, and both have stayed
correct since.

**Five rows filed, none already present.** The ledger is 1,782 rows. Two terms
were extractor artefacts and were reworded away, both sentence-initial: `Sun`
from "Sun-scorched" and the Gnomeregan line's opener. `Balgaras` and `Foul` were
both needed, which is the title-after-name split again.

**Broken deliberately, three ways.** Removing `Princess Poobah` failed the build
naming Jaguero Isle, `Bibbly F'utzbuckle` naming Kormek's Hut, and `Balgaras`
naming Direforge Hill, each with the expected message. Restored and verified
identical by checksum.

Gates: the validator passes on all nine configs, `check-gaps.py` passes, and
RHYTHM on the four touched data files is unchanged at 7/9/2 with Cities clean.
No rate budget was touched this run.

**Entries covered so far (400).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End, Alcaz
Island, Alexston Farmstead, Alterac Mountains, Alterac Valley, Alther's
Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Bael'dun
Digsite, Balnir Farmstead, Ban'Thallow Barrow Den, Baradin Bay,
Bashal'Aran, Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's
Haunt, Beren's Peril, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Spire, Blackthorn Ridge, Blackwater Cove, Blackwing
Lair, Blackwolf River, Blackwood Den, Blasted Lands, Bloodhoof Village,
Bloodvenom Post, Bogen's Ledge, Bolgan's Hole, Booty Bay, Boulderslide
Cavern, Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade
Ravine, Bramblescar, Brewnall Village, Brill, Brill Town Hall, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp
Mojache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Chill Breeze Valley, Chillwind Camp, Circle of West Binding, Cleft of
Shadow, Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Crown Guard
Tower, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkshire,
Darkshore, Darkwhisper Gorge, Darnassus, Deadeye Shore, Deadwind Pass,
Deadwood Village, Deathknell, Deeprun Tram, Deepwater Tavern, Desolace,
Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock,
Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood,
Dustfire Valley, Dustwallow Marsh, Dwarven District, East Pillar,
Eastern Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles,
Echo Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Feathermoon Stronghold, Felpaw Village, Felwood, Feralas, Field of
Giants, Flame Crest, Forest Song, Forlorn Ridge, Fray Island, Freewind
Post, Frostfire Hot Springs, Frostmane Hold, Frostwhisper Gorge,
Furlbrow's Pumpkin Farm, Gadgetzan, Galak Hold, Gallows' End Tavern,
Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gavin's Naze,
Gelkis Village, Ghost Walker Post, Gnomeregan, Gol'Bolar Quarry, Gold
Coast Quarry, Gold Road, Greenpaw Village, Grim Batol, Grimtotem Post,
Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of the Ancients,
Gunstan's Post, Haldarr Encampment, Hall of Legends, Hammerfall,
Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High Rise, Highperch,
Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Honor's
Stand, Hunter Rise, Idlewind Lake, Iris Lake, Ironforge, Ironstone Camp,
Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake, Jaggedswine
Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine, Jerod's Landing,
Jintha'Alor, Kargath, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar Crag,
Kolkar Village, Kormek's Hut, Lake Everstill, Lake Falathim, Lake
Mennar, Lakeshire, Lakkari Tar Pits, Land's End Beach, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Maestra's
Post, Magram Village, Malden's Orchard, Maraudon, Mardenholde Keep,
Marshal's Refuge, Menethil Harbor, Menethil Keep, Mirage Flats, Mirage
Raceway, Misty Pine Refuge, Misty Reed Post, Misty Valley, Molten Core,
Moonbrook, Morgan's Vigil, Mosshide Fen, Mulgore, Naxxramas,
Nesingwary's Expedition, Night Web's Hollow, Nighthaven, North Tide's
Hollow, Northfold Manor, Northpass Tower, Northridge Lumber Camp,
Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town,
Onyxia's Lair, Orgrimmar, Pool of Tears, Purgation Isle, Pyrewood
Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar
Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery,
Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Rebel Camp, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Andorhal, Ruins of Constellas, Ruins of
Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scholomance, Searing
Gorge, Sentinel Hill, Seradane, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Sishir Canyon, Skull Rock, Solliden Farmstead, Sorrow
Hill, Sorrowmurk, South Gate Outpost, Southern Barrens, Southern Gold
Road, Southfury River, Southshore, Splintertree Post, Splithoof Crag,
Stillwater Pond, Stonard, Stonetalon Mountains, Stonetalon Peak,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Sun Rock Retreat, Swamp of Sorrows,
Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp,
Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of the Moon, Terror
Wing Path, Thalanaar, Thalassian Base Camp, Thandol Span, The Barrens,
The Bulwark, The Charred Vale, The Dead Field, The Deadmines, The
Decrepit Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The
Forgotten Coast, The Forgotten Pools, The Greymane Wall, The Harborage,
The High Seat, The Hinterlands, The Jansen Stead, The Mage Quarter, The
Marris Stead, The Master's Cellar, The Noxious Glade, The Park, The
Pillar of Ash, The Red Reaches, The Ruins of Kel'Theril, The Rustmaul
Dig Site, The Scarab Dais, The Screeching Canyon, The Sepulcher, The
Shimmering Flats, The Stagnant Oasis, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Twin Colossals, The Weathered Nook, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Ridge, Tiragarde Keep,
Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's Hand,
Uldaman, Uldum, Un'Goro Crater, Undercity, Uther's Tomb, Valley of
Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of
Spears, Valley of Spirits, Valley of Strength, Valley of the Watchers,
Valley of Trials, Valley of Wisdom, Valormok, Venture Co. Base Camp,
Warrior's Terrace, Wavestrider Beach, Weazel's Crater, West Pillar,
Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site,
Whisperwind Grove, Whitereach Post, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterspring, Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 by the recomputed ranking, continuing the score-2 band.

### 2026-11-17, P4, run 17 of about 37

Reviewed the next 25 entries, from Lakeridge Highway through South Tide's Run.
Coverage is now 425 of 917. Revised 23 entries; Mor'shan Rampart and Redridge
Canyons were cleared without changes. Recomputed the ranking with redirect
following omitted, scored redirect targets, and removed the 400 covered names
using a Python set. The remaining list contained 513 distinct names: the total
entry count includes duplicate names. No Forever entry was reviewed.

**One later-era camp had passed the compositional ledger rule.** Oneiros named
Dreamer's Rest, whose own article dates its addition to patch 4.0.3a. The camp
paragraph is gone. Its ledger row is now `out-of-era`, with the dated article
as evidence. The ruins and elite green dragonspawn remain: the pre-Cataclysm
article and creature_template 5317/5319/5320 support them, including their
elite rank and random movement. Removed the asserted Greek naming intent:
the source presents that etymology as probable, not established.

**Reviewed claims and their evidence.** All 25 place articles and their proposed
Classic titles were fetched through the wiki API. None of the 25 Classic titles
was an article. Quest references below are from the schema-preserving 1.12.1
dump, not retail quest leads. The dump and all bulk extracts stayed in temporary
storage.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| Lakeridge Highway | Removed the only-route claim and the claim that the highway crosses the Lakeshire bridge. It follows the southern shore and is patrolled by gnolls. Bridge repair now describes the stolen iron shipment | Place article before its Cataclysm paragraph; quest 89 |
| Lushwater Oasis | Removed the unsupported busiest-oasis claim. Added the Kolkar leader and the investigation of altered snapjaws | Quests 852 and 880; the latter has a real Classic article, now linked |
| Malaka'jin | Removed invented Horde attitudes toward troll religion. Hunters face spiders stealing their catch; Jin'Zil has three captive night elves and wants ingredients for his brew | Quests 6461, 1058 and 1060; creature 3995 and three nearby spawns of 4072 |
| Menethil Bay | Removed the unsupported naming date and main-crossing superlative. Retained the two boat routes and identified the inlet within Baradin Bay and its crocolisks | Place article's explicit pre-Cataclysm description; transports 176231 and 176310 |
| Mirkfallon Lake | Removed the absolute claim that nobody has cut, dug or burned here. Added the lakeshore seeds sought for reforestation and nearby pridewings | Quests 6301 and 1134 |
| Mirror Lake Orchard | Replaced working cider farm, kobold raids and self-defending farmhands with Defias occupation. Changed faction from Alliance to Hostile | Place article separates the Defias occupation from the later cultists and new residents |
| Misty Reed Strand | Removed unsupported origin of the coastal gloom and the claim that nobody competes for the shore. Retained wildlife and the Horde post; described the pre-Cataclysm beach tasks | Place article's explicit pre-Cataclysm paragraph; Misty Reed Post article and previously reviewed entry |
| Moonwell | Removed the unsupported claim that the wells explain why the night elves will not abandon Ashenvale, and the implication that their water is from the destroyed original well specifically. Kept the sacred water, dryad and riverbank well | Quests 921, 1024 and 1195 |
| Mor'shan Rampart | Cleared Horde ownership, border position and conflict with the night elves; no Alliance takeover imported | Quests 911, 3921 and 6543; place article's later takeovers are separately dated |
| Mystic Ward | Removed unsourced comparative history of dwarven magic and lost shamanism. Retained the district's actual training and shops | Quest 3000 locates the Hall of Mysteries; nearby creature spawns have mage, priest and paladin trainer titles; place article |
| Noonshade Ruins | Replaced Sandfury occupants with Wastewander bandits and removed invented archaeological uncertainty and motives | Place article explicitly identifies pre-flood occupants; quests 1690 and 1691 describe the water-well conflict |
| Olsen's Farthing | Removed the claim that Silverpine belongs only to Forsaken, worgen or nobody. Ravenclaw undead occupy this farm | Place article's World of Warcraft section; creature_template 1865 and 1866 are undead |
| Oneiros | Removed Dreamer's Rest and asserted naming intent; retained the ruins, green flight and elite patrols | Oneiros pre-Cataclysm description; Dreamer's Rest patch 4.0.3a; creature_template 5317/5319/5320 |
| Pestilent Scar | Removed invented excavation by the blight and claims about what feeds Scourge work. Kept the gorge and oozes without the later flooding or bridges | Classic image and historical comparison in place article; Rotting Sludge 8607 has Eastern Plaguelands spawns in the 1.12 dump |
| Razormane Grounds | Corrected western to central Durotar. Cleared the quilboar, thorns and Agamaggan connection | Place article; quests 5045, 5046 and 5052; Agamaggan's history cites The Sundering, chapter 11, published before 1.12 |
| Red Cloud Mesa | Removed the claim that fighting is incidental. Kept the training and added hunting for village supplies and the quilboar threat | Quests 747, 755 and 3376 |
| Redridge Canyons | Cleared gnoll territory, Yowler and Lakeshire's shortage of support; no later ettins imported | Quest 126; pleas for aid in 143-146 and 4185; place article |
| Ruins of Alterac | Replaced Syndicate ownership with Mug'thol's Crushridge ogres and Southshore's bounty work | Quests 518 and 504; creature_template 2257; place article's Warcraft II history |
| Scarlet Watch Post | Identified the northern tower and Melrache instead of generic Monastery-road prose; removed the unsupported Argent Dawn accusation | Quest 372; creature_template 1665; place article. Linked numbered Classic quest part 4, not the retail quest or first Classic step |
| Scuttle Coast | Removed the misplaced Echo Isles focus and villagers' invented reluctance to talk. Kept the coast north of Tiragarde and the Kul Tiran wrecks | Place article distinguishes the wrecks from their later movement ashore |
| Sen'jin Village | Thrall met the tribe on its original islands before reaching Kalimdor, not on the Echo Isles. Removed absolute political loyalty and only-willing-troll-tribe claims | Sen'jin article's Warcraft III demo campaign references; village history citing the 2004 troll description; quest 826 |
| Shadow Grave | Cleared the waking place. Removed universal claims about living families and church judgement; grounded the account in Mordo and Sarvis | Quest 363 and the place article's pre-Cataclysm description |
| Silverwing Outpost | Cleared Duriel and the cross-river position. Removed invented Darnassian strategy and daily frequency; described Torek's planned attack without its outcome | Quest 6544 and the place article |
| Sofera's Naze | Removed the invented ghosts and unburied dead; retained Syndicate occupation | Quest 505 explicitly names this camp and Corrahn's Dagger; place article's former occupation |
| South Tide's Run | Kept the southwestern shoreline; deleted unsupported quietness, uncontested coast, whole-seaboard and wall-traffic absolutes | Place article's pre-Cataclysm shoreline description |

The Moonwell of Cleansing article dates the **subzone** addition to 4.0.3a;
that alone does not date the physical well, which quest 1195 already describes.
No verdict was inferred from that subzone date. The rewritten entry uses the
quest's directions. Menethil's two routes were rechecked in the transports
table. Sarvis's account of freedom under Sylvanas is in quest 363 itself; it was
not rejected on the basis of a later summary of Forsaken history.

**Ledger and negative checks.** Added 25 previously absent rows, asserting each
was absent before writing. Twenty-four name terms have explicit quest, creature
or historical place evidence. `Water` is a fragment when extracted alone:
introducing Gadgetzan Water Company makes the extractor reconsider ordinary
sentence-initial water across the corpus. Compound names retain their own rows.
The ledger now has 1,807 rows. Before removing the old Oneiros sentence, the
re-verdict deliberately failed validation with `Oneiros mentions "Dreamer's
Rest": Feralas camp added in patch 4.0.3a`. The new terms also failed as missing
before their evidence rows were added. No validator code or rate budget changed.

Gates: Lua 5.4.8 validation passed on the default and all nine CI configurations;
`check-gaps.py` passed with 43 explained gaps. Prose lint is clean on the ledger
and this log. The four data files retain the baseline RHYTHM counts: Kalimdor 7,
Eastern Kingdoms 9, Locales 2, Cities 0, with no other findings. Lua was built in
temporary storage because no Lua executable was installed. No release or tag.

**Entries covered so far (425).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End, Alcaz
Island, Alexston Farmstead, Alterac Mountains, Alterac Valley, Alther's
Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Bael'dun Digsite,
Balnir Farmstead, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock
Spire, Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's
Ledge, Bolgan's Hole, Booty Bay, Boulderslide Cavern, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall Village,
Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Aparaje, Camp
Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp Wurg, Cathedral Square,
Cenarion Enclave, Chill Breeze Valley, Chillwind Camp, Circle of West
Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley, Corrahn's
Dagger, Crown Guard Tower, Dalaran Crater, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadeye Shore, Deadwind
Pass, Deadwood Village, Deathknell, Deeprun Tram, Deepwater Tavern,
Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock, Dun
Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire
Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge
Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel
Rethor, Everlook, Faldir's Cove, Falfarren River, Feathermoon Stronghold,
Felpaw Village, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Galak Hold,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj,
Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnomeregan, Gol'Bolar
Quarry, Gold Coast Quarry, Gold Road, Greenpaw Village, Grim Batol,
Grimtotem Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of
the Ancients, Gunstan's Post, Haldarr Encampment, Hall of Legends,
Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High Rise,
Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha,
Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake, Ironforge, Ironstone
Camp, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine, Jerod's
Landing, Jintha'Alor, Kargath, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Lake Everstill, Lake Falathim, Lake
Mennar, Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment Camp,
Lushwater Oasis, Maestra's Post, Magram Village, Malaka'jin, Malden's
Orchard, Maraudon, Mardenholde Keep, Marshal's Refuge, Menethil Bay,
Menethil Harbor, Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon
Lake, Mirror Lake Orchard, Misty Pine Refuge, Misty Reed Post, Misty Reed
Strand, Misty Valley, Molten Core, Moonbrook, Moonwell, Mor'shan Rampart,
Morgan's Vigil, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas, Nesingwary's
Expedition, Night Web's Hollow, Nighthaven, Noonshade Ruins, North Tide's
Hollow, Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire
Valley, Northshire Vineyards, Northwatch Hold, Old Town, Olsen's Farthing,
Oneiros, Onyxia's Lair, Orgrimmar, Pestilent Scar, Pool of Tears, Purgation
Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire
Chasm, Ranazjar Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill
Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Razormane
Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge Mountains,
Refuge Pointe, Remtravel's Excavation, Render's Valley, Rethress Sanctum,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins
of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of Lordaeron,
Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Sardor Isle,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Shadow Grave, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's
Lair, Shok'Thokar, Silithus, Silverpine Forest, Silverwind Refuge,
Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's Naze, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's Run,
Southern Barrens, Southern Gold Road, Southfury River, Southshore,
Splintertree Post, Splithoof Crag, Stillwater Pond, Stonard, Stonetalon
Mountains, Stonetalon Peak, Stonewrought Dam, Stonewrought Pass, Stormwind
City, Stormwind Keep, Stranglethorn Vale, Stratholme, Sun Rock Retreat,
Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point,
Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of
the Moon, Terror Wing Path, Thalanaar, Thalassian Base Camp, Thandol Span,
The Barrens, The Bulwark, The Charred Vale, The Dead Field, The Deadmines,
The Decrepit Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The
Forgotten Coast, The Forgotten Pools, The Greymane Wall, The Harborage, The
High Seat, The Hinterlands, The Jansen Stead, The Mage Quarter, The Marris
Stead, The Master's Cellar, The Noxious Glade, The Park, The Pillar of Ash,
The Red Reaches, The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab
Dais, The Screeching Canyon, The Sepulcher, The Shimmering Flats, The
Stagnant Oasis, The Stockade, The Tainted Scar, The Talon Den, The Talondeep
Path, The Temple Gardens, The Temple of Atal'Hakkar, The Twin Colossals, The
Weathered Nook, The Writhing Haunt, The Yorgen Farmstead, Theramore Isle,
Thistleshrub Valley, Thondroril River, Thousand Needles, Three Corners,
Thunder Ridge, Tiragarde Keep, Tirisfal Glades, Tower of Althalaxx, Trade
District, Tyr's Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Uther's
Tomb, Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor,
Valley of Spears, Valley of Spirits, Valley of Strength, Valley of Trials,
Valley of Wisdom, Valley of the Watchers, Valormok, Venture Co. Base Camp,
Warrior's Terrace, Wavestrider Beach, Weazel's Crater, West Pillar, Western
Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind
Grove, Whitereach Post, Windbreak Canyon, Windshear Crag, Winterfall
Village, Winterspring, Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 by the recomputed ranking, continuing the score-2 band
from Southbreak Shore. P5 still covers run 17 onwards; nothing in this run has
shipped.

### 2026-11-17, P4, run 18 of about 37

Reviewed the next 25 entries, Southbreak Shore through The Infectis Scar.
Coverage is now 450 of 917. Revised 24 entries and cleared Stonewatch Keep
without changes. Recomputed the ranking from the remaining names, excluding the
425 covered names with a Python set. Redirect targets were fetched separately;
their Classic variants were checked as well. None of this batch's place names
or redirect targets had a separate Classic article. No Forever entry was in
scope. The SQL dump, parsed tables and wiki extracts stayed in temporary storage.

**The strongest contradictions came from the game's own text.** The Apothecarium
claimed the Forsaken's stated target was only the Scourge. Quest 447 explicitly
names humans as well. Stromgarde Keep claimed no Alliance intervention, but
quest 681 describes supply shipments from Southshore and the need to protect
them. Stagalbog named Atal'ai in the caves, while our own cave entry correctly
named murlocs. The two now agree, supported by quest 2623 and the murloc spawns
around the Swamp Talker. Stonemaul's ruins hold Firemane dragonkin, not ogres
who refused to leave.

**Every entry checked, including the one left alone.** Quest and creature ids
refer to the cmangos 1.12.1 tables with their schemas retained.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| Southbreak Shore | Cleared the original audit's removal of Captain Dreadbeard and retained pirates, turtles and sea giants. Removed the sweeping claim that the goblins police nothing outside their walls | Place article distinguishes former surf inhabitants; quest 8366 describes protection payments and the port's retaliation |
| Southern Savage Coast | Kept the western beaches and boundaries. Removed naga along the entire shore, invented naming causation and shipwreck claims. Added the Bloodsail scouting problem north of Booty Bay | Place article's geography; quest 595 |
| Southpoint Tower | Replaced constantly changing unknown occupants with Deathstalker Lesh's reconnaissance post. Corrected the road to Silverpine and changed faction to Horde | Classic-only place article; quest 494; creature 2214 |
| Splithoof Hold | Cleared cave, centaurs, brazier and flame. Removed the speculative account of who kept it alight before the centaurs and the unrelated family-history conclusion | Quests 1195 and 1197; place article separates the later flooding |
| Stagalbog | Replaced Atal'ai cave occupants with Marsh tribe murlocs; removed invented assertions about the cult's size | Stagalbog and Stagalbog Cave articles; quest 2623; spawns around creature 950 |
| Stagalbog Cave | Cleared the murlocs and Swamp Talker. Removed the unsupported claim that everything arrived after the Dark Portal and that Swamp Talker must be a role rather than a name | Quest 2623 explicitly calls him named Swamp Talker; creature 950 and nearby Marsh murlocs; cave article |
| Starfall Village | Corrected eastern to northwest of Everlook. Replaced invented sky-watching, dragon concerns and independence from Darnassus with its buildings and resident researchers | Place article; quests 5244 and 5250; creatures 10301 and 11079, including Jaron's Explorers' League title |
| Steamwheedle Port | Corrected southern to eastern Tanaris. Removed the assertion that all pirates are goblins and the invented shipping motive. Added documented freight to Booty Bay and protection money | Quests 2876 and 8366; creature 7882 is Security Chief Bilgewhizzle, distinct from Gadgetzan's Chief Engineer |
| Stonemaul Ruins | Replaced remaining ogres with Firemane dragonkin. Kept the move to Brackenwall and Rexxar's appointment of Mok'Morokk, and described Tharg's wish to return | Quests 1166 and 1168; Firemane creatures 4328/4329/4331/4334; place article's World of Warcraft section |
| Stonesplinter Valley | Cleared trogg occupation. Removed unsupported Ironforge attitudes about their ancestry; described the local leadership and depleted defenders | Quests 217, 224, 237 and 263; creatures 1205/1206/1207. Guards are not called mechanically elite in the rewrite |
| Stonewatch | Kept Gath'Ilzogg's occupation; removed invented construction purpose and the absolute loss of every defensible line. Described the keep, tower and conflict with Morganth | Place article; quest 248; The State of Lakeshire, a Classic-only quest item |
| Stonewatch Keep | Cleared its central history without edits: Morganth allied with the orcs, they captured the keep, and he turned on them. Lakeshire still seeks aid | The State of Lakeshire, item 1293, directly recounts these events; quests 248 and 143-146 corroborate the conflict and lack of help. Read the dated item article rather than trusting an unjoined page_text row |
| Stromgarde Keep | Kept the historical capital and three-way division. Replaced no-intervention claim with Southshore's threatened supply route; preserved the defenders' worsening position | Quest 681; place article's early history and World of Warcraft section |
| Terrordale | Replaced abandoned-and-ignored town with Augustus, Egan and the haunted ground | Quests 6164, 5281/5282 and 7640; creatures 12384 and 11140; place article's Classic material |
| The Altar of Zul | Removed the false position atop Jintha'Alor and unsupported name interpretation. It is a separate altar at the western edge of Vilebranch territory, with two keepers | Quest 2989; creatures 7996 and 8636 spawn together at its summit, both rank 1; place article |
| The Apothecarium | Corrected the openly stated plague targets to both humans and Scourge; removed speculation about what the Horde has asked | Quest 447; creature 2055 and the Apothecarium article |
| The Crystal Shore | Kept the beach, ridge and island geography. Removed invented motives of pirates, naga and goblins; identified Aboraz and its occupants | Place article; quest 592 explicitly places Zanzil and Yenniku at Aboraz along the Crystal Shore |
| The Dagger Hills | Removed never-settled-or-farmed assertion and unsupported gnolls. Identified the Defias ridge behind Moonbrook and the militia response | Quest 14; place article's explicit pre-Cataclysm occupant list |
| The Dark Portal | Kept the opening, First War invasion and expedition's later destruction of the Draenor side. Removed invented crater causation and Nethergarde speculation | Dark Portal article's Warcraft II manual references and pre-2.0.1 game state; The Dark Portal and the Fall of Stormwind historical text |
| The Great Forge | Kept the foundry and smiths. Removed best-in-the-Alliance and majority-production claims; added Tormus's documented work | Quest 1680; creature 6031; Great Forge article and original smithing NPCs |
| The Great Lift | Kept tauren construction and the canyon route. Removed unsupported centaur harassment and main-route superlative; described the guard's requested leave | Quest 5881; creatures 12576 and 10079; place article's pre-destruction state |
| The Green Belt | Replaced a central raptor bone field and excavation with eastern marshland and Rethiel's concerns | Quests 463 and 275; creature 1244; place article. Whelgar's separate excavation no longer supplies this entry's story |
| The Headland | Cleared the original audit's removal of the later Stormpike camp and retained the ridge order. Removed the rare cat roaming all four ridges and unsupported years-of-war claim | Original audit and Classic gallery; Araga 14222 has MovementType 0, agreeing with run 16's corrected Gavin's Naze |
| The Hushed Bank | Kept river and bridge geography. Replaced unsupported smuggling and patrol shortages with Sven and Lars's camp and wolf problem | Quest 226; creatures 311 and 893; place article's pre-Cataclysm camp |
| The Infectis Scar | Replaced generic Scourge works with the gorge west of Corin's Crossing and the shattered runeblade | Quest 5181; place article separates the later flooding. No quest outcome or later lake was imported |

Shipping in quest 2876 is freight in the story, not a passenger route added to
the transport network. The rewrite does not offer a boat trip from Steamwheedle.
The Altar of Zul rewrite names its occupants and the search being undertaken,
without revealing the search result or the later mallet task.

**Ledger and checks.** Added 34 rows, asserting each was absent first. All new
rows describe names supported by specific creature ids, quest ids or the dated
place articles. No row was deleted or re-verdict changed, and no new validator
check was introduced. Before filing the evidence, the validator failed on all
34 missing terms as expected. Adding Master Apothecary Faranell also caused the
corpus-wide extractor to recognise Master Gadrin in the already reviewed
Sen'jin entry; creature 3188 supplies that full title. The ledger is now 1,841
rows. No rate budget changed.

Gates: validation passed on all nine CI configurations; check-gaps passed with
43 explained gaps. Prose lint has no new findings: Kalimdor retains 7 RHYTHM
findings, Locales 2, Cities 0, and Eastern Kingdoms falls from 9 to 8. The ledger
and this log are clean. No release or tag; P5 still covers run 17 onwards.

**Entries covered so far (450).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End, Alcaz
Island, Alexston Farmstead, Alterac Mountains, Alterac Valley, Alther's
Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Bael'dun Digsite,
Balnir Farmstead, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock
Spire, Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's
Ledge, Bolgan's Hole, Booty Bay, Boulderslide Cavern, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall Village,
Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp Aparaje, Camp
Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp Wurg, Cathedral Square,
Cenarion Enclave, Chill Breeze Valley, Chillwind Camp, Circle of West
Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley, Corrahn's
Dagger, Crown Guard Tower, Dalaran Crater, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadeye Shore, Deadwind
Pass, Deadwood Village, Deathknell, Deeprun Tram, Deepwater Tavern,
Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock, Dun
Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire
Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge
Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel
Rethor, Everlook, Faldir's Cove, Falfarren River, Feathermoon Stronghold,
Felpaw Village, Felwood, Feralas, Field of Giants, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Galak Hold,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj,
Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnomeregan, Gol'Bolar
Quarry, Gold Coast Quarry, Gold Road, Greenpaw Village, Grim Batol,
Grimtotem Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of
the Ancients, Gunstan's Post, Haldarr Encampment, Hall of Legends,
Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High Rise,
Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha,
Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake, Ironforge, Ironstone
Camp, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine, Jerod's
Landing, Jintha'Alor, Kargath, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Lake Everstill, Lake Falathim, Lake
Mennar, Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere Internment Camp,
Lushwater Oasis, Maestra's Post, Magram Village, Malaka'jin, Malden's
Orchard, Maraudon, Mardenholde Keep, Marshal's Refuge, Menethil Bay,
Menethil Harbor, Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon
Lake, Mirror Lake Orchard, Misty Pine Refuge, Misty Reed Post, Misty Reed
Strand, Misty Valley, Molten Core, Moonbrook, Moonwell, Mor'shan Rampart,
Morgan's Vigil, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas, Nesingwary's
Expedition, Night Web's Hollow, Nighthaven, Noonshade Ruins, North Tide's
Hollow, Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire
Valley, Northshire Vineyards, Northwatch Hold, Old Town, Olsen's Farthing,
Oneiros, Onyxia's Lair, Orgrimmar, Pestilent Scar, Pool of Tears, Purgation
Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire
Chasm, Ranazjar Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill
Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul, Razormane
Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge Mountains,
Refuge Pointe, Remtravel's Excavation, Render's Valley, Rethress Sanctum,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins
of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of Lordaeron,
Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch, Sardor Isle,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Shadow Grave, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's
Lair, Shok'Thokar, Silithus, Silverpine Forest, Silverwind Refuge,
Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's Naze, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's Run,
Southbreak Shore, Southern Barrens, Southern Gold Road, Southern Savage
Coast, Southfury River, Southpoint Tower, Southshore, Splintertree Post,
Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog Cave, Starfall Village,
Steamwheedle Port, Stillwater Pond, Stonard, Stonemaul Ruins, Stonesplinter
Valley, Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormwind City, Stormwind Keep,
Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock Retreat, Swamp of
Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris, Tanner
Camp, Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of the Moon,
Terror Wing Path, Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span,
The Altar of Zul, The Apothecarium, The Barrens, The Bulwark, The Charred
Vale, The Crystal Shore, The Dagger Hills, The Dark Portal, The Dead Field,
The Deadmines, The Decrepit Ferry, The Drag, The Dry Hills, The Farstrider
Lodge, The Forgotten Coast, The Forgotten Pools, The Great Forge, The Great
Lift, The Green Belt, The Greymane Wall, The Harborage, The Headland, The
High Seat, The Hinterlands, The Hushed Bank, The Infectis Scar, The Jansen
Stead, The Mage Quarter, The Marris Stead, The Master's Cellar, The Noxious
Glade, The Park, The Pillar of Ash, The Red Reaches, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching Canyon,
The Sepulcher, The Shimmering Flats, The Stagnant Oasis, The Stockade, The
Tainted Scar, The Talon Den, The Talondeep Path, The Temple Gardens, The
Temple of Atal'Hakkar, The Twin Colossals, The Weathered Nook, The Writhing
Haunt, The Yorgen Farmstead, Theramore Isle, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Ridge, Tiragarde Keep,
Tirisfal Glades, Tower of Althalaxx, Trade District, Tyr's Hand, Uldaman,
Uldum, Un'Goro Crater, Undercity, Uther's Tomb, Valley of Bones, Valley of
Fangs, Valley of Heroes, Valley of Honor, Valley of Spears, Valley of
Spirits, Valley of Strength, Valley of Trials, Valley of Wisdom, Valley of
the Watchers, Valormok, Venture Co. Base Camp, Warrior's Terrace,
Wavestrider Beach, Weazel's Crater, West Pillar, Western Plaguelands,
Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind Grove, Whitereach
Post, Windbreak Canyon, Windshear Crag, Winterfall Village, Winterspring,
Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 by the recomputed ranking, continuing the score-2 band
from The Loch. Runs 17 and 18 are included in 1.2.13.


### 2026-11-17, release 1.2.13

Martin explicitly requested merging dev into main and publishing the next 1.2.x
build. This release includes P4 runs 17 and 18: 50 entries reviewed, 47 corrected,
none removed. Both version strings are 1.2.13. The changelog records these two
runs; P5 must not repeat them. P4 remains at 450 of 917 entries, with The Loch
next. P5 has not started and the overall sweep remains unfinished.


### 2026-11-18, P4, run 19 of about 37

Reviewed 25 vanilla entries, covering the next 24 place names from The Loch
through Wildbend River. Thunder Bluff has separate entries in Cities and
Kalimdor; both were reviewed and count towards this run's limit. Revised 23
entries, removed Thieves Camp, and cleared The Mor'shan Rampart without edits.
Winterhoof Water Well is next. Recomputed the remaining article ranking, which
confirmed the order. Checked each place title and redirect target for a separate
Classic article; Thunder Bluff (Classic) is a redirect, not such an article.
No Forever entry was changed. Database tables, their schemas, and wiki extracts
remain in temporary storage.

**Coverage accounting.** Earlier runs counted place names, even though the
917-entry denominator included duplicate names. The previous 450-name list
contains two already removed places, The Red Reaches and Whisperwind Grove,
and matches 451 surviving vanilla entries. This run adds 24 names and reviews
25 entries, removing one of them. The cumulative list now has 474 reviewed
names, including three removals; it matches 475 of the 916 surviving vanilla
entries. There are 441 surviving entries left. Historical run counts above are
left as recorded; future runs should count duplicate entry records towards the
25-entry limit and keep the name list for exclusion.

**Every entry checked.** Quest and creature ids below refer to cmangos 1.12.1.
Place articles were read for their original geography and occupants, separating
later sections and checking new prose as well as the claims removed.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| The Loch | Kept the lake and dam; removed the river counterfactual and unsupported fishing-industry claim. Described the island crocolisks and their trade | The Loch and Stonewrought Dam articles; quest 385 |
| The Magic Quarter | Kept mage and warlock training. Removed sweeping cultural claims; described the temple and tailoring facilities | Place article; creatures 4564, 4568 and original tailoring trainers |
| The Maul | Removed the invented connection between arena ownership and Gordok kingship, and the oldest-library superlative. Kept the pit, faction-free combat and western exit | Maul (subzone), explicitly Classic section. Broken Commons was caught as a later name during replacement verification and removed from the draft |
| The Merchant Coast | Kept pirates and coastal geography. Removed speculative naming and busiest-route claims; described stolen cargo | Place article's pre-Shattering occupants; quests 887 and 888 |
| The Mor'shan Rampart | Cleared without edits: Gold Road terminus, makeshift defense, raids towards Astranaar and the timber conflict | Place article's original rampart description; quests 6543-6547 and 8372 corroborate the outpost and forest war. Did not import the current Alliance faction or later flight master |
| The Royal Quarter | Kept Sylvanas and Varimathras and their Warcraft III bargain. Removed the claim about what all Forsaken accept; added the royal guards | Royal Quarter article's former occupants; Varimathras article citing The Dark Lady; creatures 2425 and 13839 |
| The Shattered Strand | Removed blanket naga control and unsupported coastline causation. Described the northern bay shore, landmarks and wildlife | Place article, Azshara (Classic) subzone list, Tower of Eldara article; later goblin-naga conflict excluded |
| The Shrine of Aessina | Corrected east to west of Astranaar. Replaced speculative religious hierarchy with Therysil and her missing sister | Shrine article; quest 945; creature 3585 and nearby original shrine residents |
| The Tower of Arathor | Removed the inaccurate magic-teaching history and unrelated imperial summary. Described Trelane's failed defense and the ogre occupation; faction changed from Alliance to Hostile | Quests 690, 694 and 696; tower article's World of Warcraft section |
| The Trade Quarter | Kept bank and auction house; removed invented expectations about Horde trade. Added the quarter's layout and traveller services | Place article's layout and original facilities |
| The Tundrid Hills | Corrected the route and position; removed unsupported patrol coverage and Frostmane incursions | Place article separates the original wildlife and shortcut from the Cataclysm troll camp |
| The War Quarter | Kept training; removed claims that all Forsaken soldiers lack fear and outperform their numbers. Named original training facilities | Place article; creatures 4594, 4596, 4598, 4607 and 11870 |
| Thieves Camp | Removed the entry and its obsolete places.tsv seed. Its alleged Defias occupants and workers' biographies had no source | Place article is explicitly Removedfrombeta, a planned subzone. No Classic article establishes a live camp; not removed merely because of an absent client row |
| Thunder Bluff, Cities | Kept mesas, bridges, Cairne and the founding. Corrected Pools of Vision occupants and removed the invented druidic reunion and city-design motives | City article's Warcraft III and game-manual sections; Pools of Vision's original Forsaken trainers; creature 3057 |
| Thunder Bluff, Kalimdor | Same supported founding and geography; removed intellectual-superiority claim and corrected the same spirit-walker error | Same sources; agrees with the existing Pools of Vision entry |
| Thunderhorn Water Well | Corrected eastern to north of Bloodhoof and replaced functioning-well assumptions with its poisoned state and cleansing preparations | Quests 748, 756 and 758; creature 2948; place article. No ritual outcome disclosed |
| Tinker Town | Kept refugees, Mekkatorque and tram. Removed the unsupported absence of disagreement and described requests for help in Gnomeregan | Place article's pre-Operation state; creature 7937; quests 2923 and 2925 |
| Tor'kren Farm | Removed invented agricultural motives and quilboar trouble. Described Misha's search for Kron | Quest 816 and creature 3193. The retail article's already-dead son is not the quest's starting state; no fate revealed |
| Tower of Azora | Removed invented scholarly history and personality claims. Described Theocritus, servants, services and his rivalry with Morganth | Place article's original inhabitants; quest 94 distinguishes watching the rival from using a glyph to study his thoughts |
| Ursolan | Kept northern Timbermaw occupation. Removed unsupported ancient construction, survey superlative and palace geography | Place article; Azshara (Classic) lists Ursolan; original creature spawns around the northern Timbermaw settlement include 6187-6189 |
| Wailing Caverns | Kept Naralex's failed restoration. Corrected his alleged screams to steam fissures and the assertion that all disciples are hostile | Quests 1487 and 914; original dungeon description preserved in Game Guide/World Dungeons |
| Warsong Gulch | Kept the logging conflict; removed clan-wide superlatives and the landless-Horde justification. Added the forest's defensive value | Quest 8372; place article and original battleground guide |
| Waterspring Field | Replaced economic superlatives and invented founding motives with water towers, Wastewander occupation and threatened supply | Quests 1690, 1691 and 1707; place article's background before flooding |
| Webwinder Path | Corrected the vague northern route; removed invented travel costs and lack of alternatives | Place article's road from Malaka'jin to Mirkfallon Lake and roadside spiders; later barricade excluded |
| Wildbend River | Kept the river; removed unsupported claims about these particular ancients fighting at Hyjal. Described the watercourse from Felwood | Place article's original river description and pre-Cataclysm image |

**Ledger and negative check.** Added 15 vanilla rows with specific evidence and
one out-of-era row, Broken Commons, asserting that all 16 were absent first.
The latter article explicitly dates the name to patch 4.0.3a. After the normal
build passed, deliberately reinserted Broken Commons into the Maul entry. The
validator failed only on the expected out-of-era message. Restored the text and
passed all nine configurations. No existing row was deleted or re-verdict changed,
and no validator code or rate budget changed. The ledger now has 1,857 rows.

Gates: the default validator and all nine CI configurations pass using Lua 5.4.8.
check-gaps passes with 43 explained gaps. All touched files were prose-linted:
Cities, the ledger, places.tsv and this log are clean; existing RHYTHM counts
are Eastern Kingdoms 8, Locales 2 and Dungeons 1, while Kalimdor falls from 7
to 6. git diff --check is clean. No tag or release; P5 covers run 19 onwards.

**Entries covered so far (474 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End, Alcaz
Island, Alexston Farmstead, Alterac Mountains, Alterac Valley, Alther's
Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang
Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ashenvale, Auberdine, Azshara, Azurelode Mine, Badlands, Bael'dun Digsite,
Balnir Farmstead, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock
Spire, Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's
Ledge, Bolgan's Hole, Booty Bay, Boulderslide Cavern, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brill, Brill Town Hall, Burning Steppes, Caer Darrow, Camp
Aparaje, Camp Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp Wurg,
Cathedral Square, Cenarion Enclave, Chill Breeze Valley, Chillwind Camp,
Circle of West Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley,
Corrahn's Dagger, Crown Guard Tower, Dalaran Crater, Dalson's Tears,
Dandred's Fold, Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadeye
Shore, Deadwind Pass, Deadwood Village, Deathknell, Deeprun Tram, Deepwater
Tavern, Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul
Rock, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood,
Dustfire Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge
Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary,
Ethel Rethor, Everlook, Faldir's Cove, Falfarren River, Feathermoon
Stronghold, Felpaw Village, Felwood, Feralas, Field of Giants, Flame Crest,
Forest Song, Forlorn Ridge, Fray Island, Freewind Post, Frostfire Hot
Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's Pumpkin Farm,
Gadgetzan, Galak Hold, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker
Post, Gnomeregan, Gol'Bolar Quarry, Gold Coast Quarry, Gold Road, Greenpaw
Village, Grim Batol, Grimtotem Post, Grol'dom Farm, Grom'gol Base Camp,
Grommash Hold, Grove of the Ancients, Gunstan's Post, Haldarr Encampment,
Hall of Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch,
High Rise, Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills,
Hiri'watha, Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake,
Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jadefire Run,
Jademir Lake, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Kargath, Kharanos, Kodo Graveyard, Kodo
Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake Everstill, Lake
Falathim, Lake Mennar, Lakeridge Highway, Lakeshire, Lakkari Tar Pits,
Land's End Beach, Lethlor Ravine, Light's Hope Chapel, Loch Modan,
Lordamere Internment Camp, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Maraudon, Mardenholde Keep, Marshal's Refuge,
Menethil Bay, Menethil Harbor, Menethil Keep, Mirage Flats, Mirage Raceway,
Mirkfallon Lake, Mirror Lake Orchard, Misty Pine Refuge, Misty Reed Post,
Misty Reed Strand, Misty Valley, Molten Core, Moonbrook, Moonwell, Mor'shan
Rampart, Morgan's Vigil, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas,
Nesingwary's Expedition, Night Web's Hollow, Nighthaven, Noonshade Ruins,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town,
Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Pestilent Scar, Pool
of Tears, Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien
Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Ratchet, Raven Hill,
Raven Hill Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul,
Razormane Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley, Rethress
Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of
Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins
of Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post,
Scholomance, Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill,
Seradane, Shadow Grave, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor,
Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest, Silverwind
Refuge, Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold Road,
Southern Savage Coast, Southfury River, Southpoint Tower, Southshore,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Starfall Village, Steamwheedle Port, Stillwater Pond, Stonard,
Stonemaul Ruins, Stonesplinter Valley, Stonetalon Mountains, Stonetalon
Peak, Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormwind City, Stormwind Keep, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade,
Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of
Arkkoran, Temple of the Moon, Terror Wing Path, Terrordale, Thalanaar,
Thalassian Base Camp, Thandol Span, The Altar of Zul, The Apothecarium, The
Barrens, The Bulwark, The Charred Vale, The Crystal Shore, The Dagger
Hills, The Dark Portal, The Dead Field, The Deadmines, The Decrepit Ferry,
The Drag, The Dry Hills, The Farstrider Lodge, The Forgotten Coast, The
Forgotten Pools, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Harborage, The Headland, The High Seat, The Hinterlands,
The Hushed Bank, The Infectis Scar, The Jansen Stead, The Loch, The Mage
Quarter, The Magic Quarter, The Marris Stead, The Master's Cellar, The
Maul, The Merchant Coast, The Mor'shan Rampart, The Noxious Glade, The
Park, The Pillar of Ash, The Red Reaches, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching Canyon,
The Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon Den,
The Talondeep Path, The Temple Gardens, The Temple of Atal'Hakkar, The
Tower of Arathor, The Trade Quarter, The Tundrid Hills, The Twin Colossals,
The War Quarter, The Weathered Nook, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Bluff, Thunder Ridge,
Thunderhorn Water Well, Tinker Town, Tiragarde Keep, Tirisfal Glades,
Tor'kren Farm, Tower of Althalaxx, Tower of Azora, Trade District, Tyr's
Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb,
Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley
of Spears, Valley of Spirits, Valley of Strength, Valley of Trials, Valley
of Wisdom, Valley of the Watchers, Valormok, Venture Co. Base Camp, Wailing
Caverns, Warrior's Terrace, Warsong Gulch, Waterspring Field, Wavestrider
Beach, Weazel's Crater, Webwinder Path, West Pillar, Western Plaguelands,
Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind Grove,
Whitereach Post, Wildbend River, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterspring, Yojamba Isle, Zul'Farrak, Zul'Gurub.

Next: P4, the next 25 entry records by the recomputed ranking, beginning with
Winterhoof Water Well. Count duplicate names as separate entries when present.
P5 covers run 19 onwards; this run has not shipped.


### 2026-11-18, P4, run 20 of about 37

Reviewed the next 25 vanilla entries, Winterhoof Water Well through Circle of
Outer Binding, after recomputing the remaining article ranking. All 25 names
have one vanilla entry each. Revised 24 and removed Witherbark Caverns, a
planned beta location. Coverage is now 499 of 915 surviving vanilla entries,
with 416 left. The cumulative 499-name list also records four removed names;
duplicate surviving entries account for the difference, as explained in run 19.
No Forever entry was changed. No separate Classic article existed for any of
these 25 place titles. The database, parsed tables with schemas, and wiki
extracts remain in temporary storage.

**Every entry checked.** The following also records the supported parts that
were retained. Quest and creature ids refer to cmangos 1.12.1.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| Winterhoof Water Well | Kept the southern well; replaced invented ownership customs with goblin poisoning, guards and cleansing preparations | Quests 748 and 754; place article separates later Grimtotem poisoning. No ritual outcome disclosed |
| Witherbark Caverns | Removed the entry. The village's real cave remains described under Witherbark Village | Place article is explicitly Removedfrombeta; identifying it with the village cave is labelled speculation. No separate seed or ledger row existed |
| Witherbark Village | Kept trolls and their village; removed invented historical grievance and replaced it with the lake, cave and alliance against Hammerfall | Quest 677; village article's original geography and inhabitants |
| Zoram'gar Outpost | Kept the Horde coastal camp; replaced the absolute isolation claim with its documented threats and research | Quests 235, 824 and 6641; creature 12736. No later harbour, inn or commander imported |
| Zul'Mashar | Corrected wholesale Scourge occupation to living Mossflayer trolls threatened by infection | Quest 6024; creature spawns around 10822 include humanoid scouts, cannibals and shadowhunters, plus undead Infiltrator Hameya. Hameya's plea supplies the threat without revealing a quest outcome |
| Zun'watha | Corrected abandoned ruins to an occupied Witherbark settlement; described Nimboya's stated grievance | Quest 2932; original hideskinner and venomblood spawns near creature 8219. The article's abandonment claim cites Cataclysm |
| Ahn'Qiraj | Kept the city, C'Thun and historical sealing. Removed the absolute currently-sealed state, invented weakening and claim that titans could only imprison Old Gods | Place article's original game section and The War of the Shifting Sands short story; no gate-opening or raid outcome disclosed |
| Astranaar | Kept island, lake and Alliance services. Removed forest-wide command and busiest-settlement claims; added the immediate furbolg threat | Quest 1054; place article's original geography and facilities |
| Bael Modan | Kept dwarven excavation and tauren conflict. Removed universal archaeological motives and the claim of equally sincere positions; used Gann's actual account | Quests 843 and 846; creature 3392 is Prospector Khazgorm of the Explorers' League |
| Balia'mah Ruins | Corrected Bloodscalp occupants to Skullsplitters. Removed the unsupported antiquity and strategic effects of the tribal war | Quest 585 explicitly locates Skullsplitter trophy skulls at Balia'mah; place geography |
| Ban'ethil Barrow Den | Kept Gnarlpine invasion and endangered sleeping druids. Replaced broad history with the Relics of Wakening needed for their ritual | Quests 475 and 483; creature 2078. No awakening outcome disclosed |
| Bitter Reaches | Corrected naga-held coast to northeastern terrain with wildlife and giants. Removed speculative proximity to Zin-Azshari | Place article's pre-Cataclysm description; creatures 6146-6148 have elite rank in 1.12 |
| Blackrock Pass | Kept the Redridge-Steppes route and border gate. Removed invented Stonewatch construction purpose and its claimed effect on the pass | Place article, with its pre-2.3.0 elite-area history |
| Bladefist Bay | Kept the bay's position near Skull Rock. Removed the later harbour and Kargath's later-published gladiator escape account | Place article dates harbour construction to Cataclysm; Kargath article sources the detailed slave revolt to Lords of War |
| Bones of Grakkarond | Kept the bones, battle and anubisath reverence. Clarified that Ossirian grounded the dragon and the gathered forces killed him; removed the unsupported construct-origin claim | Original Game Guide/Monsters of Ahn'Qiraj account; quest 8315 confirms the bones in Silithus. Did not import Grakkarond's later projection NPC |
| Bough Shadow | Kept the Dream portal and green guardians. Removed the unsupported claim that they attack one another; described original drakes | Place article; creatures 5314 and 12498 are elite dragonkin, with original spawns; no Nightmare Incursion or later tree-origin story |
| Boulderfist Hall | Kept ogre occupation. Removed largest-power and collapse-causation claims; described Kor'gresh's stolen wand | Quest 693 and creature 2793. No elite or roaming claim added for Kor'gresh |
| Bronzebeard Encampment | Replaced invented Cenarion objections and titan digging with glyph research and enquiries about Natalia. Corrected faction from Alliance to Neutral | Quests 8304, 8309 and 8310; creatures 15170 and 15171 both faction 35; article dates camp to 1.8.0 |
| Browman Mill | Corrected grain mill to lumber mill; removed invented involvement in plague shipments. Kept haunted Scourge occupation | Place article; original undead spawns north of Light's Hope Chapel. Stephen Browman is absent from the 1.12 creature table and his article explicitly dates him to 4.0.3a, so he was not added |
| Burning Blade Coven | Kept cult, cave and new recruits. Removed speculative faction motives and relative military strength; described demons, Yarrog and the medallion task | Quests 794 and 805; creature 3183 and original cave inhabitants |
| Cenarion Hold | Kept neutral recruitment, silithid defense and thinly spread forces. Removed only-settlement and gate-opening assumptions; described Larksbane's research and the commander's concern | Quests 8275, 8276, 8284 and 8304; Dearest Natalia's original dialogue identifies his missing wife |
| Champions' Hall | Kept rank-dependent access and quartermasters; removed invented diplomacy and title-origin claims. Specified Knight rank for the portal | Place article dates removal of rank requirement to 2.0.1; Honor system (Classic); original hall vendors |
| Circle of East Binding | Corrected Witherbark guardians to water elementals; removed invented pre-Arathor dating | Quest 651; fourteen Cresting Exile spawns at the binding stone; original circle article |
| Circle of Inner Binding | Replaced unknown purpose and arcane speculation with the strongest binding stone and earth guardians | Quest 651; Rumbling Exile spawns at the stone; original circle article |
| Circle of Outer Binding | Corrected cultists and unguarded power to air elemental guardians and the binding key | Quest 651; twelve Thundering Exile spawns at the stone. No later quest resolution revealed in any circle entry |

**Ledger and checks.** Added 49 vanilla rows and one grammatical fragment,
Titles. All 50 were absent before addition and the validator reported them as
missing. The fragment surfaced in Corrahn's Dagger after the lowercase use in
Champions' Hall was removed; that existing entry was not edited. Names have
specific creature, quest or original-area evidence, including full character
names as well as the shortened forms the extractor reads. The ledger now has
1,907 rows. No row was deleted or re-verdict changed, no new check was added,
and no rate budget changed, so no new negative test was required.

Gates: default validation and all nine CI configurations pass with Lua 5.4.8,
with no warnings. check-gaps passes with 43 explained gaps. Touched-file prose
lint has no new findings: Cities, the ledger and this log are clean; Eastern
Kingdoms remains at 8 RHYTHM findings, Locales at 2, and Kalimdor falls from 6
to 5. git diff --check is clean.

Martin has explicitly requested the next 1.2.x release after this dev push.
The release preparation will record runs 19 and 20 in the changelog and update
the shipped-run summary so P5 does not repeat them. The sweep itself remains
unfinished; no P5 work is claimed by this release.

**Entries covered so far (499 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Alterac Mountains, Alterac
Valley, Alther's Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal,
Angerfang Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi
Highlands, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine,
Badlands, Bael Modan, Bael'dun Digsite, Balia'mah Ruins, Balnir Farmstead,
Ban'Thallow Barrow Den, Ban'ethil Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Bitter Reaches, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Bladefist Bay,
Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's Ledge, Bolgan's
Hole, Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town Hall,
Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning Steppes,
Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp Mojache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Circle of East
Binding, Circle of Inner Binding, Circle of Outer Binding, Circle of West
Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley, Corrahn's
Dagger, Crown Guard Tower, Dalaran Crater, Dalson's Tears, Dandred's Fold,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Deadeye Shore, Deadwind
Pass, Deadwood Village, Deathknell, Deeprun Tram, Deepwater Tavern,
Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul
Rock, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood,
Dustfire Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge
Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary,
Ethel Rethor, Everlook, Faldir's Cove, Falfarren River, Feathermoon
Stronghold, Felpaw Village, Felwood, Feralas, Field of Giants, Flame Crest,
Forest Song, Forlorn Ridge, Fray Island, Freewind Post, Frostfire Hot
Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's Pumpkin Farm,
Gadgetzan, Galak Hold, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker
Post, Gnomeregan, Gol'Bolar Quarry, Gold Coast Quarry, Gold Road, Greenpaw
Village, Grim Batol, Grimtotem Post, Grol'dom Farm, Grom'gol Base Camp,
Grommash Hold, Grove of the Ancients, Gunstan's Post, Haldarr Encampment,
Hall of Legends, Hammerfall, Hearthglen, Helm's Bed Lake, Hetaera's Clutch,
High Rise, Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills,
Hiri'watha, Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake,
Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jadefire Run,
Jademir Lake, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Kargath, Kharanos, Kodo Graveyard, Kodo
Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake Everstill, Lake
Falathim, Lake Mennar, Lakeridge Highway, Lakeshire, Lakkari Tar Pits,
Land's End Beach, Lethlor Ravine, Light's Hope Chapel, Loch Modan,
Lordamere Internment Camp, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Maraudon, Mardenholde Keep, Marshal's Refuge,
Menethil Bay, Menethil Harbor, Menethil Keep, Mirage Flats, Mirage Raceway,
Mirkfallon Lake, Mirror Lake Orchard, Misty Pine Refuge, Misty Reed Post,
Misty Reed Strand, Misty Valley, Molten Core, Moonbrook, Moonwell, Mor'shan
Rampart, Morgan's Vigil, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas,
Nesingwary's Expedition, Night Web's Hollow, Nighthaven, Noonshade Ruins,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town,
Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Pestilent Scar, Pool
of Tears, Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien
Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Ratchet, Raven Hill,
Raven Hill Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul,
Razormane Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley, Rethress
Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of
Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins
of Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow Watch,
Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post,
Scholomance, Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill,
Seradane, Shadow Grave, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor,
Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest, Silverwind
Refuge, Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold Road,
Southern Savage Coast, Southfury River, Southpoint Tower, Southshore,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Starfall Village, Steamwheedle Port, Stillwater Pond, Stonard,
Stonemaul Ruins, Stonesplinter Valley, Stonetalon Mountains, Stonetalon
Peak, Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormwind City, Stormwind Keep, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade,
Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of
Arkkoran, Temple of the Moon, Terror Wing Path, Terrordale, Thalanaar,
Thalassian Base Camp, Thandol Span, The Altar of Zul, The Apothecarium, The
Barrens, The Bulwark, The Charred Vale, The Crystal Shore, The Dagger
Hills, The Dark Portal, The Dead Field, The Deadmines, The Decrepit Ferry,
The Drag, The Dry Hills, The Farstrider Lodge, The Forgotten Coast, The
Forgotten Pools, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Harborage, The Headland, The High Seat, The Hinterlands,
The Hushed Bank, The Infectis Scar, The Jansen Stead, The Loch, The Mage
Quarter, The Magic Quarter, The Marris Stead, The Master's Cellar, The
Maul, The Merchant Coast, The Mor'shan Rampart, The Noxious Glade, The
Park, The Pillar of Ash, The Red Reaches, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching Canyon,
The Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon Den,
The Talondeep Path, The Temple Gardens, The Temple of Atal'Hakkar, The
Tower of Arathor, The Trade Quarter, The Tundrid Hills, The Twin Colossals,
The War Quarter, The Weathered Nook, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley, Thondroril
River, Thousand Needles, Three Corners, Thunder Bluff, Thunder Ridge,
Thunderhorn Water Well, Tinker Town, Tiragarde Keep, Tirisfal Glades,
Tor'kren Farm, Tower of Althalaxx, Tower of Azora, Trade District, Tyr's
Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb,
Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley
of Spears, Valley of Spirits, Valley of Strength, Valley of Trials, Valley
of Wisdom, Valley of the Watchers, Valormok, Venture Co. Base Camp, Wailing
Caverns, Warrior's Terrace, Warsong Gulch, Waterspring Field, Wavestrider
Beach, Weazel's Crater, Webwinder Path, West Pillar, Western Plaguelands,
Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind Grove,
Whitereach Post, Wildbend River, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterhoof Water Well, Winterspring, Witherbark
Caverns, Witherbark Village, Yojamba Isle, Zoram'gar Outpost, Zul'Farrak,
Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 entry records by the recomputed ranking, starting with
Craftsmen's Terrace. P5 remains pending. The separately authorized release
will include runs 19 and 20.


### 2026-11-18, release 1.2.14

Martin explicitly requested one further bounded pass, followed by a dev push,
a merge into main and the next 1.2.x release. This release includes P4 runs 19
and 20: 50 entries reviewed, 47 revised, two removed and one cleared unchanged.
Both version strings are 1.2.14. CHANGELOG.md records only these previously
unreleased runs; P5 must not repeat them and now covers run 21 onwards.

The sweep remains in progress at 499 of 915 surviving vanilla entries.
Craftsmen's Terrace is next, with 416 entries left. P5 has not started.
Release preparation follows PUBLISHING.md: validate all nine configurations,
check gaps and touched-file prose, build and inspect the zip, push dev and
confirm CI for its exact SHA, then merge to main and publish the annotated tag.

Release checks passed on all nine client configurations, with 43 explained
gaps and clean prose lint on the release files. One existing Core.lua comment
was rephrased to clear its comma-so rate finding; runtime behavior is unchanged.
The local 1.2.14 zip passed the package checks and contains the matching TOC,
Core version and license, with no development tools. Sweep commit d34239d
passed GitHub Checks for that exact SHA before release preparation.

### 2026-11-18, P4, run 21 of about 37

Reviewed the next 25 vanilla entries, Craftsmen's Terrace through Hive'Ashi,
after recomputing the remaining article ranking. All 25 have one vanilla
entry each; all were revised, none removed. Coverage is now 524 of 915
surviving vanilla entries, with 391 left. No Forever entry changed. None of
these place titles has a separate Classic article. Used the original-game
sections and 1.12 quest text where retail leads describe later occupants.
The database, schema-preserving parsed tables and article extracts remain in
temporary storage. This run has not shipped; P5 covers run 21 onwards.

**Every entry checked.** Quest and creature ids refer to cmangos 1.12.1.
The retained claims and rejected suspects are recorded here for the next run.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| Craftsmen's Terrace | Kept workshops and trainers; removed invented hostility to manufacturing and architectural explanation. Added original inn and trades | Place article; creatures 4212, 4213 and 6735 with Darnassus spawns. Later worgen and profession additions excluded |
| Crystal Lake | Kept murlocs; removed largest-lake, irrigation, migration and scholarly-attitude claims. Described kelp collection | Quest 112 explicitly places lake east of Goldshire and describes the kelp. Later homestead excluded |
| Dabyrie's Farmstead | Kept working family farm; removed unprotected-road and three-sided-war claims. Corrected faction to Alliance and described militia and an attributed grievance | Place article's original inhabitants; quest 1164. Later Syndicate occupation excluded |
| Darkcloud Pinnacle | Kept Grimtotem mesas; removed unsupported defensive equivalence with Freewind Post. Described bridges and guarded correspondence | Original place geography and images; quest 5064. No later Legion assault or novel details |
| Darrowshire | Kept destroyed village and haunted ruins; removed invented public argument and the absolute death of every defender. Described survivors seeking Pamela | Quests 5601, 5210 and 5211; place article. No battle or quest resolution disclosed |
| Deep Elem Mine | Corrected Forsaken occupation to worgen under the former foreman; removed invented Dark Iron and apothecary mining history | Quest 424; creature 1972 and nearby Moonrage spawns. Forsaken possession is an objective, not the starting state |
| Demon Fall Canyon | Kept Grom's sacrifice and end of the blood curse; replaced tomb with monument. Removed historical superlative, unsupported naming attribution and speculation about the Warsong | Place account of Warcraft III confrontation; quest 8150 explicitly names monument and festival offerings |
| Dream Bough | Kept portal and green guardians; removed broad claims about the Dream, sleeping druids and dragon secrecy. Described island and tree | Place geography; original Lethlas and Jademir guardian spawns. Later tree-origin explanation and active travel portal excluded |
| Drywhisker Gorge | Kept kobolds near Hammerfall; removed unsupported threat to Horde and candle generalization. Described crystal shard and bloodstone | Quests 642 and 627. No revelation about Myzrael or quest outcome |
| Dun Algaz | Kept tunnel route and Dragonmaw threat; replaced unsourced construction and settlement narrative with current threat to Menethil access | Quest 455; original-game place section |
| Felstone Field | Kept western plague farm and cauldron. Corrected destruction request to sampling and counteragent research | Quests 5216 and 5217; original place article |
| Fenris Isle | Corrected worgen occupation to Rot Hide gnolls and Scourge; removed invented attraction for fugitives | Quests 443 and 442; original-game place section. Worgen occupation belongs to Cataclysm |
| Fenris Keep | Kept Thule and gnolls; removed unsupported scale of garrison, apprentice characterization and comparison with Kel'Thuzad. Described Alaric's plight | Quests 446 and 460; creature 1947. No rescue outcome disclosed |
| Fire Scar Shrine | Corrected satyrs to demons and Ilkrud; removed invented Elune shrine history and ritual motive | Quest 973; creature 3664; place geography. Correct source is The Tower of Althalaxx (5), not (6) |
| Firewatch Ridge | Kept Dark Iron occupation; removed unsupported claims about all occupants serving Ragnaros directly and elemental hostility. Described golems, spiders and cultist cave | Place article dates removal of elite area to 2.3.0; creatures 5861 and 5862 have elite rank |
| Gahrron's Withering | Kept plague farm; removed invented family background and reductive campaign motive. Described ghost guards and toxin research | Quests 5225 and 5226; original place section. Later prior name and novel details excluded |
| Gallows' Corner | Corrected southern route and Syndicate implication to ogre-held crossroads near Alterac ruins; removed invented age of name | Original place description and ruined tower; no no-quest or RPG-only claim carried over |
| Gnarlpine Hold | Kept hostile furbolg hold; removed invented motives, rituals and night elf attitude. Described Ursal's role in the sleeping-druid problem | Quest 486; creature 2039 and nearby original furbolg spawns. Ursal has waypoint movement and normal rank; no stationary or elite claim made. Retail demon invasion excluded |
| Go'Shek Farm | Corrected Syndicate occupation and Hostile faction to Horde. Removed invented supply history; described Jorell and Alliance investigation | Quests 657-659; creatures 2618, 2619 and 2733, faction 83. Syndicate takeover is a later warfront state |
| Goldshire | Kept crossroads, inn and trades; removed invented mill, barracks, magistrate, clientele and explanation for troop shortage. Described local security concerns | Original place services; quests 40 and 11, creature 240. No retail flight path added |
| Gordunni Outpost | Kept ogre camp; removed unrelated Dire Maul exposition and vague strategic claim. Described scarred landscape and buried cobalt | Quests 2975 and 2987; original place geography. Later inhabitants and captive sasquatch excluded |
| Grimesilt Dig Site | Kept Dark Iron seizure; removed unsupported claim that this pit runs on slave labour. Described injured Dorius and trapped worker | Quests 3367 and 4449; place article. Quest 3368 puts the enslaved team at the Cauldron, so that fact was not moved to this dig |
| Growless Cave | Corrected bears to yeti; removed invented naming joke. Described Flame of Uzel and Frostmaw hunt | Quests 553 and 1136; creature 4504, normal rank. No permanent Frostmaw spawn or elite claim added; flame is present at 1.12 |
| Hammertoe's Digsite | Kept failed excavation and Dark Iron attack; removed unsupported trogg involvement, scale of League losses and motive | Quest 719; original place article. Hammertoe's fate and later quest revelations not disclosed |
| Hive'Ashi | Kept three desert hives; removed currently-sealed-city assumption and invented inference that the seal is failing. Added northern location and Swarming Pillar infestation | Original place geography and inhabitants; later destruction excluded |

**Ledger and checks.** Added 30 vanilla rows and three grammatical fragments,
Deep, Labourers and Wraiths. All 33 were asserted absent before addition, and
the validator first failed on their missing-term messages. Deep surfaced in
other existing entries after this run removed the lowercase use; those entries
were not edited. Harvest records the existing Harvest Golem usage. The ledger
now has 1,940 rows. No existing row was deleted or re-verdict changed, and no
check or rate budget was changed, so no new negative test was required.

Default validation and all nine CI configurations pass using Lua 5.4.8, with
zero errors and warnings. check-gaps passes with 43 explained gaps. Touched-file
prose lint has no new findings: Cities, the ledger and this log are clean;
Eastern Kingdoms remains at 8 RHYTHM findings, Kalimdor at 5 and Locales at 2.
git diff --check is clean. A before-and-after prose comparison confirms exactly
25 vanilla entry records changed and no removal or Forever change.

**Entries covered so far (524 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Alterac Mountains, Alterac
Valley, Alther's Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal,
Angerfang Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi
Highlands, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine,
Badlands, Bael Modan, Bael'dun Digsite, Balia'mah Ruins, Balnir Farmstead,
Ban'Thallow Barrow Den, Ban'ethil Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Bitter Reaches, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Bladefist Bay,
Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's Ledge, Bolgan's
Hole, Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town
Hall, Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp Mojache,
Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion
Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp, Circle of East
Binding, Circle of Inner Binding, Circle of Outer Binding, Circle of West
Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley, Corrahn's
Dagger, Craftsmen's Terrace, Crown Guard Tower, Crystal Lake, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Darrowshire,
Deadeye Shore, Deadwind Pass, Deadwood Village, Deathknell, Deep Elem
Mine, Deeprun Tram, Deepwater Tavern, Demon Fall Canyon, Desolace,
Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock,
Dream Bough, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Modr, Dun Morogh,
Durnholde Keep, Durotar, Duskwood, Dustfire Valley, Dustwallow Marsh,
Dwarven District, East Pillar, Eastern Plaguelands, Eastvale Logging Camp,
Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise, Elwynn Forest,
Emberstrife's Den, Emerald Sanctuary, Ethel Rethor, Everlook, Faldir's
Cove, Falfarren River, Feathermoon Stronghold, Felpaw Village, Felstone
Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of Giants, Fire
Scar Shrine, Firewatch Ridge, Flame Crest, Forest Song, Forlorn Ridge,
Fray Island, Freewind Post, Frostfire Hot Springs, Frostmane Hold,
Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gahrron's
Withering, Galak Hold, Gallows' Corner, Gallows' End Tavern, Garren's
Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village,
Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar
Quarry, Gold Coast Quarry, Gold Road, Goldshire, Gordunni Outpost,
Greenpaw Village, Grim Batol, Grimesilt Dig Site, Grimtotem Post, Grol'dom
Farm, Grom'gol Base Camp, Grommash Hold, Grove of the Ancients, Growless
Cave, Gunstan's Post, Haldarr Encampment, Hall of Legends, Hammerfall,
Hammertoe's Digsite, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High
Rise, Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills,
Hiri'watha, Hive'Ashi, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironforge, Ironstone Camp, Isle of Dread, Itharius's Cave, Jadefire
Run, Jademir Lake, Jaggedswine Farm, Jaguero Isle, Janeiro's Point,
Jangolode Mine, Jerod's Landing, Jintha'Alor, Kargath, Kharanos, Kodo
Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake
Everstill, Lake Falathim, Lake Mennar, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lethlor Ravine, Light's Hope Chapel,
Loch Modan, Lordamere Internment Camp, Lushwater Oasis, Maestra's Post,
Magram Village, Malaka'jin, Malden's Orchard, Maraudon, Mardenholde Keep,
Marshal's Refuge, Menethil Bay, Menethil Harbor, Menethil Keep, Mirage
Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake Orchard, Misty Pine
Refuge, Misty Reed Post, Misty Reed Strand, Misty Valley, Molten Core,
Moonbrook, Moonwell, Mor'shan Rampart, Morgan's Vigil, Mosshide Fen,
Mulgore, Mystic Ward, Naxxramas, Nesingwary's Expedition, Night Web's
Hollow, Nighthaven, Noonshade Ruins, North Tide's Hollow, Northfold Manor,
Northpass Tower, Northridge Lumber Camp, Northshire Valley, Northshire
Vineyards, Northwatch Hold, Old Town, Olsen's Farthing, Oneiros, Onyxia's
Lair, Orgrimmar, Pestilent Scar, Pool of Tears, Purgation Isle, Pyrewood
Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar
Isle, Raptor Grounds, Ratchet, Raven Hill, Raven Hill Cemetery, Ravenholdt
Manor, Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red
Cloud Mesa, Redridge Canyons, Redridge Mountains, Refuge Pointe,
Remtravel's Excavation, Render's Valley, Rethress Sanctum, Roguefeather
Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins of Alterac,
Ruins of Andorhal, Ruins of Constellas, Ruins of Lordaeron, Ruins of
Mathystra, Rut'theran Village, Sandsorrow Watch, Sardor Isle, Scalebeard's
Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance, Scuttle Coast,
Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane, Shadow Grave,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shok'Thokar, Silithus, Silverpine Forest, Silverwind Refuge, Silverwing
Outpost, Sishir Canyon, Skull Rock, Sofera's Naze, Solliden Farmstead,
Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's Run, Southbreak
Shore, Southern Barrens, Southern Gold Road, Southern Savage Coast,
Southfury River, Southpoint Tower, Southshore, Splintertree Post,
Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog Cave, Starfall
Village, Steamwheedle Port, Stillwater Pond, Stonard, Stonemaul Ruins,
Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak, Stonewatch,
Stonewatch Keep, Stonewrought Dam, Stonewrought Pass, Stormwind City,
Stormwind Keep, Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock
Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis
Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran,
Temple of the Moon, Terror Wing Path, Terrordale, Thalanaar, Thalassian
Base Camp, Thandol Span, The Altar of Zul, The Apothecarium, The Barrens,
The Bulwark, The Charred Vale, The Crystal Shore, The Dagger Hills, The
Dark Portal, The Dead Field, The Deadmines, The Decrepit Ferry, The Drag,
The Dry Hills, The Farstrider Lodge, The Forgotten Coast, The Forgotten
Pools, The Great Forge, The Great Lift, The Green Belt, The Greymane Wall,
The Harborage, The Headland, The High Seat, The Hinterlands, The Hushed
Bank, The Infectis Scar, The Jansen Stead, The Loch, The Mage Quarter, The
Magic Quarter, The Marris Stead, The Master's Cellar, The Maul, The
Merchant Coast, The Mor'shan Rampart, The Noxious Glade, The Park, The
Pillar of Ash, The Red Reaches, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching Canyon,
The Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon
Den, The Talondeep Path, The Temple Gardens, The Temple of Atal'Hakkar,
The Tower of Arathor, The Trade Quarter, The Tundrid Hills, The Twin
Colossals, The War Quarter, The Weathered Nook, The Writhing Haunt, The
Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thousand Needles, Three Corners, Thunder Bluff, Thunder
Ridge, Thunderhorn Water Well, Tinker Town, Tiragarde Keep, Tirisfal
Glades, Tor'kren Farm, Tower of Althalaxx, Tower of Azora, Trade District,
Tyr's Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's
Tomb, Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor,
Valley of Spears, Valley of Spirits, Valley of Strength, Valley of Trials,
Valley of Wisdom, Valley of the Watchers, Valormok, Venture Co. Base Camp,
Wailing Caverns, Warrior's Terrace, Warsong Gulch, Waterspring Field,
Wavestrider Beach, Weazel's Crater, Webwinder Path, West Pillar, Western
Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear Crag,
Winterfall Village, Winterhoof Water Well, Winterspring, Witherbark
Caverns, Witherbark Village, Yojamba Isle, Zoram'gar Outpost, Zul'Farrak,
Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 entry records by the recomputed ranking, starting with
Hive'Regal. Count duplicate names as separate records. P5 remains pending.

### 2026-11-19, P4, run 22 of about 37

Reviewed the next 25 vanilla entries, Hive'Regal through Raptor Ridge, after
recomputing the remaining article ranking. All 25 have one vanilla record;
all were revised, none removed. Coverage is now 549 of 915 surviving vanilla
entries, with 366 left. No Forever entry changed. None of the selected places
has a separate Classic article; Moonglade (Classic) is only a redirect to
Moonglade. Original-game sections, 1.12 quest text and original creature
records settled the claims. Database and wiki extracts remain in temporary
storage. P5 remains pending and covers run 21 onwards; this run has not shipped.

**Every entry checked.** Quest and creature ids refer to cmangos 1.12.1.

| Entry | Finding and disposition | Evidence |
|---|---|---|
| Hive'Regal | Kept southern hive; removed largest-hive and continually revised map claims. Described the scout's intelligence report | Original place geography and cave entrance; quest 8738, creature 15609. No Natalia revelation or later destruction |
| Hive'Zora | Corrected northern location to western Silithus; removed invented tunnel link and migration from this hive to Un'Goro | Original place geography and inhabitants; quest 8534, creature 15610 |
| Ironband's Excavation Site | Kept trogg invasion; removed unsupported titan identification, expense argument and lower works. Described carved idols and blastpowder request | Quests 297, 298 and 436; original place section; creatures 1344 and 1345. Retail Gathering Idols is quest 26961 and was not retained as a citation |
| Irontree Cavern | Kept corrupted treants in the northern forest; removed invented druid reaction and unprecedented-hostile-forest claim | Original place description; creatures 7100 and 7101 with original spawns. Later goblin mining excluded |
| Jaedenar | Kept Shadow Council, Legion and Shadow Hold; described protective braziers. Removed naming explanation and chief-strategist title because their cited source was later | Quests 5155 and 5157. Jaedenar Awaits is quest 28152, added in 4.0.3a, so neither that reference nor its naming claim remains |
| Karazhan | Kept Medivh's tower and First War death; removed invented Guardian construction, magical-instrument claim, expedition accounts and future plans | Original place geography; The Last Guardian, published before WoW, for Medivh and Khadgar. No later raid occupants or Legion construction account |
| Lake Al'Ameth | Kept lake south of Dolanaar; removed largest-lake superlative and cultural building claims. Described timberlings and Denalan's research | Quests 918 and 919; creature 2080; original place geography |
| Lost Point | Corrected vague overrun southern outpost to western watchtower with Theramore deserters. Removed naming speculation and unrelated dragonkin claim | Quest 1286; creature 5089; place article. The current Deserters (1) article is quest 27287, so it was not retained as a citation |
| Manor Mistmantle | Replaced invented noble family and departed wealth with Stalvan, ghouls and the investigation of his past | Quests 67 and 98; creature 315 is undead, normal rank and stationary. Original place section; later Wolf Cult and wolves excluded. No quest resolution disclosed |
| Mazthoril | Corrected location beneath Frostsaber Rock to central Winterspring; removed unsupported flight-wide lack of direction and Malygos digression. Described blue dragonkin, Haleh and runes | Quest 5160; creature 10929; original place section. No attunement outcome disclosed |
| Mist's Edge | Corrected southern coast to the long coast north from Auberdine; removed invented clearing fog and unrelated ruin narrative | Original coast description; quests 4723 and 4727-4731 describe stranded creatures and murlocs. Later settlements and cultist camp excluded |
| Mo'grosh Stronghold | Kept northeastern ogre caves; removed invented new organization and mysterious artifact. Described ogre types and mined crystals | Quest 278; original creatures 1178-1183 include elite brutes, enforcers, shamans and mystics. No later Twilight's Hammer leader or elementium |
| Moon Horror Den | Kept cave, raging owlbeasts and mountain obstruction; removed unsupported creation account and only-place-to-shop assertion | Original place description and quest 4521; creature 7451 with original spawns. Later Ursius occupancy excluded |
| Moonglade | Kept shared druid sanctuary, Remulos and access; removed absolute absence of fighting, invented universal harmony and unsupported account of Malfurion's present body. Added documented internal tensions | Quests 5921 and 5922 explicitly welcome both races and identify tension between Remulos and Staghelm; original geography. No later festival or novel state imported |
| Morgan's Plot | Kept graveyard behind Karazhan; removed invented missing records, tower expeditions and speculation about burials. Described church, crypt and undead | Place description's original Unliving Residents; creature 12380 and original spawns. Later pet trainer, spirits and burials excluded |
| Mosh'Ogg Ogre Mound | Kept eastern ogre occupation; removed invented strategic motives and road effects. Described Mai'Zoth and the Mind's Eye | Quest 591 explicitly identifies the ogre mage, relic and Darkspear history; original mound. Later Lukou and serpent events excluded |
| Nethergarde Keep | Kept Kirin Tor portal watch; removed VanCleef construction story, financing details and invented neglect. Described ongoing research and supplies | Warcraft II: Beyond the Dark Portal manual explicitly gives the Kirin Tor construction and purpose; quests 1477 and 1395. Later novel construction detail excluded |
| Nightmare Vale | Kept blighted Tirisfal valley; removed unsupported deepest-plague and agricultural superlatives. Described darkhounds, bats and Ressan | Original place description; creature 10357 has rare rank and a stationary spawn. No roaming or elite claim added |
| Nijel's Point | Kept northern Alliance outpost; removed no-resources and anti-Horde founding claims. Described Pentigast's actual centaur policy | Quests 1382 and 1385; creature 5396; original place section. No retail transport routes added |
| Northshire Abbey | Kept clerical home, First War destruction and current recruits; removed unsupported origin of the Church and sweeping paladin history | Warcraft I orc mission at Northshire; quests 783, 18 and 3100; original place section. No later trainer classes or Season of Discovery quests |
| Owl Wing Thicket | Corrected central valley to southern caves; removed vague secrecy claim. Described Ranshalla's investigation without its revelation | Quests 979, 4721 and 4901; creature 10300. Later replacement quest giver excluded |
| Plaguewood | Kept blighted forest and Naxxramas overhead; removed unsupported claim that nobody can act. Described Scourge structures and guarded entrance | Original place section and images; quests 9121-9123 explicitly describe the rune portal and arcane cloaking. No raid outcome disclosed |
| Pools of Arlithrien | Kept pools, moonwell and furbolg threat; replaced vague sacred-water and commentary claims with patrol difficulty | Quest 933, Crown of the Earth (4), gives the moonwell and Gnarlpine threat; original place geography |
| Pools of Vision | Corrected tauren spirit-walker shrine to Forsaken caves beneath Spirit Rise. Removed invented formal mechanism for ancestor communication | Quest 853 explicitly locates Zamah beneath the shamans; creatures 3044, 3047 and 3419 with original trainer roles and spawns. Later comics and RPG speculation excluded |
| Raptor Ridge | Kept raptors; removed population and size comparisons and invented League research connection. Described ridge, cave and rare matriarch | Original place geography; creature 1140 has rare rank and waypoint movement, so no stationary guard or elite claim remains |

**Ledger and checks.** Added 32 vanilla rows and four grammatical fragments:
Blue, Couriers, Huge and Pools. All 36 rows were asserted absent and the
validator reported them as missing before they were added. Names have specific
quest, creature or original-place evidence; abbreviated names are tied to the
actual subject, including Unliving Resident. The ledger now has 1,976 rows.
No row was deleted or re-verdict changed, no check was added and no rate budget
changed, so no new negative test was required.

Default validation and all nine CI configurations pass on Lua 5.4.8 with zero
errors and warnings. check-gaps passes with 43 explained gaps. All touched
files were prose-linted: Cities, the ledger and this log are clean; existing
RHYTHM counts remain Eastern Kingdoms 8, Kalimdor 5 and Locales 2. Two new
sentence runs were reworded within this batch to restore the baseline.
git diff --check is clean. Before-and-after prose comparison confirms exactly
25 vanilla entry records revised, with no entries removed or Forever changes.

**Entries covered so far (549 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Alterac Mountains, Alterac
Valley, Alther's Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal,
Angerfang Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi
Highlands, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine,
Badlands, Bael Modan, Bael'dun Digsite, Balia'mah Ruins, Balnir Farmstead,
Ban'Thallow Barrow Den, Ban'ethil Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Bitter Reaches, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Bladefist Bay,
Blasted Lands, Bloodhoof Village, Bloodvenom Post, Bogen's Ledge, Bolgan's
Hole, Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town
Hall, Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp Mojache,
Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion
Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp, Circle of East
Binding, Circle of Inner Binding, Circle of Outer Binding, Circle of West
Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley, Corrahn's
Dagger, Craftsmen's Terrace, Crown Guard Tower, Crystal Lake, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Darrowshire,
Deadeye Shore, Deadwind Pass, Deadwood Village, Deathknell, Deep Elem
Mine, Deeprun Tram, Deepwater Tavern, Demon Fall Canyon, Desolace,
Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock,
Dream Bough, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Modr, Dun Morogh,
Durnholde Keep, Durotar, Duskwood, Dustfire Valley, Dustwallow Marsh,
Dwarven District, East Pillar, Eastern Plaguelands, Eastvale Logging Camp,
Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise, Elwynn Forest,
Emberstrife's Den, Emerald Sanctuary, Ethel Rethor, Everlook, Faldir's
Cove, Falfarren River, Feathermoon Stronghold, Felpaw Village, Felstone
Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of Giants, Fire
Scar Shrine, Firewatch Ridge, Flame Crest, Forest Song, Forlorn Ridge,
Fray Island, Freewind Post, Frostfire Hot Springs, Frostmane Hold,
Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gahrron's
Withering, Galak Hold, Gallows' Corner, Gallows' End Tavern, Garren's
Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village,
Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar
Quarry, Gold Coast Quarry, Gold Road, Goldshire, Gordunni Outpost,
Greenpaw Village, Grim Batol, Grimesilt Dig Site, Grimtotem Post, Grol'dom
Farm, Grom'gol Base Camp, Grommash Hold, Grove of the Ancients, Growless
Cave, Gunstan's Post, Haldarr Encampment, Hall of Legends, Hammerfall,
Hammertoe's Digsite, Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High
Rise, Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills,
Hiri'watha, Hive'Ashi, Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise,
Idlewind Lake, Iris Lake, Ironband's Excavation Site, Ironforge, Ironstone
Camp, Irontree Cavern, Isle of Dread, Itharius's Cave, Jadefire Run,
Jademir Lake, Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point,
Jangolode Mine, Jerod's Landing, Jintha'Alor, Karazhan, Kargath, Kharanos,
Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake
Al'Ameth, Lake Everstill, Lake Falathim, Lake Mennar, Lakeridge Highway,
Lakeshire, Lakkari Tar Pits, Land's End Beach, Lethlor Ravine, Light's
Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point, Lushwater
Oasis, Maestra's Post, Magram Village, Malaka'jin, Malden's Orchard, Manor
Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge, Mazthoril,
Menethil Bay, Menethil Harbor, Menethil Keep, Mirage Flats, Mirage
Raceway, Mirkfallon Lake, Mirror Lake Orchard, Mist's Edge, Misty Pine
Refuge, Misty Reed Post, Misty Reed Strand, Misty Valley, Mo'grosh
Stronghold, Molten Core, Moon Horror Den, Moonbrook, Moonglade, Moonwell,
Mor'shan Rampart, Morgan's Plot, Morgan's Vigil, Mosh'Ogg Ogre Mound,
Mosshide Fen, Mulgore, Mystic Ward, Naxxramas, Nesingwary's Expedition,
Nethergarde Keep, Night Web's Hollow, Nighthaven, Nightmare Vale, Nijel's
Point, Noonshade Ruins, North Tide's Hollow, Northfold Manor, Northpass
Tower, Northridge Lumber Camp, Northshire Abbey, Northshire Valley,
Northshire Vineyards, Northwatch Hold, Old Town, Olsen's Farthing,
Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing Thicket, Pestilent Scar,
Plaguewood, Pool of Tears, Pools of Arlithrien, Pools of Vision, Purgation
Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire
Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet, Raven Hill,
Raven Hill Cemetery, Ravenholdt Manor, Razorfen Downs, Razorfen Kraul,
Razormane Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins
of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas,
Ruins of Lordaeron, Ruins of Mathystra, Rut'theran Village, Sandsorrow
Watch, Sardor Isle, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch
Post, Scholomance, Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel
Hill, Seradane, Shadow Grave, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's
Naze, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost,
South Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold Road,
Southern Savage Coast, Southfury River, Southpoint Tower, Southshore,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Starfall Village, Steamwheedle Port, Stillwater Pond, Stonard,
Stonemaul Ruins, Stonesplinter Valley, Stonetalon Mountains, Stonetalon
Peak, Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormwind City, Stormwind Keep, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch
Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil,
Temple of Arkkoran, Temple of the Moon, Terror Wing Path, Terrordale,
Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of Zul, The
Apothecarium, The Barrens, The Bulwark, The Charred Vale, The Crystal
Shore, The Dagger Hills, The Dark Portal, The Dead Field, The Deadmines,
The Decrepit Ferry, The Drag, The Dry Hills, The Farstrider Lodge, The
Forgotten Coast, The Forgotten Pools, The Great Forge, The Great Lift, The
Green Belt, The Greymane Wall, The Harborage, The Headland, The High Seat,
The Hinterlands, The Hushed Bank, The Infectis Scar, The Jansen Stead, The
Loch, The Mage Quarter, The Magic Quarter, The Marris Stead, The Master's
Cellar, The Maul, The Merchant Coast, The Mor'shan Rampart, The Noxious
Glade, The Park, The Pillar of Ash, The Red Reaches, The Royal Quarter,
The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The
Screeching Canyon, The Sepulcher, The Shattered Strand, The Shimmering
Flats, The Shrine of Aessina, The Stagnant Oasis, The Stockade, The
Tainted Scar, The Talon Den, The Talondeep Path, The Temple Gardens, The
Temple of Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The
Tundrid Hills, The Twin Colossals, The War Quarter, The Weathered Nook,
The Writhing Haunt, The Yorgen Farmstead, Theramore Isle, Thieves Camp,
Thistleshrub Valley, Thondroril River, Thousand Needles, Three Corners,
Thunder Bluff, Thunder Ridge, Thunderhorn Water Well, Tinker Town,
Tiragarde Keep, Tirisfal Glades, Tor'kren Farm, Tower of Althalaxx, Tower
of Azora, Trade District, Tyr's Hand, Uldaman, Uldum, Un'Goro Crater,
Undercity, Ursolan, Uther's Tomb, Valley of Bones, Valley of Fangs, Valley
of Heroes, Valley of Honor, Valley of Spears, Valley of Spirits, Valley of
Strength, Valley of Trials, Valley of Wisdom, Valley of the Watchers,
Valormok, Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace,
Warsong Gulch, Waterspring Field, Wavestrider Beach, Weazel's Crater,
Webwinder Path, West Pillar, Western Plaguelands, Westfall, Wetlands,
Whelgar's Excavation Site, Whisperwind Grove, Whitereach Post, Wildbend
River, Windbreak Canyon, Windshear Crag, Winterfall Village, Winterhoof
Water Well, Winterspring, Witherbark Caverns, Witherbark Village, Yojamba
Isle, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 entry records by the recomputed ranking, starting with
Raynewood Retreat. Count duplicate names as separate records. P5 remains pending.

### 2026-11-19, release 1.2.15

Martin explicitly requested a merge of dev into main and the next 1.2.x
release. This release includes P4 runs 21 and 22: 50 vanilla entries reviewed
and corrected, with no removals. Both version strings are 1.2.15, and
CHANGELOG.md records these previously unshipped findings. P5 must not repeat
them and now covers run 23 onwards.

The sweep remains in progress at 549 of 915 surviving vanilla entries.
Raynewood Retreat is next, with 366 entries left. P5 has not started.
Release preparation follows PUBLISHING.md: validate all nine client
configurations, check gaps and touched-file prose, build and inspect the zip,
push dev and verify CI for its exact SHA, then merge to main and publish the
annotated version tag.

Release checks passed on all nine client configurations with zero errors or
warnings. Gap checking reports 43 explained gaps, release-file prose lint
is clean, and git diff --check passes. The local 1.2.15 zip passed its package
checks, contains matching TOC and Core versions plus LICENSE, and excludes
development tools. The preceding sweep commit 03ecafe passed CI for its exact
SHA before release preparation.

### 2026-11-19, P4 run 23: Raynewood Retreat through the Drowned Reef

Reviewed the next 25 records by the recomputed ranking, beginning with
Raynewood Retreat. Each name has one vanilla entry. All 25 were revised;
none were removed. Coverage is now 574 of 915 surviving entries, with 341
left. This is the first unshipped run after release 1.2.15; P5 remains pending.

Checked main and Classic article titles with redirect following omitted,
then read the six redirected place targets separately. None of these place
titles has a separate Classic article. Current leads and later sections were
separated from original geography, original quests and pre-WoW history.
Replacement prose was checked against the schema-preserving cmangos 1.12.1
quest and creature tables. Raw source data and wiki extracts remain in /tmp.

| Entry | Result | Evidence |
|---|---|---|
| Raynewood Retreat | Replaced the eastern tower and immediate Horde siege with the great tree, original guardians, Ordanus and the moonwell | Quest 1088; creature 4273 and original protectors; place article separates the later tower and attack |
| Razor Hill | Kept crossroads and military role; removed invented administrative reach, centaur origin and shipwrecked garrison | Quests 784, 823, 830 and 840; creatures 3139 and 3142. No later flight path or rebellion |
| Revantusk Village | Corrected joined Horde to allied; removed invented choice of allies and added the fishing problem | Original pact in Troll Compendium; quest 7815; creature 14740. Formal membership is in the later section |
| Ruins of Eldarath | Kept ancient city and naga; removed the claim that all occupants are transformed Highborne and described arcane tablets | Quest 3449; creature 8408; original place section |
| Ruins of Jubuwal | Corrected coastal location to the inland road east of the arena; replaced broad empire history with Zanzil's followers and mixture | Quest 621; original ruin location. Linked Classic quest, not the faction disambiguation page |
| Ruins of Ordil'Aran | Added the original Dark Strand occupation and heartswood tree in place of generic ruins commentary | Quests 970 and 1738. Linked part 4 and the quest article; later furbolg occupation excluded |
| Ruins of Ravenwind | Corrected central jungle to northern Feralas; removed unsupported harpy-origin story | Quest 2879; creatures 5362-5366; original ruins and four flames. No later archaeology or Dream incursion |
| Ruins of Thaurissan | Corrected Dagran to the earlier sorcerer-thane; removed the claim that the city sank into Blackrock Depths | Original War of the Three Hammers history; quest 3701 and creature 8879. No relic revelations disclosed |
| Saldean's Farm | Removed invented militia protection arrangement; described occupied fields and stew ingredients | Quests 9, 36 and 38; creatures 233, 235 and 114. Later homeless refuge excluded |
| Sargeron | Removed oldest-ruin superlative and unsupported account of Desolace's destruction; added Hatefury occupants and reagents | Quests 1458, 1481 and 4783; original satyr spawns. No later Elune-relic quest |
| Serpent's Coil | Replaced basilisk rock formation with winding caves held by Allistarj and the Shadowsworn | Quest 2721; creature 7666 and its cave spawn; original place account. Later replacement occupant and amulet chest excluded |
| Shadow Hold | Kept cult stronghold and demons; replaced broad survival narrative with protected passages and Banehollow | Quest 5165; creature 9516; Dousing the Flames of Protection and Lord Banehollow Classic articles. No quest outcomes |
| Shatter Scar Vale | Kept infernal craters; removed strongest-corruption comparison and described the original investigation | Quest 5156 explicitly identifies the craters, war, road and research questions; original place geography |
| Southwind Village | Removed absolute death of every inhabitant and generic hive-expansion claim; described tortured spirits and Layo's investigation | Quest 1125 and creature 13220 at Valor's Rest; original village account. No later Horde camp |
| Staghelm Point | Removed speculative naming and unrelated family narrative; described tower, watcher, bronze drake and nearby cultists | Original place section; creatures 15169 and 15185 with original spawns. No later ruined tower or Alliance base |
| Stendel's Pond | Kept location, gnolls, skeletons and graves; removed speculation treated as a poisoned-water fact | Original place geography and visible remains; article presents the water claim only as an inference |
| Stormrage Barrow Dens | Replaced unsupported current-body and portal-connection claims with druid use and the Third War awakening | Original place and The Awakening of Stormrage Warcraft III mission. Later novel account and flight-form quest excluded |
| Strahnbrad | Kept Syndicate town; removed invented repeated raids and corrected long-before-plague timing | Quest 503 and original prisoner account; The Defense of Strahnbrad Warcraft III mission. Later Forsaken state and flight master excluded |
| Temple of Zin-Malor | Kept temple and Krellian; removed Azshara-capital conflation and sweeping naga ancestry; described the magical artifact | Quest 9362 and creature 8408; original temple location. No quest resolution disclosed |
| The Cape of Stranglethorn | Kept the geographic cape, removed the southernmost-playable-ground superlative | Quest 592 explicitly names the Cape of Stranglethorn, Crystal Shore and Aboraz; quest 621. The name is vanilla despite the later standalone zone; no split or new settlements imported |
| The Creeping Ruin | Replaced invented roots, destruction history and ranger practice with original slime occupation | Place article distinguishes former slimes from later spiders; original Hinterlands ruins |
| The Crossroads | Kept roads and gathering place; removed invented strategic absolute and later Northwatch raid | Quests 842 and 869; original inn and wind rider master. Place article dates the Northwatch attack to the eve of Cataclysm |
| The Dawning Isles | Kept plague-stricken islands; removed invented migration and uncontested murloc control | Original place description has both bog beasts and murlocs; later disappearance and Scarlet occupation excluded |
| The Dor'Danil Barrow Den | Corrected Dream disturbance to Forsaken poison and severed spirits | Quest 1012 explicitly attributes this account to Kayneth's vision; original undead and druid occupants |
| The Drowned Reef | Kept wrecks and naga; removed unsupported Sundering explanation and described submerged ruins and elven gems | Quests 662, 664 and 666. Linked Sunken Treasure part 2, not the unrelated later chest |

**Ledger and checks.** Added 30 vanilla rows and two grammatical fragments,
Shortly and Silithids. All 32 rows were asserted absent and observed failing
validation before addition. Names and abbreviated forms have specific creature,
quest or original-place evidence. The ledger now contains 2,008 rows. No row
was deleted or re-verdict changed, no check was added and no rate budget
changed, so no new negative test was required.

Default validation and all nine CI configurations pass on Lua 5.4.8 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log; existing RHYTHM counts are Eastern Kingdoms
7 (down from 8), Kalimdor 5 and Locales 2. A new cross-entry sentence run was
reworded within this batch. git diff --check passes. Before-and-after prose
comparison confirms exactly 25 vanilla records changed, with no removals or
Forever changes.

**Entries covered so far (574 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Alterac Mountains, Alterac
Valley, Alther's Mill, Ambermill, Amberstill Ranch, Ameth'Aran, Andorhal,
Angerfang Encampment, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi
Highlands, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine,
Badlands, Bael Modan, Bael'dun Digsite, Balia'mah Ruins, Balnir Farmstead,
Ban'Thallow Barrow Den, Ban'ethil Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Bay of Storms, Beezil's Wreck, Beggar's Haunt, Beren's
Peril, Bitter Reaches, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Bladefist Bay, Blasted
Lands, Bloodhoof Village, Bloodvenom Post, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall, Boulderslide
Cavern, Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brill, Brill Town Hall, Bronzebeard
Encampment, Browman Mill, Burning Blade Coven, Burning Steppes, Caer Darrow,
Camp Aparaje, Camp Boff, Camp E'thok, Camp Mojache, Camp Taurajo, Camp Wurg,
Cathedral Square, Cenarion Enclave, Cenarion Hold, Champions' Hall, Chill
Breeze Valley, Chillwind Camp, Circle of East Binding, Circle of Inner
Binding, Circle of Outer Binding, Circle of West Binding, Cleft of Shadow,
Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Craftsmen's Terrace,
Crown Guard Tower, Crystal Lake, Dabyrie's Farmstead, Dalaran Crater,
Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle, Darkshire, Darkshore,
Darkwhisper Gorge, Darnassus, Darrowshire, Deadeye Shore, Deadwind Pass,
Deadwood Village, Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater
Tavern, Demon Fall Canyon, Desolace, Diamondhead River, Dire Maul, Direforge
Hill, Dolanaar, Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul
Hold, Dreadmaul Rock, Dream Bough, Drywhisker Gorge, Dun Algaz, Dun Garok,
Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire Valley,
Dustwallow Marsh, Dwarven District, East Pillar, Eastern Plaguelands,
Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder
Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Feathermoon Stronghold, Felpaw
Village, Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field
of Giants, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Forest Song,
Forlorn Ridge, Fray Island, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostwhisper Gorge, Furlbrow's Pumpkin Farm, Gadgetzan, Gahrron's
Withering, Galak Hold, Gallows' Corner, Gallows' End Tavern, Garren's Haunt,
Garrison Armory, Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost
Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry,
Gold Coast Quarry, Gold Road, Goldshire, Gordunni Outpost, Greenpaw Village,
Grim Batol, Grimesilt Dig Site, Grimtotem Post, Grol'dom Farm, Grom'gol Base
Camp, Grommash Hold, Grove of the Ancients, Growless Cave, Gunstan's Post,
Haldarr Encampment, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High Rise, Highperch,
Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake,
Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree Cavern, Isle
of Dread, Itharius's Cave, Jadefire Run, Jademir Lake, Jaedenar, Jaggedswine
Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine, Jerod's Landing,
Jintha'Alor, Karazhan, Kargath, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Lake Al'Ameth, Lake Everstill, Lake
Falathim, Lake Mennar, Lakeridge Highway, Lakeshire, Lakkari Tar Pits,
Land's End Beach, Lethlor Ravine, Light's Hope Chapel, Loch Modan, Lordamere
Internment Camp, Lost Point, Lushwater Oasis, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon,
Mardenholde Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil
Harbor, Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post, Misty Reed
Strand, Misty Valley, Mo'grosh Stronghold, Molten Core, Moon Horror Den,
Moonbrook, Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot, Morgan's
Vigil, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas,
Nesingwary's Expedition, Nethergarde Keep, Night Web's Hollow, Nighthaven,
Nightmare Vale, Nijel's Point, Noonshade Ruins, North Tide's Hollow,
Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire Abbey,
Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town, Olsen's
Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing Thicket, Pestilent
Scar, Plaguewood, Pool of Tears, Pools of Arlithrien, Pools of Vision,
Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge,
Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet, Raven
Hill, Raven Hill Cemetery, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud
Mesa, Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins
of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of Eldarath, Ruins
of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran,
Ruins of Ravenwind, Ruins of Thaurissan, Rut'theran Village, Saldean's Farm,
Sandsorrow Watch, Sardor Isle, Sargeron, Scalebeard's Cave, Scarlet
Monastery, Scarlet Watch Post, Scholomance, Scuttle Coast, Searing Gorge,
Sen'jin Village, Sentinel Hill, Seradane, Serpent's Coil, Shadow Grave,
Shadow Hold, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's
Lair, Shatter Scar Vale, Shok'Thokar, Silithus, Silverpine Forest,
Silverwind Refuge, Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's
Naze, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southpoint Tower, Southshore, Southwind
Village, Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog,
Stagalbog Cave, Staghelm Point, Starfall Village, Steamwheedle Port,
Stendel's Pond, Stillwater Pond, Stonard, Stonemaul Ruins, Stonesplinter
Valley, Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind City,
Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde Keep,
Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade,
Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of
Arkkoran, Temple of Zin-Malor, Temple of the Moon, Terror Wing Path,
Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of Zul,
The Apothecarium, The Barrens, The Bulwark, The Cape of Stranglethorn, The
Charred Vale, The Creeping Ruin, The Crossroads, The Crystal Shore, The
Dagger Hills, The Dark Portal, The Dawning Isles, The Dead Field, The
Deadmines, The Decrepit Ferry, The Dor'Danil Barrow Den, The Drag, The
Drowned Reef, The Dry Hills, The Farstrider Lodge, The Forgotten Coast, The
Forgotten Pools, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Harborage, The Headland, The High Seat, The Hinterlands,
The Hushed Bank, The Infectis Scar, The Jansen Stead, The Loch, The Mage
Quarter, The Magic Quarter, The Marris Stead, The Master's Cellar, The Maul,
The Merchant Coast, The Mor'shan Rampart, The Noxious Glade, The Park, The
Pillar of Ash, The Red Reaches, The Royal Quarter, The Ruins of Kel'Theril,
The Rustmaul Dig Site, The Scarab Dais, The Screeching Canyon, The
Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon Den,
The Talondeep Path, The Temple Gardens, The Temple of Atal'Hakkar, The Tower
of Arathor, The Trade Quarter, The Tundrid Hills, The Twin Colossals, The
War Quarter, The Weathered Nook, The Writhing Haunt, The Yorgen Farmstead,
Theramore Isle, Thieves Camp, Thistleshrub Valley, Thondroril River,
Thousand Needles, Three Corners, Thunder Bluff, Thunder Ridge, Thunderhorn
Water Well, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren Farm,
Tower of Althalaxx, Tower of Azora, Trade District, Tyr's Hand, Uldaman,
Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears, Valley
of Spirits, Valley of Strength, Valley of Trials, Valley of Wisdom, Valley
of the Watchers, Valormok, Venture Co. Base Camp, Wailing Caverns, Warrior's
Terrace, Warsong Gulch, Waterspring Field, Wavestrider Beach, Weazel's
Crater, Webwinder Path, West Pillar, Western Plaguelands, Westfall,
Wetlands, Whelgar's Excavation Site, Whisperwind Grove, Whitereach Post,
Wildbend River, Windbreak Canyon, Windshear Crag, Winterfall Village,
Winterhoof Water Well, Winterspring, Witherbark Caverns, Witherbark Village,
Yojamba Isle, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar,
Zun'watha.

Next: P4, the next 25 entry records by the recomputed ranking, starting with
The Dustbowl. Count duplicate names as separate records. P5 remains pending.

### 2026-11-19, release 1.2.16

Martin requested a merge of dev into main and the next 1.2.x release.
Release 1.2.16 includes P4 run 23: 25 vanilla entries reviewed and corrected,
with none removed. Both version strings are 1.2.16. CHANGELOG.md records
these findings; P5 must not repeat them and now covers run 24 onwards.

The sweep remains in progress at 574 of 915 surviving vanilla entries.
The Dustbowl is next, with 341 entries left. P5 has not started.

Release checks passed on all nine client configurations with zero errors or
warnings. Gap checking reports 43 explained gaps, release-file prose lint
is clean, and git diff --check passes. The local zip contains matching TOC
and Core versions plus LICENSE, and excludes development tools. The preceding
sweep commit c80118e passed CI for its exact SHA before release preparation.

### 2026-11-20, P4 run 24: the Dustbowl and 24 more

Reviewed 25 vanilla records, beginning with the Dustbowl. All 25 were revised;
none were removed. Coverage is now 599 of 915 surviving entries, with 316 left.
This is the second unshipped run after release 1.2.16; P5 remains pending.

**Read this before picking the next 25.** This run picked its batch wrongly,
and the mistake is easy to repeat. Run 23 ended with "the next 25 entry records
by the recomputed ranking, starting with The Dustbowl", and this run read that
as an instruction to continue alphabetically from the Dustbowl. It is not: the
ranking is the marker score written down in run 2 and fixed in run 5, and
alphabetical order is only the tie-break inside one score. Recomputing the
score over the 339 uncovered names afterwards put just 3 of this run's 25 in
the top 25. The Dustbowl, the Ivar Patch and the Master's Glaive score 3 each;
most of the rest score 0 or 1. That ordering exists so runs reach the entries
most likely to be wrong first, so the next run must recompute it rather than
continue from a name. The 25 reviewed here were all in scope and 23 of
them did carry bad claims, so nothing is wasted, but the order was not the
ranking's.

No place in this batch has a separate `(Classic)` article, so the bare titles
are the right wiki source; 22 of the 25 titles redirect to the article without
the leading "The". Lua was not installed on this machine, so `lua@5.4` was
installed and linked, to match the `lua5.4` the CI matrix uses.

**A reusable method, built this run.** Most claims in this batch were about who
or what is standing in a place, and the sweep had no way to answer that.
`AreaTable` carries no coordinates and the 1.12 `creature` table carries
positions but no zone or area column. The Classic Era `UiMapAssignment` table
gives each zone's world bounding box, `WorldMapOverlay` gives each subzone's
rectangle in map-texture pixels, and `UiMapXMapArt` joins them, so the two
compose into a world-space box per subzone. That turns the spawn table into a
per-place occupant list, for 578 areas.

The axes were pinned down before anything was trusted to the transform, and the
confirmations are in-game text rather than memory. Quest 430 puts the Ivar Patch
north of the Sepulcher and the boxes agree that higher x is north; quest 2742
puts the Overlook Cliffs east of Quel'Danil Lodge and they agree that lower y is
east; quest 313 puts the Grizzled Den west of Kharanos and they agree. Un'Goro
settles it alone: of the three crystal pylons the Northern has the highest x,
the Western the highest y and the Eastern the lowest. Eight zone layouts were
then read off and matched the zones as they are.

One trap came out of it. A zone's `Region` is a rectangle and rectangles
overlap, so "every kodo spawn inside Mulgore's box" quietly includes Desolace's
Kodo Graveyard and part of the Barrens. Clip to the subzone box, never the
zone's. That is what the Golden Plains finding turns on.

| Entry | Result | Evidence |
|---|---|---|
| The Dustbowl | Removed the claim that it holds nothing at all; described the wildlife and the gnomes camped on it | 15 creature spawns in the subzone box, Lotwil Veriatus and Lucien Tosselwrench among them; quests 710 and 715; place article names coyotes, rock elementals and buzzards |
| The Foothill Caverns | Corrected the assertion that Helcular finished becoming a lich here; added the yetis and the Alterac granite | Quest 552 has the lynch mob kill him before he completes it; quest 553 puts the Flame of Azel and the Flame of Veraz in the caverns and the Flame of Uzel in a cave further north, which the object spawns confirm as Growless Cave |
| The Fungal Vale | Removed an invented Argent Dawn mapping practice; described the purple ground, the haze and the Scourge holding it | Place article; quest 5206 names the scourge champions; box holds eyeless watchers, death singers, diseased flayers and an abomination. The hook's "in the west" is right: the entry sits under Eastern Plaguelands and the vale is north of the Marris Stead |
| The Gaping Chasm | Removed the unsourced claim that the hives expand from under Silithus; named the Hazzali and the lost surveyor | Quest 10; Scrimshank's Surveying Gear object in the box; Hazzali spawns. Quest 1124 supports silithid hives in Silithus but nothing supports them radiating from it |
| The Golden Plains | Removed the kodo herds; described the hunting ground that is there | No kodo spawns anywhere in the subzone box, and Mulgore's only kodo are the riding and great kodo at Bloodhoof Village. Place article calls the plains a favoured hunting ground south-east of Thunder Bluff |
| The Grizzled Den | Corrected a bear cave east of Kharanos to a wendigo cave south-west of it; removed the invented Ironforge hunter tradition | Quest 313 says west of Kharanos and wants wendigo manes for Trollplow; quest 5541; place article says south-west and wendigo; box holds wendigo, and quest 312 has Old Icebeard take MacGrann's meat locker |
| The Hidden Grove | Removed the Timbermaw and the druids, who are not here; described the walled crater and its owlbeasts | Box holds moontouched, crazed and berserk owlbeasts and no furbolgs at all; place article gives the north-east location, the ring of cliffs and the single cave in |
| The High Wilderness | Corrected a raised eastern edge to a forest in the west, and harpies to Gordunni ogres | Place article runs it from the Forgotten Coast to the Verdantis River in western Feralas; quests 2980, 2982 and 3124; the spawn band holds Gordunni, frayfeather hippogryphs, groddoc apes, ironfur bears and yetis, and no harpies. Our own High Wilderness entry in Kalimdor.lua already had this right, and the two now agree |
| The Howling Vale | Removed the invented furbolgs and the unsourced account of where the worgen came from; added the shrine | Box holds Terrowulf and Ghostpaw and no furbolgs; quest 1022 calls them mysterious wolf-men and puts the Tome of Mel'Thandris at the shrine as the possible explanation; the Tome object confirms it |
| The Ivar Patch | Corrected a farm outliving its people to a pumpkin patch with two Deathstalkers pinned down on it | Quests 425, 428 and 430 name Rane and Quinn Yorick and the barn; Deathstalker Erland and both Yoricks spawn there; Ivar the Foul is creature type 6, undead |
| The Long Wash | Corrected Darkshore's northern beach to the short stretch south of Auberdine, and removed the naga | Place article runs it south from Auberdine to west of Ameth'Aran and calls it the shortest stretch in the zone; our own Mist's Edge entry already holds the northern stretch; Darkshore's naga spawn at the Glaive and in the far north, not here |
| The Lost Fleet | Replaced "nobody agrees whose they were" with what 1.12 states outright | Quests 288, 289 and 290 name the Kul Tiras Third Fleet, the Doomed Fleet, red dragons under orcish control, Fitzsimmons as sole survivor and Captain Halyndor on the Intrepid; the Intrepid's strongbox object lies in the shallows |
| The Maclure Vineyards | Removed the unsourced "inherited rather than reasoned" reading of the feud; grounded it in the quest dialogue | Quests 62, 84, 85, 86, 112 and 114; Joshua Maclure is the vintner in creature_template; the boars are in the box |
| The Maker's Terrace | Removed the Uldaman questline's payoff and the invented Dark Iron motive; added the urns | Quest 704 has Agmond's diggers uncover the urns and Prospector Ironband blame them for the troggs, and the urn objects stand on the terrace; patch 2.3.0 removed its elite status, so it is an elite area at 1.12 |
| The Marshlands | Corrected the crater's north-west to its south-east, and pterrordax and devilsaurs to ravasaurs | Place article says south-eastern and usually the first area entered; the Eastern Crystal Pylon stands inside the box; the box is ravasaurs with Torwa Pathfinder and no devilsaurs. The article's "only area blue power crystals are found" is false at 1.12 and was not used |
| The Master's Glaive | Corrected "nobody knows what they used it on" and the cult's name; removed the invented titan prison | Quest 944 has Onu say an old lord of the earth fell here, and names the Twilight's Hammer; quest 949 says the cult's purpose is not known; quest 945 for Therylune. Soggoth is absent from 1.12 and was not named |
| The Molsen Farm | Replaced "the Molsens left" with the reason 1.12 gives, and added the machines | Quest 9 says the thieves drove the farm folk off and the harvest watchers took the fields; quest 12 names the Defias trappers here; the box holds harvest watchers, harvest golems and the Foe Reaper 4000 |
| The North Coast | Held up; named the murlocs | Place article and box agree on Vile Fin murlocs, the offshore spawning grounds and Deeb. The plague-in-the-water account was already right |
| The Noxious Lair | Corrected the eastern desert to the south-west and removed the Silithus claim; added the drained water | The subzone box sits west of Gadgetzan on the proven axes; place article says south-western, overlooking Un'Goro; quest 82 says the bugs drained the pools that used to be there. The hive is Centipaar, not Hazzali, which also separates this entry from the Gaping Chasm |
| The Oracle Glade | Removed Malfurion Stormrage, whom the article cites to a 2011 novel; named the Sentinel instead | Quests 934 and 7383 confirm the first and most powerful moonwell and the Oracle Tree; quest 937 and the spawn put Sentinel Arynia Cloudsbreak here; quest 2242 for the satyr. Everything else in the entry held |
| The Overlook Cliffs | Removed "forest trolls have little love for orcs" and the invented calculation; added the waterfall | The Revantusk tribe article has them in the Old Horde before Thrall and calls them the last forest troll tribe serving the Horde; our own Revantusk Village entry already said allied; place article has the river and the height; quests 2742, 7815 and 7816 |
| The Pools of Vision | Removed the invented Cairne and Sylvanas reasoning; added the shaman training and Zamah's own line | Quests 853 and 1064; the spawns hold both tauren shaman trainers and Forsaken mage and priest trainers, plus the Hall of Spirits object; quest 1049 is a tauren writing that the pact was too hasty. Brings the entry in line with the Pools of Vision entry in Cities.lua |
| The Quagmire | Removed the invented patrol arrangement and the settlement explanation; added the bounds and Tabetha | Place article gives the four bounds; the box holds the crocolisks, darkfang spiders, oozes, The Rot, Ripscale, Tabetha and the Theramore deserters, with the signposts that carry the route claim |
| The Riptide | Corrected "the third" to the westernmost, and removed the invented sea-route strategy | Place article says westernmost of the three; quest 1036 names all three ships and Firallon below decks; quests 599 and 604 for the command post and Seahorn's line about the Overlook Cliffs |
| The Rogues' Quarter | Removed the best-spies-in-the-world superlative and the unsourced attribution to Sylvanas | Quests 1885, 1886, 1899, 1998 and 1999 put Mennet Carkad, the Deathstalker recruitment, Estelle Gendry and Varimathras here; place article gives the south-eastern corner and the trainers; the three rogue trainers spawn with him |

**Ledger and checks.** Added 69 vanilla rows. Every one was asserted absent
before insertion and every one was seen failing validation first, because the
list was taken from the gate's own output. Rows were inserted in place instead
of re-sorting the file, so the diff is 69 insertions and no deletions; a
re-sort was tried first and moved existing rows, because the file is codepoint
ordered apart from three seams left by earlier appends. Thirteen extractor
artifacts were reworded out of the prose rather than filed: words capitalised
only by sentence position, and three composites welded across "of the" that no
1.12 source carries as one string. No row was deleted and no verdict changed.
The gate was broken deliberately on the new `Hazzali` row, failed naming the
Gaping Chasm with the expected message, and was restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log; existing RHYTHM counts are Eastern Kingdoms
7, Kalimdor 5 and Locales 1, down from 2. git diff --check passes. Comparing
the prose dump before and after confirms exactly 25 vanilla records changed,
with none added, none removed and no Forever entry touched.

**Entries covered so far (599 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Alterac Mountains, Alterac
Valley, Alther's Mill, Ambermill, Amberstill Ranch, Ameth'Aran,
Andorhal, Angerfang Encampment, Anvilmar, Apocryphan's Rest, Arathi
Basin, Arathi Highlands, Ashenvale, Astranaar, Auberdine, Azshara,
Azurelode Mine, Badlands, Bael Modan, Bael'dun Digsite, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den, Baradin
Bay, Bashal'Aran, Bathran's Haunt, Bay of Storms, Beezil's Wreck,
Beggar's Haunt, Beren's Peril, Bitter Reaches, Blackfathom Deeps,
Blackrock Depths, Blackrock Mountain, Blackrock Pass, Blackrock Spire,
Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Bladefist Bay, Blasted Lands, Bloodhoof Village,
Bloodvenom Post, Bogen's Ledge, Bolgan's Hole, Bones of Grakkarond,
Booty Bay, Bough Shadow, Boulderfist Hall, Boulderslide Cavern,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brill, Brill Town Hall, Bronzebeard
Encampment, Browman Mill, Burning Blade Coven, Burning Steppes, Caer
Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp Mojache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Circle of East
Binding, Circle of Inner Binding, Circle of Outer Binding, Circle of
West Binding, Cleft of Shadow, Coldridge Pass, Coldridge Valley,
Corrahn's Dagger, Craftsmen's Terrace, Crown Guard Tower, Crystal Lake,
Dabyrie's Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold,
Darkcloud Pinnacle, Darkshire, Darkshore, Darkwhisper Gorge, Darnassus,
Darrowshire, Deadeye Shore, Deadwind Pass, Deadwood Village, Deathknell,
Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall Canyon,
Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Rock, Dream Bough, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun
Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire Valley,
Dustwallow Marsh, Dwarven District, East Pillar, Eastern Plaguelands,
Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine,
Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel
Rethor, Everlook, Faldir's Cove, Falfarren River, Feathermoon
Stronghold, Felpaw Village, Felstone Field, Felwood, Fenris Isle, Fenris
Keep, Feralas, Field of Giants, Fire Scar Shrine, Firewatch Ridge, Flame
Crest, Forest Song, Forlorn Ridge, Fray Island, Freewind Post, Frostfire
Hot Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's Pumpkin
Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Gallows' Corner,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnarlpine
Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greenpaw Village, Grim Batol,
Grimesilt Dig Site, Grimtotem Post, Grol'dom Farm, Grom'gol Base Camp,
Grommash Hold, Grove of the Ancients, Growless Cave, Gunstan's Post,
Haldarr Encampment, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Hetaera's Clutch, High Rise, Highperch,
Hillsbrad, Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree
Cavern, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Karazhan, Kargath, Kharanos, Kodo
Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake
Al'Ameth, Lake Everstill, Lake Falathim, Lake Mennar, Lakeridge Highway,
Lakeshire, Lakkari Tar Pits, Land's End Beach, Lethlor Ravine, Light's
Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point,
Lushwater Oasis, Maestra's Post, Magram Village, Malaka'jin, Malden's
Orchard, Manor Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge,
Mazthoril, Menethil Bay, Menethil Harbor, Menethil Keep, Mirage Flats,
Mirage Raceway, Mirkfallon Lake, Mirror Lake Orchard, Mist's Edge, Misty
Pine Refuge, Misty Reed Post, Misty Reed Strand, Misty Valley, Mo'grosh
Stronghold, Molten Core, Moon Horror Den, Moonbrook, Moonglade,
Moonwell, Mor'shan Rampart, Morgan's Plot, Morgan's Vigil, Mosh'Ogg Ogre
Mound, Mosshide Fen, Mulgore, Mystic Ward, Naxxramas, Nesingwary's
Expedition, Nethergarde Keep, Night Web's Hollow, Nighthaven, Nightmare
Vale, Nijel's Point, Noonshade Ruins, North Tide's Hollow, Northfold
Manor, Northpass Tower, Northridge Lumber Camp, Northshire Abbey,
Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town,
Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing Thicket,
Pestilent Scar, Plaguewood, Pool of Tears, Pools of Arlithrien, Pools of
Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien
Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge,
Ratchet, Raven Hill, Raven Hill Cemetery, Ravenholdt Manor, Raynewood
Retreat, Razor Hill, Razorfen Downs, Razorfen Kraul, Razormane Grounds,
Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge Mountains, Refuge
Pointe, Remtravel's Excavation, Render's Valley, Rethress Sanctum,
Revantusk Village, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of
Constellas, Ruins of Eldarath, Ruins of Jubuwal, Ruins of Lordaeron,
Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of
Thaurissan, Rut'theran Village, Saldean's Farm, Sandsorrow Watch, Sardor
Isle, Sargeron, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch
Post, Scholomance, Scuttle Coast, Searing Gorge, Sen'jin Village,
Sentinel Hill, Seradane, Serpent's Coil, Shadow Grave, Shadow Hold,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shatter Scar Vale, Shok'Thokar, Silithus, Silverpine Forest, Silverwind
Refuge, Silverwing Outpost, Sishir Canyon, Skull Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold Road,
Southern Savage Coast, Southfury River, Southpoint Tower, Southshore,
Southwind Village, Splintertree Post, Splithoof Crag, Splithoof Hold,
Stagalbog, Stagalbog Cave, Staghelm Point, Starfall Village,
Steamwheedle Port, Stendel's Pond, Stillwater Pond, Stonard, Stonemaul
Ruins, Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak,
Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Keep, Strahnbrad,
Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock Retreat, Swamp
of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris,
Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran, Temple of Zin-
Malor, Temple of the Moon, Terror Wing Path, Terrordale, Thalanaar,
Thalassian Base Camp, Thandol Span, The Altar of Zul, The Apothecarium,
The Barrens, The Bulwark, The Cape of Stranglethorn, The Charred Vale,
The Creeping Ruin, The Crossroads, The Crystal Shore, The Dagger Hills,
The Dark Portal, The Dawning Isles, The Dead Field, The Deadmines, The
Decrepit Ferry, The Dor'Danil Barrow Den, The Drag, The Drowned Reef,
The Dry Hills, The Dustbowl, The Farstrider Lodge, The Foothill Caverns,
The Forgotten Coast, The Forgotten Pools, The Fungal Vale, The Gaping
Chasm, The Golden Plains, The Great Forge, The Great Lift, The Green
Belt, The Greymane Wall, The Grizzled Den, The Harborage, The Headland,
The Hidden Grove, The High Seat, The High Wilderness, The Hinterlands,
The Howling Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch,
The Jansen Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure
Vineyards, The Mage Quarter, The Magic Quarter, The Maker's Terrace, The
Marris Stead, The Marshlands, The Master's Cellar, The Master's Glaive,
The Maul, The Merchant Coast, The Molsen Farm, The Mor'shan Rampart, The
North Coast, The Noxious Glade, The Noxious Lair, The Oracle Glade, The
Overlook Cliffs, The Park, The Pillar of Ash, The Pools of Vision, The
Quagmire, The Red Reaches, The Riptide, The Rogues' Quarter, The Royal
Quarter, The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab
Dais, The Screeching Canyon, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Stagnant Oasis, The
Stockade, The Tainted Scar, The Talon Den, The Talondeep Path, The
Temple Gardens, The Temple of Atal'Hakkar, The Tower of Arathor, The
Trade Quarter, The Tundrid Hills, The Twin Colossals, The War Quarter,
The Weathered Nook, The Writhing Haunt, The Yorgen Farmstead, Theramore
Isle, Thieves Camp, Thistleshrub Valley, Thondroril River, Thousand
Needles, Three Corners, Thunder Bluff, Thunder Ridge, Thunderhorn Water
Well, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren Farm, Tower
of Althalaxx, Tower of Azora, Trade District, Tyr's Hand, Uldaman,
Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of
Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of
Spears, Valley of Spirits, Valley of Strength, Valley of Trials, Valley
of Wisdom, Valley of the Watchers, Valormok, Venture Co. Base Camp,
Wailing Caverns, Warrior's Terrace, Warsong Gulch, Waterspring Field,
Wavestrider Beach, Weazel's Crater, Webwinder Path, West Pillar, Western
Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear
Crag, Winterfall Village, Winterhoof Water Well, Winterspring,
Witherbark Caverns, Witherbark Village, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 by the recomputed ranking. Recomputed after this run over
the 314 uncovered names, its top is the Slag Pit and the Weeping Cave at 4,
Thoradin's Wall at 3, then Greatwood Vale, Grimtotem Compound, Lost Rigger
Cove, Northshire River, Shadowbreak Ravine, Shaol'watha, Skulk Rock, the
Thunderbrew Distillery, the Tower of Ilgalar, Valor's Rest and the Warsong
Lumber Camp at 2. Recompute rather than trusting this list, and count duplicate
names as separate records: High Wilderness and The High Wilderness are two
entries, as are both Altars of Storms. P5 remains pending.

### 2026-11-20, P4 run 25: the top of the ranking

Reviewed the top 25 names by the recomputed marker-score ranking, which is 26
records: Altar of Storms is two entries, one in the Burning Steppes and one in
the Blasted Lands. All 26 were revised; none were removed. Coverage is now 625
of 915 surviving entries, with 290 records left. P5 remains pending.

The ranking was recomputed from scratch rather than taken from run 24's note,
and it came out identical to it, which is the check that run 24 asked for. The
scores are nearly exhausted: the Slag Pit and the Weeping Cave scored 4,
Thoradin's Wall 3, eleven names 2, and after this run the highest score left
among the 290 uncovered names is 1. From run 26 the ranking no longer
discriminates, so alphabetical order inside score 1 is effectively the order,
and the cheap signal this sweep has been riding is spent.

**A trap in the subzone-box method from run 24.** Two AreaTable ids can share
one `WorldMapOverlay` row, and then the box identifies neither of them.
Southwind Village (2738) and Valor's Rest (3077) return the same rectangle, so
the tortured sentinels and druids that quest 1125 places in Southwind Village
appear in Valor's Rest's box as well. Forest's Edge and Westbrook Garrison
share a row the same way. Check whether a box is shared before reading
occupants off it, and fall back to an anchor NPC: Layo Starstrike stands at
Valor's Rest and is nowhere near the shared box.

| Entry | Result | Evidence |
|---|---|---|
| The Slag Pit | Replaced a slag-dumping ground holding fire elementals with the slave mine it is | Quest 3371 calls it a sweltering mine worked by Dark Iron slaves; quest 7701 puts Overseer Maltorius over the crew; the interior holds slave workers, taskmasters, slavers and Slave Master Blackheart; quest 3372 places the altar of Suntara in it; place article adds the incendosaurs |
| The Weeping Cave | Corrected the western hills to the north-east of the zone, and removed the cauldron and Argent Dawn claims | Place article puts it in north-eastern Western Plaguelands just west of the Thondroril, filled with oozes and bog beasts and The Husk; the box agrees. The Argent Dawn sentence was the same invention run 24 cut from the Fungal Vale, duplicated word for word |
| Thoradin's Wall | Kept Arathor and the Amani; added the damage and Dun Garok, and dropped the oldest-structure superlative | Place article has Thoradin order it soon after Arathor was founded and calls it gigantic and heavily damaged; quest 541 puts the Dun Garok barracks along the wall in south-eastern Hillsbrad |
| Greatwood Vale | Kept the Webwinder Path and Malaka'jin, both correct; moved the Venture Company cutting to where it is | Place article confirms access by Webwinder Path and Malaka'jin to the south; quests 1061, 1062 and 1068 put Seereth Stonebreak near the vale and the goblin logging north-west of it in Windshear Crag |
| Grimtotem Compound | Removed Magatha as the tribe's leader here; added the location and the caged sprite darters | Quest 1063 has Magatha as a respected elder crone on Elder Rise in Thunder Bluff, consulted for spiritual aid, which is not the same figure; place article puts the compound east of Dire Maul in two parts with the darters caged in the southern one; quest 2969 and Kindal Moonweaver's spawn confirm |
| Lost Rigger Cove | Reversed the Steamwheedle relationship; added the peninsula, the shipyard and the names | Quest 8366 has the cartel paying the pirates protection money and the pirates disregarding it, so the pirates are not the cartel's customers; quest 4005 names the eastmost peninsula; place article adds the mountains on three sides and the hull on the stocks |
| Northshire River | Held up; trimmed one editorial line and added the unlabelled subzone | Place article confirms the course from the mountains east of Stormwind through Northshire Valley into Crystal Lake, and the falls by the Abbey, and notes the subzone has no overworld label |
| Shadowbreak Ravine | Kept the ravine, the mushrooms and the chained circle, all correct; replaced the closing editorial with the horses | Place article confirms the well-hidden haven south-east of Shok'Thokar with giant mushrooms and a summoning circle with giant chains; the captured stallions and ley hunters are in the box, and the RPG section explains the stallions |
| Shaol'watha | Corrected an empty site to a Vilebranch-held former temple | Quests 7839 and 7844 send players against 30 Vilebranch scalpers and 15 soothsayers at the Shaol'watha and Agol'watha temples in the north-east; the box holds both plus Grimungous, and Slagtree's lost tools are there |
| Skulk Rock | Replaced a spider cave near the spider loa's shrines with the ooze-ridden troll ruin it is | Quests 77 and 2877 describe an abandoned Horde base overrun by slimes and oozes with a rumoured master ooze; the box holds jade oozes, green sludges, The Reak and 17 ghost mushrooms and no spiders at all. Shadra'Alor is most of a zone away, not a short walk |
| Thunderbrew Distillery | Removed the dwarven-economy framing; described the brewery and its two rivalries | Quest 310 has a Barleybrew asking for a barrel swap in the distillery basement at Kharanos; quest 4128 has Ragnar Thunderbrew robbed of a family recipe and blaming the Dark Iron. Grimbooze Thunderbrew, the only Thunderbrew the quests make much of, is in Westfall and not here |
| Tower of Ilgalar | Corrected the lake's south shore to the eastern foothills, and suspicion to command | Quest 91 puts Morganth in the eastern foothills controlling the Shadowhide clan, with aiding him a capital matter under Magistrate Solomon; quest 180 names Lieutenant Fangore under him; quest 94 has Theocritus watching through the Eye of Azora; place article has him exiled from Stormwind's Mage Quarter, so he did not arrive with credentials |
| Valor's Rest | Corrected a memorial to the camp and graveyard it is, and dropped the thousand-year age | Quest 1124 calls it the final resting spot for the fallen of the wastes and puts Layo Starstrike there; place article makes it a camp used by both factions with a graveyard and Cenarion Circle members, first seen on the way up from Un'Goro. The War of the Shifting Sands framing was attached to the wrong thing; quest 1124's own account of the sealed power replaces it |
| Warsong Lumber Camp | Removed the unsourced Grom and Thrall reading; added the camp and its supply line | Box holds peons, grunts, shamans, deforesters, shredders and 25 lumber piles; quest 6571 routes saw blades from Splintertree Post and axes from Booty Bay with furbolgs and satyrs taking the rest; place article adds the kennel and Kargathia Keep; quest 8150 is how 1.12 speaks of Grom |
| Altar of Storms (Burning Steppes) | Replaced vague users with the Blackrock clan; added what the altars were for | Place article has the altars cut from captured elven runestones and used to empower the ogre magi, and the Blackrock clan still using this one below Blackrock Mountain; the box holds Blackrock warlocks, Mor'zul Bloodbringer, Gorzeeki Wildeyes and an alchemy set |
| Altar of Storms (Blasted Lands) | Softened the portal's shadow to the direction it is, and added Lady Sevine | Box puts the altar north-east of the Dark Portal with Lady Sevine, her servants and a stone of binding; place article has Gul'dan intending to use the altars against the elves' defences at Quel'Thalas |
| Faol's Rest | Held up; tightened two lines and added the Scarlet tower | Place article confirms eastern Tirisfal south-west of the Scarlet Monastery, Faol dying before the Scourge came, and the grave going untended; quest 372 puts the Scarlet raiding tower north of it. Faol's own later raising is Legion-era and stays out |
| Bloodvenom Falls | Held up, including the river claim; added the oozes | Place article confirms the falls high in Felwood as the source of the Bloodvenom River and that it becomes the tainted Wildbend River in Darkshore; the box holds tainted and vile oozes with Jaedenar cultists around them |
| Cold Hearth Manor | Corrected a northern gentry house to a central farmstead, and added the tailors | Place article has a farmstead in central Tirisfal whose people all died of the plague, fields infested with Scourge zombies, and the Forsaken holding the farmhouse and trading from it; quest 383 puts it on the road east of the Deathknell crossroads; Bowen and Constance Brisboise spawn in it |
| Cragpool Lake | Corrected a lake high in the northern mountains to one in Windshear Crag, and the Horde's logging to the Venture Company's | Place article puts it in Windshear Crag with an enormous Venture Company structure above it and Gerenzo Wrenchwhistle overseeing; quest 1079 puts the lumber mill south of the lake; quest 1056 routes travellers past it to Stonetalon Peak. The Horde's timber camps are in Ashenvale, not here |
| Dreadmurk Shore | Removed the unsupported naga hold on Alcaz; added the murlocs and the wreck | Place article makes it the coast and islands between Theramore Isle and Northwatch Hold, heavily infested by the Mirefin tribe, with a Defias shipwreck between it and Alcaz and camps on the islands; the box holds Mirefin murlocs and coastrunners and Theramore sentries |
| Drygulch Ravine | Removed the harpy-origin story and the assignment line; added the banditry, the cultists and Margoz | Place article has the only way in from Razorwind Canyon, the Dustwind harpies robbing caravans and hoarding the sacks, and orcs living there before them; quest 834 is the stolen caravan supplies and the sacks are in the box; quest 828 camps Margoz between the ravine and the coast |
| Fel Rock | Added the satyr and the grells and corrected Shadowglen to Dolanaar | Quest 932 has Tallonkai Swiftroot send players north of Dolanaar after Lord Melenas and his grell warriors, and wants it kept quiet; place article agrees on the location and the infestation. The Teldrassil blessing account held and matches our Darnassus and Teldrassil entries |
| Fire Plume Ridge | Replaced the elemental formula with the named ones, and corrected nobody committing to the heat | Place article has lava down the sides, Blazerunner in a cave at the peak and shallow magma warming the crater's pools; quest 974 is Krakle's thermometer, built precisely to test whether the volcano is the source, in degrees Kraklenheit; Ringo is up there with heat exhaustion |
| Forest's Edge | Kept the border reading; named the garrison's people and Hogger | Box is shared with Westbrook Garrison and holds its quartermasters, morale officer and deputy, with Hogger and mangy wolves on the ground outside |
| High Wilderness | Held up, as run 24 found; added the groddoc apes | Place article's note that the gorillas have since moved to eastern Feralas makes their presence here a vanilla-specific fact, and 23 of them are in the spawn band |

**Ledger and checks.** Added 36 vanilla rows, every one asserted absent and seen
failing validation first, inserted in place so the ledger diff is additions
only. Twelve extractor artifacts were reworded out of the prose instead of
filed, and two composites that no 1.12 source carries as one string were
dropped to their provable parts: "King Thoradin" to Thoradin, and "the keep at
Kargathia" to Kargathia Keep, which has its own AreaTable row. No row was
deleted and no verdict changed. The gate was broken deliberately on the new
`Overseer Maltorius` row, failed naming the Slag Pit with the expected message,
and was restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log; existing RHYTHM counts are back at Eastern
Kingdoms 7, Kalimdor 5 and Locales 1, after one new cross-entry run in the
Felwood block was reworded away. git diff --check passes. The prose dump before
and after confirms exactly 26 vanilla records changed across 25 names, with
none added, none removed and no Forever entry touched.

**One thing left open, and it is not in the data.** The `FTN_NO_TEMPLATES=1`
configuration failed twice early in this run with `1 errors` and no FAIL line
in the captured output, then passed 580 consecutive times on the same bytes. It
also passed 80 consecutive times at the run 24 commit, so it is not clearly
something this run introduced. It is worth a look on its own: a gate that fails
about once in several hundred runs will eventually fail a CI build for no
reason. Nothing in `Data/` depends on it. **Chased and fixed the same day; see
the next entry.** The guess about `ns.db.unknown` was wrong.

**Entries covered so far (624 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Anvilmar, Apocryphan's Rest,
Arathi Basin, Arathi Highlands, Ashenvale, Astranaar, Auberdine,
Azshara, Azurelode Mine, Badlands, Bael Modan, Bael'dun Digsite,
Balia'mah Ruins, Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil
Barrow Den, Baradin Bay, Bashal'Aran, Bathran's Haunt, Bay of Storms,
Beezil's Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackthorn Ridge, Blackwater Cove, Blackwing Lair,
Blackwolf River, Blackwood Den, Bladefist Bay, Blasted Lands, Bloodhoof
Village, Bloodvenom Falls, Bloodvenom Post, Bogen's Ledge, Bolgan's
Hole, Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town
Hall, Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp
Mojache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cold Hearth Manor,
Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crystal Lake, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Darrowshire, Deadeye
Shore, Deadwind Pass, Deadwood Village, Deathknell, Deep Elem Mine,
Deeprun Tram, Deepwater Tavern, Demon Fall Canyon, Desolace, Diamondhead
River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur
Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire
Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Faol's Rest, Feathermoon Stronghold, Fel Rock, Felpaw Village, Felstone
Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of Giants, Fire
Plume Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Forest
Song, Forest's Edge, Forlorn Ridge, Fray Island, Freewind Post,
Frostfire Hot Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Gallows'
Corner, Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnarlpine
Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of the
Ancients, Growless Cave, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hammertoe's Digsite, Hearthglen, Helm's Bed Lake,
Hetaera's Clutch, High Rise, High Wilderness, Highperch, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree
Cavern, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Karazhan, Kargath, Kharanos, Kodo
Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Lake
Al'Ameth, Lake Everstill, Lake Falathim, Lake Mennar, Lakeridge Highway,
Lakeshire, Lakkari Tar Pits, Land's End Beach, Lethlor Ravine, Light's
Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point, Lost
Rigger Cove, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon, Mardenholde
Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil Harbor,
Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post, Misty
Reed Strand, Misty Valley, Mo'grosh Stronghold, Molten Core, Moon Horror
Den, Moonbrook, Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot,
Morgan's Vigil, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic Ward,
Naxxramas, Nesingwary's Expedition, Nethergarde Keep, Night Web's
Hollow, Nighthaven, Nightmare Vale, Nijel's Point, Noonshade Ruins,
North Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Abbey, Northshire River, Northshire Valley, Northshire
Vineyards, Northwatch Hold, Old Town, Olsen's Farthing, Oneiros,
Onyxia's Lair, Orgrimmar, Owl Wing Thicket, Pestilent Scar, Plaguewood,
Pool of Tears, Pools of Arlithrien, Pools of Vision, Purgation Isle,
Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm,
Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet, Raven Hill, Raven
Hill Cemetery, Ravenholdt Manor, Raynewood Retreat, Razor Hill, Razorfen
Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud Mesa,
Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj,
Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of
Eldarath, Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra,
Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of Thaurissan, Rut'theran
Village, Saldean's Farm, Sandsorrow Watch, Sardor Isle, Sargeron,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Serpent's Coil, Shadow Grave, Shadow Hold, Shadowbreak Ravine,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shaol'watha, Shatter Scar Vale, Shok'Thokar, Silithus, Silverpine
Forest, Silverwind Refuge, Silverwing Outpost, Sishir Canyon, Skulk
Rock, Skull Rock, Sofera's Naze, Solliden Farmstead, Sorrow Hill,
Sorrowmurk, South Gate Outpost, South Tide's Run, Southbreak Shore,
Southern Barrens, Southern Gold Road, Southern Savage Coast, Southfury
River, Southpoint Tower, Southshore, Southwind Village, Splintertree
Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog Cave,
Staghelm Point, Starfall Village, Steamwheedle Port, Stendel's Pond,
Stillwater Pond, Stonard, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind
City, Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme,
Stromgarde Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins,
Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill,
Teldrassil, Temple of Arkkoran, Temple of Zin- Malor, Temple of the
Moon, Terror Wing Path, Terrordale, Thalanaar, Thalassian Base Camp,
Thandol Span, The Altar of Zul, The Apothecarium, The Barrens, The
Bulwark, The Cape of Stranglethorn, The Charred Vale, The Creeping Ruin,
The Crossroads, The Crystal Shore, The Dagger Hills, The Dark Portal,
The Dawning Isles, The Dead Field, The Deadmines, The Decrepit Ferry,
The Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The Hidden
Grove, The High Seat, The High Wilderness, The Hinterlands, The Howling
Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The Jansen
Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure Vineyards,
The Mage Quarter, The Magic Quarter, The Maker's Terrace, The Marris
Stead, The Marshlands, The Master's Cellar, The Master's Glaive, The
Maul, The Merchant Coast, The Molsen Farm, The Mor'shan Rampart, The
North Coast, The Noxious Glade, The Noxious Lair, The Oracle Glade, The
Overlook Cliffs, The Park, The Pillar of Ash, The Pools of Vision, The
Quagmire, The Red Reaches, The Riptide, The Rogues' Quarter, The Royal
Quarter, The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab
Dais, The Screeching Canyon, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Slag Pit, The Stagnant
Oasis, The Stockade, The Tainted Scar, The Talon Den, The Talondeep
Path, The Temple Gardens, The Temple of Atal'Hakkar, The Tower of
Arathor, The Trade Quarter, The Tundrid Hills, The Twin Colossals, The
War Quarter, The Weathered Nook, The Weeping Cave, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Bluff, Thunder Ridge, Thunderbrew Distillery, Thunderhorn Water
Well, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren Farm, Tower
of Althalaxx, Tower of Azora, Tower of Ilgalar, Trade District, Tyr's
Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb,
Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor,
Valley of Spears, Valley of Spirits, Valley of Strength, Valley of
Trials, Valley of Wisdom, Valley of the Watchers, Valor's Rest,
Valormok, Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace,
Warsong Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider
Beach, Weazel's Crater, Webwinder Path, West Pillar, Western
Plaguelands, Westfall, Wetlands, Whelgar's Excavation Site, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear
Crag, Winterfall Village, Winterhoof Water Well, Winterspring,
Witherbark Caverns, Witherbark Village, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records by the recomputed ranking, which from here is a
flat field of score 1: Kal'ai Ruins, Kurzen's Compound, Lake Kel'Theril, Lariss
Pavilion, Morlos'Aran, Nek'mani Wellspring, the Ravaged Caravan, the Ravencrest
Monument, the Shrine of the Fallen Warrior, Southmoon Ruins, Starbreeze
Village, Stone Cairn Lake, the Rotting Orchard and the Sea of Cinders among
them. Recompute rather than trusting this list. Count duplicate names as
separate records: Darnassus, South Gate Pass, The Bulwark, The Talondeep Path
and Thunder Bluff are each two entries. P5 remains pending.

### 2026-11-20, the flaky validator run

Not a sweep run. Martin asked for the intermittent `FTN_NO_TEMPLATES=1`
failure that run 25 recorded, so this entry is about `tools/validate.lua` and
touches no entry prose.

**What it was.** The failing assertion is "Darkshire re-announced inside the
repeat cooldown", in the Behaviour section. Reproducing it took 2,400 parallel
runs for the first capture; the rate is roughly one in 1,300. Diffing a failing
run against a passing one showed the cooldown stamp for Darkshire reading 954
instead of 952, meaning the second arrival had announced and re-stamped rather
than being suppressed.

**Why.** Wrapping `ns.ShouldAnnounce` and `ns.MarkSeen` with logging showed the
first arrival never stamped anything at all. The cause is two sections away.
The exhaustive resolution sweep calls `mock.moveTo` for every entry through
`ns.EachEntry`, which walks the index with `pairs()`, so the player is left
standing in whichever place the hash order yielded last, with that place's
toast still up and `D.entry` still pointing at it. `D:Update` only announces
when `entry ~= self.entry`. If the sweep's last place was Darkshire, then:

- arriving at Darkshire is not a change, so nothing is announced and nothing is
  stamped;
- the arrival check passes anyway, because the stale toast from the sweep is
  still shown, so it was asserting nothing;
- the second arrival is a change, finds no stamp, announces, and fails the
  cooldown check.

Lua 5.4 randomises string hashing per process, so which entry comes last varies
per run. One of 987 entries is Darkshire, which is the observed rate.

**Proof rather than inference.** Forcing the precondition, by moving to
Darkshire immediately before the section, reproduces the failure every single
time on the old file and passes every time on the fixed one. That is the whole
mechanism, confirmed both directions, without waiting on the rare event.

**The fix.** Three lines at the top of the section: move to Elwynn Forest,
drain pending timers, hide the toast. The checks now start from a known place
with nothing on screen, so neither `D.entry` nor a stale toast carries in from
whatever the sweep did last.

Two latent defects are closed by that, not one. The cooldown check no longer
fails spuriously, and the arrival check is no longer able to pass on a toast it
did not cause. Both were verified by deliberate breakage: disabling the
cooldown line in `Core.lua` fails with "Darkshire re-announced inside the
repeat cooldown", and making `ns.ShouldAnnounce` always return false fails with
"no toast shown on arriving at Darkshire", which the old arrival check would
have missed whenever the sweep ended on Darkshire. `Core.lua` was restored
exactly both times, confirmed with `git diff`.

The rest of the toast assertions in the file were audited for the same pattern.
Every other one already hides the toast first; the arrival check was the only
one missing it.

Checks: default validation and all nine CI configurations pass, check-gaps
passes with 43 explained gaps, `lint-prose` on `tools/validate.lua` holds at
its pre-existing 40 findings from reading Lua as prose, and git diff --check
passes. The diff is 13 added lines in one file.

Next: P4 run 26, 25 records by the recomputed ranking, which is now a flat
field of score 1. P5 remains pending.

### 2026-11-20, P4 run 26: the last of the ranking

Reviewed 25 records, the last 25 names the marker-score ranking separates.
Twenty-four were revised and one held up with no change. Coverage is now 650 of
915 surviving entries, with 265 left. P5 remains pending.

The ranking was recomputed from scratch and matched run 25's note again. It is
now spent: after this run three uncovered names score 1, 248 score 0 and 14
score nothing at all. From run 28 the order is alphabetical over the remainder,
so the cheap signal is gone and the only thing left is reading the places.

**Six entries named the wrong occupants outright.** This batch was unusually
bad for it, and in every case the 1.12 spawn data and the place article agreed
against us:

| Entry | Said | Actually holds it |
|---|---|---|
| Kal'ai Ruins | Bloodscalp trolls | Murkgill murlocs, in half-sunken ruins |
| Nek'mani Wellspring | Skullsplitter trolls | An expedition of naga under Lord Sakrasis |
| Ravaged Caravan | Palemane gnolls | The Venture Company, defending its own wreck |
| Southmoon Ruins | Sandfury trolls | Dunemaul ogres, over buried Gahz'ridian |
| Stone Cairn Lake | A Riverpaw gnoll camp | Defias rogue wizards on the island, murlocs on the bank |
| Timbermaw Post | The furbolgs who stayed sane | The corrupted Winterfall tribe, in complete control |

Timbermaw Post is the sharpest of them. The place article says outright that
the name suggests the Timbermaw and the camp is not theirs, which is the whole
point of the entry and the opposite of what ours said.

**Four contradicted entries we had already verified.** That remains the most
reliable smell in this sweep.

- Lake Kel'Theril had the Highborne dying "in fighting among the night elves
  themselves over the arcane". Our own Ruins of Kel'Theril entry, and quest
  5244, say they stole a sacred artefact meaning to siphon its power and are
  cursed to hunt its fragments. The fragments are under this ice; the lake is
  where they are recovered.
- Stone Cairn Lake invented unexplained ancient cairns that "nobody has a
  convincing explanation for". The lake is named after Heroes' Vigil, the First
  War memorial on its island, which is one of our own entries.
- Wellspring Lake and Wellspring River had the water running the wrong way,
  each describing the river as feeding the lake. The river runs north out of
  the lake and goes over the edge of Teldrassil in a waterfall.
- Kurzen's Compound said "Stormwind has speculated endlessly about what exactly
  happened to him". Our Rebel Camp entry already says he lost his mind and half
  his force deserted over it, which is what the place article says too.

**Two pairs were near-duplicates of each other.** Timbermaw Hold and Timbermaw
Post repeated the same two sentences about the tribe and the tunnels almost
word for word, and Wellspring Lake and Wellspring River repeated the same
moonwell sentence. Both pairs now say different things about different places.

**Everything else, in brief.** Venomweb Vale moved from the north-west to
eastern Tirisfal below the Scarlet Monastery, with the Scarlet camp under
Lieutenant Sanders and the Council of Tirisfal's history under it. The
Skittering Dark moved from the road south to the Greymane Wall, which is at the
far end of the zone, to the worked-out mine in the north. The Rotting Orchard
moved from behind Raven Hill to southern Duskwood by the Tranquil Gardens, and
gained the Nightbane pack and the Unseen. Lariss Pavilion lost a waterfall and
a superlative and gained Azj'Tordin, the exile the pavilion is actually about.
The Ravencrest Monument lost a long hedge about which Ravencrest and gained
what is there: the broken legs of a colossal statue on the southern cliffs,
with Spitelash naga in them. The Sea of Cinders gained the Scarshield Legion.
Morlos'Aran gained its sibling ruins and the Emerald Circle's post. The Vile
Reef, Thunder Axe Fortress, Starbreeze Village, Tidefury Cove, Timbermaw Hold,
Twilight Grove and the Tower of Eldara kept their readings and gained the
occupants, altars and named NPCs the spawn data puts in them.

**The Shrine of the Fallen Warrior held up with no change.** It is the Michel
Koiter memorial and the entry had it right. The one thing tried here was adding
the name of his beta character from the place article, and that could not be
proven from any 1.12 source, so it came out and the entry is byte-identical to
the previous commit. Tethris'Aran came out of Morlos'Aran for the same reason:
the client spells that area "Tethris Aran" without the apostrophe, and rather
than argue the spelling the sentence now names the three sibling ruins we have
already written up.

**A lead for a later run, which no gate can reach.** Fourteen uncovered entry
names have no wiki article at all, and thirteen of those have no `AreaTable`
row either: Eastern Pylon, Galak Camp, Gates of Uldum, Legashi Encampment,
Legashi Stronghold, Northern Pylon, O'Breen's Encampment, Old Dalaran Ruins,
Ruins of Darrowshire, Stormwind Gates, Thalassian Vanguard Camp, The Dream
Bough, Western Pylon, and The Sanctum, which does have a row. An entry's own
name is exempt from the ledger by design, so a name we invented or paraphrased
can never fail the build. Several of these look like paraphrases of real names:
the pylons are Crystal Pylons in the game, and The Dream Bough duplicates our
own Dream Bough entry. Worth a pass of its own.

**Ledger and checks.** Added 40 rows, 39 `vanilla` and one `history`, Council
of Tirisfal, which is pre-WoW and correctly absent from 1.12 game text. Every
row was asserted absent and seen failing validation first, and rows were
inserted in place so the ledger diff is additions only. One row rests on a
creature subname rather than a name, the Scarshield Legion, and says so.
Thirteen extractor artifacts were reworded out of the prose instead of filed.
Correcting this much prose pushed the `, which` rate to 12.3 per 10k against a
budget of 12, so five of the new clauses were reworded rather than the budget
raised. No row was deleted and no verdict changed. The gate was broken
deliberately on the new `Council of Tirisfal` row, failed naming Venomweb Vale
with the expected message, and was restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log, and the pre-existing RHYTHM counts are
unchanged at Eastern Kingdoms 7, Kalimdor 5 and Locales 1. git diff --check
passes. The prose dump before and after confirms exactly 24 vanilla records
changed, none added, none removed, no Forever entry touched, and nothing
changed outside the batch.

**Entries covered so far (649 place names).**
Addle's Stead, Aerie Peak, Agama'gor, Agamand Mills, Agmond's End,
Ahn'Qiraj, Alcaz Island, Alexston Farmstead, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Anvilmar, Apocryphan's Rest,
Arathi Basin, Arathi Highlands, Ashenvale, Astranaar, Auberdine,
Azshara, Azurelode Mine, Badlands, Bael Modan, Bael'dun Digsite,
Balia'mah Ruins, Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil
Barrow Den, Baradin Bay, Bashal'Aran, Bathran's Haunt, Bay of Storms,
Beezil's Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackthorn Ridge, Blackwater Cove, Blackwing Lair,
Blackwolf River, Blackwood Den, Bladefist Bay, Blasted Lands, Bloodhoof
Village, Bloodvenom Falls, Bloodvenom Post, Bogen's Ledge, Bolgan's
Hole, Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town
Hall, Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp
Mojache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cold Hearth Manor,
Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crystal Lake, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Darrowshire, Deadeye
Shore, Deadwind Pass, Deadwood Village, Deathknell, Deep Elem Mine,
Deeprun Tram, Deepwater Tavern, Demon Fall Canyon, Desolace, Diamondhead
River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur
Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire
Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Faol's Rest, Feathermoon Stronghold, Fel Rock, Felpaw Village, Felstone
Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of Giants, Fire
Plume Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Forest
Song, Forest's Edge, Forlorn Ridge, Fray Island, Freewind Post,
Frostfire Hot Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Gallows'
Corner, Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnarlpine
Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of the
Ancients, Growless Cave, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hammertoe's Digsite, Hearthglen, Helm's Bed Lake,
Hetaera's Clutch, High Rise, High Wilderness, Highperch, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree
Cavern, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan, Kargath,
Kharanos, Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village,
Kormek's Hut, Kurzen's Compound, Lake Al'Ameth, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point,
Lost Rigger Cove, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon, Mardenholde
Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil Harbor,
Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post, Misty
Reed Strand, Misty Valley, Mo'grosh Stronghold, Molten Core, Moon Horror
Den, Moonbrook, Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot,
Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore,
Mystic Ward, Naxxramas, Nek'mani Wellspring, Nesingwary's Expedition,
Nethergarde Keep, Night Web's Hollow, Nighthaven, Nightmare Vale,
Nijel's Point, Noonshade Ruins, North Tide's Hollow, Northfold Manor,
Northpass Tower, Northridge Lumber Camp, Northshire Abbey, Northshire
River, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing
Thicket, Pestilent Scar, Plaguewood, Pool of Tears, Pools of Arlithrien,
Pools of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds,
Raptor Ridge, Ratchet, Ravaged Caravan, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud
Mesa, Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj,
Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of
Eldarath, Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra,
Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of Thaurissan, Rut'theran
Village, Saldean's Farm, Sandsorrow Watch, Sardor Isle, Sargeron,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Serpent's Coil, Shadow Grave, Shadow Hold, Shadowbreak Ravine,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shaol'watha, Shatter Scar Vale, Shok'Thokar, Shrine of the Fallen
Warrior, Silithus, Silverpine Forest, Silverwind Refuge, Silverwing
Outpost, Sishir Canyon, Skulk Rock, Skull Rock, Sofera's Naze, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's
Run, Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southmoon Ruins, Southpoint Tower,
Southshore, Southwind Village, Splintertree Post, Splithoof Crag,
Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm Point, Starbreeze
Village, Starfall Village, Steamwheedle Port, Stendel's Pond, Stillwater
Pond, Stonard, Stone Cairn Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind
City, Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme,
Stromgarde Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins,
Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill,
Teldrassil, Temple of Arkkoran, Temple of Zin- Malor, Temple of the
Moon, Terror Wing Path, Terrordale, Thalanaar, Thalassian Base Camp,
Thandol Span, The Altar of Zul, The Apothecarium, The Barrens, The
Bulwark, The Cape of Stranglethorn, The Charred Vale, The Creeping Ruin,
The Crossroads, The Crystal Shore, The Dagger Hills, The Dark Portal,
The Dawning Isles, The Dead Field, The Deadmines, The Decrepit Ferry,
The Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The Hidden
Grove, The High Seat, The High Wilderness, The Hinterlands, The Howling
Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The Jansen
Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure Vineyards,
The Mage Quarter, The Magic Quarter, The Maker's Terrace, The Marris
Stead, The Marshlands, The Master's Cellar, The Master's Glaive, The
Maul, The Merchant Coast, The Molsen Farm, The Mor'shan Rampart, The
North Coast, The Noxious Glade, The Noxious Lair, The Oracle Glade, The
Overlook Cliffs, The Park, The Pillar of Ash, The Pools of Vision, The
Quagmire, The Red Reaches, The Riptide, The Rogues' Quarter, The Rotting
Orchard, The Royal Quarter, The Ruins of Kel'Theril, The Rustmaul Dig
Site, The Scarab Dais, The Screeching Canyon, The Sea of Cinders, The
Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Skittering Dark, The Slag Pit, The Stagnant Oasis, The
Stockade, The Tainted Scar, The Talon Den, The Talondeep Path, The
Temple Gardens, The Temple of Atal'Hakkar, The Tower of Arathor, The
Trade Quarter, The Tundrid Hills, The Twin Colossals, The Vile Reef, The
War Quarter, The Weathered Nook, The Weeping Cave, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of Trials, Valley of
Wisdom, Valley of the Watchers, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River, West
Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation
Site, Whisperwind Grove, Whitereach Post, Wildbend River, Windbreak
Canyon, Windshear Crag, Winterfall Village, Winterhoof Water Well,
Winterspring, Witherbark Caverns, Witherbark Village, Yojamba Isle,
Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records. Three names still score 1, Whispering Shore,
Woodpaw Hills and the Wyrmbog, and the rest score 0, so take those three and
then work alphabetically. Count duplicate names as separate records: Darnassus,
South Gate Pass, The Bulwark, The Talondeep Path and Thunder Bluff are each two
entries. P5 remains pending.

### 2026-11-20, P4 run 27: the last three scorers and the start of the tail

Reviewed 25 records: the last three names with any marker score, then
alphabetically from Abyssal Sands. All 25 were revised. Coverage is now 675 of
915 surviving entries, with 240 left. P5 remains pending.

The ranking was recomputed and confirmed spent. From run 28 the order is
alphabetical, starting at Boulder Lode Mine.

**The shared-overlay trap caught three places in one batch.** Run 26 recorded
that two AreaTable ids can share one `WorldMapOverlay` row, and auditing for it
before reading occupants is now plainly worth the step. Woodpaw Hills shares a
box with The Writhing Deep, Bluefen with Brackenwall Village, and Algaz Station
with North Gate Pass. In the Bluefen case the shared box put thirteen
Brackenwall enforcers and the village's weaponsmith into what looked like an
empty marsh. In the Woodpaw case the shared box was the finding: the Zukk'ash
silithid in it belong to the Writhing Deep, and the place article says they are
what is driving the gnolls out of their own hills.

**Three entries named the wrong occupants.**

| Entry | Said | Actually holds it |
|---|---|---|
| Abyssal Sands | Elemental incursions, monitored by the Cenarion Circle | Silithid tunnelling under the dunes, with anubisath and resonating crystals |
| Black Channel Marsh | Murlocs along the channel | Raptor lairs close to the road, and crocolisks in the water |
| Blackwood Lake | A lake in the western Plaguelands | A polluted lake in the Eastern Plaguelands, over a drowned town |

**Two claims were dated out of era from their own source.** The Battle Ring
carried two stories: that once a generation the greatest trolls came to the
arena, and that a blood-red amulet found at midnight costs you your soul by
daybreak. Both sentences on the place article carry one citation, to *Exploring
Azeroth: The Eastern Kingdoms*, published in 2020, and the rite is framed around
Rastakhan and the loa. Both are out. What replaced them is dated the other way:
patch 1.2.0 confined the arena's free-for-all to the floor and not the stands
or the ramp, which is exactly what this subzone is, and patch 1.4.0 added Short
John Mithril's chest every three hours on the clock.

Ariden's Camp went the same way for a different reason. The entry had Ariden
leading the Dark Riders, selling forged Medivh artefacts and being cursed for
it. Ariden is absent from `creature_template` and from every line of 1.12 quest
text, the place article's account of him is uncited, and its own later sections
place the Dark Riders of Karazhan in modern content. The camp's own description
survives, and so does what 1.12 does say about the riders: they came out of
Deadwind Pass and killed Sven Yorgen's family in Duskwood, a shadowy figure was
seen burying something by the barn, and the riders were seen speaking with
Morbent Fel at the Forlorn Rowe.

**Aldrassil contradicted our own Teldrassil account, twice in one sentence.** It
had Malfurion Stormrage opposing the planting and Ysera withholding her
blessing. Our Darnassus and Teldrassil entries, verified earlier in this sweep,
have Malfurion absent in the Emerald Dream and unable to argue, and name
Nozdormu and Alexstrasza as the Aspects who refused. Aldrassil now says the
same thing they do.

**Bluefen repeated an invention run 25 had already deleted.** Its closing line,
that the marsh's wildlife is why Dustwallow stayed thinly settled, is the same
unsourced claim that came out of The Quagmire two runs ago. That is the third
time this sweep has found one invention copied across two entries, after the
Argent Dawn blight-mapping sentence and Stranglethorn's "nothing has been built
here since", which also came out of Bal'lal Ruins in this batch after run 26
removed it from Kal'ai Ruins.

**What the oracles added.** Angor Fortress is confirmed by quest 726 as the
Shadowforge's base of operations, struck to slow their presence in Uldaman.
Bael'dun Keep gained Gann Stonespire's account of tauren killed or driven off
ancestral land. The Agamand Family Crypt gained Captain Dargol, who woke the
family. Ban'ethil Hollow gained Oben Rageclaw, a druid whose body the Gnarlpine
shaman hold under an enchantment, which is the concrete form of the entry's own
point. Bear's Head moved from northern Azshara to the south-eastern mountains
and gained Archmage Xylem's tower and the fact that its furbolg villages are
Timbermaw outposts. Bloodsail Compound moved from the southern coast to the
middle of the western one and is a loose camp, not a base. Wyrmbog gained
Emberstrife's Den beside Onyxia's Lair, the eggs lying in the mud, and its 1.12
elite status. Bloodtooth Camp gained the furbolg who asked for Ran Bloodtooth's
death on the grounds that his own people must police their own. Bluegill Marsh
gained the Lost Fleet's footlockers and its cursed crew straying in from the
wrecks to the north.

**Held up.** Whispering Shore was correct in every particular, including Muad.
Bloodfen Burrow was correct on the raptors, the torn-apart settlement and
Cortello's Riddle, and gained only the riddle's own wording about a cave in the
south-west. Blackrock Stronghold's reading of Rend Blackhand held.

**Ledger and checks.** Added 17 vanilla rows, each asserted absent and seen
failing validation first, inserted in place so the ledger diff is additions
only. Eleven extractor artifacts were reworded out of the prose instead of
filed. Two names could not be proven and came out rather than being filed:
`Xylem's Tower`, which has no AreaTable row and appears in no 1.12 text, so the
sentence now names Archmage Xylem and calls it a tower; and the book title
`Moon Over the Vale`, a real 1.12 object whose name splits across "the" in the
extractor and would have cost three junk rows. Correcting this much prose pushed
the `, which` rate to 12.2 per 10k against a budget of 12 for the second run
running, so four clauses were reworded. A new cross-entry sentence run in the
Searing Gorge block was reworded away. No row was deleted and no verdict
changed. The gate was broken deliberately on the new `Captain Dargol` row,
failed naming the Agamand Family Crypt with the expected message, and was
restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log, and the RHYTHM counts are back at Eastern
Kingdoms 7, Kalimdor 5 and Locales 1. git diff --check passes. The prose dump
before and after confirms exactly 25 vanilla records changed, none added, none
removed, no Forever entry touched, and nothing changed outside the batch.

**Entries covered so far (674 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulderfist Hall,
Boulderslide Cavern, Brackenwall Village, Brackwell Pumpkin Patch,
Brambleblade Ravine, Bramblescar, Brewnall Village, Brill, Brill Town
Hall, Bronzebeard Encampment, Browman Mill, Burning Blade Coven, Burning
Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp E'thok, Camp
Mojache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cold Hearth Manor,
Coldridge Pass, Coldridge Valley, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crystal Lake, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkshire, Darkshore, Darkwhisper Gorge, Darnassus, Darrowshire, Deadeye
Shore, Deadwind Pass, Deadwood Village, Deathknell, Deep Elem Mine,
Deeprun Tram, Deepwater Tavern, Demon Fall Canyon, Desolace, Diamondhead
River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur
Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar, Duskwood, Dustfire
Valley, Dustwallow Marsh, Dwarven District, East Pillar, Eastern
Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Faol's Rest, Feathermoon Stronghold, Fel Rock, Felpaw Village, Felstone
Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of Giants, Fire
Plume Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Forest
Song, Forest's Edge, Forlorn Ridge, Fray Island, Freewind Post,
Frostfire Hot Springs, Frostmane Hold, Frostwhisper Gorge, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Gallows'
Corner, Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker Post, Gnarlpine
Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of the
Ancients, Growless Cave, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hammertoe's Digsite, Hearthglen, Helm's Bed Lake,
Hetaera's Clutch, High Rise, High Wilderness, Highperch, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree
Cavern, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan, Kargath,
Kharanos, Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village,
Kormek's Hut, Kurzen's Compound, Lake Al'Ameth, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point,
Lost Rigger Cove, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon, Mardenholde
Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil Harbor,
Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post, Misty
Reed Strand, Misty Valley, Mo'grosh Stronghold, Molten Core, Moon Horror
Den, Moonbrook, Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot,
Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore,
Mystic Ward, Naxxramas, Nek'mani Wellspring, Nesingwary's Expedition,
Nethergarde Keep, Night Web's Hollow, Nighthaven, Nightmare Vale,
Nijel's Point, Noonshade Ruins, North Tide's Hollow, Northfold Manor,
Northpass Tower, Northridge Lumber Camp, Northshire Abbey, Northshire
River, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing
Thicket, Pestilent Scar, Plaguewood, Pool of Tears, Pools of Arlithrien,
Pools of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds,
Raptor Ridge, Ratchet, Ravaged Caravan, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud
Mesa, Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj,
Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of
Eldarath, Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra,
Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of Thaurissan, Rut'theran
Village, Saldean's Farm, Sandsorrow Watch, Sardor Isle, Sargeron,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Serpent's Coil, Shadow Grave, Shadow Hold, Shadowbreak Ravine,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shaol'watha, Shatter Scar Vale, Shok'Thokar, Shrine of the Fallen
Warrior, Silithus, Silverpine Forest, Silverwind Refuge, Silverwing
Outpost, Sishir Canyon, Skulk Rock, Skull Rock, Sofera's Naze, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's
Run, Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southmoon Ruins, Southpoint Tower,
Southshore, Southwind Village, Splintertree Post, Splithoof Crag,
Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm Point, Starbreeze
Village, Starfall Village, Steamwheedle Port, Stendel's Pond, Stillwater
Pond, Stonard, Stone Cairn Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind
City, Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme,
Stromgarde Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins,
Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill,
Teldrassil, Temple of Arkkoran, Temple of Zin- Malor, Temple of the
Moon, Terror Wing Path, Terrordale, Thalanaar, Thalassian Base Camp,
Thandol Span, The Altar of Zul, The Apothecarium, The Barrens, The
Bulwark, The Cape of Stranglethorn, The Charred Vale, The Creeping Ruin,
The Crossroads, The Crystal Shore, The Dagger Hills, The Dark Portal,
The Dawning Isles, The Dead Field, The Deadmines, The Decrepit Ferry,
The Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The Hidden
Grove, The High Seat, The High Wilderness, The Hinterlands, The Howling
Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The Jansen
Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure Vineyards,
The Mage Quarter, The Magic Quarter, The Maker's Terrace, The Marris
Stead, The Marshlands, The Master's Cellar, The Master's Glaive, The
Maul, The Merchant Coast, The Molsen Farm, The Mor'shan Rampart, The
North Coast, The Noxious Glade, The Noxious Lair, The Oracle Glade, The
Overlook Cliffs, The Park, The Pillar of Ash, The Pools of Vision, The
Quagmire, The Red Reaches, The Riptide, The Rogues' Quarter, The Rotting
Orchard, The Royal Quarter, The Ruins of Kel'Theril, The Rustmaul Dig
Site, The Scarab Dais, The Screeching Canyon, The Sea of Cinders, The
Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Skittering Dark, The Slag Pit, The Stagnant Oasis, The
Stockade, The Tainted Scar, The Talon Den, The Talondeep Path, The
Temple Gardens, The Temple of Atal'Hakkar, The Tower of Arathor, The
Trade Quarter, The Tundrid Hills, The Twin Colossals, The Vile Reef, The
War Quarter, The Weathered Nook, The Weeping Cave, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of Trials, Valley of
Wisdom, Valley of the Watchers, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River, West
Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation
Site, Whispering Shore, Whisperwind Grove, Whitereach Post, Wildbend
River, Windbreak Canyon, Windshear Crag, Winterfall Village, Winterhoof
Water Well, Winterspring, Witherbark Caverns, Witherbark Village,
Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost, Zul'Farrak,
Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Boulder Lode Mine, with
Boulder'gor, Boulderslide Ravine, Brightwater Lake and Brightwood Grove behind
it. Recompute the ranking anyway to confirm nothing new scores. Count duplicate
names as separate records: Darnassus, South Gate Pass, The Bulwark, The
Talondeep Path and Thunder Bluff are each two entries. P5 remains pending.

### 2026-11-20, P4 run 28: Boulder Lode Mine to Demon Fall Ridge

Reviewed 25 records alphabetically. Twenty-three were revised and two held up
with no change. Coverage is now 700 of 915 surviving entries, with 215 left.
The ranking was recomputed and nothing scores above zero. P5 remains pending.

**Oracle precedence saved a wrong correction.** Boulderslide Ravine said it was
"full of kobolds and worse". The subzone box holds Gogger rock keepers and
geomancers and no kobolds at all, and the correction was half written when
quest 6421 turned up: "the kobolds there are frantically mining a rare crystal
called Resonite". The kobolds are real and they are in the cave at the end of
the ravine, which is Boulderslide Cavern, an entry this sweep verified earlier
and which carries them in full. Our ravine entry now describes the ravine and
points at the cave instead of repeating it. This is the method note about
verifying what you write, and it cost a near miss rather than an error only
because the quest text was checked before the edit went in.

**Six boxes in this batch were shared.** Camp Cagg with Dustbelch Grotto, Camp
Narache with Red Cloud Mesa, Chillwind Point with Ravenholdt Manor, Crushridge
Hold with Slaughter Hollow, Deadman's Crossing with Sleeping Gorge, and
Cliffspring Falls with Cliffspring River, which share one row between the two
of them. The audit is now the first step of every batch.

**An entry name with no 1.12 row, which no gate can catch.** Run 26 flagged
fourteen uncovered entry names with no wiki article; this batch produced the
first one to review. We carry both Crusader Outpost and Crusader's Outpost.
Crusader Outpost is a real Classic Era area in eastern Tirisfal under Captain
Vachon, and our entry for it was right. Crusader's Outpost has no AreaTable row
at all, and the place the article gives that name to is a tower in western
Tirisfal inside the Scarlet Palisade, which is itself absent from Classic Era
AreaTable and so post-vanilla. Our two entries both described the eastern
place. The second now describes what 1.12 actually has in the west, Scarlet
warriors and missionaries out by the Solliden Farmstead, which is the order's
westernmost ground. **The name is still one the client does not carry, and
renaming or merging the entry is a decision for Martin, not for this sweep.**

**Three entries had the wrong place or the wrong tenants.**

| Entry | Said | Actually |
|---|---|---|
| Darkmist Cavern | A spider cave in the eastern marsh | A small mine in the north-west, with ruined houses outside it |
| Dawning Wood Catacombs | A burial site in the eastern half of Duskwood | The catacombs under Raven Hill Cemetery, in the west, with two entrances |
| Crystalvein Mine | Held by Colonel Kurzen's forces | Basilisks, behind a sign telling people to keep out |
| Darrow Hill | High ground east of Tarren Mill, changing hands | High ground south-west of it, held by lions, bears and yeti |

**Chillwind Point was the wrong place entirely.** The entry had a contested high
pass on the Plaguelands border that the Alliance keeps trying to hold. It is a
small rise on the eastern edge of the Alterac Mountains with an ancient troll
ruin on it and Bath'rah the Windwatcher living there, and the place article
notes that it is often mistaken for Chillwind Camp, the Alliance outpost to the
north. Our own Chillwind Camp entry already describes that outpost and
Commander Ashlam Valorfist, so the sweep had written the camp's job into the
point's entry and then verified the camp separately without noticing.

**Darrowmere Lake carried the error run 23 fixed twice.** It had Kel'Thuzad
promise the Barovs immortality and then murder them for the estate. Run 23
corrected exactly that ordering in Scholomance and Caer Darrow: the Barovs
believed him and handed the keep over, and the cultists killed them afterwards.
Darrowmere Lake now says what those two say, which makes this the fifth
invention or error this sweep has found duplicated across entries.

**What the oracles added.** Corin's Crossing gained the Cult of the Damned in
person and the five roads its signposts still name. Camp Narache gained Chief
Hawkwind and the Bristleback warchief's plans for an extended siege of it,
which is a good deal more than the "constant low-level pressure" it had. Broken
Pillar lost its unattributed ruins and a titan gate the Explorers' League was
supposedly working on, and gained the trolls who actually built the desert's
ruins, the gahz'ridian modelled after Gahz'rilla, and Marvon Rivetseeker, the
goblin who left Ratchet to study them. Boulder'gor gained the Witherbark trolls
keeping company with the ogres. Brightwater Lake gained the Vile Fin murlocs and
Gunther Arcanus. Crushridge Hold gained Lo'Grosh and a goblin selling
engineering supplies in the middle of an ogre hold. Cliffspring Falls and
Cliffspring River now agree with each other and with the source: the falls are
the river's origin and Darkshore's principal drinking water, and the corrupted
cave behind them has Twilight's Hammer in it.

**Held up.** Deadman's Crossing was correct in every particular including the
exact wording on the signpost, and Demon Fall Ridge was correct down to
Diathorus the Seeker and the barrow den. Both are byte-identical to the previous
commit. Darkspear Strand held on the landing and Sen'jin Village and lost only
an unsourced clause about a claim south of Durotar.

**Ledger and checks.** Added 14 vanilla rows, each asserted absent and seen
failing validation first, inserted in place so the ledger diff is additions
only. Five extractor artifacts were reworded out of the prose instead of filed.
The `, which` rate went over budget for the third run running and eight clauses
were reworded to bring it back; a new cross-entry sentence run in the Badlands
block was reworded away as well. No row was deleted and no verdict changed. The
gate was broken deliberately on the new `Bath'rah` row, failed naming Chillwind
Point with the expected message, and was restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings. check-gaps passes with 43 explained gaps. Prose lint is
clean for the ledger and this log; RHYTHM counts are Eastern Kingdoms 7,
Kalimdor 5 and Locales clean, down from 1. git diff --check passes. The prose
dump before and after confirms exactly 23 vanilla records changed, none added,
none removed, no Forever entry touched, and nothing changed outside the batch.

**Entries covered so far (699 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine,
Boulder'gor, Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brightwater Lake, Brightwood Grove,
Brill, Brill Town Hall, Broken Pillar, Bronzebeard Encampment, Browman
Mill, Burning Blade Coven, Burning Steppes, Caer Darrow, Camp Aparaje,
Camp Boff, Camp Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp
Narache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Chillwind Point, Circle of East Binding, Circle of Inner Binding, Circle
of Outer Binding, Circle of West Binding, Cleft of Shadow, Cliffspring
Falls, Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's Outpost,
Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand, Darkwhisper
Gorge, Darnassus, Darrow Hill, Darrowmere Lake, Darrowshire, Dawning
Wood Catacombs, Deadeye Shore, Deadman's Crossing, Deadwind Pass,
Deadwind Ravine, Deadwood Village, Deathknell, Deep Elem Mine, Deeprun
Tram, Deepwater Tavern, Demon Fall Canyon, Demon Fall Ridge, Desolace,
Diamondhead River, Dire Maul, Direforge Hill, Dolanaar, Draco'dar,
Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Rock,
Dreadmurk Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun
Algaz, Dun Garok, Dun Modr, Dun Morogh, Durnholde Keep, Durotar,
Duskwood, Dustfire Valley, Dustwallow Marsh, Dwarven District, East
Pillar, Eastern Plaguelands, Eastvale Logging Camp, Eastwall Tower, Echo
Isles, Echo Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den,
Emerald Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren
River, Faol's Rest, Feathermoon Stronghold, Fel Rock, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feralas, Field of
Giants, Fire Plume Ridge, Fire Scar Shrine, Firewatch Ridge, Flame
Crest, Forest Song, Forest's Edge, Forlorn Ridge, Fray Island, Freewind
Post, Frostfire Hot Springs, Frostmane Hold, Frostwhisper Gorge,
Furlbrow's Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold,
Gallows' Corner, Gallows' End Tavern, Garren's Haunt, Garrison Armory,
Gates of Ahn'Qiraj, Gavin's Naze, Gelkis Village, Ghost Walker Post,
Gnarlpine Hold, Gnomeregan, Go'Shek Farm, Gol'Bolar Quarry, Gold Coast
Quarry, Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold, Grove of the
Ancients, Growless Cave, Gunstan's Post, Haldarr Encampment, Hall of
Legends, Hammerfall, Hammertoe's Digsite, Hearthglen, Helm's Bed Lake,
Hetaera's Clutch, High Rise, High Wilderness, Highperch, Hillsbrad,
Hillsbrad Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi,
Hive'Regal, Hive'Zora, Honor's Stand, Hunter Rise, Idlewind Lake, Iris
Lake, Ironband's Excavation Site, Ironforge, Ironstone Camp, Irontree
Cavern, Isle of Dread, Itharius's Cave, Jadefire Run, Jademir Lake,
Jaedenar, Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode
Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan, Kargath,
Kharanos, Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village,
Kormek's Hut, Kurzen's Compound, Lake Al'Ameth, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost Point,
Lost Rigger Cove, Lushwater Oasis, Maestra's Post, Magram Village,
Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon, Mardenholde
Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil Harbor,
Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post, Misty
Reed Strand, Misty Valley, Mo'grosh Stronghold, Molten Core, Moon Horror
Den, Moonbrook, Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot,
Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore,
Mystic Ward, Naxxramas, Nek'mani Wellspring, Nesingwary's Expedition,
Nethergarde Keep, Night Web's Hollow, Nighthaven, Nightmare Vale,
Nijel's Point, Noonshade Ruins, North Tide's Hollow, Northfold Manor,
Northpass Tower, Northridge Lumber Camp, Northshire Abbey, Northshire
River, Northshire Valley, Northshire Vineyards, Northwatch Hold, Old
Town, Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing
Thicket, Pestilent Scar, Plaguewood, Pool of Tears, Pools of Arlithrien,
Pools of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds,
Raptor Ridge, Ratchet, Ravaged Caravan, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud
Mesa, Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj,
Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of
Eldarath, Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra,
Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of Thaurissan, Rut'theran
Village, Saldean's Farm, Sandsorrow Watch, Sardor Isle, Sargeron,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane,
Serpent's Coil, Shadow Grave, Shadow Hold, Shadowbreak Ravine,
Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair,
Shaol'watha, Shatter Scar Vale, Shok'Thokar, Shrine of the Fallen
Warrior, Silithus, Silverpine Forest, Silverwind Refuge, Silverwing
Outpost, Sishir Canyon, Skulk Rock, Skull Rock, Sofera's Naze, Solliden
Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's
Run, Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southmoon Ruins, Southpoint Tower,
Southshore, Southwind Village, Splintertree Post, Splithoof Crag,
Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm Point, Starbreeze
Village, Starfall Village, Steamwheedle Port, Stendel's Pond, Stillwater
Pond, Stonard, Stone Cairn Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep,
Stonewrought Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind
City, Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme,
Stromgarde Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins,
Talonbranch Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill,
Teldrassil, Temple of Arkkoran, Temple of Zin- Malor, Temple of the
Moon, Terror Wing Path, Terrordale, Thalanaar, Thalassian Base Camp,
Thandol Span, The Altar of Zul, The Apothecarium, The Barrens, The
Bulwark, The Cape of Stranglethorn, The Charred Vale, The Creeping Ruin,
The Crossroads, The Crystal Shore, The Dagger Hills, The Dark Portal,
The Dawning Isles, The Dead Field, The Deadmines, The Decrepit Ferry,
The Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The Hidden
Grove, The High Seat, The High Wilderness, The Hinterlands, The Howling
Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The Jansen
Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure Vineyards,
The Mage Quarter, The Magic Quarter, The Maker's Terrace, The Marris
Stead, The Marshlands, The Master's Cellar, The Master's Glaive, The
Maul, The Merchant Coast, The Molsen Farm, The Mor'shan Rampart, The
North Coast, The Noxious Glade, The Noxious Lair, The Oracle Glade, The
Overlook Cliffs, The Park, The Pillar of Ash, The Pools of Vision, The
Quagmire, The Red Reaches, The Riptide, The Rogues' Quarter, The Rotting
Orchard, The Royal Quarter, The Ruins of Kel'Theril, The Rustmaul Dig
Site, The Scarab Dais, The Screeching Canyon, The Sea of Cinders, The
Sepulcher, The Shattered Strand, The Shimmering Flats, The Shrine of
Aessina, The Skittering Dark, The Slag Pit, The Stagnant Oasis, The
Stockade, The Tainted Scar, The Talon Den, The Talondeep Path, The
Temple Gardens, The Temple of Atal'Hakkar, The Tower of Arathor, The
Trade Quarter, The Tundrid Hills, The Twin Colossals, The Vile Reef, The
War Quarter, The Weathered Nook, The Weeping Cave, The Writhing Haunt,
The Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of Trials, Valley of
Wisdom, Valley of the Watchers, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River, West
Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation
Site, Whispering Shore, Whisperwind Grove, Whitereach Post, Wildbend
River, Windbreak Canyon, Windshear Crag, Winterfall Village, Winterhoof
Water Well, Winterspring, Witherbark Caverns, Witherbark Village,
Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost, Zul'Farrak,
Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Demont's Place, with
Dreadmaul Post, Dreadmist Den, Dreadmist Peak and Dun Mandarr behind it.
Eastern Pylon is in that range and is one of the fourteen names with no wiki
article, so it is the next chance to look at that list. Count duplicate names
as separate records: Darnassus, South Gate Pass, The Bulwark, The Talondeep Path
and Thunder Bluff are each two entries. P5 remains pending.

### 2026-11-20, release 1.2.17

Martin asked for dev to be merged to main and the next 1.2.x released. Release
1.2.17 carries P4 runs 24 to 28, which is 126 entry records reviewed and 123
corrected, and the fix to the flaky `FTN_NO_TEMPLATES=1` configuration of
`tools/validate.lua`. No entries were removed and no Forever entry was touched
in any of the five runs. Both version strings are 1.2.17.

`CHANGELOG.md` records the findings under the 1.2.17 heading, in three
sections: the corrections, the claims removed as undateable or out of era, and
the pairs of entries that contradicted each other. P5 must not write those
again and now covers run 29 onwards.

Release checks before preparing: default validation and all nine CI
configurations pass with zero errors and warnings, check-gaps reports 43
explained gaps, prose lint is clean on the changelog, and git diff --check
passes. `tools/build-zip.sh` produces `ForAllTheNerds-1.2.17.zip` with the toc
at `ForAllTheNerds/ForAllTheNerds.toc`, declaring interface 16001 and 11509,
both version strings reading 1.2.17, `LICENSE` present and no tooling in the
package. The preceding sweep commit 147a660 passed CI for its exact SHA before
release preparation began.

### 2026-11-21, P4 run 29: Demont's Place to Fungal Rock

Reviewed 25 records alphabetically. Twenty-four were revised and one held up
with no change. Coverage is now 725 of 915 surviving entries, with 190 left.
P5 remains pending.

**A new oracle, and it settled nine of this run's findings.** Our locations have
been coming from wiki prose, which gives a direction and sometimes nothing at
all. The Classic Era client carries the answer in a table. `WorldMapOverlay`
holds, per subzone, the clickable rectangle for that subzone on its zone map, in
map pixels on a 1002 by 668 sheet, and `UiMapAssignment` holds each zone map's
world bounding box. Together they convert a creature or object spawn in the
cmangos dump into zone coordinates, and a named subzone into a rectangle on the
same scale. So the question "what stands on the ground the client calls Fungal
Rock" became a query rather than a reading. The method was validated against
five places whose wiki coordinates are published, and against Dreadmaul Hold,
where the overlay centre and Grol the Destroyer's spawn agree to within a point.
A later run doing geography should rebuild it: `UiMap`, `UiMapArt`,
`UiMapXMapArt`, `UiMapAssignment` and `WorldMapOverlay` from wago.tools for
`wow_classic_era`, with `AreaTable` for the names. Two cautions. Zone bounding
boxes overlap, so a spawn matches several zones and the smallest match is not
reliably the right one; print them all and pick by what else is nearby. And the
overlay rectangles do not tile, so a cluster can fall in the gap between two of
them, as this run's Defias camp did.

**Three entries described the wrong inhabitants.** These are the kind the gate
cannot see: every word is vanilla and the sentence is still false.

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Frayfeather Highlands | Harpies holding night elf ruins | Frayfeather hippogryphs and stagwings; the Frayfeather are hippogryphs, not harpies |
| Fallow Sanctuary | Forest trolls in the swamp's south | The Lost Ones' village in the north-east, with a chieftain, a cook and Ongeku |
| Eastmoon Ruins | Sandfury trolls using ruins of unclear origin | Troll-built ruins with a wandering Dunemaul party in them |
| Demont's Place | A Defias magician in a fortified farmhouse | Riverpaw gnolls camped on a dead farmstead |

**Demont's Place is the one worth reading twice**, because the correction turns
on our own earlier work. The client puts Demont's Place at Westfall 31,70, and
the only thing on that ground is a Riverpaw camp: brutes, mongrels, herbalists,
a fire and the farm's sacks of oats. The Defias cluster with a renegade mage in
it, which is plainly what the old entry was describing, sits at 37,75, outside
that rectangle. What settles which is which is the Dagger Hills entry this sweep
verified earlier: it already names Defias knuckledusters, pathstalkers and
highwaymen on exactly that cluster. The wiki's retail article says Defias
occupied Demont's Place, and it is wrong about the ground the client gives that
name to.

**Four more were in the wrong part of their zone.** Dustbelch Grotto was put in
the northern Badlands and is the main ogre mound in the south-west. Dustwind
Gulch was put near Kargath, which is at the far west, and is in the east by
Lethlor Ravine. Frostsaber Rock was put in "the western mountains" and is in
northern Winterspring. Fungal Rock was put on the crater's western side and is
the cavern in the north-eastern wall. Dun Mandarr was called ruins in the
northern snow and is a wrecked camp in the south.

**Eastern Strand had the wrong island at the wrong end of the coast.** The entry
was about Purgation Isle, "the nearest of them". Purgation Isle is at Hillsbrad
17,80, out past the Western Strand; the Eastern Strand is at 62,75, at the
opposite end of the same shore. What is actually on the strand is Daggerspine
naga, and Southshore treats them as a military matter: Marshal Redpath has his
lieutenant working the beach with orders to report in person.

**Three invented histories went out.** Fallen Sky Lake had the name explaining
itself as an impact crater, with the Burning Legion raining infernals across
Ashenvale and the demonic energy going into Felwood's soil. The 1.12 reason for
the name is better: night elves gathered moonstones at the lake until the
shadethicket came, and the treants' oracle has collected the fallen stones and
sits on the island with them. Fargodeep Mine had the kingdom walking away when
the richer seams gave out, and somebody declaring the mine clean every few
years. Dreadmist Peak had a tower on top of it; there is a bonfire, an altar of
fire, the Demon Seed and a pool, and no tower.

**Dreadmist Den had the geometry inverted.** The den was "the cave under
Dreadmist Peak". Quest 924 puts the Seed "in a cave on Dreadmist Peak, above a
demonic altar of fire", and the altar object sits at the same height as the
den's named demon while Sarilus Foulborne stands thirty yards higher at the
summit. It is a cave on the peak, not beneath it.

**Two leaders, and the one who is not there yet.** The Dunemaul Compound article
gives `leader = Unknown` and lists Sandscraper under `fleader`, the former
state. Sandscraper has no row in the 1.12 creature table at all. Gor'marok the
Ravager, who the infobox files as formerly in charge, is the leader quest 5863
names and is standing in the compound. This is the infobox rule in
`tools/era-audit.md` working exactly as written: for a vanilla entry the
f-prefixed field is the one to read. The same quest also gave Eastmoon Ruins its
occupants, since it says smaller bands of the same ogres "have invaded the old
troll ruins".

**Foothold Citadel lost a room and gained a quarrel.** The entry said Daelin
Proudmoore died in this keep and called it the room where Jaina's father died.
Nothing in 1.12 places his death in the building: the claim traces to a 2011
novel, and the RPG puts it on the steps. What 1.12 does have is better. The
citadel is the barracks east of Jaina's tower, Captain Garran Vimes keeps the top
floor, and the guard rolls there list men who came over with Jaina and stayed
loyal to the admiral as missing. Vimes calls them deserters who turned traitor
out of loyalty to a dead man, and their answer is that Theramore betrayed the
Alliance. The retail article's "Paymaster Lendry, Banker" is also post-vanilla:
1.12 has Clerk Lendry.

**Featherbeard is dead, and 1.12 says so in objects rather than text.** The entry
had the hovel as a house that was somebody's and now is not, with "that is the
whole of the record". The 1.12 world carries `Featherbeard's Journal` in the
hovel below Aerie Peak and `Featherbeard's Remains` out in the hills to the
south-east. No quest in 1.12 touches either, and the retail article's
`Featherbeard's Endorsement` is not a 1.12 quest. The entry now says what the
two objects say and nothing more.

**Cross-entry work.** Camp Kosh called itself "one of three ogre camps strung
across the Badlands" while Camp Boff and Camp Wurg both say four, and four is
right: Boff, Cagg, Kosh and Wurg all have `AreaTable` rows. Camp Kosh was
corrected with the batch. Dustbelch Grotto shares its map rectangle with Camp
Cagg, so the grotto entry now describes the mound and the dwarves' interest in
ogre scrap metal and leaves Tho'grun and the rock elementals to Camp Cagg.
Fallow Sanctuary and the Harborage now agree about the draenethyst. Dustwallow
Bay no longer repeats Tidefury Cove's Nat Pagle paragraph. The Western Pylon
carried the same invented clause as the Eastern one, an expedition "working
position" nobody states, and both now say what J.D. Collie's quests say instead.

**Held up.** Dustwind Cave was correct in every particular, down to the cliffs
above Razorwind Canyon and the neophytes training inside, and is byte-identical
to the previous commit. Eastern Pylon was correct about the three pylons and
only its last clause needed replacing.

**The fourteen names with no wiki article: Eastern Pylon is cleared.** Run 26
flagged it as a name with no article, and it has no `AreaTable` row either. It is
not invented: `The Eastern Pylon` is the title of 1.12 quest 4287, whose
objective reads "Discover the location of the Eastern Crystal Pylon in Un'Goro
Crater". The entry name is attested in 1.12 game text and needs no decision from
Martin. Thirteen to go, and the ranking scan agrees on that count: recomputed
over the 190 names still uncovered, nothing scores above zero and exactly 13
come back with no article.

**Ledger and checks.** Added 24 vanilla rows, every one asserted absent and then
seen failing the gate by name before it was filed, appended as a sorted block so
the ledger diff is 24 insertions and nothing else. No row was deleted and no
verdict changed. Six extractor artifacts were reworded out of the prose rather
than filed: `Seed` from "the Seed", `Searing` from a sentence opening with
"Searing infernals", `Taskmaster` and the epithet halves `Lost` and `Mad` from
names of the form "X the Y", and `Shy` and `Rotam`, which are what a hyphenated
name splits into. Shy-Rotam is real, named in quest 5056 as the frostsaber
matriarch, but filing two half-name rows would let `Shy` pass anywhere, so the
entry says "a matriarch" instead. One corpus-global failure appeared as
predicted in the method notes: removing the lower-cased "politically" from
Dustwallow Bay made the extractor keep `Politically` from a sentence opening in
Theramore Isle, and the build failed naming an entry outside the batch. Theramore
Isle's opener was reworded.

The gate was broken deliberately on the new `Rathorian` row: validation failed
with `Dreadmist Den uses "Rathorian", which tools/era-terms.tsv does not carry`,
and the row was restored.

Default validation and all nine CI configurations pass on Lua 5.4.9 with zero
errors and warnings; the `FTN_NO_TEMPLATES=1` configuration reports its usual
single note about generically stubbed widget API. check-gaps passes with 43
explained gaps. Prose lint is clean on Locales, the ledger and the worklist;
RHYTHM counts are Eastern Kingdoms 7, unchanged, and Kalimdor 4, down from 5.
`git diff --check` passes. The prose dump before and after confirms 27 vanilla
records changed, none added, none removed and no Forever entry touched: the 24
revised entries of this batch plus Camp Kosh, Theramore Isle and the Western
Pylon.

`tools/places.tsv` carried the same errors in six of its notes, including the
Defias magician at Demont's Place and the harpies at Frayfeather, and they were
corrected with the entries.

**Entries covered so far (724 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz
Island, Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms,
Alterac Mountains, Alterac Valley, Alther's Mill, Ambermill,
Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang Encampment, Angor
Fortress, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ariden's Camp, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode
Mine, Badlands, Bael Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal
Ruins, Balia'mah Ruins, Balnir Farmstead, Ban'Thallow Barrow Den,
Ban'ethil Barrow Den, Ban'ethil Hollow, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Battle Ring, Bay of Storms, Bear's Head, Beezil's
Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches, Black Channel
Marsh, Blackchar Cave, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackrock Stronghold,
Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blackwood Lake, Bladefist Bay, Blasted Lands, Bloodfen
Burrow, Bloodhoof Village, Bloodsail Compound, Bloodtooth Camp,
Bloodvenom Falls, Bloodvenom Post, Bloodvenom River, Bluefen, Bluegill
Marsh, Bogen's Ledge, Bolgan's Hole, Bones of Grakkarond, Booty Bay,
Bough Shadow, Boulder Lode Mine, Boulder'gor, Boulderfist Hall,
Boulderslide Cavern, Boulderslide Ravine, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brightwater Lake, Brightwood Grove, Brill, Brill Town Hall,
Broken Pillar, Bronzebeard Encampment, Browman Mill, Burning Blade
Coven, Burning Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp
Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp Narache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Chillwind Point,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cliffspring Falls,
Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's
Outpost, Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand,
Darkwhisper Gorge, Darnassus, Darrow Hill, Darrowmere Lake,
Darrowshire, Dawning Wood Catacombs, Deadeye Shore, Deadman's
Crossing, Deadwind Pass, Deadwind Ravine, Deadwood Village,
Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall
Canyon, Demon Fall Ridge, Demont's Place, Desolace, Diamondhead River,
Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur Village,
Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Post, Dreadmaul Rock,
Dreadmist Den, Dreadmist Peak, Dreadmurk Shore, Dream Bough, Drygulch
Ravine, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Mandarr, Dun Modr,
Dun Morogh, Dunemaul Compound, Durnholde Keep, Durotar, Duskwood,
Dustbelch Grotto, Dustfire Valley, Dustwallow Bay, Dustwallow Marsh,
Dustwind Cave, Dustwind Gulch, Dwarven District, East Pillar, Eastern
Plaguelands, Eastern Pylon, Eastern Strand, Eastmoon Ruins, Eastvale
Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise,
Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Fallen Sky Lake, Fallow
Sanctuary, Faol's Rest, Far Watch Post, Fargodeep Mine, Featherbeard's
Hovel, Feathermoon Stronghold, Fel Rock, Felfire Hill, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feral Scar Vale,
Feralas, Field of Giants, Fire Plume Ridge, Fire Scar Shrine,
Firewatch Ridge, Flame Crest, Foothold Citadel, Forest Song, Forest's
Edge, Forlorn Ridge, Forlorn Rowe, Fray Island, Frayfeather Highlands,
Freewind Post, Frostfire Hot Springs, Frostmane Hold, Frostsaber Rock,
Frostwhisper Gorge, Fungal Rock, Furlbrow's Pumpkin Farm, Gadgetzan,
Gahrron's Withering, Galak Hold, Gallows' Corner, Gallows' End Tavern,
Garren's Haunt, Garrison Armory, Gates of Ahn'Qiraj, Gavin's Naze,
Gelkis Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek
Farm, Gol'Bolar Quarry, Gold Coast Quarry, Gold Road, Goldshire,
Gordunni Outpost, Greatwood Vale, Greenpaw Village, Grim Batol,
Grimesilt Dig Site, Grimtotem Compound, Grimtotem Post, Grol'dom Farm,
Grom'gol Base Camp, Grommash Hold, Grove of the Ancients, Growless
Cave, Gunstan's Post, Haldarr Encampment, Hall of Legends, Hammerfall,
Hammertoe's Digsite, Hearthglen, Helm's Bed Lake, Hetaera's Clutch,
High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad Fields,
Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal, Hive'Zora,
Honor's Stand, Hunter Rise, Idlewind Lake, Iris Lake, Ironband's
Excavation Site, Ironforge, Ironstone Camp, Irontree Cavern, Isle of
Dread, Itharius's Cave, Jadefire Run, Jademir Lake, Jaedenar,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine,
Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan, Kargath,
Kharanos, Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village,
Kormek's Hut, Kurzen's Compound, Lake Al'Ameth, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Lethlor Ravine,
Light's Hope Chapel, Loch Modan, Lordamere Internment Camp, Lost
Point, Lost Rigger Cove, Lushwater Oasis, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Manor Mistmantle, Maraudon,
Mardenholde Keep, Marshal's Refuge, Mazthoril, Menethil Bay, Menethil
Harbor, Menethil Keep, Mirage Flats, Mirage Raceway, Mirkfallon Lake,
Mirror Lake Orchard, Mist's Edge, Misty Pine Refuge, Misty Reed Post,
Misty Reed Strand, Misty Valley, Mo'grosh Stronghold, Molten Core,
Moon Horror Den, Moonbrook, Moonglade, Moonwell, Mor'shan Rampart,
Morgan's Plot, Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound,
Mosshide Fen, Mulgore, Mystic Ward, Naxxramas, Nek'mani Wellspring,
Nesingwary's Expedition, Nethergarde Keep, Night Web's Hollow,
Nighthaven, Nightmare Vale, Nijel's Point, Noonshade Ruins, North
Tide's Hollow, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Abbey, Northshire River, Northshire Valley,
Northshire Vineyards, Northwatch Hold, Old Town, Olsen's Farthing,
Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing Thicket, Pestilent Scar,
Plaguewood, Pool of Tears, Pools of Arlithrien, Pools of Vision,
Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien
Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge,
Ratchet, Ravaged Caravan, Raven Hill, Raven Hill Cemetery, Ravencrest
Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill, Razorfen
Downs, Razorfen Kraul, Razormane Grounds, Rebel Camp, Red Cloud Mesa,
Redridge Canyons, Redridge Mountains, Refuge Pointe, Remtravel's
Excavation, Render's Valley, Rethress Sanctum, Revantusk Village,
Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj,
Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas, Ruins of
Eldarath, Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra,
Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of Thaurissan,
Rut'theran Village, Saldean's Farm, Sandsorrow Watch, Sardor Isle,
Sargeron, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post,
Scholomance, Scuttle Coast, Searing Gorge, Sen'jin Village, Sentinel
Hill, Seradane, Serpent's Coil, Shadow Grave, Shadow Hold, Shadowbreak
Ravine, Shadowfang Keep, Shadowsong Shrine, Shadra'Alor, Shalzaru's
Lair, Shaol'watha, Shatter Scar Vale, Shok'Thokar, Shrine of the
Fallen Warrior, Silithus, Silverpine Forest, Silverwind Refuge,
Silverwing Outpost, Sishir Canyon, Skulk Rock, Skull Rock, Sofera's
Naze, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost,
South Tide's Run, Southbreak Shore, Southern Barrens, Southern Gold
Road, Southern Savage Coast, Southfury River, Southmoon Ruins,
Southpoint Tower, Southshore, Southwind Village, Splintertree Post,
Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm
Point, Starbreeze Village, Starfall Village, Steamwheedle Port,
Stendel's Pond, Stillwater Pond, Stonard, Stone Cairn Lake, Stonemaul
Ruins, Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak,
Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Keep, Strahnbrad,
Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock Retreat,
Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point,
Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran,
Temple of Zin- Malor, Temple of the Moon, Terror Wing Path,
Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar
of Zul, The Apothecarium, The Barrens, The Bulwark, The Cape of
Stranglethorn, The Charred Vale, The Creeping Ruin, The Crossroads,
The Crystal Shore, The Dagger Hills, The Dark Portal, The Dawning
Isles, The Dead Field, The Deadmines, The Decrepit Ferry, The
Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The
Hidden Grove, The High Seat, The High Wilderness, The Hinterlands, The
Howling Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The
Jansen Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure
Vineyards, The Mage Quarter, The Magic Quarter, The Maker's Terrace,
The Marris Stead, The Marshlands, The Master's Cellar, The Master's
Glaive, The Maul, The Merchant Coast, The Molsen Farm, The Mor'shan
Rampart, The North Coast, The Noxious Glade, The Noxious Lair, The
Oracle Glade, The Overlook Cliffs, The Park, The Pillar of Ash, The
Pools of Vision, The Quagmire, The Red Reaches, The Riptide, The
Rogues' Quarter, The Rotting Orchard, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching
Canyon, The Sea of Cinders, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon
Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid
Hills, The Twin Colossals, The Vile Reef, The War Quarter, The
Weathered Nook, The Weeping Cave, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of Trials, Valley of
Wisdom, Valley of the Watchers, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River,
West Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's
Excavation Site, Whispering Shore, Whisperwind Grove, Whitereach Post,
Wildbend River, Windbreak Canyon, Windshear Crag, Winterfall Village,
Winterhoof Water Well, Winterspring, Witherbark Caverns, Witherbark
Village, Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Galak Camp, with Galardell
Valley, the Gates of Ironforge, the Gates of Uldum and Golakka Hot Springs
behind it. Recompute the ranking anyway to confirm nothing new scores. Count
duplicate names as separate records: Darnassus, South Gate Pass, The Bulwark,
The Talondeep Path and Thunder Bluff are each two entries. P5 remains pending.

### 2026-11-21, P4 run 30: Galak Camp to Lake Nazferiti

Reviewed 25 records alphabetically. Twenty-three were revised, one was moved out
of the vanilla corpus, and one held up with no change. Coverage is now 749 of
914 surviving entries, with 165 left. P5 remains pending.

**One entry was not vanilla at all, and finding out why found a second way in.**
Galak Camp had Galak centaur camped on the Mulgore grass. No 1.12 oracle knows
anything about them: the name has no `AreaTable` row in `wow_classic_era`, no
wiki article, and every spawned Galak creature in the dump is in Thousand
Needles. What it does have is a row in `tools/area-gaps.tsv` giving it
area id 474 in Mulgore. In Classic Era, area 474 is `Hunter Rise UNUSED`, parent
Mulgore. So Forever took a slot vanilla never shipped and named it Galak Camp,
and the entry is Forever's content wearing a vanilla tag. It is now
`era = "forever", spoiler = true`, the pair its neighbour Gloomrise already
carries. The validator insists on both: it failed the build with "is era
'forever' but spoiler is not true, so it would show by default" until both were
set. The prose is unchanged and is still owed a check against a Forever source.

**The reason it got in is a header.** `tools/area-gaps.tsv` was generated from
`AreaTable` for product `wowf`, Forever's own client, and its first line calls
the result "Vanilla places the client names that this addon has nothing for".
Forever's client carries Forever's areas, so that file is a list of vanilla
places plus Forever's, and anything written up off it arrives untagged.
Cross-checking all 202 of its rows against Classic Era's `AreaTable` by id:

- 33 rows have ids Classic Era does not carry at all. Most are in Forever's own
  zones, where this is expected, but fourteen are in vanilla zones: Poacher's
  Den, Ironforge Submarine Facility, Stormwind Harbor, Sunken Hollow, Martsirt,
  Bandarion Keep, Shadowvale, Whispering Forest, Dragonmaw Retreat, The Drunken
  Dwarf, Legashi Stronghold, Thalassian Vanguard Camp, Camp Gev'rek, Gloomrise,
  Skywatcher Plateau, Scalding Ridge, Pillar of Assimilation and Stomping
  Grounds.
- 2 rows share an id with a differently named Classic Era area: 474, above, and
  1219, which Forever spells Legashi Encampment and Classic Era spells Legash
  Encampment.

Of the ones that have entries, all are already tagged `era = "forever"` except
**Legashi Stronghold** and **Thalassian Vanguard Camp**, both sitting in the
vanilla corpus untagged. Both were left for the next run on purpose, because
they are not the same question. Legashi Stronghold's id 16234 is Forever's own.
Thalassian Vanguard Camp's place is vanilla: `Thalassian Base Camp` is area 1220
in Classic Era and the entry already carries it as an alias, so what is wrong
there is the title, not the ground. Our Legashi Encampment has the same shape.
The next batch opens on Legash Encampment, Legashi Encampment and Legashi
Stronghold in that order, and that is the place to settle all of it at once.

**Three entries had the wrong inhabitants, and one had none of the right ones.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Ironstone Plateau | High ground held by elementals and stone creatures | Bare rock with fledgling pterrordax and young diemetradon, and the four power crystals |
| Lake Nazferiti | Gurubashi ruins on every shore, troll territory | The Venture Company's base camp, with Foreman Cozzle and his shredders |
| Jagged Reef | A reef off the coast | The northern coast itself, with Storm Bay naga, makrinni and a mammoth shark on it |
| Irontree Woods | Corrupted treants, and a Cenarion opinion about them | Irontree stompers and wanderers, and the plant-by-plant cleansing the Circle actually does here |

Ironstone Plateau is the clearest case of a name writing an entry. The plateau
has stone in its name, so the entry gave it an elemental population and then
built a paragraph on Un'Goro having fire on the ridge, earth on this plateau and
water at the springs. The ground holds pterrordax, diemetradon, bloodpetal and
one stone guardian on a patrol that covers half the crater. What is actually up
there and interesting is the crystals: red, blue, green and yellow all sit on
the plateau, and those four are what the pylon entries this sweep fixed in run
29 are about.

**Heroes' Vigil was the wrong shape, the wrong place and the wrong war.** The
entry had it as a hilltop monument east of Goldshire to Stormwind's war dead,
and spent its second paragraph on the Alliance Expedition through the Dark
Portal and the five heroes left on the Draenor side. Heroes' Vigil is the middle
of the island in Stone Cairn Lake in north-eastern Elwynn. The Stone of
Remembrance object is on it, the First War is what it commemorates, and what is
standing there now is thirteen Defias rogue wizards. The 1.12 story is the
paladin's errand: two men came out to prove the Defias had got inside the
kingdom's borders, found a pair of them going over documents, attacked, and were
overwhelmed by more mages. Henze Faulk's body is still on the island. None of
Turalyon, Khadgar, Danath Trollbane, Kurdran Wildhammer or Alleria Windrunner
has anything to do with this place.

**Lake Mereldar was put next to a chapel twenty points away.** The entry had it
"close enough to Light's Hope to be almost safe" and spent half its length on
why Light's Hope holds. The overlay puts Lake Mereldar at 63,80 and Light's Hope
Chapel at 82,58. What is actually near the lake is Corin's Crossing to the north
and Tyr's Hand to the east, and that second one explains the Scarlet warders,
clerics and enchanters standing on the shore beside the blighted surges and
plague ravagers. The lake also grows Blood of Heroes, and the entry now ends on
that.

**Four more entries were in the wrong part of their zone or off by a landmark.**
Golakka Hot Springs was in "the northwest" and is in the west, north of Terror
Run. Ice Thistle Hills were "the eastern hills" and are south-east of Everlook,
which is what two 1.12 quests say and where the overlay puts them. Grizzlepaw
Ridge was on "the loch's southern slopes" and runs through the hills south of
Thelsamar, east of Stonesplinter Valley. Jasperlode Mine was "east of Crystal
Lake"; quest 76 gives the route, east along the road to the Tower of
Azora and then north into the foothills, and Mother Fang's spawn at Elwynn
62,48 agrees.

**Six invented claims went out.** Iceflow Lake had a shipwreck under the ice,
and there is no wreck object anywhere in Dun Morogh. Jasperlode Mine was dug for
gemstone, had surveyors who never finished, and carried a standing Stormwind
instruction to the Goldshire militia; none of that is anywhere, and the mine's
real second half is a colony of mine spiders with Mother Fang at the back of it.
The Gates of Ironforge were "the only formal entrance", with the Deeprun Tram in
the game since launch and surfacing inside Tinker Town. Lake Elune'ara was
warded by the Cenarion Circle. Gurubashi Arena was run by goblins; 1.12 calls
Short John Mithril "the Pirate who runs the event at Gurubashi". Jadefire Glen
rested its whole middle paragraph on the satyrs speaking Eredun, which is an
infobox field and nothing else.

**Three retail names were caught before they were written in.** This is the
habit `tools/era-audit.md` asks for and it paid three times in one batch.
Overseer Gorthak, whom the Kargathia Keep article names as the orc in charge, has
no row in the 1.12 creature table. The Steaming Fury elementals the Golakka
article puts on the shores of the pools have none either. Gorick Guzzledraught,
who the Grizzlepaw article says "is also here", has none. In the same way the
three Ancients the Irontree Woods article names, Hastat, Stoma and Vartrus, do
have creature rows, at entry 14524 to 14526 and level 63, with zero spawns: they
are not standing in the 1.12 world and were not claimed.

**Jadefire Glen's leader is in the wrong place, and that is the infobox rule
inverted.** The article gives `leader = Xavathras` for the glen. Xavathras's
spawn is at Felwood 32,67, inside the Ruins of Constellas, a separate area with
its own `AreaTable` row. Run 29 learned to read the f-prefixed field for a
vanilla entry; this one is the same lesson from the other side, where the
infobox's current leader is real and simply is not there. The glen holds
jadefire satyrs and felsworn with Mongress and Alshirr Banebreath in it, and
what the entry now explains is the thing 1.12 actually cares about: the
corrupted moonwell at Constellas, which the satyrs are using to make more of
themselves, with the spoils going north to Xavaric.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Gates of Uldum: the sealed door is now the Uldum Pedestal, the Stone Watcher
  of Norgannon that appears at it and calls itself a guardian of entry, and the
  Plates of Uldum nobody can find. Ironforge wants to walk into the place the
  Creators worked without bringing a shovel; Thunder Bluff's reading is that the
  secrets the earth keeps would destroy us all. Both expeditions stop here.
- Hall of Explorers: the Library, Prospector Stormpike, who is worth ducking
  after you hand him bad news and can read what nobody else north of Blackrock
  Spire can, and Historian Karnik, who takes the Discs of Norgannon as an
  unfinished sentence and sends people to Uldum. The entry's claim about where
  dwarves come from is not a theory the League brought to Uldaman; quest 2278 is
  Uldaman telling it.
- Ironband's Compound: Sturgy Ironband taught blacksmithing here and was the
  best there was. A student brought him a load of umbral ore, he was eager to
  work with it, and a band of Dark Iron came for the compound soon after it
  arrived and killed everyone in the place.
- Grizzlepaw Ridge: the Farstrider Lodge went after Ol' Sooty for a year and
  nobody managed it. A younger hunter called Daryl tried his own hand and came
  away with the scar over his eye. Vyrin Swiftwind wants the head and says it
  would leave Daryl speechless for once.
- Hidden Path: the sapta. A drink made to bind a spirit to one element, known to
  only a few shaman, drunk in a holy place and never anywhere else.
- Ironbeard's Tomb: oozes, black and crimson and monstrous, and Sida still
  walking out from Menethil Harbor every week. On one visit she panicked and
  threw her bag at one, it absorbed the bag whole, and that bought her the
  moment she needed to get away.
- Iceflow Lake: Brewnall Village on the west bank keeping a hole cut in the ice,
  Paxton Ganter working it and Gretta Ganter selling the tackle, the worg Timber
  on the islands, and Frostmane Hold south-west of the village.
- Ice Thistle Hills: Umi Rumplesnicker's mechanical yeti and Witch Doctor
  Mau'ari's e'ko: the fur, the horns, and what the fur takes off a blow.
- Lake Elune'ara: the Trial of the Lake. Down into the water for a shrine
  bauble, which decays in your hands, out and across to the Shrine of Remulos
  before it goes, with other druids in the water hunting their own.
- Galardell Valley: Morganth gives the Shadowhide clan its orders through the
  pendants they wear, which is why Lakeshire's bounty is on pendants. He is in
  conflict with the Stonewatch orcs and nobody has worked out why. Theocritus,
  watching through the Eye of Azora, has worked out something worse: Morganth is
  hunting the Scythe of Elune.
- Gates of Ironforge: the battleground emissaries on the doorstep, and Jordan
  Stilwell's anvil outside the gates, a human smith up from Westfall's Longshore
  who left his wife Daphne in Defias country to come and work with the dwarves.

**Cross-entry work.** Grosh'gok Compound's last paragraph was a shortened
Deadwind Pass and The Vice, a pass with Karazhan at one end and an ogre mound at
the other; both of those entries already say it, and Deadwind Ravine already lists
the ogre composition, so the paragraph went and the compound's own ogres took
its place. The Gates of Uldum entry no longer describes Gunstan's camp, because
Gunstan's Post is an entry of its own and already has the dwarf, the campfire
and the book about the awakening of the dwarves; the gates entry names it and
stops. `tools/places.tsv` carried the Heroes' Vigil hilltop and the Lake
Mereldar chapel in its notes, and both were corrected with the entries.

**Held up.** Gunther's Retreat was correct in every particular, down to the lich
who believes every other undead in the glades is still a Scourge thrall and has
his minions attack anyone who comes near on that basis, and is byte-identical to
the previous commit. Kargathia Keep's Kargath Bladefist paragraph held; only its
first paragraph, which had officers nobody names and a reinforcement plan nobody
states, was replaced with the operation the dump shows.

**The eleven names with no wiki article, down from thirteen.** Both of this
batch's were settled. Gates of Uldum has no `AreaTable` row, but 1.12 quests
2946 and 2966 send the player to "the gates of Uldum in Tanaris" and the reward
text puts a Stone Watcher "in front of the gates of Uldum", so the name is
attested in game text. Galak Camp is resolved the other way, as Forever's own
area, above. What remains is Legashi Encampment, Legashi Stronghold, Northern
Pylon, O'Breen's Encampment, Old Dalaran Ruins, Ruins of Darrowshire, Stormwind
Gates, Thalassian Vanguard Camp, The Dream Bough, The Sanctum and Western Pylon.
Three of those eleven are the Forever naming cases above, worth knowing before
the next run starts on two of them. The ranking was recomputed over all
190 names that were still uncovered at the start of this run: nothing scored
above zero, and the thirteen missing matched.

**Ledger and checks.** Added 43 vanilla rows, every one asserted absent first
and then seen failing the gate by name, appended as a sorted block so the ledger
diff is 43 insertions and nothing else. No row was deleted and no verdict
changed. The deliberate break was the Mother Fang row: removing it failed the
build with `Jasperlode Mine uses "Mother Fang"`, and the row was restored. The
`era = "forever"` and `spoiler` pairing was also seen failing, on Galak Camp,
before it was satisfied.

Nine extractor artifacts were reworded out of the prose rather than filed, and
two of them are the corpus-global trap firing in both directions at once.
Writing `Remy Two Times` made `Two` a proper noun and failed fourteen other
entries on sentence-initial "Two", plus one on `Two of the Horde`; the name came
out and the gold dust kept its buyer without being named. Writing `Foreman
Cozzle` capitalised "Foreman" mid-sentence. That stopped it being ordinary
English, so it stopped being stripped from the front of a run, so
`Azurelode Mine uses "Foreman Bonds"` failed two zones away; both foremen are real 1.12
creatures, so both were filed rather than reworded, and the compositional rule
has two fewer entries resting on it. Going the other way, removing "built for
the empire's blood sports" from Gurubashi Arena took the corpus's only
lower-cased "combat" with it and failed `The Maul uses "Combat"`; a lower-cased
"combat" went back into the arena's first sentence. The rest were ordinary words
at the head of a sentence: `Steaming`, `Frenzied`, `Fledgling`, `Grizzled`,
`Snapjaw`, `Irontree`, `Whipper`, `Grave`, `Twelve`, plus `Lodge` and `Sturgy`
standing alone where a filed full name reads better, and two runs broken because
they crossed "of the": `Eridan Bluewind of the Emerald Circle` and `Prospector
Gunstan of the Explorers' League`.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps.
`tools/lint-prose.py` is clean on `Data/Locales.lua`, `Data/Cities.lua`,
`tools/era-terms.tsv` and `tools/places.tsv`, with RHYTHM at 7 on
`Data/EasternKingdoms.lua` and 4 on `Data/Kalimdor.lua`, both unchanged. One of
those did rise during the run: "The ridge is held by grizzled..." chained onto
the preceding entry's "The statuary is a statement..." and made a third
consecutive "The ", so it became "It is held by". Comparing the prose dump
against a worktree at HEAD: 981 entries before and after, none added, none
removed, 23 vanilla records changed, and exactly one era tag changed.

**Entries covered so far (748 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz
Island, Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms,
Alterac Mountains, Alterac Valley, Alther's Mill, Ambermill,
Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang Encampment, Angor
Fortress, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ariden's Camp, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode
Mine, Badlands, Bael Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal
Ruins, Balia'mah Ruins, Balnir Farmstead, Ban'ethil Barrow Den,
Ban'ethil Hollow, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Battle Ring, Bay of Storms, Bear's Head, Beezil's
Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches, Black Channel
Marsh, Blackchar Cave, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackrock Stronghold,
Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blackwood Lake, Bladefist Bay, Blasted Lands, Bloodfen
Burrow, Bloodhoof Village, Bloodsail Compound, Bloodtooth Camp,
Bloodvenom Falls, Bloodvenom Post, Bloodvenom River, Bluefen, Bluegill
Marsh, Bogen's Ledge, Bolgan's Hole, Bones of Grakkarond, Booty Bay,
Bough Shadow, Boulder Lode Mine, Boulder'gor, Boulderfist Hall,
Boulderslide Cavern, Boulderslide Ravine, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brightwater Lake, Brightwood Grove, Brill, Brill Town Hall,
Broken Pillar, Bronzebeard Encampment, Browman Mill, Burning Blade
Coven, Burning Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp
Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp Narache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Chillwind Point,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cliffspring Falls,
Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's
Outpost, Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand,
Darkwhisper Gorge, Darnassus, Darrow Hill, Darrowmere Lake,
Darrowshire, Dawning Wood Catacombs, Deadeye Shore, Deadman's
Crossing, Deadwind Pass, Deadwind Ravine, Deadwood Village,
Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall
Canyon, Demon Fall Ridge, Demont's Place, Desolace, Diamondhead River,
Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur Village,
Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Post, Dreadmaul Rock,
Dreadmist Den, Dreadmist Peak, Dreadmurk Shore, Dream Bough, Drygulch
Ravine, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Mandarr, Dun Modr,
Dun Morogh, Dunemaul Compound, Durnholde Keep, Durotar, Duskwood,
Dustbelch Grotto, Dustfire Valley, Dustwallow Bay, Dustwallow Marsh,
Dustwind Cave, Dustwind Gulch, Dwarven District, East Pillar, Eastern
Plaguelands, Eastern Pylon, Eastern Strand, Eastmoon Ruins, Eastvale
Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise,
Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Fallen Sky Lake, Fallow
Sanctuary, Faol's Rest, Far Watch Post, Fargodeep Mine, Featherbeard's
Hovel, Feathermoon Stronghold, Fel Rock, Felfire Hill, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feral Scar Vale,
Feralas, Field of Giants, Fire Plume Ridge, Fire Scar Shrine,
Firewatch Ridge, Flame Crest, Foothold Citadel, Forest Song, Forest's
Edge, Forlorn Ridge, Forlorn Rowe, Fray Island, Frayfeather Highlands,
Freewind Post, Frostfire Hot Springs, Frostmane Hold, Frostsaber Rock,
Frostwhisper Gorge, Fungal Rock, Furlbrow's Pumpkin Farm, Gadgetzan,
Gahrron's Withering, Galak Hold, Galardell Valley, Gallows' Corner,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's Naze, Gelkis
Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm,
Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry, Gold Road,
Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw Village, Grim
Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem Post,
Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold,
Grosh'gok Compound, Grove of the Ancients, Growless Cave, Gunstan's
Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment, Hall of
Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow
Lake, Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's
Excavation Site, Ironbeard's Tomb, Ironforge, Ironstone Camp,
Ironstone Plateau, Irontree Cavern, Irontree Woods, Isle of Dread,
Itharius's Cave, Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar,
Jagged Reef, Jaggedswine Farm, Jaguero Isle, Janeiro's Point,
Jangolode Mine, Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai
Ruins, Karazhan, Kargath, Kargathia Keep, Kharanos, Kodo Graveyard,
Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Kurzen's
Compound, Lake Al'Ameth, Lake Elune'ara, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lake Mereldar, Lake Nazferiti,
Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lariss Pavilion, Lethlor Ravine, Light's Hope Chapel, Loch Modan,
Lordamere Internment Camp, Lost Point, Lost Rigger Cove, Lushwater
Oasis, Maestra's Post, Magram Village, Malaka'jin, Malden's Orchard,
Manor Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge,
Mazthoril, Menethil Bay, Menethil Harbor, Menethil Keep, Mirage Flats,
Mirage Raceway, Mirkfallon Lake, Mirror Lake Orchard, Mist's Edge,
Misty Pine Refuge, Misty Reed Post, Misty Reed Strand, Misty Valley,
Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook,
Moonglade, Moonwell, Mor'shan Rampart, Morgan's Plot, Morgan's Vigil,
Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic Ward,
Naxxramas, Nek'mani Wellspring, Nesingwary's Expedition, Nethergarde
Keep, Night Web's Hollow, Nighthaven, Nightmare Vale, Nijel's Point,
Noonshade Ruins, North Tide's Hollow, Northfold Manor, Northpass
Tower, Northridge Lumber Camp, Northshire Abbey, Northshire River,
Northshire Valley, Northshire Vineyards, Northwatch Hold, Old Town,
Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar, Owl Wing Thicket,
Pestilent Scar, Plaguewood, Pool of Tears, Pools of Arlithrien, Pools
of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Ragefire Chasm, Ranazjar Isle, Raptor Grounds,
Raptor Ridge, Ratchet, Ravaged Caravan, Raven Hill, Raven Hill
Cemetery, Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat,
Razor Hill, Razorfen Downs, Razorfen Kraul, Razormane Grounds, Rebel
Camp, Red Cloud Mesa, Redridge Canyons, Redridge Mountains, Refuge
Pointe, Remtravel's Excavation, Render's Valley, Rethress Sanctum,
Revantusk Village, Roguefeather Den, Roland's Doom, Ruins of Aboraz,
Ruins of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of
Constellas, Ruins of Eldarath, Ruins of Jubuwal, Ruins of Lordaeron,
Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of Ravenwind, Ruins of
Thaurissan, Rut'theran Village, Saldean's Farm, Sandsorrow Watch,
Sardor Isle, Sargeron, Scalebeard's Cave, Scarlet Monastery, Scarlet
Watch Post, Scholomance, Scuttle Coast, Searing Gorge, Sen'jin
Village, Sentinel Hill, Seradane, Serpent's Coil, Shadow Grave, Shadow
Hold, Shadowbreak Ravine, Shadowfang Keep, Shadowsong Shrine,
Shadra'Alor, Shalzaru's Lair, Shaol'watha, Shatter Scar Vale,
Shok'Thokar, Shrine of the Fallen Warrior, Silithus, Silverpine
Forest, Silverwind Refuge, Silverwing Outpost, Sishir Canyon, Skulk
Rock, Skull Rock, Sofera's Naze, Solliden Farmstead, Sorrow Hill,
Sorrowmurk, South Gate Outpost, South Tide's Run, Southbreak Shore,
Southern Barrens, Southern Gold Road, Southern Savage Coast, Southfury
River, Southmoon Ruins, Southpoint Tower, Southshore, Southwind
Village, Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog,
Stagalbog Cave, Staghelm Point, Starbreeze Village, Starfall Village,
Steamwheedle Port, Stendel's Pond, Stillwater Pond, Stonard, Stone
Cairn Lake, Stonemaul Ruins, Stonesplinter Valley, Stonetalon
Mountains, Stonetalon Peak, Stonewatch, Stonewatch Keep, Stonewrought
Dam, Stonewrought Pass, Stormrage Barrow Dens, Stormwind City,
Stormwind Keep, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch
Glade, Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil,
Temple of Arkkoran, Temple of the Moon, Temple of Zin- Malor, Terror
Wing Path, Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span,
The Altar of Zul, The Apothecarium, The Barrens, The Bulwark, The Cape
of Stranglethorn, The Charred Vale, The Creeping Ruin, The Crossroads,
The Crystal Shore, The Dagger Hills, The Dark Portal, The Dawning
Isles, The Dead Field, The Deadmines, The Decrepit Ferry, The
Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The
Hidden Grove, The High Seat, The High Wilderness, The Hinterlands, The
Howling Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The
Jansen Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure
Vineyards, The Mage Quarter, The Magic Quarter, The Maker's Terrace,
The Marris Stead, The Marshlands, The Master's Cellar, The Master's
Glaive, The Maul, The Merchant Coast, The Molsen Farm, The Mor'shan
Rampart, The North Coast, The Noxious Glade, The Noxious Lair, The
Oracle Glade, The Overlook Cliffs, The Park, The Pillar of Ash, The
Pools of Vision, The Quagmire, The Red Reaches, The Riptide, The
Rogues' Quarter, The Rotting Orchard, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching
Canyon, The Sea of Cinders, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon
Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid
Hills, The Twin Colossals, The Vile Reef, The War Quarter, The
Weathered Nook, The Weeping Cave, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of the Watchers, Valley
of Trials, Valley of Wisdom, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River,
West Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's
Excavation Site, Whispering Shore, Whisperwind Grove, Whitereach Post,
Wildbend River, Windbreak Canyon, Windshear Crag, Winterfall Village,
Winterhoof Water Well, Winterspring, Witherbark Caverns, Witherbark
Village, Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Legash Encampment, with
Legashi Encampment, Legashi Stronghold, Lighthouse and Lion's Pride Inn behind
it. The first three are the Forever naming question this run opened and should
be settled together. Recompute the ranking anyway to confirm nothing new scores.
Count duplicate names as separate records: Darnassus, South Gate Pass, The
Bulwark, The Talondeep Path and Thunder Bluff are each two entries. P5 remains
pending.

### 2026-11-21, P4 run 31: Legash Encampment to North Tide's Run

Reviewed 25 records alphabetically. Twenty-three were revised, one was deleted as
a duplicate, one was moved out of the vanilla corpus, and one held up with no
change. Coverage is now 772 of 912 surviving entries, with 140 left. P5 remains
pending.

**The Azshara satyrs were three entries for two places.** Run 30 ended by
flagging this and the batch opened on it, so it was settled first.
`Legash Encampment` is area 1219 in `wow_classic_era`, in northern Azshara, and
Forever's client spells the same area `Legashi Encampment`. We had an entry under
each spelling, with different prose, for one patch of ground. The third,
`Legashi Stronghold`, is area 16234, which Classic Era does not carry at all, and
its prose had been written from the Legash Encampment wiki article: the same
"east of Ursolan, north of the Thalassian camp", and a grimoire Archmage Xylem
found there.

That resolves three ways.

- **Legash Encampment** keeps the ground, with `aliases = { "Legashi Encampment" }`
  so Forever's client still resolves to it. `Data/Schema.lua` documents aliases as
  "other strings the client might report for this place", which is this case
  exactly. Its position is now confirmed rather than quoted: the overlay puts the
  encampment at Azshara 58,18, Ursolan at 47,28 and the Thalassian Base Camp at
  61,29, so east of the one and north of the other is right.
- **Legashi Encampment** is deleted as the duplicate. There is no `tools/places.tsv`
  row for either spelling, so nothing had to be commented out; run 10 and run 13
  both left that loose end and the rule from run 13 stands, that a deletion is not
  finished until the worklist says why.
- **Legashi Stronghold** is now `era = "forever", spoiler = true`, and the borrowed
  geography is out of it. The grimoire went too: no 1.12 quest mentions one in
  Azshara, and the wiki's citation is to a quest that does not exist in 1.12 at all.
  What is left is the clan and the War of the Ancients, which hold either way, and
  the entry still owes a Forever source for its own specifics.

**Four entries had the wrong inhabitants, and one had the wrong everything.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Nethander Stead | A Hillsbrad farm still being worked, whose farmers say the crops do not care who is winning | An abandoned farm held by Mudsnout gnolls, with giant white mushrooms growing in the fields |
| Mizjah Ruins | Overgrown ruins, with a paragraph on the Gurubashi collapse | Mosh'Ogg brutes and witch doctors, ambushing Grom'gol's supply caravans to Stonard |
| Mystral Lake | Furbolgs on the shores | Three dozen befouled water elementals in the water, and the Talondeep Path shut because of them |
| Mirror Lake | Kobolds working out of the nearby hills | Defias in the trees, and a mage sent from Stormwind to test the water |
| Lower Wilds | Thick jungle south from the Twin Colossals, gorillas and yeti | The eastern end of Feralas running out to Thousand Needles, longtooth runners and ironfur bears, with Thalanaar at the far end |

Nethander Stead is the one to read twice. The entry was a farm with farmers on it,
and nobody has farmed it for a long time. Quest 509 sends the player to the stead
"south of Tarren Mill and east of the river and Southshore" to collect six
Mudsnout Blossoms "from the field", and Apothecary Lydon's own comment on the
gnolls is that at least they are good for something. The mushrooms are the first
step of an elixir of agony, and the chain runs through Master Apothecary Faranell
in the Undercity towards a new plague. There is nothing in it about crops.

**Mazra'Alor had the wrong tribe, the wrong shape and the wrong owner.** The entry
called it an Amani site in the north-east that the Scourge had taken over, with
Zul'Mashar "close by". Mazra'Alor is the large ziggurat at the heart of Zul'Mashar,
and the trolls on it are Mossflayer: scouts, cannibals and shadowhunters, with
Mossflayer zombies among them, so the plague got into the tribe rather than
replacing it. What makes the place matter is quest 5065, which says two of the six
Tablets of Mosh'aru are in Mossflayer hands in the Eastern Plaguelands, and that
the tablets record how Hakkar's essence was contained. The Hakkar paragraph the
Mizjah entry had been carrying belongs here, in a form 1.12 actually supports.

**North Gate Pass contradicted our own North Gate Outpost entry, and lost.** The
pass entry said it carries traffic "toward the Badlands road and the eastern
mountains" and is the route the Mo'grosh use. Our outpost entry, correctly, says
the pass links Dun Morogh with Loch Modan. The overlay puts North Gate Pass at
Loch Modan 23,15, the north-west corner, and the client carries the pass as two
area rows, 807 on the Dun Morogh side and 838 on the Loch side. The Mo'grosh are
at the opposite corner: quest 278 has them mining crystals "to the northeast" and
quest 1655 sends the player "northeast across the Loch". Both claims went.

**Four more invented claims went out.** Lion's Pride Inn had the lion on the sign
standing for Anduin Lothar, in a paragraph that admitted "whether the innkeeper had
him in mind is not recorded", which is the tell. Maclure Vineyards had a feud whose
origins "depend entirely on which farmhouse you ask in" and a magistrate who has
given up on it. Longshore had Stormwind's merchant traffic running close inshore
and Sentinel Hill having no coastal patrol. Nightsong Woods had Thrall restraining
the Warsong "more than once"; no 1.12 text says so, and what the Horde's own quest
text does say is that the Alliance, "under the guise of protecting a forest that
doesn't belong to them", is trying to deny the Horde one of its largest sources of
lumber.

**Three retail names were caught before they were written in, again.** The North
Point Tower article is built around a blood elf prisoner called Ithania, with
Captain Darill and Sergeant Lukas garrisoning the place; none of the three has a
row in the 1.12 creature table, and the quests the article lists are the 2.3
Dustwallow revamp. Private Hendel does exist in 1.12, and he is not there: quest
1265 puts him at "the first tower outside of Theramore", which the objective names
as Sentry Point, and quest 1266 moves him to tents along the road west. So the
entry now says what 1.12 has at the tower, Theramore's sentries, with the
infiltrators camped along the road watching Brackenwall and the Kul Tiras marines
who get paid at the start of every month.

**The Military Ward was training the wrong classes.** It had warrior and paladin
training and gryphon riders, then undercut itself by adding that the gryphons come
from the Wildhammers. Quest 1679 settles the district outright: "You can find Muren
at the Hall of Arms in the Military Ward of Ironforge", for a warrior trainer. The
hall holds warrior and hunter training, the battlemasters and a hangar for steam
tanks and flying machines, and Muren Stormpike at Ironforge 70.8,90.3, Donal Osgood
at 69.9,88.9 and Buliwyf Stonehand at 61.2,89.5 put all three in the same corner of
the city. Paladin training is in the Mystic Ward, which has its own entry.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Mannoroc Coven: the Burning Blade is bringing the demons through. The cult opens
  portals with the Hand of Iruxos, kept in a demon box inside Thunder Axe Fortress,
  and Taiga Wisemane at Shadowprey Village wants six portals banished and warns
  about the guardians on them. Lord Azrethoc is over the demons and Jugkar Grim'rod
  is the Burning Blade's man on site. The Gizelton Caravan pays for an escort past
  the place because something has the kodos spooked.
- Mor'shan Base Camp: the camp is the Horde's way into Warsong Gulch. Captain
  Shatterskull takes the marks of honour and Kelm Hargunth turns a standing with
  the clan into rations and bandages that work nowhere else. The three paragraphs
  of Gold Road the entry had been carrying are already in the Gold Road and
  Mor'shan Rampart entries.
- Lordamere Lake: the water is dead. An ancient plague killed off the lake's
  aquatic life, Apothecary Berard was studying it until Arugal took his mind, and
  the Royal Apothecary Society went after his journal for exactly that reason. The
  Dawning Isles are overrun by Vile Fin murlocs, snapjaw turtles are worth money in
  Southshore, Lord Aliden Perenolde's manor is on the shore and Dalaran's wizards
  used to run an internment camp on the water.
- Maclure Vineyards: the feud has a romance in the middle of it. Maybell Maclure
  and Tommy Joe Stonefield, a note to William Pestle at the inn, crystal kelp off
  the Crystal Lake murlocs, and a bottle of invisibility liquor. Billy Maclure is
  accused of taking an old widow's necklace, a pork belly pie improves his mood,
  and somebody has put a price on the Brackwell sow's collar.
- Mistvale Valley: Witch Doctor Unbagwa in his hidden cave is the only one who can
  call up the white beast Mokk, whose heart is what a man dying of Stranglethorn
  fever needs, and he wants a gorilla fang to start and protection while he talks.
  The gorillas also supply fangs, aged sinew and the giblets a Booty Bay bookmaker
  sends to a debtor without saying where they came from. Hemet Nesingwary is out,
  because his 1.12 expedition hunts tigers, panthers and raptors.
- Night Run: the Felmusk hold it, it is the smallest of the three Ashenvale satyr
  settlements with Satyrnaar and Xavian, and it sits on a naze nobody climbs. A
  Warsong oil delivery was intercepted and is being used for rituals here and at
  the other two.
- Lion's Pride Inn: Innkeeper Farley, the motto about rest and relaxation for the
  tired and cold, William Pestle lodging there with his potions, and the registry
  out of Duskwood with a second address for Stalvan half scratched out, pointing
  here.
- Mirror Lake: Jennea Cannon sends mages to fill a flask at the foot of the
  waterfall, because the mystic struggles of the last few years tore magic out of
  channels that used to be stable, and her fear is for anyone drinking from it.
- Nightsong Woods: the eastern half of the forest from Raynewood Retreat out to
  Azshara, and Kayneth Stillwind at the shrine of Forest Song wanting reports
  because he thinks a corruption is moving through Ashenvale. Forest Song is in
  1.12, named in quest 4581, which is worth knowing because the retail article
  describes it as a draenei outpost.

**Held up, and one that nearly did.** North Gate Outpost was correct in every
particular, down to the mountaineers lost in the mountains hunting the larger
beasts and the young dwarves and gnomes sent after them, and is byte-identical to
the previous commit. The Lighthouse was correct too, including the part that looked
least likely: Captain Grayson really is a ghost, `creature_template` 392 is type 6,
undead, and quest 104 has him say his own life "was ended upon the rocks". It
gained the two details 1.12 adds, that the oil for the flame comes off the harvest
golems inland and that Old Murk-Eye talked the weaker-minded murlocs into the
second raid.

**Cross-entry work.** Longshore now names Daphne Stilwell's farmhouse at its
southern end, which closes a loop run 30 opened at the Gates of Ironforge, where
Jordan Stilwell is the smith who went up to work with the dwarves and left her
there. Longshore and North Tide's Run both hold a lockbox with half of the Pendant
of the Sea Lion in it, the druid aquatic-form trial that run 30 put into Lake
Elune'ara; the four lockboxes are at Westfall 18,33, Silverpine 30,29, Durotar
22,22 and Darkshore 49,11. North Tide's Run also gained what Wallace the Blind
actually is, a weaponsmith, which his `SubName` has said all along. Misty Shore and
Lordamere Lake both said "Dalaran's crater", which is a post-vanilla name; both now
say the ruins. `tools/places.tsv` carried the Longshore, Nightsong Woods and Night
Run errors in its notes and all three were corrected.

**The names with no wiki article are down to nine.** Both of this batch's were
settled by the Azshara work above, one by deletion and one by era. What remains is
Northern Pylon, O'Breen's Encampment, Old Dalaran Ruins, Ruins of Darrowshire,
Stormwind Gates, Thalassian Vanguard Camp, The Dream Bough, The Sanctum and
Western Pylon. Thalassian Vanguard Camp is the last of the three Forever naming
cases: its ground is vanilla, `Thalassian Base Camp` is area 1220, and the entry
already carries that as an alias, so what is wrong there is the title. The ranking
was recomputed over the 165 names uncovered at the start of this run and over the
140 left after it; nothing scored above zero either time.

**Ledger and checks.** Added 35 vanilla rows, every one asserted absent first and
then seen failing the gate by name, appended as a sorted block so the ledger diff
is 35 insertions and nothing else. No row was deleted and no verdict changed. The
deliberate break was the Mudsnout row: removing it failed the build with
`Nethander Stead uses "Mudsnout"`, and the row was restored.

Eight extractor artifacts were reworded rather than filed: `Gulch` and `Lion's
Pride` and `Unbagwa` and `Shatterskull` standing alone where the filed full name
reads better, `Marines` and `Outriders` from the tail of a unit name, `Savage` from
"Mokk the Savage", and `Theramore Sentries` from a plural the extractor does not
strip. A new gate also fired for the first time in this sweep: `validate.lua`
checks the rate of `", which"` across the whole corpus, not just per file, and
nine new clauses pushed it to 117 uses, 12.2 per 10k words against a budget of 12.
Four were rewritten and the warning cleared. That is worth remembering, because the
per-file lint had nothing to say about any of them.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps.
`tools/lint-prose.py` is clean on `Data/Locales.lua`, `Data/Cities.lua`,
`tools/era-terms.tsv`, `tools/places.tsv` and this log, with RHYTHM at 7 on
`Data/EasternKingdoms.lua` and 4 on `Data/Kalimdor.lua`, both unchanged. Comparing
the prose dump against a worktree at HEAD: 989 records before and 988 after, none
added, one removed, 23 changed and one era tag changed. The corpus is now 912
vanilla entries and 76 Forever ones.

**Entries covered so far (771 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz
Island, Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms,
Alterac Mountains, Alterac Valley, Alther's Mill, Ambermill,
Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang Encampment, Angor
Fortress, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ariden's Camp, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode
Mine, Badlands, Bael Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal
Ruins, Balia'mah Ruins, Balnir Farmstead, Ban'ethil Barrow Den,
Ban'ethil Hollow, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Battle Ring, Bay of Storms, Bear's Head, Beezil's
Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches, Black Channel
Marsh, Blackchar Cave, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackrock Stronghold,
Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blackwood Lake, Bladefist Bay, Blasted Lands, Bloodfen
Burrow, Bloodhoof Village, Bloodsail Compound, Bloodtooth Camp,
Bloodvenom Falls, Bloodvenom Post, Bloodvenom River, Bluefen, Bluegill
Marsh, Bogen's Ledge, Bolgan's Hole, Bones of Grakkarond, Booty Bay,
Bough Shadow, Boulder Lode Mine, Boulder'gor, Boulderfist Hall,
Boulderslide Cavern, Boulderslide Ravine, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brightwater Lake, Brightwood Grove, Brill, Brill Town Hall,
Broken Pillar, Bronzebeard Encampment, Browman Mill, Burning Blade
Coven, Burning Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp
Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp Narache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Chillwind Point,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cliffspring Falls,
Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's
Outpost, Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand,
Darkwhisper Gorge, Darnassus, Darrow Hill, Darrowmere Lake,
Darrowshire, Dawning Wood Catacombs, Deadeye Shore, Deadman's
Crossing, Deadwind Pass, Deadwind Ravine, Deadwood Village,
Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall
Canyon, Demon Fall Ridge, Demont's Place, Desolace, Diamondhead River,
Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur Village,
Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Post, Dreadmaul Rock,
Dreadmist Den, Dreadmist Peak, Dreadmurk Shore, Dream Bough, Drygulch
Ravine, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Mandarr, Dun Modr,
Dun Morogh, Dunemaul Compound, Durnholde Keep, Durotar, Duskwood,
Dustbelch Grotto, Dustfire Valley, Dustwallow Bay, Dustwallow Marsh,
Dustwind Cave, Dustwind Gulch, Dwarven District, East Pillar, Eastern
Plaguelands, Eastern Pylon, Eastern Strand, Eastmoon Ruins, Eastvale
Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise,
Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Fallen Sky Lake, Fallow
Sanctuary, Faol's Rest, Far Watch Post, Fargodeep Mine, Featherbeard's
Hovel, Feathermoon Stronghold, Fel Rock, Felfire Hill, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feral Scar Vale,
Feralas, Field of Giants, Fire Plume Ridge, Fire Scar Shrine,
Firewatch Ridge, Flame Crest, Foothold Citadel, Forest Song, Forest's
Edge, Forlorn Ridge, Forlorn Rowe, Fray Island, Frayfeather Highlands,
Freewind Post, Frostfire Hot Springs, Frostmane Hold, Frostsaber Rock,
Frostwhisper Gorge, Fungal Rock, Furlbrow's Pumpkin Farm, Gadgetzan,
Gahrron's Withering, Galak Hold, Galardell Valley, Gallows' Corner,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's Naze, Gelkis
Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm,
Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry, Gold Road,
Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw Village, Grim
Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem Post,
Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold,
Grosh'gok Compound, Grove of the Ancients, Growless Cave, Gunstan's
Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment, Hall of
Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow
Lake, Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's
Excavation Site, Ironbeard's Tomb, Ironforge, Ironstone Camp,
Ironstone Plateau, Irontree Cavern, Irontree Woods, Isle of Dread,
Itharius's Cave, Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar,
Jagged Reef, Jaggedswine Farm, Jaguero Isle, Janeiro's Point,
Jangolode Mine, Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai
Ruins, Karazhan, Kargath, Kargathia Keep, Kharanos, Kodo Graveyard,
Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Kurzen's
Compound, Lake Al'Ameth, Lake Elune'ara, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lake Mereldar, Lake Nazferiti,
Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lariss Pavilion, Legash Encampment, Lethlor Ravine, Light's Hope
Chapel, Lighthouse, Lion's Pride Inn, Loch Modan, Longshore, Lordamere
Internment Camp, Lordamere Lake, Lost Point, Lost Rigger Cove, Lower
Wilds, Lushwater Oasis, Maclure Vineyards, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Mannoroc Coven, Manor
Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge, Mazra'Alor,
Mazthoril, Menethil Bay, Menethil Harbor, Menethil Keep, Military
Ward, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake,
Mirror Lake Orchard, Mist's Edge, Mistvale Valley, Misty Pine Refuge,
Misty Reed Post, Misty Reed Strand, Misty Shore, Misty Valley, Mizjah
Ruins, Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook,
Moonglade, Moonwell, Mor'shan Base Camp, Mor'shan Rampart, Morgan's
Plot, Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen,
Mulgore, Mystic Ward, Mystral Lake, Naxxramas, Nek'mani Wellspring,
Nesingwary's Expedition, Nethander Stead, Nethergarde Keep, Night Run,
Night Web's Hollow, Nighthaven, Nightmare Vale, Nightsong Woods,
Nijel's Point, Noonshade Ruins, North Gate Outpost, North Gate Pass,
North Point Tower, North Tide's Hollow, North Tide's Run, Northfold
Manor, Northpass Tower, Northridge Lumber Camp, Northshire Abbey,
Northshire River, Northshire Valley, Northshire Vineyards, Northwatch
Hold, Old Town, Olsen's Farthing, Oneiros, Onyxia's Lair, Orgrimmar,
Owl Wing Thicket, Pestilent Scar, Plaguewood, Pool of Tears, Pools of
Arlithrien, Pools of Vision, Purgation Isle, Pyrewood Village,
Quel'Danil Lodge, Quel'Lithien Lodge, Ragefire Chasm, Ranazjar Isle,
Raptor Grounds, Raptor Ridge, Ratchet, Ravaged Caravan, Raven Hill,
Raven Hill Cemetery, Ravencrest Monument, Ravenholdt Manor, Raynewood
Retreat, Razor Hill, Razorfen Downs, Razorfen Kraul, Razormane
Grounds, Rebel Camp, Red Cloud Mesa, Redridge Canyons, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Valley,
Rethress Sanctum, Revantusk Village, Roguefeather Den, Roland's Doom,
Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins of Alterac, Ruins of
Andorhal, Ruins of Constellas, Ruins of Eldarath, Ruins of Jubuwal,
Ruins of Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of
Ravenwind, Ruins of Thaurissan, Rut'theran Village, Saldean's Farm,
Sandsorrow Watch, Sardor Isle, Sargeron, Scalebeard's Cave, Scarlet
Monastery, Scarlet Watch Post, Scholomance, Scuttle Coast, Searing
Gorge, Sen'jin Village, Sentinel Hill, Seradane, Serpent's Coil,
Shadow Grave, Shadow Hold, Shadowbreak Ravine, Shadowfang Keep,
Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair, Shaol'watha, Shatter
Scar Vale, Shok'Thokar, Shrine of the Fallen Warrior, Silithus,
Silverpine Forest, Silverwind Refuge, Silverwing Outpost, Sishir
Canyon, Skulk Rock, Skull Rock, Sofera's Naze, Solliden Farmstead,
Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's Run,
Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southmoon Ruins, Southpoint Tower,
Southshore, Southwind Village, Splintertree Post, Splithoof Crag,
Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm Point, Starbreeze
Village, Starfall Village, Steamwheedle Port, Stendel's Pond,
Stillwater Pond, Stonard, Stone Cairn Lake, Stonemaul Ruins,
Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak,
Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Keep, Strahnbrad,
Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock Retreat,
Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point,
Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran,
Temple of the Moon, Temple of Zin- Malor, Terror Wing Path,
Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar
of Zul, The Apothecarium, The Barrens, The Bulwark, The Cape of
Stranglethorn, The Charred Vale, The Creeping Ruin, The Crossroads,
The Crystal Shore, The Dagger Hills, The Dark Portal, The Dawning
Isles, The Dead Field, The Deadmines, The Decrepit Ferry, The
Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The
Hidden Grove, The High Seat, The High Wilderness, The Hinterlands, The
Howling Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The
Jansen Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure
Vineyards, The Mage Quarter, The Magic Quarter, The Maker's Terrace,
The Marris Stead, The Marshlands, The Master's Cellar, The Master's
Glaive, The Maul, The Merchant Coast, The Molsen Farm, The Mor'shan
Rampart, The North Coast, The Noxious Glade, The Noxious Lair, The
Oracle Glade, The Overlook Cliffs, The Park, The Pillar of Ash, The
Pools of Vision, The Quagmire, The Red Reaches, The Riptide, The
Rogues' Quarter, The Rotting Orchard, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching
Canyon, The Sea of Cinders, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon
Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid
Hills, The Twin Colossals, The Vile Reef, The War Quarter, The
Weathered Nook, The Weeping Cave, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of the Watchers, Valley
of Trials, Valley of Wisdom, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River,
West Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's
Excavation Site, Whispering Shore, Whisperwind Grove, Whitereach Post,
Wildbend River, Windbreak Canyon, Windshear Crag, Winterfall Village,
Winterhoof Water Well, Winterspring, Witherbark Caverns, Witherbark
Village, Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Northdale, with the Oracle
Glade, Northern Pylon and O'Breen's Encampment behind it. Recompute the ranking
anyway to confirm nothing new scores. Count duplicate names as separate records:
Darnassus, South Gate Pass, The Bulwark, The Talondeep Path and Thunder Bluff are
each two entries. P5 remains pending.

### 2026-11-21, P4 run 32: Northdale to Saltspray Glen

Reviewed 25 records alphabetically. Twenty-three were revised, two were deleted
as duplicates, and none held up unchanged. That is the first run with no clean record in it. Coverage is now 795 of 910 surviving entries, with 115 left. P5
remains pending.

**Four of this batch were among the names with no wiki article, and all four are
settled.** That list is down from nine to five.

- **Northern Pylon** is attested: `The Northern Pylon` is the title of 1.12 quest
  4285, whose objective reads "Discover the location of the Northern Crystal
  Pylon in Un'Goro Crater". The same holds for the last one on the list, since
  `The Western Pylon` is quest 4288. Run 29 cleared Eastern Pylon the same way
  with quest 4287, so all three pylons are named in 1.12 game text.
- **O'Breen's Encampment** was a name and an entry with nothing behind either.
  The client calls the place **O'Breen's Camp**, area 323, parent Arathi
  Highlands, and the entry described a Syndicate camp of Alterac's dispossessed
  nobility on the southern road. Captain O'Breen is a Blackwater Raiders captain
  who took three ships into Faldir's Cove after sunken elven treasure: quest 662
  has the tide drop and two of them go onto a temple in the reef, quest 663 has
  his cabin boy telling the player to go and talk to him, and quest 664 is a
  survivor of the Maiden's Folly saying the naga killed everyone who made it into
  the water. The entry is renamed to the client's spelling, keeps the old one as
  an alias, and now says what the camp is. Our Faldir's Cove entry had the
  expedition right all along; this camp is the part of it that is still alive.
- **Old Dalaran Ruins** is the third duplicate this sweep has found. We already
  have **Dalaran Crater**, same parent, reviewed in an earlier run, with the
  summoners and theurgists and bound elemental slaves in it, and its didYouKnow
  already carries the Kel'Thuzad point the second entry repeated. Deleted, with
  the name added to Dalaran Crater's aliases.
- **Ruins of Darrowshire** is the fourth. The client area is **Darrowshire**, 2262,
  the phrase "ruins of Darrowshire" appears nowhere in 1.12 quest text, and we
  already have a reviewed `Darrowshire` entry with Pamela Redpath in it. The two
  entries' content is merged into that one, which takes `Ruins of Darrowshire` as
  an alias, and the duplicate is deleted.

**The Dalaran names are worth a decision, Martin.** Three entries touch one
place: `Dalaran Crater`, which is the vanilla ruins and holds the client's own
name `Dalaran` as an alias as of this run; `City of Dalaran` in `Data/Forever.lua`,
which is Forever's visitable city and also claims `Dalaran` as an alias; and the
`Old Dalaran Ruins` entry this run deleted. Two entries aliasing the same string
leaves the resolver deciding by file order rather than by intent.
Run 31 raised the same shape for Thalassian Vanguard Camp. Nothing is broken that
I can see, and the fix is a judgement about which entry should answer on which
client, so it is left alone and written down here.

**Five entries had the wrong inhabitants.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Saltspray Glen | Murloc ground on the northern shore | A raptor nesting ground: highland razormaws, scytheclaws and lashtails, with Mosshide gnolls |
| Ruins of Isildien | Night elf ruins held by centaur | The Gordunni ogres, in clan strength: warlords, battlemasters, mage-lords, shamans, warlocks |
| Rocktusk Farm | A Razormane quilboar farm | The Horde's pig farm, west of Orgrimmar's gates. The Razormane are a zone away |
| Rethban Caverns | Kobolds in an abandoned shaft | Redridge gnolls, with their drudgers gathering the ore themselves |
| Ruins of Solarsal | A coastal ruin half in the water | Night elf ruins on Sardor Isle with Hatecrest naga standing on them |

Rocktusk Farm is the one worth reading twice, because the name is the trap. A
farm called Rocktusk in quilboar country reads as a quilboar farm, and the entry
went further and built a paragraph on Agamaggan and the quilboar claim to the
coast. The 1.12 spawns at Durotar 42.6,14.9 are eight swine, three elder mottled
boars, a corrupted boar, two benches and some silverleaf. The Razormane are at
the Razormane Grounds, Durotar 35 to 47 by 34 to 52, which is their own subzone
with battleguards and dustrunners and scouts in it. No 1.12 quest mentions
Rocktusk Farm at all. It is a pig pen that feeds Orgrimmar.

**The Oracle Glade's oracle is a tree.** The entry had it as "a place of
consultation and prophecy, tended by night elves who read the natural world for
guidance", and closed on "the night elves blame the tree rather than the oracles",
a sentence about nothing. There are no oracles. The Oracle Tree stands
in Teldrassil's north-west with the first and most powerful of the world tree's
moonwells under its boughs, it reports by shedding a piece of its bark for
somebody to carry to Fandral Staghelm, and a runner carrying one of those reports
was killed by the Bloodfeather harpies nesting round the glade. That is why
Sentinel Arynia Cloudsbreak is out there with a detachment. And the night elves
do have a grievance about Teldrassil, sourced in quest 934: Staghelm asked the
dragons for the blessings Nordrassil had, Nozdormu refused him for his arrogance
and Alexstrasza refused with him, and without them the tree's growth is flawed
and the kaldorei's immortality has not come back.

**Two entries described a zone instead of a place.** Razor Hill Barracks spent
all three paragraphs on Durotar's borders and the Burning Blade, which the Razor
Hill zone entry and the Burning Blade Coven entry already cover; the barracks
itself is the largest building in the town and the place a young orc is taught a
trade, with Tarshaw Jaggedscar on warriors, Swart on shaman and Tai'jin on
priests. Rage Scar Hold had two sentences of generic Feralas and a closing line
that run 31 had just written into the Lower Wilds entry; what is actually
interesting about the hold is that it has books and written symbols in it and
night elf architecture deeper in, so the yeti moved into something rather than digging it.

**Invention removed.** Red Rocks said the burial ground had been interfered with
and that "the Grimtotem and outside necromancy have both been suspected"; it is
Bristleback quilboar, they are logged on a nameplate as interlopers, and nothing about it is a suspicion. Plaguemist Ravine had the Wildhammers watching the
border closely, and the ravine has two silvermanes and an owlbeast in it and
nobody else at all. Ridgepoint Tower had an undermanned chain of towers holding a
handful of guards and a signal fire. Razorwind Canyon had the night elves holding
harpies to be descended from Aviana's servants, which is not in 1.12 anywhere;
what the canyon does have is Rezlak, who had lost enough goblin caravans through
Drygulch Ravine to stop waiting for help and start paying for it. Rethban Caverns
had the ore named for the mountains, where quest 347 says it is named after the
man who first found it, Bart Rethban, and that scribes mix its dark flat colour
into their dyes.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Rise of the Defiler: Razelikh is not his name, Rakh'likh is, and getting hold of
  it is a piece of work. Three subordinates, Sevine and Allistarj and Grol, each
  wear a third of an amulet attuned to its wearer's lifeforce, and while they stay
  inside the Blasted Lands none of them can be killed; the whole amulet is what
  summons him. Eighteen stones hold men bound as servants to the four of them in
  what one of the bound calls eternal torture.
- Ortell's Hideout: Ortell deserted the Twilight's Hammer and hides in the
  mountains south of Southwind Village. He can read the cult's writing with the
  Twilight Lexicon, whose three chapters are kept apart by officers called
  Twilight Keepers, and he works through a tablet out loud, swapping every third
  word against the second chapter and every other word against the first, then
  wondering whether he has it backwards. He also wants their monthly bulletin,
  the True Believer, because it will say whether they are still hunting him.
- Northdale: the Order was decimated when Uther was killed, Taelan Fordring was
  pushed back to this hamlet and made his last stand in it, and his own account is
  that he wondered whether any of the Silver Hand were left alive and whether it
  mattered, and then threw the standard down. The symbol is still on the ground
  and his father has asked for it back.
- Ruins of Zul'Kunda: Gan'zulah is the Bloodscalp chief and Nezzliok his
  witchdoctor, both deep in the ruins, and between them they know what happened to
  a Darkspear child the tribe took. Their headhunters work this coast and Zuuldaia
  along it.
- Ruins of Zul'Mamwe: Ana'thek is the Skullsplitter chieftain, the tribe keeps a
  pile of trophy skulls here as at Balia'mah and Ziata'jai, and those skulls are
  currency in the feud: a Bloodscalp will trade what he knows for three of them,
  so that his spirit has slaves in the Nether.
- Northern Pylon: the man at Marshal's Refuge who found it could not let the
  rumours alone, said the thought was driving him crazy and that he will usually
  believe anything people tell him, and could only say he had heard there was a
  pylon somewhere in the north.
- Render's Camp: renegades and outrunners with summoners, shadowcasters, trackers
  and champions behind them, and Kazon among the tents.
- Render's Rock: Keeshan was taken prisoner after the fighting at Stonewatch Keep
  and dragged up here.
- Palemane Rock: the gnolls' own nameplates are tanners and skinners, which is
  what the raiding is for.
- Ravaged Twilight Camp: Demitrian can wake a blade from the bindings of an
  imprisoned wind elemental, given elementium and the essence of a firelord, and
  he is not honest about what he means to do with them.
- Rethban Caverns: Yorus Barleybrew's Rethban Gauntlet, which is to drink a
  Barleybrew Scalder, go in as far as the first fork and come back inside the hour
  through whole heaps of gnolls without dying.

**Cross-entry work.** Saltspray Glen now places itself against Ironbeard's Tomb,
which run 31 revised, and Bluegill Marsh. The Zul'Kunda and Zul'Mamwe entries
now carry the two halves of the same feud rather than each asserting it.
Darrowshire absorbed the deleted duplicate's material about the Argent Dawn
needing to know who did what on the day. `tools/places.tsv` carried the Saltspray
murlocs, the Rocktusk quilboar and the Ortell cultist in its notes, and all three
were corrected. Neither deleted entry had a worklist row, so nothing needed
commenting out, which is the loose end run 13 recorded.

**Ledger and checks.** Added 27 vanilla rows, every one asserted absent first and
then seen failing the gate by name, appended as a sorted block so the ledger diff
is 27 insertions and nothing else. No row was deleted and no verdict changed. The
deliberate break was the Twilight Lexicon row: removing it failed the build with
`Ortell's Hideout uses "Twilight Lexicon"`, and the row was restored.

Nine extractor artifacts were reworded rather than filed: the epithet halves
`Cruel` and `Dire` from "Ana'thek the Cruel" and "Nezzliok the Dire", `Order`
standing alone where the Silver Hand reads better, `Feathermoon` alone where the
filed Feathermoon Stronghold does, the plurals `Savages` and `Screamers` at the
head of a sentence, `Eighteen` and `Smelted` likewise, and the run `Yorus
Barleybrew's Rethban Gauntlet`, kept whole by the extractor across the
possessive. The corpus-wide `", which"` rate fired again, as it did in run 31,
and it took two passes: eleven new clauses put it at 12.4 per 10k words, cutting
four left it at 12.1, still over, and three more brought it under. Worth knowing
that the budget is tight enough now that a run adding ten of them will always
have to give some back.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps.
`tools/lint-prose.py` is clean on `Data/Locales.lua`, `tools/era-terms.tsv`,
`tools/places.tsv` and this log, with RHYTHM at 7 on `Data/EasternKingdoms.lua`
and 4 on `Data/Kalimdor.lua`, both unchanged. Comparing the prose dump against a
worktree at HEAD: 988 records before and 986 after, one added and three removed
by the rename and the two deletions, 23 changed, no era tag changed. The corpus
is now 910 vanilla entries and 76 Forever ones.

**Entries covered so far (794 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz
Island, Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms,
Alterac Mountains, Alterac Valley, Alther's Mill, Ambermill,
Amberstill Ranch, Ameth'Aran, Andorhal, Angerfang Encampment, Angor
Fortress, Anvilmar, Apocryphan's Rest, Arathi Basin, Arathi Highlands,
Ariden's Camp, Ashenvale, Astranaar, Auberdine, Azshara, Azurelode
Mine, Badlands, Bael Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal
Ruins, Balia'mah Ruins, Balnir Farmstead, Ban'ethil Barrow Den,
Ban'ethil Hollow, Ban'Thallow Barrow Den, Baradin Bay, Bashal'Aran,
Bathran's Haunt, Battle Ring, Bay of Storms, Bear's Head, Beezil's
Wreck, Beggar's Haunt, Beren's Peril, Bitter Reaches, Black Channel
Marsh, Blackchar Cave, Blackfathom Deeps, Blackrock Depths, Blackrock
Mountain, Blackrock Pass, Blackrock Spire, Blackrock Stronghold,
Blackthorn Ridge, Blackwater Cove, Blackwing Lair, Blackwolf River,
Blackwood Den, Blackwood Lake, Bladefist Bay, Blasted Lands, Bloodfen
Burrow, Bloodhoof Village, Bloodsail Compound, Bloodtooth Camp,
Bloodvenom Falls, Bloodvenom Post, Bloodvenom River, Bluefen, Bluegill
Marsh, Bogen's Ledge, Bolgan's Hole, Bones of Grakkarond, Booty Bay,
Bough Shadow, Boulder Lode Mine, Boulder'gor, Boulderfist Hall,
Boulderslide Cavern, Boulderslide Ravine, Brackenwall Village,
Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar, Brewnall
Village, Brightwater Lake, Brightwood Grove, Brill, Brill Town Hall,
Broken Pillar, Bronzebeard Encampment, Browman Mill, Burning Blade
Coven, Burning Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp
Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp Narache, Camp
Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold,
Champions' Hall, Chill Breeze Valley, Chillwind Camp, Chillwind Point,
Circle of East Binding, Circle of Inner Binding, Circle of Outer
Binding, Circle of West Binding, Cleft of Shadow, Cliffspring Falls,
Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's
Outpost, Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's
Farmstead, Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud
Pinnacle, Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand,
Darkwhisper Gorge, Darnassus, Darrow Hill, Darrowmere Lake,
Darrowshire, Dawning Wood Catacombs, Deadeye Shore, Deadman's
Crossing, Deadwind Pass, Deadwind Ravine, Deadwood Village,
Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall
Canyon, Demon Fall Ridge, Demont's Place, Desolace, Diamondhead River,
Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur Village,
Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Post, Dreadmaul Rock,
Dreadmist Den, Dreadmist Peak, Dreadmurk Shore, Dream Bough, Drygulch
Ravine, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Mandarr, Dun Modr,
Dun Morogh, Dunemaul Compound, Durnholde Keep, Durotar, Duskwood,
Dustbelch Grotto, Dustfire Valley, Dustwallow Bay, Dustwallow Marsh,
Dustwind Cave, Dustwind Gulch, Dwarven District, East Pillar, Eastern
Plaguelands, Eastern Pylon, Eastern Strand, Eastmoon Ruins, Eastvale
Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise,
Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Fallen Sky Lake, Fallow
Sanctuary, Faol's Rest, Far Watch Post, Fargodeep Mine, Featherbeard's
Hovel, Feathermoon Stronghold, Fel Rock, Felfire Hill, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feral Scar Vale,
Feralas, Field of Giants, Fire Plume Ridge, Fire Scar Shrine,
Firewatch Ridge, Flame Crest, Foothold Citadel, Forest Song, Forest's
Edge, Forlorn Ridge, Forlorn Rowe, Fray Island, Frayfeather Highlands,
Freewind Post, Frostfire Hot Springs, Frostmane Hold, Frostsaber Rock,
Frostwhisper Gorge, Fungal Rock, Furlbrow's Pumpkin Farm, Gadgetzan,
Gahrron's Withering, Galak Hold, Galardell Valley, Gallows' Corner,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's Naze, Gelkis
Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm,
Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry, Gold Road,
Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw Village, Grim
Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem Post,
Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold,
Grosh'gok Compound, Grove of the Ancients, Growless Cave, Gunstan's
Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment, Hall of
Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow
Lake, Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's
Excavation Site, Ironbeard's Tomb, Ironforge, Ironstone Camp,
Ironstone Plateau, Irontree Cavern, Irontree Woods, Isle of Dread,
Itharius's Cave, Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar,
Jagged Reef, Jaggedswine Farm, Jaguero Isle, Janeiro's Point,
Jangolode Mine, Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai
Ruins, Karazhan, Kargath, Kargathia Keep, Kharanos, Kodo Graveyard,
Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut, Kurzen's
Compound, Lake Al'Ameth, Lake Elune'ara, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lake Mereldar, Lake Nazferiti,
Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach,
Lariss Pavilion, Legash Encampment, Lethlor Ravine, Light's Hope
Chapel, Lighthouse, Lion's Pride Inn, Loch Modan, Longshore, Lordamere
Internment Camp, Lordamere Lake, Lost Point, Lost Rigger Cove, Lower
Wilds, Lushwater Oasis, Maclure Vineyards, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Mannoroc Coven, Manor
Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge, Mazra'Alor,
Mazthoril, Menethil Bay, Menethil Harbor, Menethil Keep, Military
Ward, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake,
Mirror Lake Orchard, Mist's Edge, Mistvale Valley, Misty Pine Refuge,
Misty Reed Post, Misty Reed Strand, Misty Shore, Misty Valley, Mizjah
Ruins, Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook,
Moonglade, Moonwell, Mor'shan Base Camp, Mor'shan Rampart, Morgan's
Plot, Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen,
Mulgore, Mystic Ward, Mystral Lake, Naxxramas, Nek'mani Wellspring,
Nesingwary's Expedition, Nethander Stead, Nethergarde Keep, Night Run,
Night Web's Hollow, Nighthaven, Nightmare Vale, Nightsong Woods,
Nijel's Point, Noonshade Ruins, North Gate Outpost, North Gate Pass,
North Point Tower, North Tide's Hollow, North Tide's Run, Northdale,
Northern Pylon, Northfold Manor, Northpass Tower, Northridge Lumber
Camp, Northshire Abbey, Northshire River, Northshire Valley,
Northshire Vineyards, Northwatch Hold, O'Breen's Camp, Old Town,
Olsen's Farthing, Oneiros, Onyxia's Lair, Oracle Glade, Orgrimmar,
Ortell's Hideout, Owl Wing Thicket, Palemane Rock, Pestilent Scar,
Plaguemist Ravine, Plaguewood, Pool of Tears, Pools of Arlithrien,
Pools of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Rage Scar Hold, Ragefire Chasm, Ranazjar Isle,
Raptor Grounds, Raptor Ridge, Ratchet, Ravaged Caravan, Ravaged
Twilight Camp, Raven Hill, Raven Hill Cemetery, Ravencrest Monument,
Ravenholdt Manor, Raynewood Retreat, Razor Hill, Razor Hill Barracks,
Razorfen Downs, Razorfen Kraul, Razormane Grounds, Razorwind Canyon,
Rebel Camp, Red Cloud Mesa, Red Rocks, Redridge Canyons, Redridge
Mountains, Refuge Pointe, Remtravel's Excavation, Render's Camp,
Render's Rock, Render's Valley, Rethban Caverns, Rethress Sanctum,
Revantusk Village, Ridgepoint Tower, Rise of the Defiler, Rocktusk
Farm, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins of
Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas,
Ruins of Eldarath, Ruins of Isildien, Ruins of Jubuwal, Ruins of
Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of
Ravenwind, Ruins of Solarsal, Ruins of Thaurissan, Ruins of Zul'Kunda,
Ruins of Zul'Mamwe, Rut'theran Village, Saldean's Farm, Saltspray
Glen, Sandsorrow Watch, Sardor Isle, Sargeron, Scalebeard's Cave,
Scarlet Monastery, Scarlet Watch Post, Scholomance, Scuttle Coast,
Searing Gorge, Sen'jin Village, Sentinel Hill, Seradane, Serpent's
Coil, Shadow Grave, Shadow Hold, Shadowbreak Ravine, Shadowfang Keep,
Shadowsong Shrine, Shadra'Alor, Shalzaru's Lair, Shaol'watha, Shatter
Scar Vale, Shok'Thokar, Shrine of the Fallen Warrior, Silithus,
Silverpine Forest, Silverwind Refuge, Silverwing Outpost, Sishir
Canyon, Skulk Rock, Skull Rock, Sofera's Naze, Solliden Farmstead,
Sorrow Hill, Sorrowmurk, South Gate Outpost, South Tide's Run,
Southbreak Shore, Southern Barrens, Southern Gold Road, Southern
Savage Coast, Southfury River, Southmoon Ruins, Southpoint Tower,
Southshore, Southwind Village, Splintertree Post, Splithoof Crag,
Splithoof Hold, Stagalbog, Stagalbog Cave, Staghelm Point, Starbreeze
Village, Starfall Village, Steamwheedle Port, Stendel's Pond,
Stillwater Pond, Stonard, Stone Cairn Lake, Stonemaul Ruins,
Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak,
Stonewatch, Stonewatch Keep, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Keep, Strahnbrad,
Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun Rock Retreat,
Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade, Talrendis Point,
Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of Arkkoran,
Temple of the Moon, Temple of Zin- Malor, Terror Wing Path,
Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar
of Zul, The Apothecarium, The Barrens, The Bulwark, The Cape of
Stranglethorn, The Charred Vale, The Creeping Ruin, The Crossroads,
The Crystal Shore, The Dagger Hills, The Dark Portal, The Dawning
Isles, The Dead Field, The Deadmines, The Decrepit Ferry, The
Dor'Danil Barrow Den, The Drag, The Drowned Reef, The Dry Hills, The
Dustbowl, The Farstrider Lodge, The Foothill Caverns, The Forgotten
Coast, The Forgotten Pools, The Fungal Vale, The Gaping Chasm, The
Golden Plains, The Great Forge, The Great Lift, The Green Belt, The
Greymane Wall, The Grizzled Den, The Harborage, The Headland, The
Hidden Grove, The High Seat, The High Wilderness, The Hinterlands, The
Howling Vale, The Hushed Bank, The Infectis Scar, The Ivar Patch, The
Jansen Stead, The Loch, The Long Wash, The Lost Fleet, The Maclure
Vineyards, The Mage Quarter, The Magic Quarter, The Maker's Terrace,
The Marris Stead, The Marshlands, The Master's Cellar, The Master's
Glaive, The Maul, The Merchant Coast, The Molsen Farm, The Mor'shan
Rampart, The North Coast, The Noxious Glade, The Noxious Lair, The
Oracle Glade, The Overlook Cliffs, The Park, The Pillar of Ash, The
Pools of Vision, The Quagmire, The Red Reaches, The Riptide, The
Rogues' Quarter, The Rotting Orchard, The Royal Quarter, The Ruins of
Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The Screeching
Canyon, The Sea of Cinders, The Sepulcher, The Shattered Strand, The
Shimmering Flats, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Stagnant Oasis, The Stockade, The Tainted Scar, The Talon
Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid
Hills, The Twin Colossals, The Vile Reef, The War Quarter, The
Weathered Nook, The Weeping Cave, The Writhing Haunt, The Yorgen
Farmstead, Theramore Isle, Thieves Camp, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thousand Needles, Three Corners,
Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of the Watchers, Valley
of Trials, Valley of Wisdom, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River,
West Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's
Excavation Site, Whispering Shore, Whisperwind Grove, Whitereach Post,
Wildbend River, Windbreak Canyon, Windshear Crag, Winterfall Village,
Winterhoof Water Well, Winterspring, Witherbark Caverns, Witherbark
Village, Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost,
Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Sar'theris Strand, with
Satyrnaar, Scrabblescrew's Camp and Sentry Point behind it. Recompute the ranking
anyway to confirm nothing new scores. Count duplicate names as separate records:
Darnassus, South Gate Pass, The Bulwark, The Talondeep Path and Thunder Bluff are
each two entries. Five names still have no wiki article: Stormwind Gates,
Thalassian Vanguard Camp, The Dream Bough, The Sanctum and Western Pylon, and the
last of those is already settled by 1.12 quest 4288. P5 remains pending.

### 2026-11-21, release 1.2.18

Martin asked for dev to be merged to main and the next 1.2.x released. Release
1.2.18 carries P4 runs 29 to 32, which is 100 entry records reviewed and 93
corrected. Three records were deleted as duplicates of entries the addon already
had, two were moved out of the vanilla corpus as Forever's own places, one was
renamed to the spelling the client reports, and three held up with no change.
The vanilla corpus is 910 entries and the Forever one is 76. Both version strings
are 1.2.18.

`CHANGELOG.md` records the findings under the 1.2.18 heading, in the same three
sections 1.2.17 used: the corrections, the claims removed, and the structural
changes, which this time include the three merges, the two Forever tags and the
rename. P5 must not write any of runs 29 to 32 again and now covers run 33
onwards. The other half of P5, writing the findings into `tools/era-audit.md`,
is still outstanding and was not touched by this release.

Release checks before preparing: default validation and all nine CI
configurations pass with zero errors and warnings, check-gaps reports 43
explained gaps, prose lint is clean on the changelog, the CurseForge description
and the README, and git diff --check passes. `tools/build-zip.sh` produces
`ForAllTheNerds-1.2.18.zip` with the toc at `ForAllTheNerds/ForAllTheNerds.toc`,
declaring interface 16001 and 11509, both version strings reading 1.2.18,
`LICENSE` present, 26 entries packaged and no tooling, media or dotfiles in it.
The upload label override `-n ":{package-name}-{project-version}"` is still in
`.github/workflows/release.yml`, so the file lists as `ForAllTheNerds-1.2.18`
rather than a bare number. The preceding sweep commit cc3e00e passed CI for its
exact SHA before release preparation began.

### 2026-11-22, P4 run 33: Sar'theris Strand to Splinterspear Junction

Reviewed 25 records alphabetically, 24 names with South Gate Pass counted twice.
Twenty-three were revised and two held up unchanged. Coverage is now 820 of 910
surviving entries, with 90 left. P5 remains pending.

**Two records are clean and should not be looked at again.** Sleeping Gorge says
the gorge is a short chasm in eastern Deadwind Pass that one of the paths south
to Karazhan runs along before turning east into the Vice, and that the roads here
go to Karazhan, to an ogre mound or back out. All of that holds: the Vice is where
the Deadwind ogres keep their mounds and camps along that road, and 1.12 spawns
Deadwind brutes, maulers, ogre mages and warlocks there. Slither Rock says one
creature lived in a small hidden cave beyond the Terror Wing Path in the Burning
Steppes' far corner, Cyrus Therepentous, who would help while being rude about it.
1.12 has him alone in it at Burning Steppes 95.1,31.6, elite, holding ground, with
nothing else inside seventy yards. Acride, who the wiki says lives there now, is
later and was correctly absent.

**Five entries had the wrong inhabitants or the wrong place.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Silver Stream Mine | A productive dwarven mine until troggs came up through the floor | It ran dry long ago and the Miners' League made it a storage depot; kobolds moved in on the crates |
| Southridge Beach | Azshara's lower coast, beneath the Haldarr satyrs | The south edge of the Bay of Storms in mid-Azshara, held by Spitelash naga; the Haldarr are away at 20,62 |
| Splinterspear Junction | A junction held by nobody, where control shifts | Stonard's scouts patrol the fork; the swamp around it is spinners, crocolisks and jaguars |
| Spirit Rise | The Pools of Vision, where spirit-walkers commune with the ancestors | The pools are the Forsaken's enclave at Thunder Bluff: Apothecary Zamah, Archmage Shymm, Forsaken priests, a Defilers emissary |
| Slaughter Hollow | A gorge the Crushridge use as a killing ground | An ogre mound, a cave, with Rizz Loosebolt caged inside it selling engineering supplies |

Silver Stream is the one worth reading twice, because the entry was wrong in the
same direction twice over. Quest 307 is explicit: the mine "ran dry long ago", the
Miners' League converted it into a storage depot, and "now Kobolds have moved in,
putting their filthy paws on good, Dwarven tools". The 1.12 spawns are Tunnel Rat
vermin, foragers, scouts and kobolds around ten Miners' League Crates. No trogg is
within reach of the place. The entry also closed on "nobody in Thelsamar is
volunteering to be first down the shaft", where Mountaineer Stormpike is impatient
for the order to clear them out and says the thought of their hands in a dwarven
mine turns his stomach. Quest 1921 adds the detail the entry had no idea about:
those crates are the only known source of the charged rift gems woven into a
mage's first wizard robe.

**The Pools of Vision are not a tauren place.** Spirit Rise is the shaman mesa and
the entry had that right, with Siln Skychaser training there and the Hall of
Spirits on the cap. What is under the cap is the Forsaken's own business at Thunder
Bluff: Apothecary Zamah of the Royal Apothecary Society, Archmage Shymm teaching
mages, Malakai Cross and Father Cobb teaching priests, and a Defilers emissary
taking recruits, all present in 1.12. The spirit-walkers and the ancestors were
invented. The same entry claimed Thrall's restoration of orcish shamanism "was
helped enormously by having the tauren to consult", which nothing in this period
says, and that is out as well. Worth recording that Krendle Bigpockets and the
Spirit Rise zeppelin to Orgrimmar are not in 1.12 at all: there is no creature with
the title Zeppelin Master anywhere in the 1.12 table, so an entry that reached for
the wiki's travel section here would have shipped a Cataclysm flight path.

**Three entries were built on sources that are not vanilla.**

- Shrine of the Dormant Flame closed on a `didYouKnow` saying the view from the
  summit is the best in Durotar and that "jumping off is not advised, and the
  accounts felt the need to specify it". That is the wiki's advice to players,
  repeated back as though it were lore, and the note is deleted rather than
  reworded. The entry also had the brazier "lit by them as part of that", where
  quest 1524 runs the other way: the shaman carries a torch up to mark the attempt,
  lights it at the brazier and brings it back down aflame. Telf Joolam's own lines
  are better than what was there, so the entry now carries them: without the torch
  he turns people away, apologetic about the climb, and most of those who reach him
  came looking for lost treasure or something mystical to kill and leave again
  thinking the shrine is empty.
- South Gate Pass, the Loch Modan record, said the Stonewrought Dam and the passes
  "were designed by Franclorn Forgewright, who was a Dark Iron". Franclorn is
  vanilla and he is a Dark Iron, and quest 3801 has him introduce himself as the one
  "responsible for the stonewrought method of architecture". The dam is a different
  claim: the wiki cites it to the Pipe of Franclorn Forgewright, and no item of that
  name exists in 1.12. The passes are a third claim, and the wiki's own note says
  only that he "presumably" designed Stonewrought Pass, which is not this pass
  anyway. All of it is out. In its place, something the article does
  support: South Gate Outpost counted as part of Dun Morogh in this period, and its
  mountaineers had cleared the road in a way North Gate Outpost's dwarves never
  managed.
- Spirit Den had troll witch doctors dealing "in the loa and in the older practice
  the Gurubashi empire ran on", and put Unbagwa "in a different line of business
  from the priests at Zul'Gurub". The word loa does not appear anywhere in the 1.12
  corpus. What Unbagwa actually does is quest 348: Stranglethorn fever's only known
  cure is the heart of Mokk, an elusive white gorilla, he is the only one who can
  summon the beast, he wants a gorilla fang first, and when he starts talking to
  the spirits the valley's other gorillas come to the talking, so somebody has to
  stand over him and keep them off.

**Our own entries were contradicting each other in two places.** Shadowglen put
the glade "in Teldrassil's branches" while Shadowthread Cave, which is inside
Shadowglen, put itself "in Teldrassil's roots". The cave is in the glade's
north-western corner, so the roots are gone. Shrine of the Deceiver claimed the
Shadow Council run it and "Jaedenar as a whole is theirs", which is what the
Jaedenar and Shadow Hold entries already say, and it was wrong about the shrine
itself: mapping the 1.12 spawns across Jaedenar puts warlocks, darkweavers,
legionnaires, Shadow Lord Fel'dan and Lord Banehollow in the northern half at
Felwood y=44 to 51, and the southern barrow den at y=58 to 62 holds cultists,
adepts and guardians with hounds among them and no warlock at all.

**Shadowglen and Shadowthread Cave were both wrong about why.** Shadowglen said
its grells and corrupted wildlife "are an early sign that something is wrong with
the tree itself", and Shadowthread said the cave's spiders are big because
"Teldrassil was planted without the dragon Aspects' blessings and it is sick". The
two causes are different and both are supplied by 1.12. Quest 459 blames fel moss:
the grells and grellkin are tainted by it, and the furbolgs who used to live in
these hills deserted their homes and gathered under the Gnarlpine name through the
same corruption. Quest 916 blames growth rather than sickness: Gilshalan Windwalker
came out from Darnassus because the webwoods are cousin to a much smaller spider
and he believes the world tree's recent growth has had a profound effect on them,
and he is sending venom and an egg back to the city to see whether the properties
bear it out. Githyiss, the largest spider in the cave, was missing from the entry
and is in now. Her corruption by a Gnarlpine totem is not: that comes from The
Vengeance of Elune, which is absent from the 1.12 quest table along with Vile Touch.

**Three entries were describing the wrong thing about the place.**

- Shadowprey Village led on the naga and never mentioned fish. In 1.12 it is a
  fishing village first: Jinar'Zillen the fisherman, Lui'Mala teaching the trade,
  Mai'Lahii on tackle, a shellfish trap under the docks somebody is always being
  talked into emptying, and bloodbelly as the catch the tauren at Ghost Walker Post
  send for when the centaur leave them time. The naga are one strand of it and they
  belong to one man: Drulzegar Skraghook was fishing near Ranazjar Isle when the
  Slitherblade came up at his crew, he was the only one who got out, and the rest of
  his life goes on having them killed.
- Scrabblescrew's Camp said Smeed "runs a kodo caravan out of it". He does not. The
  Gizelton Caravan is Cork's, Rigger drives it, and Smeed sells them kodos and pays
  the escorts past the Kolkar village and through Mannoroc Coven; Cork and Rigger
  make a gold piece a week between them. What Smeed has is the kodo kombobulator,
  which jolts an ancient or dying beast into one that will follow a caravan, and a
  rival, Bibbly F'utzbuckle at Kormek's Hut, who collects kodo bones for furniture,
  instruments and blasting powder. The entry's line that the tauren treat the
  graveyard as "natural and sacred" has no source in this period and is out; the
  kodos walking there to die does, and stays.
- Silverwing Grove spent both paragraphs on the Ashenvale war and never said what
  the grove is for. It is where the Alliance enters Warsong Gulch, with a dozen
  Silverwing elites on the ground, Illiyana Moonblaze on supply, an Alliance
  brigadier general and Sentinel Farsong, who pays out for a win in the gulch. Its
  claim that the fight is "the oldest continuous fight between the Alliance and
  Horde in Kalimdor" is a superlative with nothing behind it and is gone.

**Shady Rest Inn was hedging where 1.12 is specific.** The entry said the inn "was
burned with people inside it. That is the whole of what is agreed", then built two
paragraphs on Jaina and Thrall having more to lose than anyone, and on Theramore
being "the only human settlement on Kalimdor that has chosen to live alongside the
Horde". None of that is sourced. The quest chain is, and it is in 1.12: James Hyal
opened the inn at the edge of the Barrens meaning it to be a good place to stop, it
did well until Theramore lost the marsh roads to the ogres, he would not give it up
for safety inside the walls, and it burned with his wife and child in it. Two
investigations run separately, Captain Garran Vimes's from the top floor of
Foothold Citadel and Krog's out of Brackenwall Village, and the rubble holds a
blackened iron shield fixed to the chimney, rows of hoofprints through the mud and
a Theramore lieutenant's badge. Krog's reading of the shield is the part worth
keeping: humans do not hang plain iron on a fireplace, so somebody who was there
put it up, and he cannot decide whether it was a warning or a threat. Who did it
stays out, because that is how the chain resolves.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Sentry Point had the tower watching "the road into Theramore from the north and
  the Barrens beyond it" and Theramore's outposts being sparse. It is the first
  tower outside the city, across the bridge from the island, with a captain and
  fourteen guards on it and all of them roaming. The thin-hinterland point is real
  but it belongs to Vimes, who says the city lost control of the roads and the ogres
  took them over. The tower is also where the search for Private Hendel starts: he
  was stationed at it and he is not there.
- Sar'theris Strand was "a northern beach held by naga" with night elf ruins along
  it. It is the name of Desolace's whole coast, which Shadowprey Village sits on in
  the south, and the sea giants and makrura the entry left out are half of what is
  on it. The ruins the naga actually hold are at the bottom of the sea, north near
  Ranazjar Isle. The wreck off the northern end is Karnitol's: a Stormwind mage
  whose ship the sea giants took, who got one chest to the beach and then abandoned
  it and teleported out, and the chest turns up dry and empty with long deep
  scratches on it that no blade would make.
- Shindigger's Camp gave all three paragraphs to high elves and one line to the
  dwarf the camp is named after. Rhapsody Shindigger was the best rider Gryphon
  Master Talonaxe had at Aerie Peak until the drink, and he set up a brew camp east
  of the aviary after being let go. He drank a keg of stout before flying Brohann
  Caskbelly of the Explorers' League over the Swamp of Sorrows to look for a sunken
  temple, came off his mount, went under, surfaced among trolls, swam out fast and
  kept an Atal'ai tablet fragment. He had known the temple was down there the whole
  time and nobody had asked him.
- Shrine of Remulos had the shrine "at the glade's heart" and Remulos holding court
  as "a demigod". Quest 28 puts it in north-western Moonglade, a short walk west of
  Nighthaven, and his spawn is at Moonglade 36,42. The demigod rank is not in this
  period: 1.12 calls Zaetar the first son of Cenarius and Remulos his brother, and
  nothing more. Tajarri is the shrine's warden, wardens patrol it, and two of the
  druid aquatic-form trials resolve here, the Lake Elune'ara bauble that decays
  while carried and the pendant that can only be joined in the shrine's presence.
- Satyrnaar was three sentences of general satyr lore. It is the Bleakheart's camp,
  the most intact and most central of Ashenvale's three satyr settlements with Night
  Run and Xavian, tents among ruined buildings just off the Splintertree road to
  Azshara, and the easiest to reach, which is why it is the most fought over. A Cult
  of the Dark Strand soulgem is kept there and the 1.12 ground carries fifteen
  pieces of tainted wood and a circle of imprisonment. Prince Raze was left out
  deliberately: he patrols, and the wiki puts his spawn at Xavian.
- Shimmer Ridge had the Frostmane raiding "down from here onto the road and the
  ranches" and a closing paragraph about nobody ever answering their claim to Dun
  Morogh. Neither is sourced. What the ridge is is two camps joined by a bridge west
  of the Gates of Ironforge, with eleven seers holding ground, a meat smoker and
  eight shimmerweed baskets, and quest 315 explains the baskets: the Frostmane grow
  shimmerweed for their tribal rituals, the dwarves have found no use for it, and
  Rejold Barleybrew at Brewnall Village wants it for a stout and does not mind
  whether a batch comes off a seer or out of a basket. The entry also said "west of
  Kharanos" where the ridge is north of it.
- Spirit Rock had the sapta as "the first lesson rather than a ceremony: not casting
  anything, but listening to the ground and finding out whether it answers", which
  is close but invented. Quest 1517 says a sapta binds the drinker's spirit to one
  element, only a select few shaman know a recipe, and it is drunk in a holy place
  and never anywhere else; standing humbly before the earth is the whole of the rite,
  and the warning is that the other elements will not be so passive. The entry's
  "every orc shaman since starts on this hill" overstated it as well: the quest is
  open to Horde shaman, not orcs alone.

**One faction field changed.** Southridge Beach was `Contested` on the strength of
the satyrs that are not there. It is naga ground, so it is now `Hostile`, which is
what the neighbouring Jagged Reef entry carries for the same reason.

**Ledger and checks.** Added 39 vanilla rows, every one asserted absent before the
append and the block appended sorted, so the ledger diff is 39 insertions and
nothing else. No row was deleted and no verdict changed. The deliberate break was
the `Private Hendel` row: removing it failed the build with `Sentry Point uses
"Private Hendel"`, and the row was restored.

Four of those rows are the corpus-global extractor rule biting entries this run did
not touch, which is the trap run 32 recorded. Putting `Archmage Shymm` into Spirit
Rise mid-sentence made `Archmage` a word the extractor keeps everywhere, and the
build then failed naming Shadowfang Keep, Serpent's Coil and Bear's Head for
`Archmage Arugal`, `Archmage Allistarj` and `Archmage Xylem`, none of which had
ever been extracted before. `Gryphon Master Talonaxe` did the same to The Altar of
Zul. All four are 1.12 creatures and were filed. Eleven extractor artifacts were
reworded rather than filed, in run 32's manner: the bare second mentions `Joolam`,
`Hyal`, `Talonaxe`, `Shindigger` and `Unbagwa`, the epithet halves `Savage` and
`Vile` from "Mokk the Savage" and "Githyiss the Vile", the plural `Skychasers`, the
`of the` runs `Apothecary Zamah of the Royal Apothecary Society` and `Brohann
Caskbelly of the Explorers' League`, both broken with a comma, and `Rat`, left over
from "Tunnel Rat kobolds" because `Tunnel` appears capitalised nowhere else
mid-sentence; that one is now just "kobolds", which is what quest 307 says.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps.
`tools/lint-prose.py` is clean on `Data/Locales.lua`, `Data/Cities.lua` and
`tools/era-terms.tsv`, with RHYTHM at 7 on `Data/EasternKingdoms.lua` and 4 on
`Data/Kalimdor.lua`, both unchanged. One RHYTHM finding did rise and was reworded
rather than accepted: "The only known cure for the fever" in Spirit Den completed a
run of three sentences opening "The " that the linter sees only because it reads
Lua as prose, the first two being the tail of the neighbouring Southern Savage
Coast record, and it now reads "Its only known cure". Comparing the prose dump
against a worktree at HEAD: 986 records before and after, none added or removed, 23
changed, no era tag changed. The corpus stays at 910 vanilla entries and 76 Forever
ones.

**Entries covered so far (818 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine,
Boulder'gor, Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brightwater Lake, Brightwood Grove,
Brill, Brill Town Hall, Broken Pillar, Bronzebeard Encampment, Browman
Mill, Burning Blade Coven, Burning Steppes, Caer Darrow, Camp Aparaje,
Camp Boff, Camp Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp
Narache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Chillwind Point, Circle of East Binding, Circle of Inner Binding, Circle
of Outer Binding, Circle of West Binding, Cleft of Shadow, Cliffspring
Falls, Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's Outpost,
Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand, Darkwhisper
Gorge, Darnassus, Darrow Hill, Darrowmere Lake, Darrowshire, Dawning
Wood Catacombs, Deadeye Shore, Deadman's Crossing, Deadwind Pass,
Deadwind Ravine, Deadwood Village, Deathknell, Deep Elem Mine, Deeprun
Tram, Deepwater Tavern, Demon Fall Canyon, Demon Fall Ridge, Demont's
Place, Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Post, Dreadmaul Rock, Dreadmist Den, Dreadmist Peak, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Mandarr, Dun Modr, Dun Morogh, Dunemaul Compound, Durnholde
Keep, Durotar, Duskwood, Dustbelch Grotto, Dustfire Valley, Dustwallow
Bay, Dustwallow Marsh, Dustwind Cave, Dustwind Gulch, Dwarven District,
East Pillar, Eastern Plaguelands, Eastern Pylon, Eastern Strand,
Eastmoon Ruins, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Fallen Sky Lake, Fallow Sanctuary, Faol's Rest, Far Watch Post,
Fargodeep Mine, Featherbeard's Hovel, Feathermoon Stronghold, Fel Rock,
Felfire Hill, Felpaw Village, Felstone Field, Felwood, Fenris Isle,
Fenris Keep, Feral Scar Vale, Feralas, Field of Giants, Fire Plume
Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Foothold Citadel,
Forest Song, Forest's Edge, Forlorn Ridge, Forlorn Rowe, Fray Island,
Frayfeather Highlands, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostsaber Rock, Frostwhisper Gorge, Fungal Rock, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Galardell
Valley, Gallows' Corner, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's
Naze, Gelkis Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan,
Go'Shek Farm, Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash
Hold, Grosh'gok Compound, Grove of the Ancients, Growless Cave,
Gunstan's Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment,
Hall of Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow Lake,
Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's Excavation
Site, Ironbeard's Tomb, Ironforge, Ironstone Camp, Ironstone Plateau,
Irontree Cavern, Irontree Woods, Isle of Dread, Itharius's Cave,
Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar, Jagged Reef,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine,
Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan,
Kargath, Kargathia Keep, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Kurzen's Compound, Lake Al'Ameth,
Lake Elune'ara, Lake Everstill, Lake Falathim, Lake Kel'Theril, Lake
Mennar, Lake Mereldar, Lake Nazferiti, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Legash Encampment,
Lethlor Ravine, Light's Hope Chapel, Lighthouse, Lion's Pride Inn, Loch
Modan, Longshore, Lordamere Internment Camp, Lordamere Lake, Lost Point,
Lost Rigger Cove, Lower Wilds, Lushwater Oasis, Maclure Vineyards,
Maestra's Post, Magram Village, Malaka'jin, Malden's Orchard, Mannoroc
Coven, Manor Mistmantle, Maraudon, Mardenholde Keep, Marshal's Refuge,
Mazra'Alor, Mazthoril, Menethil Bay, Menethil Harbor, Menethil Keep,
Military Ward, Mirage Flats, Mirage Raceway, Mirkfallon Lake, Mirror
Lake, Mirror Lake Orchard, Mist's Edge, Mistvale Valley, Misty Pine
Refuge, Misty Reed Post, Misty Reed Strand, Misty Shore, Misty Valley,
Mizjah Ruins, Mo'grosh Stronghold, Molten Core, Moon Horror Den,
Moonbrook, Moonglade, Moonwell, Mor'shan Base Camp, Mor'shan Rampart,
Morgan's Plot, Morgan's Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound,
Mosshide Fen, Mulgore, Mystic Ward, Mystral Lake, Naxxramas, Nek'mani
Wellspring, Nesingwary's Expedition, Nethander Stead, Nethergarde Keep,
Night Run, Night Web's Hollow, Nighthaven, Nightmare Vale, Nightsong
Woods, Nijel's Point, Noonshade Ruins, North Gate Outpost, North Gate
Pass, North Point Tower, North Tide's Hollow, North Tide's Run,
Northdale, Northern Pylon, Northfold Manor, Northpass Tower, Northridge
Lumber Camp, Northshire Abbey, Northshire River, Northshire Valley,
Northshire Vineyards, Northwatch Hold, O'Breen's Camp, Old Town, Olsen's
Farthing, Oneiros, Onyxia's Lair, Oracle Glade, Orgrimmar, Ortell's
Hideout, Owl Wing Thicket, Palemane Rock, Pestilent Scar, Plaguemist
Ravine, Plaguewood, Pool of Tears, Pools of Arlithrien, Pools of Vision,
Purgation Isle, Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge,
Rage Scar Hold, Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor
Ridge, Ratchet, Ravaged Caravan, Ravaged Twilight Camp, Raven Hill,
Raven Hill Cemetery, Ravencrest Monument, Ravenholdt Manor, Raynewood
Retreat, Razor Hill, Razor Hill Barracks, Razorfen Downs, Razorfen
Kraul, Razormane Grounds, Razorwind Canyon, Rebel Camp, Red Cloud Mesa,
Red Rocks, Redridge Canyons, Redridge Mountains, Refuge Pointe,
Remtravel's Excavation, Render's Camp, Render's Rock, Render's Valley,
Rethban Caverns, Rethress Sanctum, Revantusk Village, Ridgepoint Tower,
Rise of the Defiler, Rocktusk Farm, Roguefeather Den, Roland's Doom,
Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins of Alterac, Ruins of
Andorhal, Ruins of Constellas, Ruins of Eldarath, Ruins of Isildien,
Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra, Ruins of
Ordil'Aran, Ruins of Ravenwind, Ruins of Solarsal, Ruins of Thaurissan,
Ruins of Zul'Kunda, Ruins of Zul'Mamwe, Rut'theran Village, Saldean's
Farm, Saltspray Glen, Sandsorrow Watch, Sar'theris Strand, Sardor Isle,
Sargeron, Satyrnaar, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch
Post, Scholomance, Scrabblescrew's Camp, Scuttle Coast, Searing Gorge,
Sen'jin Village, Sentinel Hill, Sentry Point, Seradane, Serpent's Coil,
Shadow Grave, Shadow Hold, Shadowbreak Ravine, Shadowfang Keep,
Shadowglen, Shadowprey Village, Shadowsong Shrine, Shadowthread Cave,
Shadra'Alor, Shady Rest Inn, Shalzaru's Lair, Shaol'watha, Shatter Scar
Vale, Shimmer Ridge, Shindigger's Camp, Shok'Thokar, Shrine of Remulos,
Shrine of the Deceiver, Shrine of the Dormant Flame, Shrine of the
Fallen Warrior, Silithus, Silver Stream Mine, Silverpine Forest,
Silverwind Refuge, Silverwing Grove, Silverwing Outpost, Sishir Canyon,
Skulk Rock, Skull Rock, Slaughter Hollow, Sleeping Gorge, Slither Rock,
Sofera's Naze, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate
Outpost, South Gate Pass, South Tide's Run, Southbreak Shore, Southern
Barrens, Southern Gold Road, Southern Savage Coast, Southfury River,
Southmoon Ruins, Southpoint Tower, Southridge Beach, Southshore,
Southwind Village, Spirit Den, Spirit Rise, Spirit Rock, Splinterspear
Junction, Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog,
Stagalbog Cave, Staghelm Point, Starbreeze Village, Starfall Village,
Steamwheedle Port, Stendel's Pond, Stillwater Pond, Stonard, Stone Cairn
Lake, Stonemaul Ruins, Stonesplinter Valley, Stonetalon Mountains,
Stonetalon Peak, Stonewatch, Stonewatch Keep, Stonewrought Dam,
Stonewrought Pass, Stormrage Barrow Dens, Stormwind City, Stormwind
Keep, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde Keep, Sun
Rock Retreat, Swamp of Sorrows, Tahonda Ruins, Talonbranch Glade,
Talrendis Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple
of Arkkoran, Temple of Zin- Malor, Temple of the Moon, Terror Wing Path,
Terrordale, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of
Zul, The Apothecarium, The Barrens, The Bulwark, The Cape of
Stranglethorn, The Charred Vale, The Creeping Ruin, The Crossroads, The
Crystal Shore, The Dagger Hills, The Dark Portal, The Dawning Isles, The
Dead Field, The Deadmines, The Decrepit Ferry, The Dor'Danil Barrow Den,
The Drag, The Drowned Reef, The Dry Hills, The Dustbowl, The Farstrider
Lodge, The Foothill Caverns, The Forgotten Coast, The Forgotten Pools,
The Fungal Vale, The Gaping Chasm, The Golden Plains, The Great Forge,
The Great Lift, The Green Belt, The Greymane Wall, The Grizzled Den, The
Harborage, The Headland, The Hidden Grove, The High Seat, The High
Wilderness, The Hinterlands, The Howling Vale, The Hushed Bank, The
Infectis Scar, The Ivar Patch, The Jansen Stead, The Loch, The Long
Wash, The Lost Fleet, The Maclure Vineyards, The Mage Quarter, The Magic
Quarter, The Maker's Terrace, The Marris Stead, The Marshlands, The
Master's Cellar, The Master's Glaive, The Maul, The Merchant Coast, The
Molsen Farm, The Mor'shan Rampart, The North Coast, The Noxious Glade,
The Noxious Lair, The Oracle Glade, The Overlook Cliffs, The Park, The
Pillar of Ash, The Pools of Vision, The Quagmire, The Red Reaches, The
Riptide, The Rogues' Quarter, The Rotting Orchard, The Royal Quarter,
The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The
Screeching Canyon, The Sea of Cinders, The Sepulcher, The Shattered
Strand, The Shimmering Flats, The Shrine of Aessina, The Skittering
Dark, The Slag Pit, The Stagnant Oasis, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid Hills,
The Twin Colossals, The Vile Reef, The War Quarter, The Weathered Nook,
The Weeping Cave, The Writhing Haunt, The Yorgen Farmstead, Theramore
Isle, Thieves Camp, Thistleshrub Valley, Thondroril River, Thoradin's
Wall, Thousand Needles, Three Corners, Thunder Axe Fortress, Thunder
Bluff, Thunder Ridge, Thunderbrew Distillery, Thunderhorn Water Well,
Tidefury Cove, Timbermaw Hold, Timbermaw Post, Tinker Town, Tiragarde
Keep, Tirisfal Glades, Tor'kren Farm, Tower of Althalaxx, Tower of
Azora, Tower of Eldara, Tower of Ilgalar, Trade District, Twilight
Grove, Tyr's Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan,
Uther's Tomb, Valley of Bones, Valley of Fangs, Valley of Heroes, Valley
of Honor, Valley of Spears, Valley of Spirits, Valley of Strength,
Valley of Trials, Valley of Wisdom, Valley of the Watchers, Valor's
Rest, Valormok, Venomweb Vale, Venture Co. Base Camp, Wailing Caverns,
Warrior's Terrace, Warsong Gulch, Warsong Lumber Camp, Waterspring
Field, Wavestrider Beach, Weazel's Crater, Webwinder Path, Wellspring
Lake, Wellspring River, West Pillar, Western Plaguelands, Westfall,
Wetlands, Whelgar's Excavation Site, Whispering Shore, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear
Crag, Winterfall Village, Winterhoof Water Well, Winterspring,
Witherbark Caverns, Witherbark Village, Woodpaw Hills, Wyrmbog, Yojamba
Isle, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from Steelgrill's Depot through The
Dead Acre, which is 25 names with no duplicate among them. Recompute the ranking
anyway to confirm nothing new scores. Count duplicate names as separate records:
Darnassus, The Bulwark, The Talondeep Path and Thunder Bluff are each two entries,
and South Gate Pass, the fifth, is done as of this run. Four names still have no
wiki article: Stormwind Gates, which falls in the next batch, Thalassian Vanguard
Camp, The Dream Bough and The Sanctum. P5 remains pending and now covers run 29
onwards.

### 2026-11-22, P4 run 34: Steelgrill's Depot to The Den

Reviewed 25 records alphabetically. Twenty-three were revised and two were deleted
as duplicates, so no record in this batch held up unchanged. Coverage is now 842
of 907 surviving entries, with 65 left. P5 remains pending.

**Two corrections to the bookkeeping before anything else.**

The covered list carried `Temple of Zin- Malor` with a space in it. That is a
line-wrap artifact: run 18 reviewed `Temple of Zin-Malor` and wrote it correctly,
and a later run's re-wrapping of the list broke the hyphen. The name is spelled
right in this run's list. It had put Temple of Zin-Malor back into the uncovered
pool, where it would have been reviewed a second time in this batch; it was taken
out and `The Den` moved up to make the twenty-fifth record. Recounting at the same
time showed run 33's figure of 820 covered was one too many, so the arithmetic in
this entry starts from a recount rather than from the previous total. Four names in
the covered list are no longer entries at all, which is correct and not a counting
error: The Red Reaches and Whisperwind Grove were deleted by earlier runs as
Cataclysm places, and Thieves Camp and Witherbark Caverns went the same way.

The cause of the broken hyphen is worth naming so the next run does not put it
back. Python's `textwrap.fill` breaks words at hyphens by default. Whoever
regenerates the covered list must pass `break_on_hyphens=False`, or check the
block afterwards. `Temple of Zin-Malor` is the only hyphenated entry name in the
whole corpus, so it is the only one that can be damaged this way, and it is spelled
correctly in this run's list.

Run 33's entry says "there is no creature with the title Zeppelin Master anywhere
in the 1.12 table". **That is wrong and this run found it.** 1.12 has six of them:
Nez'raz, Hin Denburg, Frezza, Zapetta, Snurk Bucksquick and Squibby Overspeck, on
the Orgrimmar, Grom'gol, Undercity and Tirisfal runs. What is true, and what the
Spirit Rise conclusion actually rested on, is narrower: **Krendle Bigpockets has no
creature_template row at all**, so the Thunder Bluff zeppelin the wiki puts on
Spirit Rise is not in this period. The entry was right; the sentence supporting it
in the log was not. The cause is worth writing down because it will recur: the
scratch tool used to make that claim reads the `creature` table, which is spawns,
not `creature_template`, which is every creature the game knows. A creature can be
in the game with no static spawn row, and Magus Rimtori is exactly that case: she
is absent from `creature` and present in `creature_template` as 8578, with AI
scripts and two quests naming her. **Absence from a spawn table is not absence from
the game.** Check templates before concluding a character does not exist.

**Three duplicate pairs, and the client's name wins in all three.**

| Kept | Deleted | Why |
|---|---|---|
| Thalassian Base Camp | Thalassian Vanguard Camp | AreaTable 1220 against no row and no wiki article |
| The Stonefield Farm | Stonefield Farm | AreaTable 63, parent Elwynn Forest |
| The Maclure Vineyards | Maclure Vineyards | AreaTable 64, parent Elwynn Forest |

Run 32 raised the Thalassian pair and left it for a decision, and the decision is
settled by the client: `Thalassian Base Camp` is area 1220 with the parent Azshara,
`Thalassian Vanguard Camp` has no AreaTable row, no wiki article and no mention in
1.12 text. It goes, and the Base Camp takes it as an alias. The other pair is worse
than a doubled name. `Stonefield Farm` sat in `Data/Locales.lua` under Elwynn with
no parent field while `The Stonefield Farm` sat in `Data/EasternKingdoms.lua` with
one, and the same for the two Maclure entries, so the addon carried four entries
for two farms. Both Maclure entries had already been reviewed by earlier runs,
which is the part worth noticing: two separate claim reviews passed over the same
place and neither spotted the twin. The surviving entries take the deleted names as
aliases and absorb what the duplicates had that they did not.

One loose end to hand on: `The Stonefield Farm` is still unreviewed and falls in the
next batch. It has been edited this run only as a merge target, so the next run
should give it the claim review it has not had.

**Five entries described the wrong place or the wrong occupants.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| The Cleft | A split in Teldrassil's bark wide enough to walk down | A Gnarlpine den under Ursal the Mauler, with enslaved druids held in it |
| Terrace of Repose | A funerary terrace for Lordaeron's honoured dead, the occupants not resting | The Scarlet Crusade's green ground at the Scarlet Monastery gate, hedges and a clean fountain |
| Stonewatch Falls | Caves behind the water used by Blackrock orcs and gnolls | A deep pool with a small murloc camp at the bottom; the orcs and gnolls are up the hill |
| Stonebull Lake | A lake in southern Mulgore, peaceful by any standard | A horseshoe round Bloodhoof Village in central Mulgore, with a burnt caravan on its north shore |
| Sundown Marsh | The water around Menethil Harbor, murloc country | The deepest, north-western part of the Wetlands, with two shopkeepers living in it |

The Cleft is the one worth reading twice, because the entry was not describing a
place at all. It had the Cleft as a feature of the tree, "a split in the bark",
and spent its second paragraph on Teldrassil's age. The 1.12 spawns at the area are
Gnarlpine pathfinders, avengers and totemics with Ursal the Mauler patrolling among
them and four Enslaved Druid of the Talon held on the ground, and Moon Priestess
Amara and two huntresses watching the road outside. It is a furbolg den with
hostages in it. Nothing in the entry survived.

**Three entries were built on the wrong era's association.**

- Steelgrill's Depot gave two of three paragraphs to Gnomeregan, Thermaplugg and
  the radiation. That link is the Cataclysm one: the Operation: Gnomeregan chain and
  its covert operatives are what put Gnomeregan at this depot, and none of it is in
  1.12. What the depot is in this period is a siege engine shop. Quest 400 has it
  plainly: Beldin Steelgrill owns the local mechanic shop, is the best siege engine
  tech there is, breaks arclight spanners faster than anyone can supply them, and the
  depot is "a local haunt for veteran siege engine pilots". Pilot Bellowfiz is
  stocking his tank the Jetsteam for a Siege Brigade run and Pilot Stonegear wants a
  rare ore for his engine's firepower. The entry now says that instead.
- The Dead Acre had the soil giving out early and drought and royal neglect doing
  for the rest. None of that is sourced. The farm was burned by the Defias Brotherhood
  when they took the zone, and what works the fields now is machinery: eight harvest
  reapers and six Foe Reaper 4000s at Westfall 63,60, with Defias knuckledusters and a
  highwayman still on the ground they burned.
- Stoutlager Inn rested on the wiki's note that the inn is "a popular place to spend
  some quality time with one's guildmates", which is player culture rather than lore,
  and built "the most popular room in Loch Modan" and "the place in this zone where
  everyone ends up" on top of it. It also claimed the dwarves have held the valley
  since before the Three Hammers, which nothing supports. What is in the inn is the
  Hearthstove family, a baker, a herbalist, a general goods dwarf and a tradesman,
  with Torren Squarejaw and Jern Hornhelm of the Explorers' League usually in it, and
  a notice on the wall: by order of the Magistrate of Thelsamar, Chok'sul is wanted
  for the attacks on the town, the Stonewrought Dam and the excavation site.

**Invention removed.** The Crystal Vale had the Cenarion Circle watching the vale
closely for signs of change; the vale holds dust stormers, desert rumblers and an
open air elemental rift, and the Twilight's Hammer got to it first with their
ravaged camp and Highlord Demitrian in it. The Darkened Bank had smugglers and
Defias using crossings that neither the Night Watch nor the People's Militia could
spare men to patrol; what is on the bank is Sven Yorgen and Lars, two refugees with
a campfire at the western end, and nothing else for seventy yards. Terror Run had
Marshal's Refuge issuing a standing instruction to avoid the south; what it has is
Marshal Expeditions sending Spark Nilminer to dig for dead stegodons and
diemetradons and nearly being eaten whole setting up camp, and the only red power
crystals in the world. The Canals claimed a statue along the water honouring the
city's dead, and the hook promised "a monument to a mage"; there is no statue
gameobject anywhere in Stormwind's canals, the statues are in the Valley of Heroes
where our own entry already describes all five of them, and the claim was a
conflation of the two places. Swamplight Manor called the spy's paperwork
"murdered"; the report is buried, the spy's fate is not stated, and the entry now
says dead rather than murdered.

**Stonewatch Tower had the relationship backwards.** The entry said the tower "fell
with the keep when the Blackrock orcs came through for Morganth". Morganth is not
what the orcs came for. Quest 248 has Theocritus watching the Tower of Ilgalar and
detecting that Morganth is in conflict with the orcs in Stonewatch Keep, reason
unknown, and the way he investigates it is to have a Glyph of Azora planted at the
top of the intact watch tower beside the keep, hidden in a jar that "once held a
foul-smelling liquor, but now lies empty and forgotten on a pair of barrels", close
enough to read the minds inside. So the tower is not a ruin that fell: it is
standing, the orcs hold the ground under it, and a mage in Elwynn is listening
through it. The entry's other claim held up and is kept: quest 20 says the Blackrock
came from the Burning Steppes and claimed the keep, and from there maraud north of
Lakeshire and keep its citizens in town.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Thalassian Base Camp called the elves high elves on their own account. They are
  blood elves, and the story is a sequence of betrayals: Magus Rimtori told Belgrom
  Rockmaul that Azshara held great riches and powerful items, took an orcish escort
  off him in exchange for a share, and killed every one of them; Ag'tor Bloodfist at
  Valormok has been sending people after her since and they do not come back either;
  and she hired the goblin Kim'jael to scout for lost treasure and then turned on
  him, which is why he wants his compass, scope, stuffed chicken and Wizzlegoober
  back. What she is digging for is left open, as 1.12 leaves it: a circle of crystals
  in her camp matching a diagram in her own book, one crystal tied to her and the
  others to something worse, and Kim'jael's guess of a rune the naga hold in the
  Ruins of Eldarath.
- The Cauldron had two sentences, one of them the claim that Blackrock Mountain's
  western approach lies beneath it. What lies inside it is the Slag Pit, where
  incendosaurs occupy the lava pools and Overseer Maltorius commands the crew, a
  Thorium Brotherhood agent gone over to the Dark Iron with an order out on him from
  his own side. Above that are eleven slave workers, Dark Iron slavers and
  taskmasters, Slave Master Blackheart, and the detail the entry most needed: the
  slaves have been driven far enough that they attack anyone who comes at them,
  including anyone trying to free them.
- The Crimson Veil and The Damsel's Luck both opened by reciting that the Bloodsail
  keep three frigates and naming the other two, which is the third repetition of the
  same paragraph across the three ship entries. The Crimson Veil is the fleet's
  flagship, Fleet Master Firallon has her with Ironpatch beside him, and he recruits
  anyone who has made themselves no friend of Booty Bay. The Damsel's Luck has
  Captain Stillwater, who is a gnome, and Brutus, who is a golem. Cortello's Riddle
  is lying about on both decks in threes.
- The Den said nothing about the Den. It is the cave at the heart of the Valley of
  Trials, Gornek runs it, and it has a trainer for every class and vendors for the
  basics and no trade trainers at all. The entry also had Thrall "born in
  internment", which is not right: he was born in the wild after Durotan and Draka
  fled Gul'dan, and the camps are what he broke open later. That clause is gone.
- The Commons kept the auction house and the vault and added an inference about the
  tram making Ironforge a hub out of proportion to Dun Morogh's population. What the
  ring actually holds, besides the auctioneers, is the war: emissaries for the
  Stormpike Guard, the Silverwing Sentinels and the League of Arathor standing about
  looking for volunteers, with Thief Catcher Farmountain walking the circuit.
- Terrorweb Tunnel was already right about the crypt fiends and the geography and
  keeps both. It gains the nerubian overseer that patrols the length of it.
- Tethris Aran gains the thing that makes it unusual: nobody holds it. Scorpashi
  snappers and a gritjaw basilisk are the whole garrison, and it sits just north of
  Thunder Axe Fortress.
- Temple of Ahn'Qiraj kept its C'Thun and Old God material, which holds. Its
  `didYouKnow` asserted that something is buried under the Master's Glaive in
  Darkshore. 1.12 does not say that. It says the Twilight's Hammer are at work there
  with a cursed page of ancient elven text, using elven magic to bring their old
  masters back, and that their purpose is not known. The note now says that.

**One already-covered entry was corrected in passing.** Ravaged Caravan had the
caravan "carrying supplies up to Supervisor Fizsprocket's mine". Quest 749 says the
crates are stamped by the Venture Co. Mining Division and that their contents were
due for processing at one of the company's central plants, which is cargo coming out
rather than supplies going in, and quest 765 puts Fizsprocket's mine east of the
wreck. The direction was an inference and is now stated the way the source states
it.

**Two names on the no-article list are settled, in opposite directions.** Thalassian
Vanguard Camp had no article because there is no such place; it is deleted. Stormwind
Gates has no article and no AreaTable row either, but it is not invented: 1.12 holds
nine gameobjects named `Stormwind Gate`, 28035 to 28043. The entry stays. That list
is down to Thalassian Vanguard Camp removed, leaving The Dream Bough and The Sanctum.

**Ledger and checks.** Added 35 vanilla rows, every one asserted absent before the
append and the block appended sorted, so the ledger diff is 35 insertions and
nothing else. No row was deleted and no verdict changed. The absence assertion
earned its keep this run: a first attempt at 38 rows aborted because `Fleet Master
Firallon`, `Magus Rimtori` and `Pilot Stonegear` were already filed, which is the
silent-drop failure the earlier runs warned about, and nothing was written. The
deliberate break was the `Gornek` row: removing it failed the build with `The Den
uses "Gornek"`, and the row was restored.

Ten extractor artifacts were reworded rather than filed: the bare second mentions
`Rimtori`, `Firallon` and `Stonegear`, which became the full filed names; the plural
`Hearthstoves`; the bare forenames `Lina` and `Vidra`; `Talon` out of "druids of the
Talon"; the `of` run `Copies of Cortello`; `Mutilated` at the head of a sentence; and
`Marshal's Expedition`, which is the wiki's spelling where 1.12 quest 3882 says
`Marshal Expeditions`. One name was deleted outright rather than filed: `Swiftgear
Station`, which the wiki gives to the house in Sundown Marsh and which appears
nowhere in the 1.12 corpus. The house is described without it.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps. `git diff
--check` passes. `tools/lint-prose.py` is clean on `Data/Locales.lua`,
`Data/Cities.lua` and `tools/era-terms.tsv`, holds at 7 on
`Data/EasternKingdoms.lua` and 1 on `Data/Dungeons.lua`, both unchanged, and drops
from 4 to 3 on `Data/Kalimdor.lua`. Comparing the prose dump against a worktree at
HEAD: 986 records before and 983 after, none added and three removed by the merges,
27 changed, no era tag changed. The corpus is now 907 vanilla entries and 76
Forever ones.

**Entries covered so far (840 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine,
Boulder'gor, Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brightwater Lake, Brightwood Grove,
Brill, Brill Town Hall, Broken Pillar, Bronzebeard Encampment, Browman
Mill, Burning Blade Coven, Burning Steppes, Caer Darrow, Camp Aparaje,
Camp Boff, Camp Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp
Narache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Chillwind Point, Circle of East Binding, Circle of Inner Binding, Circle
of Outer Binding, Circle of West Binding, Cleft of Shadow, Cliffspring
Falls, Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's Outpost,
Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand, Darkwhisper
Gorge, Darnassus, Darrow Hill, Darrowmere Lake, Darrowshire, Dawning
Wood Catacombs, Deadeye Shore, Deadman's Crossing, Deadwind Pass,
Deadwind Ravine, Deadwood Village, Deathknell, Deep Elem Mine, Deeprun
Tram, Deepwater Tavern, Demon Fall Canyon, Demon Fall Ridge, Demont's
Place, Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Post, Dreadmaul Rock, Dreadmist Den, Dreadmist Peak, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Mandarr, Dun Modr, Dun Morogh, Dunemaul Compound, Durnholde
Keep, Durotar, Duskwood, Dustbelch Grotto, Dustfire Valley, Dustwallow
Bay, Dustwallow Marsh, Dustwind Cave, Dustwind Gulch, Dwarven District,
East Pillar, Eastern Plaguelands, Eastern Pylon, Eastern Strand,
Eastmoon Ruins, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Fallen Sky Lake, Fallow Sanctuary, Faol's Rest, Far Watch Post,
Fargodeep Mine, Featherbeard's Hovel, Feathermoon Stronghold, Fel Rock,
Felfire Hill, Felpaw Village, Felstone Field, Felwood, Fenris Isle,
Fenris Keep, Feral Scar Vale, Feralas, Field of Giants, Fire Plume
Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Foothold Citadel,
Forest Song, Forest's Edge, Forlorn Ridge, Forlorn Rowe, Fray Island,
Frayfeather Highlands, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostsaber Rock, Frostwhisper Gorge, Fungal Rock, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Galardell
Valley, Gallows' Corner, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's
Naze, Gelkis Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan,
Go'Shek Farm, Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash
Hold, Grosh'gok Compound, Grove of the Ancients, Growless Cave,
Gunstan's Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment,
Hall of Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow Lake,
Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's Excavation
Site, Ironbeard's Tomb, Ironforge, Ironstone Camp, Ironstone Plateau,
Irontree Cavern, Irontree Woods, Isle of Dread, Itharius's Cave,
Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar, Jagged Reef,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine,
Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan,
Kargath, Kargathia Keep, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Kurzen's Compound, Lake Al'Ameth,
Lake Elune'ara, Lake Everstill, Lake Falathim, Lake Kel'Theril, Lake
Mennar, Lake Mereldar, Lake Nazferiti, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Legash Encampment,
Lethlor Ravine, Light's Hope Chapel, Lighthouse, Lion's Pride Inn, Loch
Modan, Longshore, Lordamere Internment Camp, Lordamere Lake, Lost Point,
Lost Rigger Cove, Lower Wilds, Lushwater Oasis, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Mannoroc Coven, Manor Mistmantle,
Maraudon, Mardenholde Keep, Marshal's Refuge, Mazra'Alor, Mazthoril,
Menethil Bay, Menethil Harbor, Menethil Keep, Military Ward, Mirage
Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake, Mirror Lake
Orchard, Mist's Edge, Mistvale Valley, Misty Pine Refuge, Misty Reed
Post, Misty Reed Strand, Misty Shore, Misty Valley, Mizjah Ruins,
Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook, Moonglade,
Moonwell, Mor'shan Base Camp, Mor'shan Rampart, Morgan's Plot, Morgan's
Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic
Ward, Mystral Lake, Naxxramas, Nek'mani Wellspring, Nesingwary's
Expedition, Nethander Stead, Nethergarde Keep, Night Run, Night Web's
Hollow, Nighthaven, Nightmare Vale, Nightsong Woods, Nijel's Point,
Noonshade Ruins, North Gate Outpost, North Gate Pass, North Point Tower,
North Tide's Hollow, North Tide's Run, Northdale, Northern Pylon,
Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire
Abbey, Northshire River, Northshire Valley, Northshire Vineyards,
Northwatch Hold, O'Breen's Camp, Old Town, Olsen's Farthing, Oneiros,
Onyxia's Lair, Oracle Glade, Orgrimmar, Ortell's Hideout, Owl Wing
Thicket, Palemane Rock, Pestilent Scar, Plaguemist Ravine, Plaguewood,
Pool of Tears, Pools of Arlithrien, Pools of Vision, Purgation Isle,
Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Rage Scar Hold,
Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet,
Ravaged Caravan, Ravaged Twilight Camp, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razor Hill Barracks, Razorfen Downs, Razorfen Kraul, Razormane Grounds,
Razorwind Canyon, Rebel Camp, Red Cloud Mesa, Red Rocks, Redridge
Canyons, Redridge Mountains, Refuge Pointe, Remtravel's Excavation,
Render's Camp, Render's Rock, Render's Valley, Rethban Caverns, Rethress
Sanctum, Revantusk Village, Ridgepoint Tower, Rise of the Defiler,
Rocktusk Farm, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins
of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas,
Ruins of Eldarath, Ruins of Isildien, Ruins of Jubuwal, Ruins of
Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of Ravenwind,
Ruins of Solarsal, Ruins of Thaurissan, Ruins of Zul'Kunda, Ruins of
Zul'Mamwe, Rut'theran Village, Saldean's Farm, Saltspray Glen,
Sandsorrow Watch, Sar'theris Strand, Sardor Isle, Sargeron, Satyrnaar,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scrabblescrew's Camp, Scuttle Coast, Searing Gorge, Sen'jin Village,
Sentinel Hill, Sentry Point, Seradane, Serpent's Coil, Shadow Grave,
Shadow Hold, Shadowbreak Ravine, Shadowfang Keep, Shadowglen, Shadowprey
Village, Shadowsong Shrine, Shadowthread Cave, Shadra'Alor, Shady Rest
Inn, Shalzaru's Lair, Shaol'watha, Shatter Scar Vale, Shimmer Ridge,
Shindigger's Camp, Shok'Thokar, Shrine of Remulos, Shrine of the
Deceiver, Shrine of the Dormant Flame, Shrine of the Fallen Warrior,
Silithus, Silver Stream Mine, Silverpine Forest, Silverwind Refuge,
Silverwing Grove, Silverwing Outpost, Sishir Canyon, Skulk Rock, Skull
Rock, Slaughter Hollow, Sleeping Gorge, Slither Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Gate Pass, South Tide's Run, Southbreak Shore, Southern Barrens,
Southern Gold Road, Southern Savage Coast, Southfury River, Southmoon
Ruins, Southpoint Tower, Southridge Beach, Southshore, Southwind
Village, Spirit Den, Spirit Rise, Spirit Rock, Splinterspear Junction,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Staghelm Point, Starbreeze Village, Starfall Village, Steamwheedle
Port, Steelgrill's Depot, Stendel's Pond, Stillwater Pond, Stonard,
Stone Cairn Lake, Stonebull Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Falls,
Stonewatch Keep, Stonewatch Tower, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Gates, Stormwind Keep,
Stoutlager Inn, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Sundown Marsh, Swamp of Sorrows, Swamplight
Manor, Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris,
Tanner Camp, Tarren Mill, Teldrassil, Temple of Ahn'Qiraj, Temple of
Arkkoran, Temple of Zin-Malor, Temple of the Moon, Terrace of Repose,
Terror Run, Terror Wing Path, Terrordale, Terrorweb Tunnel, Tethris
Aran, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of Zul,
The Apothecarium, The Barrens, The Bulwark, The Canals, The Cape of
Stranglethorn, The Cauldron, The Charred Vale, The Cleft, The Commons,
The Creeping Ruin, The Crimson Veil, The Crossroads, The Crystal Shore,
The Crystal Vale, The Dagger Hills, The Damsel's Luck, The Dark Portal,
The Darkened Bank, The Dawning Isles, The Dead Acre, The Dead Field, The
Deadmines, The Decrepit Ferry, The Den, The Dor'Danil Barrow Den, The
Drag, The Drowned Reef, The Dry Hills, The Dustbowl, The Farstrider
Lodge, The Foothill Caverns, The Forgotten Coast, The Forgotten Pools,
The Fungal Vale, The Gaping Chasm, The Golden Plains, The Great Forge,
The Great Lift, The Green Belt, The Greymane Wall, The Grizzled Den, The
Harborage, The Headland, The Hidden Grove, The High Seat, The High
Wilderness, The Hinterlands, The Howling Vale, The Hushed Bank, The
Infectis Scar, The Ivar Patch, The Jansen Stead, The Loch, The Long
Wash, The Lost Fleet, The Maclure Vineyards, The Mage Quarter, The Magic
Quarter, The Maker's Terrace, The Marris Stead, The Marshlands, The
Master's Cellar, The Master's Glaive, The Maul, The Merchant Coast, The
Molsen Farm, The Mor'shan Rampart, The North Coast, The Noxious Glade,
The Noxious Lair, The Oracle Glade, The Overlook Cliffs, The Park, The
Pillar of Ash, The Pools of Vision, The Quagmire, The Red Reaches, The
Riptide, The Rogues' Quarter, The Rotting Orchard, The Royal Quarter,
The Ruins of Kel'Theril, The Rustmaul Dig Site, The Scarab Dais, The
Screeching Canyon, The Sea of Cinders, The Sepulcher, The Shattered
Strand, The Shimmering Flats, The Shrine of Aessina, The Skittering
Dark, The Slag Pit, The Stagnant Oasis, The Stockade, The Tainted Scar,
The Talon Den, The Talondeep Path, The Temple Gardens, The Temple of
Atal'Hakkar, The Tower of Arathor, The Trade Quarter, The Tundrid Hills,
The Twin Colossals, The Vile Reef, The War Quarter, The Weathered Nook,
The Weeping Cave, The Writhing Haunt, The Yorgen Farmstead, Theramore
Isle, Thieves Camp, Thistleshrub Valley, Thondroril River, Thoradin's
Wall, Thousand Needles, Three Corners, Thunder Axe Fortress, Thunder
Bluff, Thunder Ridge, Thunderbrew Distillery, Thunderhorn Water Well,
Tidefury Cove, Timbermaw Hold, Timbermaw Post, Tinker Town, Tiragarde
Keep, Tirisfal Glades, Tor'kren Farm, Tower of Althalaxx, Tower of
Azora, Tower of Eldara, Tower of Ilgalar, Trade District, Twilight
Grove, Tyr's Hand, Uldaman, Uldum, Un'Goro Crater, Undercity, Ursolan,
Uther's Tomb, Valley of Bones, Valley of Fangs, Valley of Heroes, Valley
of Honor, Valley of Spears, Valley of Spirits, Valley of Strength,
Valley of Trials, Valley of Wisdom, Valley of the Watchers, Valor's
Rest, Valormok, Venomweb Vale, Venture Co. Base Camp, Wailing Caverns,
Warrior's Terrace, Warsong Gulch, Warsong Lumber Camp, Waterspring
Field, Wavestrider Beach, Weazel's Crater, Webwinder Path, Wellspring
Lake, Wellspring River, West Pillar, Western Plaguelands, Westfall,
Wetlands, Whelgar's Excavation Site, Whispering Shore, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear
Crag, Winterfall Village, Winterhoof Water Well, Winterspring,
Witherbark Caverns, Witherbark Village, Woodpaw Hills, Wyrmbog, Yojamba
Isle, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from The Den of Flame through The
Writhing Deep, which is 25 names with no duplicate among them. The Stonefield Farm
falls in that batch and has not had its claim review; it was edited this run only
to absorb the deleted duplicate, so review it properly. Recompute the ranking
anyway to confirm nothing new scores. Count duplicate names as separate records:
Altar of Storms, Darnassus, The Bulwark, The Talondeep Path and Thunder Bluff are
each two entries, and all five are already covered. Two names still have no wiki
article, The Dream Bough and The Sanctum, and both fall in this next batch. P5
remains pending and covers run 29 onwards.

### 2026-11-22, release 1.2.19

Martin asked for dev to be merged to main and the next 1.2.x released. Release
1.2.19 carries P4 runs 33 and 34, which is 50 entry records reviewed and 46
corrected. Three records were deleted as duplicates of entries the addon already
had: Thalassian Vanguard Camp into Thalassian Base Camp, and the two Elwynn farms
that had been written up twice into The Stonefield Farm and The Maclure Vineyards.
Two records held up with no change, Sleeping Gorge and Slither Rock. One faction
field changed, Southridge Beach from Contested to Hostile. The vanilla corpus is
907 entries and the Forever one is 76. Both version strings read 1.2.19.

`CHANGELOG.md` records the findings under the 1.2.19 heading in the same three
sections 1.2.17 and 1.2.18 used: the corrections, the claims removed, and the
structural changes, which this time are the three merges and the faction change.
P5 must not write runs 33 or 34 again and now covers run 35 onwards. The other
half of P5, writing the findings into `tools/era-audit.md`, is still outstanding
and was not touched by this release.

Two things this release does not carry, because they are notes to ourselves rather
than player-facing changes: the correction to run 33's claim about Zeppelin Masters
in the 1.12 table, and the covered-list hyphen bug. Both are recorded in the run 34
entry above.

Release checks before preparing: default validation and all nine CI configurations
pass with zero errors and warnings, check-gaps reports 43 explained gaps, prose
lint is clean on the changelog, the CurseForge description and the README, and
`git diff --check` passes. `tools/build-zip.sh` produces
`ForAllTheNerds-1.2.19.zip` with the toc at `ForAllTheNerds/ForAllTheNerds.toc`,
declaring interface 16001 and 11509, both version strings reading 1.2.19,
`LICENSE` present, 26 entries packaged and no tooling, media or dotfiles in it.
The upload label override `-n ":{package-name}-{project-version}"` is still in
`.github/workflows/release.yml`, so the file lists as `ForAllTheNerds-1.2.19`
rather than a bare number. The preceding sweep commit 954d659 passed CI for its
exact SHA before release preparation began.

### 2026-11-23, P4 run 35: The Den of Flame to The Writhing Deep

Reviewed 25 records alphabetically. All 25 were revised and none held up
unchanged, which is the third run with no clean record in it. Coverage is now 867
of 907 surviving entries, with 40 left. P5 remains pending.

**The no-article list is empty, and it was never five names long.** Earlier runs
recorded Stormwind Gates, Thalassian Vanguard Camp, The Dream Bough, The Sanctum
and Western Pylon as having no wiki article. Two of the three that were left come
off the list this run, and the lesson is about how they were searched rather than
about the places. `The Dream Bough` has no article; **`Dream Bough` does**, and it
is a long one. `The Sanctum` has no article; `Sanctum` is a disambiguation page
and **`Sanctum (Stromgarde Keep)`** is the article. The leading definite article
and the qualified title are both ordinary wiki conventions, and a run that
searches only the entry's exact name will keep inventing gaps. Of the original
five, Stormwind Gates is attested in 1.12 as nine `Stormwind Gate` gameobjects,
Western Pylon by quest 4288, Thalassian Vanguard Camp was deleted in run 34
because there is no such place, and these two had articles all along.

**Five entries named the wrong occupants or the wrong place.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| The Uplands | Crushridge ogre country | The Syndicate's strongest ground, with Baron Vardus on it |
| The Dust Plains | Farmland that gave out, with harvest golems still working it | Westfall's southernmost ground: Riverpaw gnoll camps and Mortwake's Tower |
| The Undercroft | A burial site the Scourge's necromancers are harvesting | Zaeldarr the Outcast's gang of undead troll body-thieves |
| The Stockpile | A smugglers' and bandits' cache with changing owners | The cave at the back of Kurzen's Compound where his special forces are kept |
| The Tidus Stair | A sunken formation below the surface off the eastern coast | Stone terraces above the Merchant Coast with two tauren fishing off them |

The Uplands is the one to read twice, because the entry had the faction wrong and
then built a paragraph on the error. It said the Crushridge hold the hills and are
"fighting the Syndicate for the high ground now", which made a picture out of a
contest that is not happening. The Syndicate hold the Uplands and this is where
they are strongest: Baron Vardus stands at Alterac Mountains 47.8,17.1 with eight
Syndicate sentries, a saboteur and an Argus shadow mage around him, and quest 566
has High Executor Darthalia wanting him for crimes against the Forsaken as a
high-ranking man of theirs. No Crushridge spawn is anywhere near. The hills were
also the kingdom's bread basket, which is a better reason for anyone to want them
than altitude.

**The Dust Plains repeated the Dead Acre's mistake exactly.** Run 34 found the
Dead Acre described as farmland whose soil gave out, where the Defias burned it.
The Dust Plains entry said "south of Moonbrook the soil stopped holding water and
the tenants walked away" and put harvest golems still working the dirt as the
zone's most unsettling sight. Neither is so. The plains are the southernmost part
of Westfall, Riverpaw gnolls keep camps across them with Defias highwaymen on the
same ground and Leprithus wandering it, and the fixture at the eastern edge is
Mortwake's Tower, where Klaven Mortwake sits with Defias tower sentries and
patrollers below him and Venture Company drones about the place. There are no
harvest machines in the plains at all: the nearest are at the Dead Acre, five grid
squares north. Two entries in two consecutive runs reached for the same invented
agricultural decline, and it is worth naming as a habit rather than a one-off.

**The Undercroft had the raiding backwards.** The entry had necromancers working a
burial site and the Argent Dawn unable to guard its graveyards. Quest 6021 has it
the other way round: Caretaker Alen at Light's Hope Chapel complains that dead
troll thieves under Zaeldarr the Outcast come at night and steal bodies out of the
grave pit below the chapel, then carry them back to the Undercroft to the west. The
crypt is the thieves' hideout, not the target. Behind it is a mound of dirt beside
a wagon with a chest in it, and Infiltrator Hameya's note explaining the chest: he
and his brethren ate bad meat on the road to Zul'Mashar and changed, he can feel a
lich's words pushing him on to infect his own people, and he wrote the note asking
to be killed while he still could.

**Two entries put the wrong thing at the centre of the place.** The Cleft was
reviewed in run 34; the Den of Flame and the Dragonmurk are this run's pair, and
the Stonemaul are the reason. The Den of Flame entry had it as "a cave of black
dragonkin" and nothing else. Quest 1166 gives it a history: Overlord Mok'Morokk's
account is that big dragons came and made fire at the old home, so he moved the
clan to Brackenwall Village, and he left in such a hurry that his grog, his snuff
and his strongbox are all still down there with the Stonemaul Banner. The den was
an ogre mound and the architecture still says so. The Dragonmurk entry claimed
"Onyxia's lair opens into this part of the marsh", where quest 1172 sends the
player to the Wyrmbog for the lair and the eggs, and the Dragonmurk is where the
brood is scattered. It also surrounds the Den of Flame and the Stonemaul Ruins.
Draz'Zilb's line is the one worth keeping: they will never reclaim Stonemaul
Village while the ground around it is a breeding pen.

**Invention removed.** The Shifting Mire had tracks that "hold for a season and
then stop holding" and Stonard keeping the usable routes marked; the real reason
for the name is better, which is that some force gathers the extremely fine silt
and moves it so that it travels as though alive, and 1.12 offers no explanation for
the force at all. The Shining Strand had the Vile Fin murlocs moving out to the
Dawning Isles and improving the strand, where in this period they hold the whole
length of it in numbers no other stretch of Silverpine has to deal with, six kinds
of them across the lakeshore. Over in Deadwind, the Vice had ogres being "indifferent to history" and
nothing else able to live next to Karazhan; it is several mounds and camps along the
Karazhan road, with Deadwind warlocks among the brutes and ogre magi, and why
anybody settled a canyon holding nothing but restless spirits and a few vultures is
a question with no answer in it. The Sludge Fen had the Venture Company beyond
Horde pressure because "the cartel has no central authority" to pressure, which the
Venture Co. Mine entry disproves two zones away: Mogul Razdunk and an advisory board
are exactly that, and they are sending Fizsprocket shredders.

**One addition was taken back out before it shipped.** The Scarab Wall gained, and
then lost, the wall's own name. Exploring Azeroth gives the construction in
detail, the lower hundred feet moulded out of the sand by the night elves and the
bronze dragonflight's magic carrying it many times higher, and says the night elves
called it Irana'ethil, the shield against the shadow. That is a 2023 book naming an
event ten thousand years old, the name appears nowhere in 1.12, and a player of this
period could not have heard it. The ledger would have taken it as a `history` row on
the same basis as Aviana or Cho'gall, which is what makes it worth recording: the
`history` verdict is for pre-WoW facts, and a fact being set before WoW is not the
same as its being known in this period. The entry keeps what the vanilla scepter
chain establishes, that the night elves and the bronze dragons raised the wall
together at the end of the War of the Shifting Sands, and drops the rest.

**Where an entry lost a paragraph, 1.12 had a better one.**

- The Ruins of Stardust had "these ruins are ten thousand years old" and a sentence
  about Ashenvale being full of ruins. Two 1.12 quests do better. Quest 1534 makes
  it a holy place on an island in a lake south of Astranaar, with a fountain at the
  lake's centre whose water a shaman needs, and passes on the tale that creatures of
  nature protect the ruins while allowing it might be a story to frighten off the
  night elves' enemies. Those creatures are the bog beasts, corrupted by water that
  has taken the demonic rot coming down out of Felwood, and the site is tinted
  yellow-green for the same reason. Quest 1034 explains the name: the stardust is a
  frosted dust on the one kind of bush the taint has not touched, Pelturas Whitemoon
  sends for handfuls of it, and it brings down his daughter Relara's fever.
- The Stonefield Farm had not had its own claim review, which run 34 flagged. It has
  one now. Gramma Stonefield is the one who thinks of William Pestle and the
  invisibility liquor, Tommy Joe Stonefield waits at the river west of the farm,
  Bernice Stonefield's necklace was dropped near the Fargodeep Mine by Billy Maclure
  and carried in by a gold-toothed kobold, and Ma Stonefield will pay for the collar
  of the Brackwells' prize sow because Princess keeps coming over to eat the
  vegetables.
- The Venture Co. Mine said the company "did not seek permission". They sought it and
  were refused, and dug anyway. The mine has three ways in of which only the main one
  is walkable, Supervisor Fizsprocket runs the company's whole business in Mulgore
  from it with Enforcer Emilgund keeping order, and the papers out of the wrecked
  caravan on Stonebull Lake show the board pressing him to take the operation into
  lumber with new shredders and a mill.
- The Sludge Fen was a pool of clear blue water before the oil rig went on top of it,
  Supervisor Lugwizzle runs it, and the best thing about it is being robbed by other
  goblins: Sputtervalve of the Tinkers' Union decided stealing the Venture Company's
  shredder design was faster than beating it, and Wizzlecrank climbed into one
  without first getting the key.
- The Dream Bough is a great tree on an island in Jademir Lake, the largest in
  Feralas, with Lethlas and the Jademir dragonkin holding the island and the portal
  under it.
- The Slithering Scar is the Gorishi's, it has most of southern Un'Goro, and a
  crystal in the hive will call something worse up if it is interfered with. The
  colossus the wiki has them raising is later content and stayed out.
- The Writhing Deep held up and was sharpened. The causal chain the entry asserted,
  that the hive drives the gnolls frantic and the gnolls run into Camp Mojache, is
  sourced: quest 2903 reads the Woodpaw battle plans as a two-front war with most of
  the effort going south, and quest 7730 says plainly that if the insects are driving
  the gnolls to frenzy then they are the larger threat. Stinglasher is in now.
- The Savage Coast runs from the Westfall border down to Grom'gol, not just the
  north-west, and quest 629 puts a troll city sunk off it that the murlocs now hold.
- The Ruined Reaches is the southern coast near Durotar, not the worst-wrecked piece
  of the whole coastline, and the Gadgetspring gnomes keep a shop with a lift in it
  on the western shore. The Ravencrest Monument and Rethress Sanctum claims are out.
- The Rolling Plains cover southern Mulgore from Bloodhoof Village to the Barrens
  border, not the eastern edge, and the Windfury harpy nest at the eastern end is the
  one thing on them not simply grazing. The wiki's centaur outriders were left out:
  no Centaur Outrunner spawns in Mulgore at all in this period.
- The Sanctum's Thoras Trollbane paragraph said he took Stromgarde out of the
  Alliance "when Lordaeron would not act on the internment camps". That reads as
  negligence about the camps and conceals what he actually wanted, which was every
  orc in them executed. He argued it bitterly with Terenas, who was a close friend,
  and withdrew when Lordaeron refused.
- The Swarming Pillar was already close and now agrees with our own Hive'Ashi entry,
  which says the pillar is infested by that hive's insects: swarmers and stingers,
  all elite, just south of Cenarion Hold.
- The Shady Nook and the Ruins of Ordil'Aran both held up on the substance. The Nook
  gains Greenpaw Village as its other landmark; Ordil'Aran gains the heartswood tree,
  whose core opens a portal at a summoning circle in the crypt below, which is what
  ties it to the Tower of Althalaxx.

**Two of my own sentences from run 34 were wrong and are fixed.** The Maclure
Vineyards entry, which run 34 rewrote, put the Brackwell prize sow eating the
Maclures' vegetables. Quest 88 is Ma Stonefield's: Princess comes over to the
Stonefield fields and it is Ma Stonefield who wants her dead. The sow has moved to
the entry it belongs to. The same paragraph had Bernice's pie sent across "with the
wish that he chokes on it", and the word choke appears nowhere in the 1.12 corpus
in that sense; quest 86 has Billy Maclure naming his price and Bernice baking it,
and nothing about choking. Both errors were introduced by the run 34 merge, which is
the asymmetry the method notes warn about: the claim under test gets scrutiny and
the words that travel with it ride for free.

**Ledger and checks.** Added 38 vanilla rows across three appends, every one
asserted absent first and each block appended sorted, so the ledger diff is 38
insertions and nothing else. No row was deleted. One existing row was corrected
rather than re-verdicted: `Greenpaw Village` had been filed this run against
AreaTable row 428, which is wrong, and now cites 2359. The deliberate break was the
`Zaeldarr` row: removing it failed the build with `The Undercroft uses "Zaeldarr"`,
and the row was restored.

Eleven extractor artifacts were reworded rather than filed: the bare second
mentions `Fizsprocket`, `Zaeldarr`, `Tommy Joe`, `Maybell`, `Billy` and `Bernice`,
the title `Colonel` standing alone, the sentence-initial `Battle`, `Dust` and
`Southern Mulgore`, and the `of the` run `Sputtervalve of the Tinkers' Union`,
broken with a comma, which then needed both halves filing anyway. Capitalising
`Windfury Harpies` to make the term match the creature name was a mistake and was
undone: it made `Harpies` a word the extractor keeps everywhere and the build
failed naming Roguefeather Den, Windfury Ridge and Windbreak Canyon, none of which
this run touched. Lower-casing the plural and filing `Windfury` as a component was
the right way round. That is the third run in a row to trip the corpus-global rule,
always in the same direction: making a term more specific in one entry turns a
common word into a proper noun everywhere.

Both rate budgets fired and both were brought back under rather than raised. `',
and it is'` hit 4.1 per 10k against a budget of 4 and `', which'` hit 12.3 against
12; six clauses were rewritten, four of mine and two from this run's own additions,
which put them at 4.0 and 12.0 or below.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps. `git diff
--check` passes. `tools/lint-prose.py` is clean on `Data/Locales.lua`,
`tools/era-terms.tsv` and `tools/places.tsv`, and holds at 3 on `Data/Kalimdor.lua`
and 7 on `Data/EasternKingdoms.lua`, both unchanged. Four worklist notes in
`tools/places.tsv` carried the corrected claims and were fixed: the Uplands'
Crushridge, the Dust Plains' failed farmland, the Shifting Mire's northern
position and the Rolling Plains' eastern one. Comparing the prose dump against a
worktree at HEAD: 983 records before and after, none added or removed, 27 changed,
no era tag changed. The corpus stays at 907 vanilla entries and 76 Forever ones.

**Entries covered so far (865 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine,
Boulder'gor, Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brightwater Lake, Brightwood Grove,
Brill, Brill Town Hall, Broken Pillar, Bronzebeard Encampment, Browman
Mill, Burning Blade Coven, Burning Steppes, Caer Darrow, Camp Aparaje,
Camp Boff, Camp Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp
Narache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Chillwind Point, Circle of East Binding, Circle of Inner Binding, Circle
of Outer Binding, Circle of West Binding, Cleft of Shadow, Cliffspring
Falls, Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's Outpost,
Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand, Darkwhisper
Gorge, Darnassus, Darrow Hill, Darrowmere Lake, Darrowshire, Dawning
Wood Catacombs, Deadeye Shore, Deadman's Crossing, Deadwind Pass,
Deadwind Ravine, Deadwood Village, Deathknell, Deep Elem Mine, Deeprun
Tram, Deepwater Tavern, Demon Fall Canyon, Demon Fall Ridge, Demont's
Place, Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Post, Dreadmaul Rock, Dreadmist Den, Dreadmist Peak, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Mandarr, Dun Modr, Dun Morogh, Dunemaul Compound, Durnholde
Keep, Durotar, Duskwood, Dustbelch Grotto, Dustfire Valley, Dustwallow
Bay, Dustwallow Marsh, Dustwind Cave, Dustwind Gulch, Dwarven District,
East Pillar, Eastern Plaguelands, Eastern Pylon, Eastern Strand,
Eastmoon Ruins, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Fallen Sky Lake, Fallow Sanctuary, Faol's Rest, Far Watch Post,
Fargodeep Mine, Featherbeard's Hovel, Feathermoon Stronghold, Fel Rock,
Felfire Hill, Felpaw Village, Felstone Field, Felwood, Fenris Isle,
Fenris Keep, Feral Scar Vale, Feralas, Field of Giants, Fire Plume
Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Foothold Citadel,
Forest Song, Forest's Edge, Forlorn Ridge, Forlorn Rowe, Fray Island,
Frayfeather Highlands, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostsaber Rock, Frostwhisper Gorge, Fungal Rock, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Galardell
Valley, Gallows' Corner, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's
Naze, Gelkis Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan,
Go'Shek Farm, Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash
Hold, Grosh'gok Compound, Grove of the Ancients, Growless Cave,
Gunstan's Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment,
Hall of Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow Lake,
Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's Excavation
Site, Ironbeard's Tomb, Ironforge, Ironstone Camp, Ironstone Plateau,
Irontree Cavern, Irontree Woods, Isle of Dread, Itharius's Cave,
Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar, Jagged Reef,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine,
Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan,
Kargath, Kargathia Keep, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Kurzen's Compound, Lake Al'Ameth,
Lake Elune'ara, Lake Everstill, Lake Falathim, Lake Kel'Theril, Lake
Mennar, Lake Mereldar, Lake Nazferiti, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Legash Encampment,
Lethlor Ravine, Light's Hope Chapel, Lighthouse, Lion's Pride Inn, Loch
Modan, Longshore, Lordamere Internment Camp, Lordamere Lake, Lost Point,
Lost Rigger Cove, Lower Wilds, Lushwater Oasis, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Mannoroc Coven, Manor Mistmantle,
Maraudon, Mardenholde Keep, Marshal's Refuge, Mazra'Alor, Mazthoril,
Menethil Bay, Menethil Harbor, Menethil Keep, Military Ward, Mirage
Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake, Mirror Lake
Orchard, Mist's Edge, Mistvale Valley, Misty Pine Refuge, Misty Reed
Post, Misty Reed Strand, Misty Shore, Misty Valley, Mizjah Ruins,
Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook, Moonglade,
Moonwell, Mor'shan Base Camp, Mor'shan Rampart, Morgan's Plot, Morgan's
Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic
Ward, Mystral Lake, Naxxramas, Nek'mani Wellspring, Nesingwary's
Expedition, Nethander Stead, Nethergarde Keep, Night Run, Night Web's
Hollow, Nighthaven, Nightmare Vale, Nightsong Woods, Nijel's Point,
Noonshade Ruins, North Gate Outpost, North Gate Pass, North Point Tower,
North Tide's Hollow, North Tide's Run, Northdale, Northern Pylon,
Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire
Abbey, Northshire River, Northshire Valley, Northshire Vineyards,
Northwatch Hold, O'Breen's Camp, Old Town, Olsen's Farthing, Oneiros,
Onyxia's Lair, Oracle Glade, Orgrimmar, Ortell's Hideout, Owl Wing
Thicket, Palemane Rock, Pestilent Scar, Plaguemist Ravine, Plaguewood,
Pool of Tears, Pools of Arlithrien, Pools of Vision, Purgation Isle,
Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Rage Scar Hold,
Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet,
Ravaged Caravan, Ravaged Twilight Camp, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razor Hill Barracks, Razorfen Downs, Razorfen Kraul, Razormane Grounds,
Razorwind Canyon, Rebel Camp, Red Cloud Mesa, Red Rocks, Redridge
Canyons, Redridge Mountains, Refuge Pointe, Remtravel's Excavation,
Render's Camp, Render's Rock, Render's Valley, Rethban Caverns, Rethress
Sanctum, Revantusk Village, Ridgepoint Tower, Rise of the Defiler,
Rocktusk Farm, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins
of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas,
Ruins of Eldarath, Ruins of Isildien, Ruins of Jubuwal, Ruins of
Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of Ravenwind,
Ruins of Solarsal, Ruins of Thaurissan, Ruins of Zul'Kunda, Ruins of
Zul'Mamwe, Rut'theran Village, Saldean's Farm, Saltspray Glen,
Sandsorrow Watch, Sar'theris Strand, Sardor Isle, Sargeron, Satyrnaar,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scrabblescrew's Camp, Scuttle Coast, Searing Gorge, Sen'jin Village,
Sentinel Hill, Sentry Point, Seradane, Serpent's Coil, Shadow Grave,
Shadow Hold, Shadowbreak Ravine, Shadowfang Keep, Shadowglen, Shadowprey
Village, Shadowsong Shrine, Shadowthread Cave, Shadra'Alor, Shady Rest
Inn, Shalzaru's Lair, Shaol'watha, Shatter Scar Vale, Shimmer Ridge,
Shindigger's Camp, Shok'Thokar, Shrine of Remulos, Shrine of the
Deceiver, Shrine of the Dormant Flame, Shrine of the Fallen Warrior,
Silithus, Silver Stream Mine, Silverpine Forest, Silverwind Refuge,
Silverwing Grove, Silverwing Outpost, Sishir Canyon, Skulk Rock, Skull
Rock, Slaughter Hollow, Sleeping Gorge, Slither Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Gate Pass, South Tide's Run, Southbreak Shore, Southern Barrens,
Southern Gold Road, Southern Savage Coast, Southfury River, Southmoon
Ruins, Southpoint Tower, Southridge Beach, Southshore, Southwind
Village, Spirit Den, Spirit Rise, Spirit Rock, Splinterspear Junction,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Staghelm Point, Starbreeze Village, Starfall Village, Steamwheedle
Port, Steelgrill's Depot, Stendel's Pond, Stillwater Pond, Stonard,
Stone Cairn Lake, Stonebull Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Falls,
Stonewatch Keep, Stonewatch Tower, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Gates, Stormwind Keep,
Stoutlager Inn, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Sundown Marsh, Swamp of Sorrows, Swamplight
Manor, Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris,
Tanner Camp, Tarren Mill, Teldrassil, Temple of Ahn'Qiraj, Temple of
Arkkoran, Temple of Zin-Malor, Temple of the Moon, Terrace of Repose,
Terror Run, Terror Wing Path, Terrordale, Terrorweb Tunnel, Tethris
Aran, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of Zul,
The Apothecarium, The Barrens, The Bulwark, The Canals, The Cape of
Stranglethorn, The Cauldron, The Charred Vale, The Cleft, The Commons,
The Creeping Ruin, The Crimson Veil, The Crossroads, The Crystal Shore,
The Crystal Vale, The Dagger Hills, The Damsel's Luck, The Dark Portal,
The Darkened Bank, The Dawning Isles, The Dead Acre, The Dead Field, The
Deadmines, The Decrepit Ferry, The Den, The Den of Flame, The Dor'Danil
Barrow Den, The Drag, The Dragonmurk, The Dream Bough, The Drowned Reef,
The Dry Hills, The Dust Plains, The Dustbowl, The Farstrider Lodge, The
Foothill Caverns, The Forgotten Coast, The Forgotten Pools, The Fungal
Vale, The Gaping Chasm, The Golden Plains, The Great Forge, The Great
Lift, The Green Belt, The Greymane Wall, The Grizzled Den, The
Harborage, The Headland, The Hidden Grove, The High Seat, The High
Wilderness, The Hinterlands, The Howling Vale, The Hushed Bank, The
Infectis Scar, The Ivar Patch, The Jansen Stead, The Loch, The Long
Wash, The Lost Fleet, The Maclure Vineyards, The Mage Quarter, The Magic
Quarter, The Maker's Terrace, The Marris Stead, The Marshlands, The
Master's Cellar, The Master's Glaive, The Maul, The Merchant Coast, The
Molsen Farm, The Mor'shan Rampart, The North Coast, The Noxious Glade,
The Noxious Lair, The Oracle Glade, The Overlook Cliffs, The Park, The
Pillar of Ash, The Pools of Vision, The Quagmire, The Red Reaches, The
Riptide, The Rogues' Quarter, The Rolling Plains, The Rotting Orchard,
The Royal Quarter, The Ruined Reaches, The Ruins of Kel'Theril, The
Ruins of Ordil'Aran, The Ruins of Stardust, The Rustmaul Dig Site, The
Sanctum, The Savage Coast, The Scarab Dais, The Scarab Wall, The
Screeching Canyon, The Sea of Cinders, The Sepulcher, The Shady Nook,
The Shattered Strand, The Shifting Mire, The Shimmering Flats, The
Shining Strand, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Slithering Scar, The Sludge Fen, The Stagnant Oasis, The
Stockade, The Stockpile, The Stonefield Farm, The Swarming Pillar, The
Tainted Scar, The Talon Den, The Talondeep Path, The Temple Gardens, The
Temple of Atal'Hakkar, The Tidus Stair, The Tower of Arathor, The Trade
Quarter, The Tundrid Hills, The Twin Colossals, The Undercroft, The
Uplands, The Venture Co. Mine, The Vice, The Vile Reef, The War Quarter,
The Weathered Nook, The Weeping Cave, The Writhing Deep, The Writhing
Haunt, The Yorgen Farmstead, Theramore Isle, Thieves Camp, Thistleshrub
Valley, Thondroril River, Thoradin's Wall, Thousand Needles, Three
Corners, Thunder Axe Fortress, Thunder Bluff, Thunder Ridge, Thunderbrew
Distillery, Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold,
Timbermaw Post, Tinker Town, Tiragarde Keep, Tirisfal Glades, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Twilight Grove, Tyr's Hand, Uldaman, Uldum,
Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valley of Bones,
Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of Spears,
Valley of Spirits, Valley of Strength, Valley of Trials, Valley of
Wisdom, Valley of the Watchers, Valor's Rest, Valormok, Venomweb Vale,
Venture Co. Base Camp, Wailing Caverns, Warrior's Terrace, Warsong
Gulch, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River, West
Pillar, Western Plaguelands, Westfall, Wetlands, Whelgar's Excavation
Site, Whispering Shore, Whisperwind Grove, Whitereach Post, Wildbend
River, Windbreak Canyon, Windshear Crag, Winterfall Village, Winterhoof
Water Well, Winterspring, Witherbark Caverns, Witherbark Village,
Woodpaw Hills, Wyrmbog, Yojamba Isle, Zoram'gar Outpost, Zul'Farrak,
Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the next 25 records, alphabetically from The Zoram Strand through
Western Pylon, which is 25 names with no duplicate among them. Western Pylon is
already settled by 1.12 quest 4288, so it needs recording rather than
researching. Recompute the ranking anyway to confirm nothing new scores. Count
duplicate names as separate records: Altar of Storms, Darnassus, The Bulwark, The
Talondeep Path and Thunder Bluff are each two entries, and all five are covered.
No name is left without a wiki article. After that batch, fifteen records remain,
from Western Strand to Zuuldaia Ruins, which is one more run. P5 remains pending
and covers run 35 onwards.

### 2026-11-23, P4 run 36: The Zoram Strand to Western Pylon

Reviewed 25 records alphabetically. Twenty-four were revised and one held up
unchanged. Coverage is now 892 of 907 surviving entries, with 15 left, which is
one more run. P5 remains pending.

**Western Pylon is the clean record.** It says the western pylon completes the ring
with the northern and eastern ones, that all three are the same unexplained work,
and that what the expedition can actually show is narrower: the pylons take the
crater's power crystals and a manual at Marshal's Refuge sets out what combining
them at a pylon table does. All of that holds. Run 32 settled the name itself from
1.12 quest 4288, `The Western Pylon`, and nothing here needed changing.

**The worst error in the batch was read straight off a place name.** Twilight Vale
had the Twilight's Hammer holding ground in Darkshore, running inland from the
Master's Glaive, with "three separate camps along this coast". There is no cult in
it at all. Twilight Vale is the name of Darkshore's southern forests, from below
Ameth'Aran down to the Ashenvale border, and the name belongs to the half-light the
coast sits in permanently, the same half-light Darkshore itself is named for. What
is in the woods is Blackwood ursas and shaman in numbers, moonstalkers, and deer
that are visibly sick. The entry had taken the word Twilight, found a cult of that
name two zones away in Silithus, and built a cult presence out of the coincidence.
Twilight Shore next door, which our entry had right, is the same name for the same
reason. This is a new shape of error for the sweep and worth naming: not a retail
article misread, but a proper noun inferred from a common word in a place name.

**Four entries named the wrong occupants, the wrong place or the wrong direction.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Vul'Gol Ogre Mound | Vul'Gol ogres, with worgen pressing in on them | Splinter Fist ogres under Zzarc' Vul, who the mound is named for; no worgen |
| Valorwind Lake | The Hinterlands' main lake, below Aerie Peak | A small lake north-east of Shadra'Alor |
| Verdantis River | Northern Feralas, near Jademir Lake and the Dream Bough | Central Feralas, south-east of Dire Maul |
| Thunder Falls | Falls toward Eastvale watering eastern Elwynn | A ravine in north-western Elwynn, off Mirror Lake's waterfall |

Vul'Gol is the instructive one, because the entry invented a tribe out of the place
name and then invented a conflict for it. There is no Vul'Gol tribe: the ogres are
Splinter Fist and the mound is named after Zzarc' Vul, who leads them. The worgen
were never there. What is there, besides the ogres, is a basin that humans used to
farm, with the ruined farmhouses still standing, walls thick with ore from copper
up to gold that nobody is mining, Abercrombie's stolen crate of tools and herbs,
and Viktori Prism'Antras wanting Zzarc' Vul's monocle for his research. The Night
Watch will not spend its own few members on the place and pays others instead.

Thunder Falls had the wrong half of Elwynn and then concluded that "nothing of
consequence has ever happened here". It is in the north-western mountains, reached
by a steep path off the right of Mirror Lake's waterfall, and it is unusual in
having falls at both ends fed by a third that cannot be reached at all. There is
also a cottage up there with an anvil, a fire, a pier and a boat, and a few bandits
who presumably own the lot.

**Three Silithus cult entries were repeating each other, and 1.12 had the thing
that tells them apart.** Twilight Base Camp, Twilight Outpost and Twilight Post all
carried a version of the same paragraph: the cult serves the Old Gods, Ahn'Qiraj
holds C'Thun, they want it out. True, but it described the organisation rather than
any of the three camps. What each camp actually has is wind stones, in three sizes,
and quests 8332 and 8341 explain them: a cultist communes through a stone to reach
the Abyssal Council, the lesser and ordinary stones reach its dukes, and only the
top-ranking members of the Twilight's Council may speak through a greater wind
stone to the Council's lords. Aurel Goldleaf at Cenarion Hold has worked out what
that is worth, and will fit somebody out with a ring of lordship and a medallion of
station so they can activate a greater stone, be taken for a servant of the Council
and lure a Lord into an ambush. Each camp now carries its own keeper as well:
Havunth at the Base Camp, Exeter at the Outpost, Mayna at the Post. The Outpost
gains the detail that makes its old hook literal, which is that it is pitched in
the far south-west just north-west of the Scarab Wall, against the very thing the
cult wants opened.

**Invention removed.** Thelgen Rock was "a dwarven working that the marsh
reclaimed", with the mine becoming a cave when the water came in; nothing says it
was ever a mine. It is a cavern running deep into the southern Wetlands mountains,
crawling with cave stalkers and leech stalkers with the Leech Widow inside, and the
reason to go in is incendicite in the walls, volatile enough to be hard to handle
without blowing yourself up, which Pilot Stonegear up at Steelgrill's Depot wants
for cannon shells. Tranquil Gardens Cemetery had the Night Watch guarding it with
real attention and a rising there being "a disaster rather than a patrol"; the
rising has already happened, the undead in it are the weakest in Duskwood, and the
Night Watch's own undead work in 1.12 sends people to Raven Hill instead. The
Tradesmen's Terrace claimed the night elves "had no money economy to speak of
before joining the Alliance" and that the quarter is an accommodation to allies;
neither is sourced, and the district is less of a concession than the stalls
suggest, since sentinels walk it, wisps drift through it and ancient protectors
stand among the merchants. Westbrook Garrison had the Defias as its awkward job
and the gnolls as the half the soldiers prefer to talk about; in this period the
garrison's work is the Riverpaw pack to its south, it is short of men because the
army is abroad, and Hogger's wanted posters are on its wall.

**One claim was asserted where the source says nobody knows.** Twilight's Run had
Staghelm Point above it "named for Fandral Staghelm". It is named for one of the
two Staghelms and it is not known which: Fandral, who led the night elf armies in
the War of the Shifting Sands, or his son Valstann, who fell in it. The entry now
says so, and keeps the point it was making, that a cult serving the thing under
Ahn'Qiraj has dug itself in beneath a monument to the family whose war sealed it.

**Where an entry lost a paragraph, 1.12 had a better one.**

- Valgan's Field was "one of several holdings between the Sepulcher and Pyrewood
  that have been abandoned since Arugal's worgen got loose". It is the wheat farm
  north of the bridge where Arugal stayed before the war, and his spellbooks are
  still in it. Dalar Dawnweaver at the Sepulcher wants one spell out of them, the
  Remedy of Arugal, to turn the man's own magic against him and have Silverpine for
  the Dark Lady, and his opinion of Arugal is worth quoting at length: he cannot
  understand how the man was ever accepted into the Kirin Tor, calls his spellcraft
  as transparent as a blown glass bauble, and holds that the old hack was not fit to
  clean chamber pots in Dalaran.
- Valley of Kings had statuary that was "a statement about who owns these
  mountains" and a chokepoint fortified against enemies to the east. The gate faces
  south. The two kings are Madoran Bronzebeard and Khardros Wildhammer, and the
  statues were raised by their sons after both men were dead, standing over the pass
  into southlands gone volcanic under Ragnaros, as a warning to anyone minded to
  attack the dwarven kingdoms and a reminder of the price the Dark Irons paid for
  trying. Mountaineer Pebblebitty keeps the gate and the lever and will not open it
  for anyone who has not satisfied her. She also has a history with Margol out in
  the Badlands and will tell you any horn you bring her is a fake, because she has
  seen the real one close up.
- The Zoram Strand gains Talen, who is the reason anyone goes onto it: he was taking
  a small vessel over the submerged ruins when the naga came up out of the water at
  him, and in getting ashore he lost the ancient statuette he had braved the place
  for. The statuette locks and the key is the Ring of Zoram. Down in Blackfathom
  Deeps the naga are cutting sapphire clusters out of the walls of the first
  tunnels, and Vorsha the Lasher comes out of the same sea at the Horde's outpost,
  unprovoked each time.
- Thistlefur Village is east of the Zoram Strand rather than in northern Ashenvale,
  holds avengers and shaman under Dal Bloodclaw and Rorgish Jowl, and Raene
  Wolfrunner in Astranaar wants Bloodclaw's skull. A party of trolls carrying sacred
  charms to Zoram'gar was attacked and killed by the tribe before it arrived.
- Thelsamar gains the blood sausage it is already famous for in the hook: Vidra
  Hearthstove makes it, the ingredients are bear meat, boar intestines for the
  casings and spider ichor for spice, and she recommends eating them fresh.
- Thorium Point gains Overseer Oilfist and the point that the camp's neutrality is
  practical rather than declared, with dwarves of both kinds and orcs working out of
  it. Oilfist is also the man who put the order out on Overseer Maltorius down in
  the Cauldron, which run 34 wrote up from the other end.
- Thorn Hill held up on the substance and gains the plunder: the Crossroads' own
  supply crates are stacked up on the hill, taken off Horde caravans on the road
  below, with Elder Mystic Razorsnout among the geomancers and defenders. Tortusk,
  who the wiki gives as its leader, has no creature row in 1.12 and stayed out.
- Tkashi Ruins was on the shore of Lake Nazferiti with trolls, raptors and
  crocolisks in equal measure. It is south-west of Nesingwary's Expedition and a
  large group of Bloodscalp live in it. Hemet Nesingwary's own account of coming
  through is that his party did so without incident. Berrin Burnquill, who the wiki
  has assigning the work there, is absent from 1.12 and stayed out.
- Venture Co. Operations Center gains Foreman Cozzle, a workboss and a lumberjack,
  which is more than prospecting.
- Twilight Shore gains what lives on it, murlocs all over the sand and threshadons
  lying off it, and loses an unsourced line about the Wildbend River carrying
  Felwood's corruption down to the coast.
- Warsong Labor Camp held up and gains the reason its isolation matters in both
  directions: Alliance adventurers come out to it precisely because the guards can
  be killed without anything coming of it.

**Ledger and checks.** Added 43 rows, 41 `vanilla` and two `history`, every one
asserted absent before the append and the block appended sorted, so the ledger diff
is 43 insertions and nothing else. No row was deleted and no verdict changed. The
two history rows are `Madoran Bronzebeard` and `Madoran`, filed on the precedent of
`Khardros` and `Khardros Wildhammer`, which were already there on the same footing.
Worth contrasting with run 35's refusal of Irana'ethil: both are pre-WoW, but
Madoran Bronzebeard is named in the History of Warcraft books a 1.12 player can
read in the game, while Irana'ethil was coined in a book published in 2023. The
deliberate break was the `Zzarc' Vul` row: removing it failed the build with
`Vul'Gol Ogre Mound uses "Zzarc' Vul"`, and the row was restored.

Seven extractor artifacts were reworded rather than filed: the bare second mentions
`Dawnweaver`, `Bloodclaw`, `Oilfist` and `Rainer`, the sentence-initial
`Threshadons`, the epithet half `Vile` out of "Vyral the Vile", and `Lords`
standing alone, which became the Council's lords. The `', which'` budget fired at
13.1 per 10k against a budget of 12, which is the third run running, and fourteen
clauses were rewritten to bring it under rather than raising it. One RHYTHM finding
rose on `Data/EasternKingdoms.lua` and was reworded: a sentence of mine opening
"The dead are up and walking" completed a run of three sentences opening "The "
that the linter only sees because it reads Lua as prose, the other two being the
tails of neighbouring records.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps. `git diff
--check` passes. `tools/lint-prose.py` is clean on `Data/Locales.lua`,
`Data/Cities.lua`, `tools/era-terms.tsv` and `tools/places.tsv`, and holds at 3 on
`Data/Kalimdor.lua` and 7 on `Data/EasternKingdoms.lua`, both unchanged. Two
worklist notes in `tools/places.tsv` carried corrected claims and were fixed: the
Tkashi Ruins' position on Lake Nazferiti and Tortusk at Thorn Hill. Comparing the
prose dump against a worktree at HEAD: 983 records before and after, none added or
removed, 24 changed, no era tag changed. The corpus stays at 907 vanilla entries
and 76 Forever ones.

**Entries covered so far (890 place names).**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'Thallow Barrow Den, Ban'ethil Barrow Den,
Ban'ethil Hollow, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle
Ring, Bay of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt,
Beren's Peril, Bitter Reaches, Black Channel Marsh, Blackchar Cave,
Blackfathom Deeps, Blackrock Depths, Blackrock Mountain, Blackrock Pass,
Blackrock Spire, Blackrock Stronghold, Blackthorn Ridge, Blackwater
Cove, Blackwing Lair, Blackwolf River, Blackwood Den, Blackwood Lake,
Bladefist Bay, Blasted Lands, Bloodfen Burrow, Bloodhoof Village,
Bloodsail Compound, Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post,
Bloodvenom River, Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole,
Bones of Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine,
Boulder'gor, Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine,
Brackenwall Village, Brackwell Pumpkin Patch, Brambleblade Ravine,
Bramblescar, Brewnall Village, Brightwater Lake, Brightwood Grove,
Brill, Brill Town Hall, Broken Pillar, Bronzebeard Encampment, Browman
Mill, Burning Blade Coven, Burning Steppes, Caer Darrow, Camp Aparaje,
Camp Boff, Camp Cagg, Camp E'thok, Camp Kosh, Camp Mojache, Camp
Narache, Camp Taurajo, Camp Wurg, Cathedral Square, Cenarion Enclave,
Cenarion Hold, Champions' Hall, Chill Breeze Valley, Chillwind Camp,
Chillwind Point, Circle of East Binding, Circle of Inner Binding, Circle
of Outer Binding, Circle of West Binding, Cleft of Shadow, Cliffspring
Falls, Cliffspring River, Cold Hearth Manor, Coldridge Pass, Coldridge
Valley, Corin's Crossing, Corrahn's Dagger, Craftsmen's Terrace,
Cragpool Lake, Crown Guard Tower, Crusader Outpost, Crusader's Outpost,
Crushridge Hold, Crystal Lake, Crystalvein Mine, Dabyrie's Farmstead,
Dalaran Crater, Dalson's Tears, Dandred's Fold, Darkcloud Pinnacle,
Darkmist Cavern, Darkshire, Darkshore, Darkspear Strand, Darkwhisper
Gorge, Darnassus, Darrow Hill, Darrowmere Lake, Darrowshire, Dawning
Wood Catacombs, Deadeye Shore, Deadman's Crossing, Deadwind Pass,
Deadwind Ravine, Deadwood Village, Deathknell, Deep Elem Mine, Deeprun
Tram, Deepwater Tavern, Demon Fall Canyon, Demon Fall Ridge, Demont's
Place, Desolace, Diamondhead River, Dire Maul, Direforge Hill, Dolanaar,
Draco'dar, Draenil'dur Village, Dragonmaw Gates, Dreadmaul Hold,
Dreadmaul Post, Dreadmaul Rock, Dreadmist Den, Dreadmist Peak, Dreadmurk
Shore, Dream Bough, Drygulch Ravine, Drywhisker Gorge, Dun Algaz, Dun
Garok, Dun Mandarr, Dun Modr, Dun Morogh, Dunemaul Compound, Durnholde
Keep, Durotar, Duskwood, Dustbelch Grotto, Dustfire Valley, Dustwallow
Bay, Dustwallow Marsh, Dustwind Cave, Dustwind Gulch, Dwarven District,
East Pillar, Eastern Plaguelands, Eastern Pylon, Eastern Strand,
Eastmoon Ruins, Eastvale Logging Camp, Eastwall Tower, Echo Isles, Echo
Ridge Mine, Elder Rise, Elwynn Forest, Emberstrife's Den, Emerald
Sanctuary, Ethel Rethor, Everlook, Faldir's Cove, Falfarren River,
Fallen Sky Lake, Fallow Sanctuary, Faol's Rest, Far Watch Post,
Fargodeep Mine, Featherbeard's Hovel, Feathermoon Stronghold, Fel Rock,
Felfire Hill, Felpaw Village, Felstone Field, Felwood, Fenris Isle,
Fenris Keep, Feral Scar Vale, Feralas, Field of Giants, Fire Plume
Ridge, Fire Scar Shrine, Firewatch Ridge, Flame Crest, Foothold Citadel,
Forest Song, Forest's Edge, Forlorn Ridge, Forlorn Rowe, Fray Island,
Frayfeather Highlands, Freewind Post, Frostfire Hot Springs, Frostmane
Hold, Frostsaber Rock, Frostwhisper Gorge, Fungal Rock, Furlbrow's
Pumpkin Farm, Gadgetzan, Gahrron's Withering, Galak Hold, Galardell
Valley, Gallows' Corner, Gallows' End Tavern, Garren's Haunt, Garrison
Armory, Gates of Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's
Naze, Gelkis Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan,
Go'Shek Farm, Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry,
Gold Road, Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw
Village, Grim Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem
Post, Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash
Hold, Grosh'gok Compound, Grove of the Ancients, Growless Cave,
Gunstan's Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment,
Hall of Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite,
Hearthglen, Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden
Path, High Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad
Fields, Hillsbrad Foothills, Hiri'watha, Hive'Ashi, Hive'Regal,
Hive'Zora, Honor's Stand, Hunter Rise, Ice Thistle Hills, Iceflow Lake,
Idlewind Lake, Iris Lake, Ironband's Compound, Ironband's Excavation
Site, Ironbeard's Tomb, Ironforge, Ironstone Camp, Ironstone Plateau,
Irontree Cavern, Irontree Woods, Isle of Dread, Itharius's Cave,
Jadefire Glen, Jadefire Run, Jademir Lake, Jaedenar, Jagged Reef,
Jaggedswine Farm, Jaguero Isle, Janeiro's Point, Jangolode Mine,
Jasperlode Mine, Jerod's Landing, Jintha'Alor, Kal'ai Ruins, Karazhan,
Kargath, Kargathia Keep, Kharanos, Kodo Graveyard, Kodo Rock, Kolkar
Crag, Kolkar Village, Kormek's Hut, Kurzen's Compound, Lake Al'Ameth,
Lake Elune'ara, Lake Everstill, Lake Falathim, Lake Kel'Theril, Lake
Mennar, Lake Mereldar, Lake Nazferiti, Lakeridge Highway, Lakeshire,
Lakkari Tar Pits, Land's End Beach, Lariss Pavilion, Legash Encampment,
Lethlor Ravine, Light's Hope Chapel, Lighthouse, Lion's Pride Inn, Loch
Modan, Longshore, Lordamere Internment Camp, Lordamere Lake, Lost Point,
Lost Rigger Cove, Lower Wilds, Lushwater Oasis, Maestra's Post, Magram
Village, Malaka'jin, Malden's Orchard, Mannoroc Coven, Manor Mistmantle,
Maraudon, Mardenholde Keep, Marshal's Refuge, Mazra'Alor, Mazthoril,
Menethil Bay, Menethil Harbor, Menethil Keep, Military Ward, Mirage
Flats, Mirage Raceway, Mirkfallon Lake, Mirror Lake, Mirror Lake
Orchard, Mist's Edge, Mistvale Valley, Misty Pine Refuge, Misty Reed
Post, Misty Reed Strand, Misty Shore, Misty Valley, Mizjah Ruins,
Mo'grosh Stronghold, Molten Core, Moon Horror Den, Moonbrook, Moonglade,
Moonwell, Mor'shan Base Camp, Mor'shan Rampart, Morgan's Plot, Morgan's
Vigil, Morlos'Aran, Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic
Ward, Mystral Lake, Naxxramas, Nek'mani Wellspring, Nesingwary's
Expedition, Nethander Stead, Nethergarde Keep, Night Run, Night Web's
Hollow, Nighthaven, Nightmare Vale, Nightsong Woods, Nijel's Point,
Noonshade Ruins, North Gate Outpost, North Gate Pass, North Point Tower,
North Tide's Hollow, North Tide's Run, Northdale, Northern Pylon,
Northfold Manor, Northpass Tower, Northridge Lumber Camp, Northshire
Abbey, Northshire River, Northshire Valley, Northshire Vineyards,
Northwatch Hold, O'Breen's Camp, Old Town, Olsen's Farthing, Oneiros,
Onyxia's Lair, Oracle Glade, Orgrimmar, Ortell's Hideout, Owl Wing
Thicket, Palemane Rock, Pestilent Scar, Plaguemist Ravine, Plaguewood,
Pool of Tears, Pools of Arlithrien, Pools of Vision, Purgation Isle,
Pyrewood Village, Quel'Danil Lodge, Quel'Lithien Lodge, Rage Scar Hold,
Ragefire Chasm, Ranazjar Isle, Raptor Grounds, Raptor Ridge, Ratchet,
Ravaged Caravan, Ravaged Twilight Camp, Raven Hill, Raven Hill Cemetery,
Ravencrest Monument, Ravenholdt Manor, Raynewood Retreat, Razor Hill,
Razor Hill Barracks, Razorfen Downs, Razorfen Kraul, Razormane Grounds,
Razorwind Canyon, Rebel Camp, Red Cloud Mesa, Red Rocks, Redridge
Canyons, Redridge Mountains, Refuge Pointe, Remtravel's Excavation,
Render's Camp, Render's Rock, Render's Valley, Rethban Caverns, Rethress
Sanctum, Revantusk Village, Ridgepoint Tower, Rise of the Defiler,
Rocktusk Farm, Roguefeather Den, Roland's Doom, Ruins of Aboraz, Ruins
of Ahn'Qiraj, Ruins of Alterac, Ruins of Andorhal, Ruins of Constellas,
Ruins of Eldarath, Ruins of Isildien, Ruins of Jubuwal, Ruins of
Lordaeron, Ruins of Mathystra, Ruins of Ordil'Aran, Ruins of Ravenwind,
Ruins of Solarsal, Ruins of Thaurissan, Ruins of Zul'Kunda, Ruins of
Zul'Mamwe, Rut'theran Village, Saldean's Farm, Saltspray Glen,
Sandsorrow Watch, Sar'theris Strand, Sardor Isle, Sargeron, Satyrnaar,
Scalebeard's Cave, Scarlet Monastery, Scarlet Watch Post, Scholomance,
Scrabblescrew's Camp, Scuttle Coast, Searing Gorge, Sen'jin Village,
Sentinel Hill, Sentry Point, Seradane, Serpent's Coil, Shadow Grave,
Shadow Hold, Shadowbreak Ravine, Shadowfang Keep, Shadowglen, Shadowprey
Village, Shadowsong Shrine, Shadowthread Cave, Shadra'Alor, Shady Rest
Inn, Shalzaru's Lair, Shaol'watha, Shatter Scar Vale, Shimmer Ridge,
Shindigger's Camp, Shok'Thokar, Shrine of Remulos, Shrine of the
Deceiver, Shrine of the Dormant Flame, Shrine of the Fallen Warrior,
Silithus, Silver Stream Mine, Silverpine Forest, Silverwind Refuge,
Silverwing Grove, Silverwing Outpost, Sishir Canyon, Skulk Rock, Skull
Rock, Slaughter Hollow, Sleeping Gorge, Slither Rock, Sofera's Naze,
Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate Outpost, South
Gate Pass, South Tide's Run, Southbreak Shore, Southern Barrens,
Southern Gold Road, Southern Savage Coast, Southfury River, Southmoon
Ruins, Southpoint Tower, Southridge Beach, Southshore, Southwind
Village, Spirit Den, Spirit Rise, Spirit Rock, Splinterspear Junction,
Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog, Stagalbog
Cave, Staghelm Point, Starbreeze Village, Starfall Village, Steamwheedle
Port, Steelgrill's Depot, Stendel's Pond, Stillwater Pond, Stonard,
Stone Cairn Lake, Stonebull Lake, Stonemaul Ruins, Stonesplinter Valley,
Stonetalon Mountains, Stonetalon Peak, Stonewatch, Stonewatch Falls,
Stonewatch Keep, Stonewatch Tower, Stonewrought Dam, Stonewrought Pass,
Stormrage Barrow Dens, Stormwind City, Stormwind Gates, Stormwind Keep,
Stoutlager Inn, Strahnbrad, Stranglethorn Vale, Stratholme, Stromgarde
Keep, Sun Rock Retreat, Sundown Marsh, Swamp of Sorrows, Swamplight
Manor, Tahonda Ruins, Talonbranch Glade, Talrendis Point, Tanaris,
Tanner Camp, Tarren Mill, Teldrassil, Temple of Ahn'Qiraj, Temple of
Arkkoran, Temple of Zin-Malor, Temple of the Moon, Terrace of Repose,
Terror Run, Terror Wing Path, Terrordale, Terrorweb Tunnel, Tethris
Aran, Thalanaar, Thalassian Base Camp, Thandol Span, The Altar of Zul,
The Apothecarium, The Barrens, The Bulwark, The Canals, The Cape of
Stranglethorn, The Cauldron, The Charred Vale, The Cleft, The Commons,
The Creeping Ruin, The Crimson Veil, The Crossroads, The Crystal Shore,
The Crystal Vale, The Dagger Hills, The Damsel's Luck, The Dark Portal,
The Darkened Bank, The Dawning Isles, The Dead Acre, The Dead Field, The
Deadmines, The Decrepit Ferry, The Den, The Den of Flame, The Dor'Danil
Barrow Den, The Drag, The Dragonmurk, The Dream Bough, The Drowned Reef,
The Dry Hills, The Dust Plains, The Dustbowl, The Farstrider Lodge, The
Foothill Caverns, The Forgotten Coast, The Forgotten Pools, The Fungal
Vale, The Gaping Chasm, The Golden Plains, The Great Forge, The Great
Lift, The Green Belt, The Greymane Wall, The Grizzled Den, The
Harborage, The Headland, The Hidden Grove, The High Seat, The High
Wilderness, The Hinterlands, The Howling Vale, The Hushed Bank, The
Infectis Scar, The Ivar Patch, The Jansen Stead, The Loch, The Long
Wash, The Lost Fleet, The Maclure Vineyards, The Mage Quarter, The Magic
Quarter, The Maker's Terrace, The Marris Stead, The Marshlands, The
Master's Cellar, The Master's Glaive, The Maul, The Merchant Coast, The
Molsen Farm, The Mor'shan Rampart, The North Coast, The Noxious Glade,
The Noxious Lair, The Oracle Glade, The Overlook Cliffs, The Park, The
Pillar of Ash, The Pools of Vision, The Quagmire, The Red Reaches, The
Riptide, The Rogues' Quarter, The Rolling Plains, The Rotting Orchard,
The Royal Quarter, The Ruined Reaches, The Ruins of Kel'Theril, The
Ruins of Ordil'Aran, The Ruins of Stardust, The Rustmaul Dig Site, The
Sanctum, The Savage Coast, The Scarab Dais, The Scarab Wall, The
Screeching Canyon, The Sea of Cinders, The Sepulcher, The Shady Nook,
The Shattered Strand, The Shifting Mire, The Shimmering Flats, The
Shining Strand, The Shrine of Aessina, The Skittering Dark, The Slag
Pit, The Slithering Scar, The Sludge Fen, The Stagnant Oasis, The
Stockade, The Stockpile, The Stonefield Farm, The Swarming Pillar, The
Tainted Scar, The Talon Den, The Talondeep Path, The Temple Gardens, The
Temple of Atal'Hakkar, The Tidus Stair, The Tower of Arathor, The Trade
Quarter, The Tundrid Hills, The Twin Colossals, The Undercroft, The
Uplands, The Venture Co. Mine, The Vice, The Vile Reef, The War Quarter,
The Weathered Nook, The Weeping Cave, The Writhing Deep, The Writhing
Haunt, The Yorgen Farmstead, The Zoram Strand, Thelgen Rock, Thelsamar,
Theramore Isle, Thieves Camp, Thistlefur Village, Thistleshrub Valley,
Thondroril River, Thoradin's Wall, Thorium Point, Thorn Hill, Thousand
Needles, Three Corners, Thunder Axe Fortress, Thunder Bluff, Thunder
Falls, Thunder Ridge, Thunderbrew Distillery, Thunderhorn Water Well,
Tidefury Cove, Timbermaw Hold, Timbermaw Post, Tinker Town, Tiragarde
Keep, Tirisfal Glades, Tkashi Ruins, Tor'kren Farm, Tower of Althalaxx,
Tower of Azora, Tower of Eldara, Tower of Ilgalar, Trade District,
Tradesmen's Terrace, Tranquil Gardens Cemetery, Twilight Base Camp,
Twilight Grove, Twilight Outpost, Twilight Post, Twilight Shore,
Twilight Vale, Twilight's Run, Tyr's Hand, Uldaman, Uldum, Un'Goro
Crater, Undercity, Ursolan, Uther's Tomb, Valgan's Field, Valley of
Bones, Valley of Fangs, Valley of Heroes, Valley of Honor, Valley of
Kings, Valley of Spears, Valley of Spirits, Valley of Strength, Valley
of Trials, Valley of Wisdom, Valley of the Watchers, Valor's Rest,
Valormok, Valorwind Lake, Venomweb Vale, Venture Co. Base Camp, Venture
Co. Operations Center, Verdantis River, Vul'Gol Ogre Mound, Wailing
Caverns, Warrior's Terrace, Warsong Gulch, Warsong Labor Camp, Warsong
Lumber Camp, Waterspring Field, Wavestrider Beach, Weazel's Crater,
Webwinder Path, Wellspring Lake, Wellspring River, West Pillar,
Westbrook Garrison, Western Plaguelands, Western Pylon, Westfall,
Wetlands, Whelgar's Excavation Site, Whispering Shore, Whisperwind
Grove, Whitereach Post, Wildbend River, Windbreak Canyon, Windshear
Crag, Winterfall Village, Winterhoof Water Well, Winterspring,
Witherbark Caverns, Witherbark Village, Woodpaw Hills, Wyrmbog, Yojamba
Isle, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub, Zul'Mashar, Zun'watha.

Next: P4, the last 15 records, alphabetically from Western Strand through
Zuuldaia Ruins: Western Strand, Westfall Lighthouse, Whispering Gardens, Wild
Shore, Wildhammer Keep, Wildmane Water Well, Wildwind Lake, Windfury Ridge,
Windshear Mine, Witch Hill, Woodpaw Den, Xavian, Zalashji's Den, Ziata'jai Ruins
and Zuuldaia Ruins. No duplicate among them. Witch Hill was read in run 34 as
background for Swamplight Manor but has not had its own review. Recompute the
ranking anyway to confirm nothing new scores. After that batch P4 is finished and
P5 is the whole of what is left: the findings into `tools/era-audit.md`, and the
changelog lines for runs 35 onwards.

### 2026-11-23, release 1.2.20

Martin asked for dev to be merged to main and the next 1.2.x released. Release
1.2.20 carries P4 runs 35 and 36, which is 50 entry records reviewed and 49
corrected. One record held up unchanged, Western Pylon. Nothing was deleted, no
era tag changed and no faction changed. The vanilla corpus is 907 entries and the
Forever one is 76. Both version strings read 1.2.20.

`CHANGELOG.md` records the findings under the 1.2.20 heading in the same three
sections the last three releases used. Its lead names the thing that is new in
these two runs, which is entries that had invented an owner out of the place name
itself: Twilight Vale's cult and the Vul'Gol tribe. P5 must not write runs 35 or
36 again and now covers run 37 onwards, which is the last P4 batch. The other half
of P5, writing the findings into `tools/era-audit.md`, is still outstanding and was
not touched by this release.

Two notes-to-ourselves are deliberately not in the changelog, as in 1.2.19: the
tooling lesson that a creature can be in `creature_template` with no row in
`creature`, and the covered-list hyphen bug. Both are in the run 34 and 35 entries
above.

Release checks before preparing: default validation and all nine CI configurations
pass with zero errors and warnings, check-gaps reports 43 explained gaps, prose
lint is clean on the changelog, the CurseForge description and the README, and
`git diff --check` passes. `tools/build-zip.sh` produces
`ForAllTheNerds-1.2.20.zip` with the toc at `ForAllTheNerds/ForAllTheNerds.toc`,
declaring interface 16001 and 11509, both version strings reading 1.2.20,
`LICENSE` present, 26 entries packaged and no tooling, media or dotfiles in it.
The upload label override `-n ":{package-name}-{project-version}"` is still in
`.github/workflows/release.yml`, so the file lists as `ForAllTheNerds-1.2.20`
rather than a bare number. The preceding sweep commit 5f9593b passed CI for its
exact SHA before release preparation began.

### 2026-11-24, P4 run 37: Western Strand to Zuuldaia Ruins

Reviewed the last 15 records. Every one of them was revised and none held up
unchanged, which is the first batch in the whole of P4 with no clean record in
it. Coverage is 907 of 907 and **P4 is finished**. P5 is the whole of what is
left.

**The ranking was recomputed, as the header asked, and it is spent.** All 15
score zero on every marker: no `(Classic)` article, which is the strongest tell
in `tools/era-audit.md` and worth 3 on its own, no 4.0.3a patch note, no
`Classic only` tag, no Cataclysm or Shattering in the lead, no later-era
section and no post-vanilla patch template. That is the expected shape for the
tail, and it confirms nothing was left unreachable the way run 5 found 137
entries hiding at the bottom of the broken ranking.

**The worst error put a place at the wrong end of its zone.** Zuuldaia Ruins was
"on the southern coast, a short walk from Booty Bay's docks", sitting "at the
bottom of the vale" with naga offshore. It is at the opposite end of
Stranglethorn. The 1.12 client puts it at 21,14 on the northern part of the
western coast, and quest 582 says so in words: Nimboya at Grom'gol sends people
to the headhunters "at the ruins of Zuuldaia and Zul'Kunda, along the coast to
the north". Booty Bay is at 27,77. The ruin is held in strength by Bloodscalp
witch doctors, berserkers, headhunters, hunters, scouts and mystics, with
crocolisks in the water, and the reason a Darkspear walks that far up the coast
is that the chief's son is missing and the Bloodscalp are the tribe's enemies.
Nothing about the naga, the goblins declining to strip the stonework, or the
Blackwater Raiders survived.

**Two entries invented their subject matter from the name and nothing else.**
This is the error class run 36 named at Twilight Vale, and the tail had two more
of it.

Whispering Gardens was "an old Lordaeron graveyard", a formal burial ground for
Capital City's dead whose occupants had got up and walked off, watched by the
Forsaken, with older graves warded by the Church. None of that exists. The
Gardens are the rise on the south side of the Scarlet Monastery's entrance in
north-eastern Tirisfal, and the Scarlet Crusade holds them: scouts on the slope,
magicians and preservers behind, a Scarlet Watch Post on the ground. There is
not one grave object anywhere on the hill, no Forsaken, and nothing in 1.12 that
explains the name at all. The entry now says so rather than filling the gap,
which is the Staghelm Point rule from run 36 applied to an absence instead of a
dispute. The neighbouring Terrace of Repose entry already covers the ground just
north of the same gate, so the two were written to stay distinct: the Terrace
has the hedges, the fountain, the sentries and the cathedral and armoury doors.

Witch Hill had "the marsh's undead and its stranger inhabitants" concentrating
on it, in "the northern marsh", a site "isolated, unexplained and left alone by
both factions". There are no undead on Witch Hill. Within 300 yards of the
middle of it the client has bark rippers, venomspitters, raptors and crocolisks
and nothing dead at all, and the hill is north-west of Theramore on the
north-eastern side of the marsh, with Mirefin camps along the shore above it.
Far from being left alone, Swamplight Manor stands near its centre and both
Theramore and Brackenwall send people to it. The one thing the entry was right
about is that the name is unexplained, and that is now the only thing it claims
about the name.

**A lighthouse whose keeper is dead, described as though he were on duty.**
Westfall Lighthouse said the flame "still works and still matters" and that "its
keeper's situation is lonely and precarious". The keeper's family is dead and
the man tending the flame is a ghost. Captain Grayson says it himself in quests
103 and 104: his life ended on those rocks, the keeper's family was frightened
off the first time Old Murk-Eye brought the murlocs up the beach, they came back
and relit the flame, and the second raid killed them in front of him. With
nobody left to watch it the job fell to him, and his afterlife's business is
seeing that no other sailor goes the way he did. What he needs for the work is
five flasks of oil out of Westfall's harvest golems. Quest 152 supplies the
reason the flame matters at all, which the entry had reached for and guessed at:
the wrecks are already along this coast and the Great Sea is treacherous.
Children's Week confirms the obvious from the other direction, with an orphan
delighted at having met a real ghost.

**Ownership the 1.12 data does not support.** Windshear Mine was "a tin mine the
Horde took over after the goblins walked away from it", a working Horde mine and
a goblin leftover. The tin is right and the rest is not. The Venture Company has
not walked away: loggers, deforesters, operators and a named goblin, Piznik, are
at the mouth of it with wagons of explosives, and there is no Horde creature
within reach of the place. What is in the shafts is the Windshear kobolds, and
they are not the hired labour the entry implies either, since vermin, tunnel
rats, diggers and stonecutters work under geomancers and an overlord and the
tribe is named for the ground. The entry now says plainly that nothing in this
period gives the mine to the Horde, and the record's faction moved from `Horde`
to `Hostile` to match. The prose also called the Venture Company "the cartel",
which is a conflation this corpus avoids elsewhere: the Steamwheedle Cartel is a
different body, and Booty Bay's entry uses the name properly.

**A paragraph sourced to a 2018 novel.** Woodpaw Den explained the gnolls as
having been squeezed from two directions, the Gordunni having deforested their
old home and the Feral Scar yetis having come through it. The wiki carries that,
and its own footnote gives the source as *Traveler: The Spiral Path*, chapters 4
and 5, published in 2018. This is run 35's Irana'ethil case exactly, and it was
refused on the same ground: a fact being set in the past is not the same as its
being known in this period. Deleted rather than softened. What 1.12 has instead
is better anyway. Hadoken Swiftstrider at Camp Mojache wants five alphas dead
inside an hour, on the reasoning that losing their leaders at once would throw
the clan into chaos and stop it storming the camp, and he says in the same
breath that something has whipped the gnolls into this state and he wants to
know what. Our own Woodpaw Hills entry already carries the answer, which is the
silithid coming up at the Writhing Deep, so the den entry points at the question
and leaves the answer where it already lives.

**Four more records named the wrong place, occupant or relation.**

| Entry | Said | Actually, at 1.12 |
|---|---|---|
| Wildmane Water Well | The third well, in the western plains, on Mulgore's western side under the bluffs | North of Thunder Bluff, and quest 760 says it in words; it is the northernmost well and the last of the three to be cleansed |
| Wildwind Lake | Near Camp Mojache in central Feralas, with Grimtotem the complication at the camp | Eastern Feralas below the camp, whose tauren are Thrall's; the Grimtotem have their own compound further west |
| Windfury Ridge | Harpies have settled there, and harpies and tauren have no history to speak of | The clan's sorceresses and matriarchs; Ruul Eagletalon counts them among Mulgore's natural enemies and sends the young after them as a trial |
| Ziata'jai Ruins | Overgrown ruins, dated by the empire's collapse to older than anything human here | Empty of occupants, with a Skullsplitter trophy pile in it; the dating claim was unsourced and ran backwards |

Wildmane is the instructive one of the four, because the quest chain settles both
halves of the entry at once. Quest 760 places the well north of Thunder Bluff and
calls it the last of three, which makes the hook's "third" right and the
"western plains" wrong, and quests 748 and 756 name what fouled it: goblins. Six
Venture Co. workers and two supervisors are standing at the well itself, with the
Wildmane Water Pump and six Well Stones among them. The wiki gives the Grimtotem
as the culprits, tainting the water as payback for exile from Thunder Bluff, and
that is not the 1.12 story and stayed out. Mull Thunderhorn's own line about the
goblins, that they will never learn the difference between contending with the
land and living in harmony with it, does the work the entry's unsourced
paragraph about the Earthmother was reaching for.

Ziata'jai's dating claim is worth keeping a note on. It read that dating the
Gurubashi collapse to the war against Hakkar "puts these blocks well past the age
of anything human on this continent". Arathor is the older of the two by a wide
margin, so the inference runs the wrong way even if the date were sourced, and it
is not. Deleted. The ruin's actual content is that nothing lives in it: the
Skullsplitter camps are to the east and what the tribe keeps out in the ruin is a
trophy pile, one of the three that quest 585 sends somebody round, the others at
Balia'mah and Zul'Mamwe, because the Skullsplitter and the Bloodscalp are at war
with each other.

**Three entries this run's checking corrected outside the batch.** The method's
own weakness is that a claim travelling with a verified one rides free, so
these are worth listing.

- **Eastern Strand** said the Western Strand "at the other end of the same coast
  has the same trouble", meaning Daggerspine naga. It has murlocs. The Torn Fin
  tribe holds the western coast at x 24 to 48 and the Daggerspine the eastern at
  x 52 to 68, with Southshore between them, and quest 561 has Marshal Redpath
  moving his lieutenant from the murlocs to the naga precisely because they are
  two different problems. The rest of that entry, including Redpath's order to
  report in person, is correct and untouched.
- **Swamplight Manor**, from run 34, had Witch Hill with "something haunting it,
  which Jarl would like dealt with". The haunting is Zelfrax, who has no creature
  row anywhere in 1.12, and Jarl's three quests are a moonsteel broadsword, 20
  unpopped Darkmist eyes and 3 soothing spices. He never mentions a haunting. The
  line now carries the blade instead, which he wants without saying what he means
  to cut.
- **Wildwind Lake** contradicted our own Camp Mojache entry, which already had
  the Grimtotem in a compound west of the camp rather than in it. The lake entry
  was the one that was wrong.

**Where an entry lost something, 1.12 usually had better.**

- Western Strand had the town militia dealing with the murlocs "when it has
  anybody spare", with Tarren Mill seeing to it that this is rare. Neither half
  is sourced, and the real arrangement is funnier. Lieutenant Farren Orinelle was
  posted out from the Stormwind city guard, thinks the town looks like it should
  have been abandoned, cannot get the harbour out of his nose, and sends somebody
  else down the coast in his place. When Redpath asks for heads as proof he
  objects to handling them, and he has not eaten fish in weeks, which in a
  fishing town means he has not eaten much. Scargil is the rare on that beach.
- Wildhammer Keep carried the War of the Three Hammers in three sentences and got
  the consequence wrong: "the Wildhammers came north to this peak". They went to
  Grim Batol first, and the in-game History of Warcraft a 1.12 player can read
  spells out the whole sequence across pages 1917 to 1931. The Bronzebeards, with
  the largest standing army, banished the other two clans from under the
  mountain; Khardros took his people north through the gates of Dun Algaz and
  founded their kingdom inside Grim Batol; Modgud broke its gates and Khardros cut
  her down in his own halls; her death left a stain that made the fortress
  unlivable; Bronzebeard offered them a place inside Ironforge's borders and they
  refused; and only then did Khardros bring them to the Hinterlands, where they
  built on the slopes rather than carve a kingdom underneath and bonded with the
  gryphons. A keep standing on top of a peak is the shape that history left, and
  the entry now says so. The unsourced "three thousand years on" went with the rest.
- Xavian gains what is actually happening in it. Prince Raze and Geltharis are
  both there, which is what makes it the seat of satyr power rather than merely
  one of three camps; the temple ruins are in the north-east of the forest with a
  waterfall running through them; dryads came for the Branch of Cenarius after the
  satyrs took it and Anilia, who led them, is lying in the ruins pointing north
  and naming Geltharis; and the Warsong Oil objects scattered through the camp are
  an intercepted shipment, which quest 6571 explains, with the satyrs at all three
  holdings burning it in rituals and an orc at Splintertree Post trying to get it
  back.
- Wild Shore gains the fleet in detail, deckhands, sea dogs, swabbies and elder
  magi, and Jaguero Isle off its eastern end across a shallow strait. It loses
  Gorlash. The wiki has him wandering the Wild Shore; the 1.12 client has him
  stationary at 37,70, which is fourteen points north of the Bloodsail anchorage
  at 30 to 36, 90, in the Mistvale gorilla belt on the eastern side of the cape,
  and his quest says he wanders "the coast east of here" from Booty Bay rather
  than the southern shore. Wrong beach and he does not walk, so the sentence went.
- Zalashji's Den had naga established on the shore and a cartel that "keeps
  selling to the pirates". There is one naga. Zalashji is alone, carries no
  subtitle, has no script and no quest attached to him, and his model is the
  Daggerspine Marauder's, which is the only thing in the client that makes him a
  naga at all. The cartel's arrangement with the Southsea runs the other way:
  quest 8366 has the Steamwheedle paying them protection money regularly, the
  pirates lately disregarding what it buys, and Security Chief Bilgewhizzle unable
  to go and make the point himself because he has to stay in Gadgetzan to keep the
  peace.
- Windfury Ridge gains the split in the clan. Sorceresses and matriarchs, levels
  9 to 11, nest along the northern rim on the approaches to Thunder Bluff;
  ordinary harpies and wind witches, levels 7 to 9, are down in the middle of the
  zone and south-east of Bloodhoof Village. That reconciles Ruul Eagletalon's
  instruction to look south-east with the ridge sitting in the north: he points
  the young at the easier end of the same clan.

**Ledger and checks.** Added 12 rows, every one `vanilla`, every one asserted
absent before the append, and the block appended sorted at the end of the file,
so the ledger diff is 12 insertions and nothing else. No row was deleted and no
verdict changed. The deliberate break was the `Zalashji` row: removing it failed
the build with `Zalashji's Den uses "Zalashji"`, and the row was restored.

One of the 12 is worth recording on its own. `Security Chief Bilgewhizzle` had
never been checked by anything, because the only mentions of him in the corpus,
in Steamwheedle Port and Lost Rigger Cove, both open a sentence with his title.
A word capitalised only at sentence start is thrown out, so the whole term was
dropped and neither entry was ever gated on him. Writing him mid-sentence in
Zalashji's Den turned `Security` into a kept word corpus-wide and all three
entries failed at once. This is the fifth run running for the corpus-global
extractor rule, and the first time it has pointed the other way: the fix was to
file the row, which brought two untouched entries under the gate rather than
breaking them.

Three extractor artifacts were reworded rather than filed, all of them bare
second mentions: `Mull`, `Orinelle` and `Grayson`. No rate budget fired this
run; `', which'` sits at 0.8 per 1000 words against a budget of 6 in Kalimdor,
0.7 in Eastern Kingdoms and 1.1 in Locales. One RHYTHM finding did appear and
was fixed: two of my own sentences, the Ziata'jai "The Skullsplitter camps are
over to the east" and the Zuuldaia "The Bloodscalp are in the old stonework",
completed a run of three sentences opening "The " that the linter only sees
because it reads Lua as prose. Both were reworded, and `Data/Locales.lua` is
clean again.

Two readMore references were wrong and were caught by checking the titles
against the wiki API rather than by the validator, which only checks that a
reference produces a valid address. `Dangers of the Windfury (Classic)` and
`Down the Coast (Classic)` do not exist; the articles are at the bare titles,
and neither quest has a `(Classic)` page, so the bare title is the only one and
the wiki trap does not apply. Worth doing on every run that adds references.

`lua tools/validate.lua` passes, and so do the nine client configs in
`.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with its usual single
note. `python3 -I tools/check-gaps.py` passes with 43 explained gaps. `git diff
--check` passes. `tools/lint-prose.py` is clean on `Data/Locales.lua`,
`Data/Cities.lua`, `tools/era-terms.tsv` and `tools/places.tsv`, holds at 7 on
`Data/EasternKingdoms.lua`, holds at 1 on `Data/Dungeons.lua`, and drops from 3
to 2 on `Data/Kalimdor.lua`. Baselines were taken from a worktree at HEAD rather
than from the previous run's note. Two worklist notes in `tools/places.tsv`
carried corrected claims and were fixed: Zuuldaia's position relative to Booty
Bay and Zalashji's Den having naga in the plural. Comparing the prose dump
against that worktree: 983 records before and after, none added or removed, 17
changed, no era tag changed. The corpus stays at 907 vanilla entries and 76
Forever ones.

**Entries covered so far (905 place names). P4 is complete.**
Abyssal Sands, Addle's Stead, Aerie Peak, Agama'gor, Agamand Family
Crypt, Agamand Mills, Agmond's End, Agol'watha, Ahn'Qiraj, Alcaz Island,
Aldrassil, Alexston Farmstead, Algaz Station, Altar of Storms, Alterac
Mountains, Alterac Valley, Alther's Mill, Ambermill, Amberstill Ranch,
Ameth'Aran, Andorhal, Angerfang Encampment, Angor Fortress, Anvilmar,
Apocryphan's Rest, Arathi Basin, Arathi Highlands, Ariden's Camp,
Ashenvale, Astranaar, Auberdine, Azshara, Azurelode Mine, Badlands, Bael
Modan, Bael'dun Digsite, Bael'dun Keep, Bal'lal Ruins, Balia'mah Ruins,
Balnir Farmstead, Ban'ethil Barrow Den, Ban'ethil Hollow, Ban'Thallow
Barrow Den, Baradin Bay, Bashal'Aran, Bathran's Haunt, Battle Ring, Bay
of Storms, Bear's Head, Beezil's Wreck, Beggar's Haunt, Beren's Peril,
Bitter Reaches, Black Channel Marsh, Blackchar Cave, Blackfathom Deeps,
Blackrock Depths, Blackrock Mountain, Blackrock Pass, Blackrock Spire,
Blackrock Stronghold, Blackthorn Ridge, Blackwater Cove, Blackwing Lair,
Blackwolf River, Blackwood Den, Blackwood Lake, Bladefist Bay, Blasted
Lands, Bloodfen Burrow, Bloodhoof Village, Bloodsail Compound,
Bloodtooth Camp, Bloodvenom Falls, Bloodvenom Post, Bloodvenom River,
Bluefen, Bluegill Marsh, Bogen's Ledge, Bolgan's Hole, Bones of
Grakkarond, Booty Bay, Bough Shadow, Boulder Lode Mine, Boulder'gor,
Boulderfist Hall, Boulderslide Cavern, Boulderslide Ravine, Brackenwall
Village, Brackwell Pumpkin Patch, Brambleblade Ravine, Bramblescar,
Brewnall Village, Brightwater Lake, Brightwood Grove, Brill, Brill Town
Hall, Broken Pillar, Bronzebeard Encampment, Browman Mill, Burning Blade
Coven, Burning Steppes, Caer Darrow, Camp Aparaje, Camp Boff, Camp Cagg,
Camp E'thok, Camp Kosh, Camp Mojache, Camp Narache, Camp Taurajo, Camp
Wurg, Cathedral Square, Cenarion Enclave, Cenarion Hold, Champions'
Hall, Chill Breeze Valley, Chillwind Camp, Chillwind Point, Circle of
East Binding, Circle of Inner Binding, Circle of Outer Binding, Circle
of West Binding, Cleft of Shadow, Cliffspring Falls, Cliffspring River,
Cold Hearth Manor, Coldridge Pass, Coldridge Valley, Corin's Crossing,
Corrahn's Dagger, Craftsmen's Terrace, Cragpool Lake, Crown Guard Tower,
Crusader Outpost, Crusader's Outpost, Crushridge Hold, Crystal Lake,
Crystalvein Mine, Dabyrie's Farmstead, Dalaran Crater, Dalson's Tears,
Dandred's Fold, Darkcloud Pinnacle, Darkmist Cavern, Darkshire,
Darkshore, Darkspear Strand, Darkwhisper Gorge, Darnassus, Darrow Hill,
Darrowmere Lake, Darrowshire, Dawning Wood Catacombs, Deadeye Shore,
Deadman's Crossing, Deadwind Pass, Deadwind Ravine, Deadwood Village,
Deathknell, Deep Elem Mine, Deeprun Tram, Deepwater Tavern, Demon Fall
Canyon, Demon Fall Ridge, Demont's Place, Desolace, Diamondhead River,
Dire Maul, Direforge Hill, Dolanaar, Draco'dar, Draenil'dur Village,
Dragonmaw Gates, Dreadmaul Hold, Dreadmaul Post, Dreadmaul Rock,
Dreadmist Den, Dreadmist Peak, Dreadmurk Shore, Dream Bough, Drygulch
Ravine, Drywhisker Gorge, Dun Algaz, Dun Garok, Dun Mandarr, Dun Modr,
Dun Morogh, Dunemaul Compound, Durnholde Keep, Durotar, Duskwood,
Dustbelch Grotto, Dustfire Valley, Dustwallow Bay, Dustwallow Marsh,
Dustwind Cave, Dustwind Gulch, Dwarven District, East Pillar, Eastern
Plaguelands, Eastern Pylon, Eastern Strand, Eastmoon Ruins, Eastvale
Logging Camp, Eastwall Tower, Echo Isles, Echo Ridge Mine, Elder Rise,
Elwynn Forest, Emberstrife's Den, Emerald Sanctuary, Ethel Rethor,
Everlook, Faldir's Cove, Falfarren River, Fallen Sky Lake, Fallow
Sanctuary, Faol's Rest, Far Watch Post, Fargodeep Mine, Featherbeard's
Hovel, Feathermoon Stronghold, Fel Rock, Felfire Hill, Felpaw Village,
Felstone Field, Felwood, Fenris Isle, Fenris Keep, Feral Scar Vale,
Feralas, Field of Giants, Fire Plume Ridge, Fire Scar Shrine, Firewatch
Ridge, Flame Crest, Foothold Citadel, Forest Song, Forest's Edge,
Forlorn Ridge, Forlorn Rowe, Fray Island, Frayfeather Highlands,
Freewind Post, Frostfire Hot Springs, Frostmane Hold, Frostsaber Rock,
Frostwhisper Gorge, Fungal Rock, Furlbrow's Pumpkin Farm, Gadgetzan,
Gahrron's Withering, Galak Hold, Galardell Valley, Gallows' Corner,
Gallows' End Tavern, Garren's Haunt, Garrison Armory, Gates of
Ahn'Qiraj, Gates of Ironforge, Gates of Uldum, Gavin's Naze, Gelkis
Village, Ghost Walker Post, Gnarlpine Hold, Gnomeregan, Go'Shek Farm,
Gol'Bolar Quarry, Golakka Hot Springs, Gold Coast Quarry, Gold Road,
Goldshire, Gordunni Outpost, Greatwood Vale, Greenpaw Village, Grim
Batol, Grimesilt Dig Site, Grimtotem Compound, Grimtotem Post,
Grizzlepaw Ridge, Grol'dom Farm, Grom'gol Base Camp, Grommash Hold,
Grosh'gok Compound, Grove of the Ancients, Growless Cave, Gunstan's
Post, Gunther's Retreat, Gurubashi Arena, Haldarr Encampment, Hall of
Explorers, Hall of Legends, Hammerfall, Hammertoe's Digsite, Hearthglen,
Helm's Bed Lake, Heroes' Vigil, Hetaera's Clutch, Hidden Path, High
Rise, High Wilderness, Highperch, Hillsbrad, Hillsbrad Fields, Hillsbrad
Foothills, Hiri'watha, Hive'Ashi, Hive'Regal, Hive'Zora, Honor's Stand,
Hunter Rise, Ice Thistle Hills, Iceflow Lake, Idlewind Lake, Iris Lake,
Ironband's Compound, Ironband's Excavation Site, Ironbeard's Tomb,
Ironforge, Ironstone Camp, Ironstone Plateau, Irontree Cavern, Irontree
Woods, Isle of Dread, Itharius's Cave, Jadefire Glen, Jadefire Run,
Jademir Lake, Jaedenar, Jagged Reef, Jaggedswine Farm, Jaguero Isle,
Janeiro's Point, Jangolode Mine, Jasperlode Mine, Jerod's Landing,
Jintha'Alor, Kal'ai Ruins, Karazhan, Kargath, Kargathia Keep, Kharanos,
Kodo Graveyard, Kodo Rock, Kolkar Crag, Kolkar Village, Kormek's Hut,
Kurzen's Compound, Lake Al'Ameth, Lake Elune'ara, Lake Everstill, Lake
Falathim, Lake Kel'Theril, Lake Mennar, Lake Mereldar, Lake Nazferiti,
Lakeridge Highway, Lakeshire, Lakkari Tar Pits, Land's End Beach, Lariss
Pavilion, Legash Encampment, Lethlor Ravine, Light's Hope Chapel,
Lighthouse, Lion's Pride Inn, Loch Modan, Longshore, Lordamere
Internment Camp, Lordamere Lake, Lost Point, Lost Rigger Cove, Lower
Wilds, Lushwater Oasis, Maestra's Post, Magram Village, Malaka'jin,
Malden's Orchard, Mannoroc Coven, Manor Mistmantle, Maraudon,
Mardenholde Keep, Marshal's Refuge, Mazra'Alor, Mazthoril, Menethil Bay,
Menethil Harbor, Menethil Keep, Military Ward, Mirage Flats, Mirage
Raceway, Mirkfallon Lake, Mirror Lake, Mirror Lake Orchard, Mist's Edge,
Mistvale Valley, Misty Pine Refuge, Misty Reed Post, Misty Reed Strand,
Misty Shore, Misty Valley, Mizjah Ruins, Mo'grosh Stronghold, Molten
Core, Moon Horror Den, Moonbrook, Moonglade, Moonwell, Mor'shan Base
Camp, Mor'shan Rampart, Morgan's Plot, Morgan's Vigil, Morlos'Aran,
Mosh'Ogg Ogre Mound, Mosshide Fen, Mulgore, Mystic Ward, Mystral Lake,
Naxxramas, Nek'mani Wellspring, Nesingwary's Expedition, Nethander
Stead, Nethergarde Keep, Night Run, Night Web's Hollow, Nighthaven,
Nightmare Vale, Nightsong Woods, Nijel's Point, Noonshade Ruins, North
Gate Outpost, North Gate Pass, North Point Tower, North Tide's Hollow,
North Tide's Run, Northdale, Northern Pylon, Northfold Manor, Northpass
Tower, Northridge Lumber Camp, Northshire Abbey, Northshire River,
Northshire Valley, Northshire Vineyards, Northwatch Hold, O'Breen's
Camp, Old Town, Olsen's Farthing, Oneiros, Onyxia's Lair, Oracle Glade,
Orgrimmar, Ortell's Hideout, Owl Wing Thicket, Palemane Rock, Pestilent
Scar, Plaguemist Ravine, Plaguewood, Pool of Tears, Pools of Arlithrien,
Pools of Vision, Purgation Isle, Pyrewood Village, Quel'Danil Lodge,
Quel'Lithien Lodge, Rage Scar Hold, Ragefire Chasm, Ranazjar Isle,
Raptor Grounds, Raptor Ridge, Ratchet, Ravaged Caravan, Ravaged Twilight
Camp, Raven Hill, Raven Hill Cemetery, Ravencrest Monument, Ravenholdt
Manor, Raynewood Retreat, Razor Hill, Razor Hill Barracks, Razorfen
Downs, Razorfen Kraul, Razormane Grounds, Razorwind Canyon, Rebel Camp,
Red Cloud Mesa, Red Rocks, Redridge Canyons, Redridge Mountains, Refuge
Pointe, Remtravel's Excavation, Render's Camp, Render's Rock, Render's
Valley, Rethban Caverns, Rethress Sanctum, Revantusk Village, Ridgepoint
Tower, Rise of the Defiler, Rocktusk Farm, Roguefeather Den, Roland's
Doom, Ruins of Aboraz, Ruins of Ahn'Qiraj, Ruins of Alterac, Ruins of
Andorhal, Ruins of Constellas, Ruins of Eldarath, Ruins of Isildien,
Ruins of Jubuwal, Ruins of Lordaeron, Ruins of Mathystra, Ruins of
Ordil'Aran, Ruins of Ravenwind, Ruins of Solarsal, Ruins of Thaurissan,
Ruins of Zul'Kunda, Ruins of Zul'Mamwe, Rut'theran Village, Saldean's
Farm, Saltspray Glen, Sandsorrow Watch, Sar'theris Strand, Sardor Isle,
Sargeron, Satyrnaar, Scalebeard's Cave, Scarlet Monastery, Scarlet Watch
Post, Scholomance, Scrabblescrew's Camp, Scuttle Coast, Searing Gorge,
Sen'jin Village, Sentinel Hill, Sentry Point, Seradane, Serpent's Coil,
Shadow Grave, Shadow Hold, Shadowbreak Ravine, Shadowfang Keep,
Shadowglen, Shadowprey Village, Shadowsong Shrine, Shadowthread Cave,
Shadra'Alor, Shady Rest Inn, Shalzaru's Lair, Shaol'watha, Shatter Scar
Vale, Shimmer Ridge, Shindigger's Camp, Shok'Thokar, Shrine of Remulos,
Shrine of the Deceiver, Shrine of the Dormant Flame, Shrine of the
Fallen Warrior, Silithus, Silver Stream Mine, Silverpine Forest,
Silverwind Refuge, Silverwing Grove, Silverwing Outpost, Sishir Canyon,
Skulk Rock, Skull Rock, Slaughter Hollow, Sleeping Gorge, Slither Rock,
Sofera's Naze, Solliden Farmstead, Sorrow Hill, Sorrowmurk, South Gate
Outpost, South Gate Pass, South Tide's Run, Southbreak Shore, Southern
Barrens, Southern Gold Road, Southern Savage Coast, Southfury River,
Southmoon Ruins, Southpoint Tower, Southridge Beach, Southshore,
Southwind Village, Spirit Den, Spirit Rise, Spirit Rock, Splinterspear
Junction, Splintertree Post, Splithoof Crag, Splithoof Hold, Stagalbog,
Stagalbog Cave, Staghelm Point, Starbreeze Village, Starfall Village,
Steamwheedle Port, Steelgrill's Depot, Stendel's Pond, Stillwater Pond,
Stonard, Stone Cairn Lake, Stonebull Lake, Stonemaul Ruins,
Stonesplinter Valley, Stonetalon Mountains, Stonetalon Peak, Stonewatch,
Stonewatch Falls, Stonewatch Keep, Stonewatch Tower, Stonewrought Dam,
Stonewrought Pass, Stormrage Barrow Dens, Stormwind City, Stormwind
Gates, Stormwind Keep, Stoutlager Inn, Strahnbrad, Stranglethorn Vale,
Stratholme, Stromgarde Keep, Sun Rock Retreat, Sundown Marsh, Swamp of
Sorrows, Swamplight Manor, Tahonda Ruins, Talonbranch Glade, Talrendis
Point, Tanaris, Tanner Camp, Tarren Mill, Teldrassil, Temple of
Ahn'Qiraj, Temple of Arkkoran, Temple of the Moon, Temple of Zin-Malor,
Terrace of Repose, Terror Run, Terror Wing Path, Terrordale, Terrorweb
Tunnel, Tethris Aran, Thalanaar, Thalassian Base Camp, Thandol Span, The
Altar of Zul, The Apothecarium, The Barrens, The Bulwark, The Canals,
The Cape of Stranglethorn, The Cauldron, The Charred Vale, The Cleft,
The Commons, The Creeping Ruin, The Crimson Veil, The Crossroads, The
Crystal Shore, The Crystal Vale, The Dagger Hills, The Damsel's Luck,
The Dark Portal, The Darkened Bank, The Dawning Isles, The Dead Acre,
The Dead Field, The Deadmines, The Decrepit Ferry, The Den, The Den of
Flame, The Dor'Danil Barrow Den, The Drag, The Dragonmurk, The Dream
Bough, The Drowned Reef, The Dry Hills, The Dust Plains, The Dustbowl,
The Farstrider Lodge, The Foothill Caverns, The Forgotten Coast, The
Forgotten Pools, The Fungal Vale, The Gaping Chasm, The Golden Plains,
The Great Forge, The Great Lift, The Green Belt, The Greymane Wall, The
Grizzled Den, The Harborage, The Headland, The Hidden Grove, The High
Seat, The High Wilderness, The Hinterlands, The Howling Vale, The Hushed
Bank, The Infectis Scar, The Ivar Patch, The Jansen Stead, The Loch, The
Long Wash, The Lost Fleet, The Maclure Vineyards, The Mage Quarter, The
Magic Quarter, The Maker's Terrace, The Marris Stead, The Marshlands,
The Master's Cellar, The Master's Glaive, The Maul, The Merchant Coast,
The Molsen Farm, The Mor'shan Rampart, The North Coast, The Noxious
Glade, The Noxious Lair, The Oracle Glade, The Overlook Cliffs, The
Park, The Pillar of Ash, The Pools of Vision, The Quagmire, The Red
Reaches, The Riptide, The Rogues' Quarter, The Rolling Plains, The
Rotting Orchard, The Royal Quarter, The Ruined Reaches, The Ruins of
Kel'Theril, The Ruins of Ordil'Aran, The Ruins of Stardust, The Rustmaul
Dig Site, The Sanctum, The Savage Coast, The Scarab Dais, The Scarab
Wall, The Screeching Canyon, The Sea of Cinders, The Sepulcher, The
Shady Nook, The Shattered Strand, The Shifting Mire, The Shimmering
Flats, The Shining Strand, The Shrine of Aessina, The Skittering Dark,
The Slag Pit, The Slithering Scar, The Sludge Fen, The Stagnant Oasis,
The Stockade, The Stockpile, The Stonefield Farm, The Swarming Pillar,
The Tainted Scar, The Talon Den, The Talondeep Path, The Temple Gardens,
The Temple of Atal'Hakkar, The Tidus Stair, The Tower of Arathor, The
Trade Quarter, The Tundrid Hills, The Twin Colossals, The Undercroft,
The Uplands, The Venture Co. Mine, The Vice, The Vile Reef, The War
Quarter, The Weathered Nook, The Weeping Cave, The Writhing Deep, The
Writhing Haunt, The Yorgen Farmstead, The Zoram Strand, Thelgen Rock,
Thelsamar, Theramore Isle, Thieves Camp, Thistlefur Village,
Thistleshrub Valley, Thondroril River, Thoradin's Wall, Thorium Point,
Thorn Hill, Thousand Needles, Three Corners, Thunder Axe Fortress,
Thunder Bluff, Thunder Falls, Thunder Ridge, Thunderbrew Distillery,
Thunderhorn Water Well, Tidefury Cove, Timbermaw Hold, Timbermaw Post,
Tinker Town, Tiragarde Keep, Tirisfal Glades, Tkashi Ruins, Tor'kren
Farm, Tower of Althalaxx, Tower of Azora, Tower of Eldara, Tower of
Ilgalar, Trade District, Tradesmen's Terrace, Tranquil Gardens Cemetery,
Twilight Base Camp, Twilight Grove, Twilight Outpost, Twilight Post,
Twilight Shore, Twilight Vale, Twilight's Run, Tyr's Hand, Uldaman,
Uldum, Un'Goro Crater, Undercity, Ursolan, Uther's Tomb, Valgan's Field,
Valley of Bones, Valley of Fangs, Valley of Heroes, Valley of Honor,
Valley of Kings, Valley of Spears, Valley of Spirits, Valley of
Strength, Valley of the Watchers, Valley of Trials, Valley of Wisdom,
Valor's Rest, Valormok, Valorwind Lake, Venomweb Vale, Venture Co. Base
Camp, Venture Co. Operations Center, Verdantis River, Vul'Gol Ogre
Mound, Wailing Caverns, Warrior's Terrace, Warsong Gulch, Warsong Labor
Camp, Warsong Lumber Camp, Waterspring Field, Wavestrider Beach,
Weazel's Crater, Webwinder Path, Wellspring Lake, Wellspring River, West
Pillar, Westbrook Garrison, Western Plaguelands, Western Pylon, Western
Strand, Westfall, Westfall Lighthouse, Wetlands, Whelgar's Excavation
Site, Whispering Gardens, Whispering Shore, Whisperwind Grove,
Whitereach Post, Wild Shore, Wildbend River, Wildhammer Keep, Wildmane
Water Well, Wildwind Lake, Windbreak Canyon, Windfury Ridge, Windshear
Crag, Windshear Mine, Winterfall Village, Winterhoof Water Well,
Winterspring, Witch Hill, Witherbark Caverns, Witherbark Village,
Woodpaw Den, Woodpaw Hills, Wyrmbog, Xavian, Yojamba Isle, Zalashji's
Den, Ziata'jai Ruins, Zoram'gar Outpost, Zul'Farrak, Zul'Gurub,
Zul'Mashar, Zun'watha, Zuuldaia Ruins.

Next: P5, and nothing else. P0 to P4 are all done, and run 37 shipped in 1.2.21
along with its changelog lines, so the only half of P5 left is the findings into
`tools/era-audit.md`, which has not been touched since the original four errors.
Do not tag and do not publish: releases are Martin's call. When P5 is done, write
"SWEEP COMPLETE" as the first line of this file, commit, and say plainly that the
loop can be stopped.

### 2026-11-24, release 1.2.21

Martin asked for the addon's own dev tooling and data collection to come out,
and for dev to be merged to main and released as the next 1.2.x. Both halves are
in this release, so it carries more than a sweep batch does.

**What came out of the addon.** Three commands and the recording behind them:
`/ftn gaps` and its `logUnknown` list of unwritten place names, `/ftn npcs` and
its `logNPCs` roster of targeted NPCs with creature ids, and `/ftn areas` with
its `areaScan` result. Gone with them: the two settings checkboxes, the
`ns.has.unitIsPlayer`, `identityProbe` and `areaInfo` capability probes, the
`PLAYER_TARGET_CHANGED` and `UPDATE_MOUSEOVER_UNIT` frame in `Detect.lua` with
`rosterNameOf` and `creatureIdFrom`, and the `RecordUnknown`, `UnknownList`,
`RecordNPC`, `NPCList`, `ScanAreas` and `AreaGaps` functions in `Core.lua`.
Two of the recorders were on by default, which is the part that justified
removing rather than defaulting them off.

`ns.PruneCollected` is new and takes the five keys out of an existing player's
saved variables on load. The collected data is deleted rather than merely
orphaned. Settings, discoveries and stats are left alone. Three new
checks in the validator cover it, under a new `Retired lists` section: that an
old file loses all five keys and keeps everything else, that `ns.defaults`
carries none of them so a new file cannot start collecting again, and that none
of the six functions is still on the namespace. All three were broken
deliberately and confirmed to fail, by dropping `npcs` from the prune list, by
putting `logNPCs` back in the defaults, and by restoring an `ns.RecordNPC` stub.
A fourth check asserts the eight retired command spellings degrade to a place
lookup instead of erroring, for anyone with one in a macro.

**What this means for the sweep's own method, which matters more here than the
release does.** Two of the three worklists this sweep has been working from were
built by those commands. `tools/places.tsv` came out of `/ftn gaps`,
`tools/characters.tsv` and `tools/creature-ids.tsv` out of `/ftn npcs`, and
`tools/area-gaps.tsv` and `tools/coverage.md` were cross-checked against
`/ftn areas`. All three files stay and all of them are complete enough for P5.
What is no longer available is regenerating them from inside the game. The notes
that described those routes as live instructions now say so at the top:
`tools/npc-ids.md`, `tools/area-sweep.md` and the regeneration recipe in
`tools/coverage.md`. The AreaTable and wago.tools routes are untouched, so the
area sweep can still be repeated; the cross-check against the addon's own live
resolver cannot.

**The CI matrix went from nine configurations to six.** `FTN_NO_SECRET_PROBE=1`,
`FTN_NO_UNITISPLAYER=1` and `FTN_NO_AREAINFO=1` each existed to prove the roster
or the area scan coped on a client missing the API it needed. Nothing in the
addon reads those APIs now. All three would have reported green while exercising
nothing, and that is worse than not running them. The dead `os.getenv`
gates came out of `tools/mock_wow.lua` with them, though the stubs themselves
stay, since they model the client rather than the addon. `issecretvalue` is
untouched and still used by `Detect.lua`.

Two helpers in `Util.lua`, `U.CallBool` and `U.SafeBool`, are left in place
although the roster was their only caller. They are generic secret-value guards
rather than collection code, the validator exercises them directly, and taking
them out would have been a second change riding along with this one.

**Release contents.** P4 run 37, the last fifteen records, plus the removal
above. `CHANGELOG.md` records both under the 1.2.21 heading in **Removed**,
**Fixed** and **Changed**, and the removal leads, because it is the half a
player would notice. The `', which'` budget fired on the new section at 9.3 per
1000 words against a budget of 6, and five clauses were rewritten to bring it
under rather than raising it. With run 37's lines written, the changelog half of
P5 is finished for every run, and **P5 is now `tools/era-audit.md` alone**.

Release checks before preparing: default validation and all six remaining CI
configurations pass with zero errors and warnings, the retail and verbose
switches pass too, check-gaps reports 43 explained gaps, prose lint is clean on
the changelog, the CurseForge description and the README, and `git diff --check`
passes. The preceding sweep commit 2018343 passed CI for its exact SHA before
release preparation began.

### 2026-11-25, P5: the write-up, and the end of the sweep

`tools/era-audit.md` goes from 90 lines about four errors to 250 about the whole
sweep. P0 through P5 are done and the first line of this file now says so.

**The numbers in it were measured, not tallied.** Adding up thirty-seven runs'
own claims would have compounded every bookkeeping slip the log already records
two of, so the corpus arithmetic came from dumping the prose at the 1.2.5 tag,
the last release before the sweep began, dumping it again at HEAD, and pairing
the records: 994 records before and 983 after, 921 vanilla and 907, 73 Forever
and 76. Of the 906 vanilla records present at both ends, 692 changed and 214
were left exactly as they were. Eleven records left the vanilla corpus, five
deleted as places that do not exist in this period, The Sludgewerks, Whisperwind
Grove, The Red Reaches, Thieves Camp and Witherbark Caverns, and six resolved as
duplicates in favour of the client's own spelling. Three moved from vanilla to
Forever: Galak Camp, Legashi Stronghold and Skywatcher Plateau. One name was
added, O'Breen's Camp: the same place as the old O'Breen's Encampment, under
the name the client uses.

That 214 is the figure worth keeping. It is the quarter of the corpus the sweep
read and found no fault in, and without it the other number means nothing.

**Nine classes of error, ranked by how much trouble each caused.** The later
state described as the present, which is what the original audit was written
for, is only the first and not the commonest. The wrong occupants is the
commonest. Then the wrong place, invention, a proper noun inferred from a common
word in the place name, a claim asserted where the source says nobody knows,
lore published long after the period about events inside it, our own entries
contradicting each other, and the sweep's own corrections wrong in turn. Each
carries two or three worked examples out of the log.

**The three ways in that the first pass had not seen** are written up alongside
the original retail-article diagnosis, which held across all 907 entries: an
infobox leader filed under a tribe's best-known holding rather than where the
client puts him, the worklist keeping a deleted place alive and eligible to be
written up again, and absence from the spawn table read as absence from the
game, the Magus Rimtori lesson from run 34.

**The section worth reading twice is "What no gate can catch".** Classes 2
through 9 all pass the ledger cleanly, because each is built entirely out of
words that are vanilla. Twilight Vale's invented cult used `Twilight's Hammer`,
a correct row in the ledger, in a zone where no cult stands. The audit says so
plainly rather than leaving the gates looking more capable than they are, and it
records the two extractor limits with it. A term capitalised only at the start
of a sentence is never checked at all, and that hid `Security Chief
Bilgewhizzle` in two entries until a third wrote him mid-sentence. The same rule
in reverse means a more specific term in one entry can fail entries nobody
touched, as happened in five consecutive runs.

**Two stale instructions fixed while here.** The "Before every commit" section
said nine client configs; 1.2.21 dropped three and it is six. The old header
said `tools/era-audit.md` "records the six errors already found", which stopped
being what that file is.

**No new checks, so nothing to break deliberately.** This item is documentation
only: no entry prose, no ledger row, no code and no validator section changed.
The prose dump is 983 records before and after, none added, removed or changed,
and no era tag changed. Worth knowing for whoever compares dumps next:
`tools/dump-prose.lua` does not emit its records in a stable order, because it
walks a Lua table, so two dumps of an identical corpus differ line by line and
`diff` reports a change that is not there. Compare them keyed on the entry name,
or sort both first. `lua tools/validate.lua` passes, and so do the six
client configs in `.github/workflows/ci.yml`, the `FTN_NO_TEMPLATES=1` one with
its usual single note. `python3 -I tools/check-gaps.py` passes with 43 explained
gaps. `git diff --check` passes. `tools/lint-prose.py` is clean on
`tools/era-audit.md` and on this file. Nothing was tagged and nothing published:
P5's brief says releases are Martin's call, and 1.2.21 already carries run 37.

The sweep is over. Nothing is scheduled, nothing is pending, and the next person
to touch an entry should read `tools/era-audit.md` and not this log.

### 2026-11-26, audit P1: does the client have this name at all?

The first run of `tools/audit-prompt.md`. P1 is now mechanised as
`tools/check-names.py`, which takes both AreaTables and is not in CI, because it
needs a download.

**What it found: seven duplicate pairs the sweep never looked for.** In each
case we carry two entries for one place, one under the name the client reports
and one under a name it does not. The client-named entry answers when the player
stands there; the other is reachable only by looking it up.

| Our name, which the client does not use | What the client reports, and the entry that answers |
|---|---|
| Andorhal | Ruins of Andorhal, area 193 |
| Crusader's Outpost | Crusader Outpost, area 167 |
| Mor'shan Rampart | The Mor'shan Rampart, area 1703 |
| Oracle Glade | The Oracle Glade, area 264 |
| Ruins of Ordil'Aran | The Ruins of Ordil'Aran, area 412 |
| The Dream Bough | Dream Bough, area 1111 |
| The High Wilderness | High Wilderness, area 1136 |

Five of the seven differ by a leading "The" and one by an apostrophe. `U.Key`
lowercases and normalises whitespace and quote characters and does nothing else.
To the resolver none of those is a near miss.

The sweep found and resolved six duplicate pairs over 37 runs and missed all
seven of these, because its question was always "is this entry's prose true".
Nothing in it ever asked whether a second entry already covered the same ground
under a different name.

**Two leads that are not duplicates.** `Shok'Thokar` in Desolace has no
AreaTable row in either client and appears nowhere in 1.12 game text; the entry
was reviewed by the sweep, so the prose may be sound while the name is not
something the client will ever report. `Nordrassil` is tagged `forever` and has
no area in Forever's own AreaTable either, although the wiki's Mount Hyjal
article lists it as a subregion. Both need their own verification.

**How wrong the probe was before it was right. This is the part worth keeping.**
It reported 64 names on its first pass. Then 26, once instances and city
interiors were excluded. Then 15, once Forever entries were matched against
Forever's AreaTable instead of our 68-row new-zone worklist, a mistake that had
been reporting twelve places as missing when none of them was. Then 9, once
the places named in quest text but carrying no area row were listed with the
quest that names each. Reporting the 64 would have buried the finding in noise
of my own making.

And the interpretation was wrong twice after that. The raw list looked like
entries that could never fire. Reading `U.Key` suggested they were dead. Feeding
the client's own strings through `ns.FindSubIn` showed all seven resolving
perfectly well, to a different entry. Only the real resolver settled it. The script now tells its next reader to do
that before writing anything up.

Two smaller things found on the way. `wow_classic_era`'s AreaTable carries no
city district or quarter rows at all, and Stormwind City has exactly one child
area, the Valley of Heroes. That puts 43 of our city entries beyond this test,
and whether `GetSubZoneText` ever returns their names is a separate question for
the game. Separately, `mock_wow` replaces the global `print` with WoW's chat
version, so a probe script that prints its results writes an empty file and
exits 0. Use `io.write`, as `tools/dump-prose.lua` does.

**Nothing was fixed this run and that is deliberate.** Resolving seven duplicate
pairs means seven decisions about which entry survives and what the other has
that is worth keeping, and the gate that would stop an eighth appearing has to
land with them, because a gate added before the merges fails the build on all
seven. That is the next chunk, and it is a chunk rather than a note: run 32
recorded a structural problem and left it, and a player found it eleven releases
later.

Next: merge the seven pairs, keeping the client's name in each case and the
other as an alias, then gate the shape. After that, verify Shok'Thokar and
Nordrassil. Then P5, which is the readMore probe and the cheapest of the rest.

### 2026-11-26, audit P1 part two: the merges, and a gate that found an eighth pair

Seven pairs merged, one pair found not to be a pair at all, and an eighth found
by the gate that P1 could not have reached.

**The six article-and-spelling merges.** In each case the entry carrying the
client's own name survives, takes anything the other had that was worth keeping,
and holds the dropped name as an alias so that looking it up still works.

| Survives | Deleted | What the deleted entry gave it |
|---|---|---|
| Ruins of Andorhal | Andorhal | the plague cauldrons answering to Araj, and the Scarlet patrols coming down from Hearthglen |
| The Mor'shan Rampart | Mor'shan Rampart | nothing it did not already have |
| The Oracle Glade | Oracle Glade | the tree reporting by shedding bark to Fandral Staghelm, the runner killed carrying one, and the dragons' refused blessing |
| The Ruins of Ordil'Aran | Ruins of Ordil'Aran | Delgren the Purifier, and the warlocks' story of two lovers who fell in the War of the Ancients |
| Dream Bough | The Dream Bough | all of it. The surviving entry was two sentences and the deleted one had the four Dream gates, Lethlas and the boughguards |
| High Wilderness | The High Wilderness | the Gordunni holding the ruined night elf ground, Old Grizzlegut and Antilus the Soarer |

Two of those are worth noting as a pattern: at the Oracle Glade and the Dream
Bough the better write-up was the one with the wrong name. A merge that simply
deleted the odd-named entry would have thrown away the best material in both.

**One pair was not a pair, and nearly got merged anyway.** `Crusader Outpost`
and `Crusader's Outpost` are two real Scarlet Crusade scout towers at opposite
ends of Tirisfal. The wiki carries both and distinguishes them explicitly. The
first is Captain Vachon's, in the east at 80,56, watching the glades road and
flanking the Scarlet Monastery, and it has AreaTable row 167. The second sits
inside the Scarlet Palisade in the west by the Solliden Farmstead, is the
Crusade's westernmost holding in Lordaeron, and has no area row at all. Both our
entries were right. Both now carry a comment saying they are not each other, and
the apostrophe form is in `check-names.py`'s allowed list with its source.

This is the probe's own discipline earning its place. The list said duplicate;
the sources said otherwise.

**The gate, and the eighth pair.** `tools/validate.lua` now fails when two
entries under one parent collide after a harder normalisation than `U.Key`
does: drop a leading article and every non-alphanumeric character. It is
deliberately narrower than it could be, because stripping an apostrophe-s would
fire on the two Crusader towers, which are a real pair of places.

It failed on first run, naming `Pools of Vision` and `The Pools of Vision`.
**P1 could not have found that one**, because the Pools are inside Thunder Bluff
and P1 excludes city interiors: `wow_classic_era` has no AreaTable row for any
of them, so the test has nothing to match against. The gate does not care about
the AreaTable, which is exactly why it reaches where P1 cannot. Two checks of
the same family, with different blind spots, and it took both to clear the
corpus.

Resolving that eighth pair needed a different tiebreak, since the client names
neither form. The wiki's article is at `Pools of Vision` with `The Pools of
Vision` as a redirect, so the canonical title won; the richer of the two
write-ups survived under it, and it now lives in `Data/Cities.lua`, which is
where a city interior belongs. Broke the gate deliberately by restoring a
`The Dream Bough` entry beside `Dream Bough`, confirmed it failed naming both,
and restored.

**Where this leaves P1.** Nine leads down to two. `Nordrassil` is tagged
`forever` and has no area in Forever's own AreaTable, although the wiki lists it
as a Mount Hyjal subregion. `Shok'Thokar` in Desolace has no area row in either
client and appears nowhere in 1.12 game text. Neither is a duplicate and both
need their own verification.

One lead chased to nothing, recorded so nobody chases it again: the Balnir
Farmstead entry has Captain Vachon raiding from a tower just along from the
farm, which looked wrong once the Crusader towers were untangled. Balnir is at
76,60 and Vachon's tower is at 80,56. It is correct.

One tidiness observation, not acted on: entries do not always live in the file
their zone suggests. `Crusader Outpost` is a Tirisfal entry in
`Data/Kalimdor.lua`, and the Pools of Vision were a Thunder Bluff interior in
the same file until this run moved them. The resolver reads `parent` and does
not care, so this is housekeeping rather than a defect.

The corpus is 900 vanilla entries and 79 Forever ones, down from 907 vanilla.
Seven records left it, all of them a second write-up of ground already covered.

Next: verify Nordrassil and Shok'Thokar, then P5, the readMore probe.

### 2026-11-26, audit P1 part three: the last two leads, and P1 closes clean

Both verified. One was the Dalaran error again, under a different name, in an
entry the sweep had reviewed and passed. `tools/check-names.py` now exits 0:
every testable entry matches an area its own client knows.

**Shok'Thokar was a Cataclysm area all along.** Its own wiki page settles it in
one line, in the patch-changes section: `Patch 4.0.3a, Replaced Magram Village`.
The place in this period is **Magram Village**, AreaTable 604, parent Desolace,
and we already had an entry for it. 1.12 quest text has Warug the Magram
spokesman sitting on the outskirts of that village in south-east Desolace,
across quests 1367, 1369 and 1371.

Our entry had it as "a Burning Blade site in the southern waste" with the
Mannoroc Coven for company. The Burning Blade do take the village, with a pit
lord called Agogridon and a tower built to watch the area, and the three centaur
khans then unite in it. All of that is 4.0.3a. The infobox reads centaur as the
current race and demons as the former, which is retail's current, and the whole
arrangement postdates this addon's period by an expansion.

Deleted, and the term filed `out-of-era` with `ci` matching, the way Whisperwind
Grove and The Red Reaches were, so it cannot be written back in any casing.
Magram Village keeps the ground and gains Warug, who is the closest thing to a
diplomatic channel the centaur offer. Nothing from the deleted entry was worth
absorbing: its two paragraphs were about the Burning Blade in Desolace generally
rather than about this village. That vagueness is its own tell.

That is the third instance of the class `tools/era-audit.md` now leads on: an
entry named for an area that exists, under a name a later client gave it, whose
prose then describes the later state. Dalaran Crater, the five entries that
followed it, and now this. The entry name is the carrier every time.

**Nordrassil is a tree, not a subzone, and the entry is right.** Neither client
registers an area for it. The wiki's article is the tree itself, and the only
subzone of that name belongs to the Burning Crusade's Hyjal Summit instance and
is out of era. The Mount Hyjal (Forever) article's own subregion list has
nine entries and Nordrassil is not among them, though the article's history
prose names it seven times. So the client will never report it, `/ftn nordrassil`
is how anyone reaches it, and that is fine for the most consequential tree in the
setting. Added to the probe's allowed list with that reasoning, alongside the
Un'Goro pylons and the Lion's Pride Inn.

**P1 is finished.** 978 entries, 72 of them outside what this probe can test:
22 instances, 42 city interiors and 8 quest-named or landmark exceptions, each
of the 8 carrying its source in the script. The remaining 906 all match. The
probe's full arc, worth keeping for the next one: 64 raw hits, 26 after the
category exclusions, 15 once each era was matched against its own client, 9 once
the landmarks were listed, 2 after the duplicate merges, 0 now. Six of those
stages were the probe being wrong rather than the corpus.

Two deliberate breaks, both confirmed and restored: removing the `Warug` row
failed the build naming Magram Village, and writing `Shok'Thokar` back into that
entry's prose failed on the new out-of-era row, which is the row doing the job
it was filed for.

The corpus is 899 vanilla entries and 79 Forever ones.

Next: P5, the readMore probe, which is the cheapest of the remaining ones and
has already produced two findings by accident this month.

### 2026-11-26, audit P5: the readMore references

1,517 references across 1,072 distinct titles, all checked against the wiki.
Twenty-five were wrong and are fixed. `tools/check-refs.py` mechanises the run
and now exits 0.

**Six were dead links.** The validator only asserts that a reference produces a
valid https address, so a reference to a page nobody ever wrote passes the build
and ships. Four were Forever entries pointing at pages the wiki has not written:
`Galestrider` from Fairweather Stables, `Rog'mar`, `Valanaar` and
`Valanaar Skydocks`. Each now points at the page that does cover the ground,
`Zephras Isle`, `Riverglades` or `Valanaar Port Authority`. The other two were
mistitled: `Zzarc' Vul` for the wiki's `Zzarc'Vul`, a stray space, and
`Wasteland (quest)` for `Wasteland`, which is the right page and carries a
`Classic only` tag.

That makes nine Forever references to nonexistent pages found this month, after
the eight unwritable subzones. Forever's wiki coverage is thinner than our
Forever entries assumed when they were given further reading.

**Five were disambiguation pages.** Each hands the reader a menu instead of an
article. `Amani` from the Hinterlands wanted the `Amani Empire`; `Gurubashi`
from Bal'lal Ruins wanted the `Gurubashi Empire`; `The Ravaged Caravan` from
Stonebull Lake wanted the Mulgore Horde quest rather than a Nagrand one; `The
Restless Souls` from Terrordale wanted the first of its two parts; and `Margoz`
from Drygulch Ravine wanted `Margoz (orc)`, the Durotar quest giver, rather than
the human from a novel.

**Two were the wrong kind of thing under the right name.** We cited
`The Venture Co.` from the Venture Co. Mine meaning the company; the bare page
is a retail quest, and the company is at `Venture Company`. And the Ruins of
Stardust cited both `Ruins of Stardust` and `The Ruins of Stardust`, which looked
like a duplicate and was not: the first is the place and the second was reaching
for the quest, and the quest lives at `The Ruins of Stardust (quest)`.

**The (Classic) trap does not transfer to readMore, and that is the finding
worth keeping.** It is the most reliable tell in `tools/era-audit.md` for prose.
Probing all 992 bare titles turned up **71 with a real `(Classic)` article**, and
switching all 71 would have been wrong for most of them.

| The (Classic) page is | Count | Verdict |
|---|---:|---|
| a quest | 21 | switch, for 16 of them |
| a zone | 37 | leave: the bare title is the lore and history page, which is what this addon is |
| an instance | 9 | leave, same reasoning |
| a character | 2 | leave emphatically |
| other | 2 | leave |

`Stranglethorn Vale (Classic)` settles the zone case in its own hatnote: it
sends the reader to the bare title "for lore and history" and keeps itself for
the pre-Cataclysm zone snapshot. And `Kel'Thuzad (Classic)` is the raid
encounter at 14k while the bare page is the character at 73k, so switching that
one would have replaced a lore article with a tactics page.

Five of the 21 quest-shaped hits were NPC or faction names where the `(Classic)`
page is a coincidentally-named quest: `Southsea Freebooters`,
`Supervisor Fizsprocket`, `Zaeldarr the Outcast`, `Margoz` and
`The Venture Co.`. For the first three the bare page is the NPC or faction and is
correct. So 16 switched, 55 were left, and the rule had to be applied by type
rather than by its own tell.

**One limitation with nothing to fix,** recorded so it is not rediscovered.
Three vanilla names redirect to pages titled for a later era and no
vanilla-specific page exists: The People's Militia to Westfall Brigade, Sandfury
to Farraki tribe, and Zandalar tribe to Zandalari Empire. The reader lands on
the right subject under the wrong era's name.

Nine more redirects land on an apparently different title and were each checked
and left: Eldre'Thalas really is Dire Maul, Sunken Temple really is the Temple
of Atal'Hakkar, the Kingdom of Azeroth really did become Stormwind, Neltharion
really is Deathwing, and so on. The script still prints them, because the next
reader should check rather than trust that someone did.

**One thing P5 confirmed rather than found.** The Ruins of Stardust entry says
shaman send people to the fountain at the lake's centre for a water sample. That
is quest 1534, almost word for word: a waterskin, Ashenvale beyond Lake Mystral,
a holy place, a small fountain at the centre of the lake, and a return to Islen.
The reference now points at Islen Waterseer.

No entry prose changed in this run, only references. Next: P2, the probe that
asks whether an entry's name claims more than its prose proves. That is the
Dalaran catch, and the only one of the eight that cannot be mechanised at all.

### 2026-11-26, audit P2: does the name claim more than the prose proves?

One finding in 978 entries, and a corrected idea of what this probe is for.

**The first filter was the wrong filter.** The obvious way to narrow P2 is to
find names that assert a state: Ruins of, Crater, Abandoned, Lost, Sunken,
Burning, Fallen. That produced 59 candidates, of which three had a state in the
name the prose never mentions, and all three were the filter catching a word
that is simply part of a real place name. Forlorn Rowe is called that. So is the
Forgotten Coast. Ashwood's Fall turned out to be the opposite of a problem: its
last sentence already says the identification "stays an inference rather than a
fact", which is the discipline this whole audit is asking for.

Checked the strongest of the 56 that do agree with their names, since agreement
between name and prose is the dangerous case rather than the safe one: both
craters, both drowned places, both broken, both tainted, both dead. Un'Goro has
a crater, Weazel has a crater, the Drowned Reef has wrecks and submerged ruins,
the Broken Pillar "stands, or rather lies". All sound.

**What actually produces name errors is an entry explaining its own name.**
Every one this project has had was an etymology: Staghelm Point, Gavin's Naze,
Twilight Vale, Vul'Gol, the Headland. So the probe was re-aimed at the claim
rather than at the name, grepping the prose for "named for", "takes its name",
"the name is" and the like. That returns **109 entries making 143 naming
claims**, which is the right reading list, and the re-aimed grep is now in
`tools/audit-prompt.md` under P2.

Reassuring in passing: the sweep's own naming corrections are visible in that
list in their fixed form. Twilight's Run says nobody is sure which Staghelm the
point is named for. Twilight Vale says named for the dusk and not for the cult.
Whispering Gardens and Witch Hill both say nothing in this period explains the
name. Gavin's Naze says a naze is a headland, so two of the four are named for
what all four are.

**The one finding: Darrow Hill.** It said "the name belongs to the same
Lordaeron family as Darrowmere Lake and the village of Darrowshire", and there
is no Darrow family. No page on the wiki mentions one, there is no `Darrow
(family)` article, the Darrow Hill article says nothing about it, and 1.12 text
names Darrow Hill, Darrowshire, Darrowmere and Caer Darrow without ever
connecting them to a house. It is the Gavin's Naze shape exactly: a paragraph
built on an observed naming pattern. The shared name is a fact and stays; the
family is gone, and the entry now says that nothing in this period says where
the name came from or which place carried it first.

**Three etymologies checked and clean, recorded so nobody rechecks them.** Bear's
Head is named after the Timbermaw furbolg villages dotted across it, which is
what the place article says. Saltspray Glen is named for the ease with which the
ocean throws seawater inland, in almost our own words. And Rethban ore really is
named after the man who first found it: quest 347 says "Rethban Ore is named
after the man who first found it, Bart Rethban" in those words. That last one
was briefly a lead because a truncated grep of the dump hid the sentence, which
is worth admitting: the probe's output is only as good as the reading behind it,
and a `head -4` is not a reading.

**No gate came out of this one, and none can.** Darrow Hill's claim was built
entirely from terms the ledger carries and verdicts as vanilla, because every
one of them is: Darrow, Darrow Hill, Darrowmere Lake, Darrowshire. The sentence
was false and every word in it was proven. That is the whole argument for P2
existing, and for it being read rather than run.

Next: the remaining probes are P3, whether a claim reused across entries was
verified more than once, P4, whether an entry's only source is another of our
entries, P6, the unread fields, and P7, what the sources say that we do not. P7
is the one that finds missing sentences and is the largest.

### 2026-11-28, audit: the gap files agreed with each other and both were wrong

This came out of a question about something else. Martin asked whether the two
lighthouse entries could simply both stay. Checking that meant reading
`tools/places.tsv`, and the row above the lighthouse row pointed at
`tools/area-gaps.tsv`, and that file turned out to be a snapshot from
2026-11-09 with 165 of its 202 data rows already written. The header said to
treat the count as an upper bound, which was true and far too mild.

**The real finding was next to it.** `tools/coverage.md` listed four places as
empty that the addon already has entries for: O'Breen's Camp in Arathi
Highlands, Turner's Logging Camp in Riverglades, and Dae'gun and Elderwild in
Mount Hyjal. All four also had a row in `tools/no-source.md` explaining why
they were still gaps. Three of those rows sat under the heading "Forever areas
that exist only as a name in a list", above a paragraph stating that a name in
a list is not a source: no description, no NPC placed there, no quest that
mentions it. Turner's Logging Camp has Tan'jani and the quest `Fetch 'n'
Fletch`. Elderwild has Ortak Lomgok, a boy called Mirt, and two quests.
Dae'gun has Azgalor's ashes and Jereman sending people through it. The entries
were written later and nobody came back to the file.

**`check-gaps.py` passed throughout, and the reason matters more than the four
rows.** It compared `coverage.md` against `no-source.md` and against nothing
else. Both files had gone stale in the same direction at the same time, so they
agreed, and agreement was all the check tested. The CI step was labelled "this
fails if a place has been written up and its reason was left behind". It could
not. Neither of its inputs knew what the addon contained.

**The gate.** `tools/addon_entries.py` now loads the addon through
`mock_wow.lua` and hands back every entry with its aliases, and `check-gaps.py`
uses it for a third comparison: an open gap that an entry already answers to,
in the same zone, is now a failure. The zone has to match, because a few
subzone names sit in two zones and the resolver matches a subzone against its
declared parent, so a name-only test would call those written when they are
not. Broken deliberately both ways before committing: restoring Turner's
Logging Camp to both files gives `ALREADY WRITTEN` and exit 1 while the two
older comparisons stay silent, and listing the same name under Mulgore instead
reports nothing, which is the false positive the parent requirement exists to
prevent. The loader also replaced a regular expression that had matched 61 of
978 entries and reported a clean result.

**One real caveat recorded, not fixed.** O'Breen's Camp has AreaTable row 323,
but `no-source.md` recorded on 2026-11-09 that the wiki carries it as a planned
subzone that was removed, so the client may never report the string even though
the camp and O'Breen are both on the sand at Faldir's Cove. P1 passes it,
because P1 only asks whether the client's table carries the name. That limit is
now written into `check-names.py` beside the other things it cannot test.

**The lighthouse question itself is unanswered and is Martin's.** Both areas are
real, 26 and 115, both parented to Westfall, so neither entry is dead and
leaving both costs nothing but a repeated set of facts. Settled while checking:
no other zone has a bare `Lighthouse` area, so moving that name onto an alias
cannot steal it from anywhere, and the only cost of merging is one orphaned
`seen` key, because `ns.MarkSeen` is keyed on `U.Key(entry.name)`.

Next: P3, P4, P6 and P7 remain. The lesson from this one generalises past the
probes. Every check here should be asked what it compares, and whether either
side of the comparison knows anything we did not write ourselves.

### 2026-11-28, the Westfall lighthouse merge

Martin's call, taken after the check above turned the naming question into a
question with an answer. There were two entries for one building: `Lighthouse`,
area 26, and `Westfall Lighthouse`, area 115, both parented to Westfall. Both
names are real and both resolved, and the two write-ups told the same story
about the same dead man in different words, so a player walking the point was
told it twice and counted as discovering two places.

**What survived and why.** `Westfall Lighthouse` keeps the entry, because the
entry name is what appears in chat and in a lookup list, where `Lighthouse`
alone says nothing about where it is. `Lighthouse` and `The Lighthouse` are
aliases on it. That is safe to do: no other zone in the AreaTable has a bare
`Lighthouse` area, so the alias takes the name from nowhere. The merged lore
keeps every sourced claim from both: the Longshore and the wrecks, Grayson dead
on the rocks below and lucid about it, the keeper's family frightened off and
then killed on Old Murk-Eye's second raid, the oil from the harvest golems, and
the tidehunters and oracles still on the shore. The one line that went is the
second telling of each.

**Checked through the real resolver, not the validator.** `Lighthouse`, `The
Lighthouse` and `Westfall Lighthouse` all return the one entry from
`ns.FindSubIn`, with the single key `westfall lighthouse`, which is what makes
`onlyFirstVisit` and `repeatCooldown` behave. P1's lesson applies here too: a
validator pass says the data is well formed, and only the resolver says a
string lands. 977 entries now, down one. `check-refs.py` exits clean at 1515
references, so the fourth readMore title the merged entry picked up is real.

**One cost, accepted.** Players who already visited the place under the old
`Lighthouse` entry keep an orphaned `seen` key, because `ns.MarkSeen` is keyed
on `U.Key(entry.name)`. Nothing reads it and nothing breaks. `ns.PruneCollected`
is the precedent for tidying that sort of thing if it ever accumulates.

Next: a release will need a CHANGELOG line, written at release prep as usual,
saying the lighthouse is one place again. The remaining probes are still P3, P4,
P6 and P7.
