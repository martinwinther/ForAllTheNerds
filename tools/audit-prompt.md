# Finding the errors the method cannot see

A prompt for auditing this addon's lore, written to be run by somebody with no
memory of previous runs.

`tools/prompt.md` is the contract for writing an entry. `tools/era-audit.md` is
the account of what went wrong before. This file is neither. It is for the next
error, which will not look like the last one.

## Why this exists, in one paragraph

The vanilla-era sweep read all 907 vanilla entries against the client's own data
across 37 runs, built a 2,480-row term ledger, and gated the build on it. A
player then found that five entries put a crater at Dalaran, which belongs to a
much later point in the story. The sweep had reviewed two of those five and
passed them. It passed them because every word in the sentence was genuinely
vanilla and because the entry was called `Dalaran Crater`, a real area name in a
later client, so the name read as corroboration. Nothing was wrong with the
method. The error was sitting in a place the method does not look.

## The governing idea

**Do not hunt for the last error. Hunt for the surfaces the checks do not
read.** Content in an unread surface has never been verified by anything, so
that is where error accumulates, silently, for as long as the surface stays
unread.

In this project the gate reads `hook`, `lore` and `didYouKnow` and nothing else.
Everything in this list is therefore unverified by construction:

| Surface | What it can assert without being checked |
|---|---|
| the entry `name` | a state, an owner, a shape, an era |
| `aliases` | that the client calls the place this, and that no other entry answers to it |
| `readMore` titles | that an article exists and is about this place |
| `parent` | which zone the place is in |
| `faction` | who holds it |
| `levels` | when a player meets it |
| `era` and `spoiler` | which game this belongs to |
| the absence of a paragraph | everything the sources say that the entry leaves out |

That table is the audit. Each row below is a probe for one of them.

## The probes

Run one probe per run. Each says what a hit means and, as importantly, what it
does not mean.

### P1. Does the client have this name at all?

**Mechanised: `tools/check-names.py`.** It takes both AreaTables, excludes the
categories the test cannot apply to, and prints what is left. Not in CI, because
it needs a download.

Every entry name and alias, matched against the AreaTable of the client that
entry belongs to. A miss means the client would never report that string, so the
entry can only be reached by looking it up by name.

A hit may be: a name imported from a later client, which is the Dalaran case; a
name the client spells differently, as with `Andorhal` against the client's
`Ruins of Andorhal`; a second entry sitting beside a correctly named one; or a
name nothing in the game uses.

Three categories the test cannot apply to, and the reason each is a category
rather than a hit. **Instances** are not subzone areas. **City interiors** are
not areas either: `wow_classic_era`'s `AreaTable` has no row containing the word
district or quarter anywhere in it, and Stormwind City has exactly one child
area, the Valley of Heroes. **Quest-named landmarks** are real places the client
never registers as areas, like the Un'Goro pylons and the Lion's Pride Inn; the
script lists them with the quest that names each, because an exclusion without a
reason rots into a place to hide a failure.

Match each entry against its **own** client. A `forever` entry lives in a client
that carries the vanilla areas plus Forever's, so testing it against our 68-row
new-zone worklist reports twelve places that are not missing at all.

The numbers from the first run are the argument for all of the above: 64 names
before the exclusions, 26 with the wrong Forever table, 15 with the right one,
9 once the quest-named landmarks were listed. Only then was any of it worth
reading.

### P2. Does the name claim more than the prose proves?

Cover the entry's name and read only the hook and the lore. Then ask what the
name is asserting, and whether the prose you just read supports it.

This is the Dalaran catch stated generally, and no script will do it. `Dalaran
Crater` asserts a crater. The prose never proved one, and nobody noticed,
because the name had already settled the question before the first sentence.

**Narrow it by naming claims, not by state words.** The obvious filter is names
containing a state: Ruins of, Crater, Abandoned, Lost, Sunken, Burning, Fallen.
That was tried first and produced 59 candidates and nothing at all. Three looked
like hits and all three were the filter catching a word that is simply part of a
real place name, as at Forlorn Rowe and the Forgotten Coast. A state word in a
name is usually just the name.

What produced every name error this project has actually had is an entry
**explaining its own name**. Staghelm Point, Gavin's Naze, Twilight Vale,
Vul'Gol and the Headland were all etymologies. So grep the prose for the claim
rather than the name for the word:

    lua tools/dump-prose.lua | grep -nEi \
      "named (for|after)|takes its name|gets its name|the name (is|comes|belongs)|is named"

That returns about 110 entries and 140 claims, which is a reading list for one
run. Work it in bands and record where you stopped. Most will be sound, and the
sound ones are worth seeing too: an entry that says "nothing in this period
explains the name" is doing exactly what it should.

### P3. Who else says this, and was it checked there too?

Find distinctive claims that appear in more than one entry. For each, establish
whether it was verified once and copied, or verified in each place.

Run 10 of the sweep found two of its own four findings were corrections that had
been applied to the entry the error was spotted in and never carried across.
**A correction is not finished when the entry it was found in is fixed.** The
same holds for an unverified claim: it spreads by being reused.

### P4. What is this entry's only source?

For each claim, name the oracle. If the honest answer is "another of our
entries", the claim has never been verified at all; it has been agreed with.

