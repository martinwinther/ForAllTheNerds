# Keeping the lore in its own era

This addon covers patch 1.12 and earlier, plus Forever's own content. On
2026-11-09 four entries were found describing things that do not exist yet in
that period. This file records how they got in, how they were found, and what
now stops them.

## What was wrong

| Entry | What it said | What is true at 1.12 |
|---|---|---|
| Southern Barrens | The lower half of the Barrens, "past the Great Divide" | The Great Divide is a lava chasm the Cataclysm opened. In 1.12 the halves are divided by a dried-up riverbed |
| Gold Road | Runs from the Mor'shan Rampart "down to the Great Divide" | It runs the length of the zone, crossing that riverbed on a bridge; south of the bridge it is the Southern Gold Road |
| The Headland | A Stormpike training camp with instructors and a drill sergeant | The Stormpikes arrive in Cataclysm. In 1.12 the ridge holds mountain lions and nothing else |
| Southbreak Shore | Captain Dreadbeard leads the pirates there | Dreadbeard is Cataclysm. In 1.12 it is Southsea Freebooters, with sea giants in the surf |

Two further corrections came out of the same pass. Gavin's Naze named the four
ridges above Hillsbrad as Sofera's Naze, Corrahn's Dagger, Dandred's Fold and
itself; the wiki numbers them and the third is the Headland, not Dandred's
Fold, and the Headland is not named after a person, so the paragraph built on
that observation was wrong twice. Shandris Feathermoon was given the rank of
General, which she does not hold on a 1.12 nameplate.

## How they got in

Every one came from a retail wiki article. A retail article covers a place
across every expansion it has existed in, with the current state in the lead
paragraph and the earlier states under headings, in galleries, or in image
captions. Read quickly, the lead reads like the truth about the place.

The tells, in order of reliability:

- An article at `Foo (Classic)` exists. Then the bare `Foo` is the retail one.
- The infobox image is captioned `Foo (Cataclysm).jpg`, and a gallery lower
  down has `Foo.jpg | In Classic`.
- Cited quests are Cataclysm quests, and ability ids are five digits starting
  with 7 or 8. A 1.12 spell id is four digits or low five.
- The NPC named in the lead is absent from a 1.12 creature table.

## What stops it now

**`tools/validate.lua`, section "Era scope".** Fails the build when entry prose
contains any of a list of terms that cannot be right in this period: the Great
Divide, Northern Barrens, Cataclysm, the Shattering, Garrosh, the Ebon Blade
and so on. Entry names are exempt, because the 1.12 client does have an area
called the Southern Barrens; only the prose is read. Terms that are proper
nouns in one sense and ordinary English in another are matched case
sensitively, so "the northern Barrens" passes and "the Northern Barrens" does
not. The list covers named things and nothing else: a term with a legitimate
pre-1.12 use, such as Draenor or the Dark Portal, is deliberately not in it.

**`tools/check-era.py`.** The named-term list cannot catch a character who
simply does not exist yet, because nothing about the name gives it away. That
needs data. cmangos/classic-db publishes the 1.12.1 world database, and its
`creature_template` table is every creature in the game at that patch. The
script reads the prose of every vanilla entry, pulls out each titled character
name, and prints the ones missing from that table:

    python3 -I tools/check-era.py --download

It prints a list rather than passing or failing, because absence has two
meanings. A dead king is absent and in scope. A captain standing on a beach is
absent and out of it. Nineteen names come back and eighteen are history.

The dump is GPL-3.0 and this addon is MIT, so it is never committed: the script
downloads it to a temporary directory, reads it and leaves it there. That is
also why this check is not in CI.

## What was checked and came back clean

The same pass swept wider than the four entries, and the rest held up:

- Every capitalised phrase used twice or more across all 921 vanilla entries,
  against both the 1.12 creature table and the addon's own place names. No
  post-vanilla content among them.
- Every place-shaped name in the prose that the addon does not itself register,
  38 of them. All vanilla or sentence fragments.
- The specific claims that looked like the same mistake and were not: Baine
  Bloodhoof gives the Bael'dun quest in 1.12 and is at Bloodhoof Village;
  Honor's Stand is a Horde position in 1.12 and only becomes Alliance in
  Cataclysm; Corrahn's Dagger is Syndicate ground before the Stormpikes take
  it; Araga is a 1.12 rare; Nat's Landing and the Defiler's Den are both
  vanilla; Camp Taurajo is standing.

## The rule this leaves

For a vanilla place, read the `(Classic)` article when one exists, and check
any character named in the lead against the 1.12 table before writing them
into an entry. For a Forever place, Forever's own article is the source and its
characters are correctly absent from 1.12.