The sweep found entries contradicting each other many times, because a
contradiction is visible. Two entries quietly agreeing on something false is
not, and nothing in the build can see it.

### P5. Does the linked article describe this place?

**Mechanised: `tools/check-refs.py`.** Fails on a dead reference, and reports
disambiguation landings, odd redirects and `(Classic)` candidates as leads. It
needs the network and is not in CI.

Every `readMore` title: does it exist, and is it about the same thing?

Both halves fail in practice. The validator checks only that a reference
produces a valid address. Six dead links shipped: four of them Forever entries
pointing at pages the wiki has not written, and two simply mistitled,
`Zzarc' Vul` for `Zzarc'Vul` and `Wasteland (quest)` for `Wasteland`.

A title can also exist and be wrong, in three ways the first run found:

- **A different place of the same name.** There is an article called Eastwind
  Shore and it is in the Grizzly Hills, while the Riverglades has its own.
- **A disambiguation page**, which hands the reader a menu instead of an
  article. Five shipped, including `Margoz`, where the right target is
  `Margoz (orc)` and the other option is a novel character.
- **The wrong kind of thing under the right name.** We cited `The Venture Co.`
  meaning the company; the bare page is a retail quest and the company is at
  `Venture Company`.

**Do not apply the (Classic) rule mechanically here.** It is the most reliable
tell in `era-audit.md` for prose, and for `readMore` it is right only sometimes.
The first run found 71 bare titles with a real `(Classic)` article and only 16
were switches. Classify the `(Classic)` page before touching anything:

| The (Classic) page is | Do |
|---|---|
| a quest | switch. The vanilla quest has different objectives, levels and text |
| a zone | leave. `Stranglethorn Vale (Classic)` sends you to the bare title "for lore and history", which is what this addon is |
| an instance | leave, same reasoning |
| a character | leave. `Kel'Thuzad (Classic)` is the raid encounter at 14k; the bare page is the character at 73k |

And five of the 21 quest-shaped hits were NPC or faction names where the
`(Classic)` page is a coincidentally-named quest. Check what the citing entry
meant before switching even those.

One limitation with nothing to fix: three vanilla names redirect to pages
titled for a later era and no vanilla-specific page exists. The reader lands on
the right subject under the wrong era's name: The People's Militia to
Westfall Brigade, Sandfury to Farraki tribe, Zandalar tribe to Zandalari
Empire.

### P6. Do the unread fields agree with the client?

`parent` against the client's own `ParentAreaID`. `faction` against who the
client actually puts on the ground. `levels` against the creatures standing
there. `era` against which product's `AreaTable` carries the row.

None of these is read by the gate, so a wrong one has never been contradicted by
anything. Run 36 found a `faction` field that was set from an assumption about
who held a beach.

### P7. What do the sources say that we do not?

Invert the method. Instead of taking each claim and looking for support, take
the oracle's account of the place and diff it against the entry.

Every other probe finds a wrong sentence. This one finds a missing one, which no
check can ever fail on. Most of the sweep's best material came out of it: the
quest text that explains why a dome is there, the officer who cannot be bothered
to walk down the coast, the boy making mud dragons instead of watching sheep.

### P8. Can two entries answer for one string?

Now gated: `tools/validate.lua` fails on an alias colliding with another entry's
name. Keep the probe anyway and re-run it after any schema change, because the
gate only knows about the collision shape it was written for.

## Turning a lead into a finding

Every probe produces leads. A lead is not a finding, and this is where an audit
earns or loses its credibility.

- **Verify each lead against the oracle precedence before writing it down.**
  cmangos 1.12.1 first, then wago.tools, then the wiki. Never the other way
  round.
- **Suspect the probe before the data.** P1's first run here reported 64 names
  with no client area. One was a bad read of my own, about twenty were city
  districts, a category the test does not apply to, and several were instances.
  Had that list been reported as 64 findings it would have been worse than
  useless. If a probe is mostly noise, fix the probe.
- **Record what a lead turned out to be, including nothing.** A lead chased to a
  dead end and not written down gets chased again. The sweep kept a list of
  names with no wiki article for eleven runs for exactly this reason.
- **Prefer a gate to a fix.** Run 32 of the sweep found the alias collision at
  Dalaran, wrote it down, and left it, and it stayed live until a player hit it.
  Recording a structural problem is not the same as having a check for it. When
  a confirmed finding has a shape, spend the time on the check, break it
  deliberately, confirm the expected failure, and restore it.
- **Delete what cannot be supported.** Do not reword it into something vaguer
  and keep it. A softened sentence reads as though it has been checked.

## How to run it

One probe per run, as the sweep ran one batch per run, and for the same reason:
a run that tries to do everything finishes none of it and leaves no record of
where it got to.

Each run ends by appending to the log in `tools/era-sweep.md`, below the
SWEEP COMPLETE marker and under its own heading, with: which probe, what it
reported, how many leads survived verification, what each turned out to be, and
what is next. Work on dev. Never tag and never publish: releases are Martin's
call.

## Out of scope

This audit is about whether entries are true, not whether they read well.
`tools/lint-prose.py` owns the prose. Do not restyle an entry you are auditing;
a diff that mixes a correction with a rewrite cannot be reviewed.
