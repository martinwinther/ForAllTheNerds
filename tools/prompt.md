# House style for ForAllTheNerds lore entries

This file is the contract. `generate.py --prompt` embeds it verbatim into the
prompt it builds, so editing this file changes what the model writes.

## What the addon is

An in-game addon for **World of Warcraft: Forever**. When the player walks into
a zone, a town, a ruin or a dungeon, it shows one line of hook text on a small
card. Clicking the card opens the full write-up.

The reader is standing in the place, right now, probably mid-quest. They want to
know what they are looking at and why it matters. They do not want an
encyclopedia article.

## The hard rules

1. **Lore cutoff: patch 1.12 and everything before it.** Warcraft I, II and III
   and the pre-WoW novels and backstory are all in scope: the Sundering, the War
   of the Ancients, Arathor, the fall of Lordaeron, the Battle of Mount Hyjal,
   the War of the Three Hammers. **Nothing from The Burning Crusade onward.**
   - No Outland, no draenei, no blood elves as a playable people, no Illidan
     ruling anything, no Lich King marching on Northrend, no Cataclysm, no
     Deathwing having returned, no Pandaria, no Legion, no Shadowlands.
   - Write in the present tense of patch 1.12. Varian is missing. Dalaran is a
     crater. Onyxia is still Lady Prestor and nobody knows. Kil'jaeden is still
     out there and unaddressed.
2. **No spoilers for anything the player is about to do.** Explain the standing
   situation and the history. Never explain how a questline resolves, who turns
   out to be a traitor, or what is at the bottom of the dungeon they are about
   to enter. "The Scarlet Crusade's leadership is not what it claims to be" is
   fine. Naming what it actually is, is not.
3. **For Forever's own new zones**, background only, and set
   `era = "forever", spoiler = true` on every entry. Describe where the place
   sits, who lives there, and the established older history the place is built
   on. Nothing about the new story.
4. **Do not invent lore.** If you do not know something, leave it out. An entry
   that is three accurate sentences beats one that is four paragraphs with a
   made-up king in it. Never invent an NPC name, a date, a battle or a
   bloodline.
5. **Names must match the game exactly**, because they are string keys matched
   against `GetZoneText()` and `GetSubZoneText()`. "The Barrens", not "Barrens".
   "Razorfen Kraul", not "Razorfen Krawl". If you are unsure of a spelling, say
   so in a comment instead of guessing.

## Voice

- Plain, dry, specific. The tone of a well-read friend leaning over and telling
  you the interesting part, not a narrator and not a wiki.
- Lead with the thing that makes the place worth caring about.
- Prefer concrete consequence over adjectives. "The nobility refused to pay the
  masons who rebuilt the city, and Westfall is still burning over it" beats
  "a tragic tale of betrayal".
- Note the ironies and the unresolved threads; they are the reason this addon
  exists. Grom's tomb sits in a forest his own clan is logging. Stromgarde, the
  birthplace of human civilisation, is being carved up by bandits.
- No second-person instruction ("you should go here"), no quest advice, no
  mechanics, no item or level recommendations.
- British spelling, since the rest of the database uses it.
- Do not open an entry with "Nestled in" or "Once a thriving". Do not end with
  "only time will tell".

## Phrasings that are banned

`tools/validate.lua` fails the build if any of these appear. They are the
formulas this database was edited to remove, and they are the quickest way to
make a write-up read as generated rather than written.

Never use:

- the verdict clause family: "which is a fair summary / fair indicator / fair
  comment / fair measure / fair picture / fair illustration of ..."
- "..., which is the point" / "..., that is the point"
- "X is Y in miniature"
- "which tells you how/what/most of what you need to know"
- "which is not a coincidence" / "not accidental" / "not incidental"
- "a fight nobody is winning"
- "in the most literal sense" / "in the fullest sense"
- "by a wide margin"
- "a grim reminder", "a testament to", "speaks to", "the hallmark of"
- "rich tapestry", "nestled in", "a veritable", "myriad", "boasts", "delve"
- em dashes. Use a comma, a colon or a full stop.

Also rate-limited, with a budget per 10,000 words that the validator enforces:
", and it is", ", and they are", ", which ...", ", so ...", "simply",
"genuine(ly)", "entirely", "effectively", "considerably", "largely",
"a great deal", "a reminder", "the usual X".

A couple of uses is voice. Twenty is a tic. The validator prints the current
rate when you are over.

**Rhythm:** do not write three sentences in a row that all begin "The ". The
validator warns on that too. Vary how sentences open, and vary their length;
alternate a long explanatory sentence with a short flat one.

## The exact shape to produce

Lua, using the registration helpers already defined by `Data/Schema.lua`:

```lua
ns.Zone{
    name = "Elwynn Forest",            -- exact in-game string
    continent = "Eastern Kingdoms",    -- or "Kalimdor", "Elemental Plane"
    faction = "Alliance",              -- Alliance|Horde|Contested|Neutral|Hostile
    levels = "1-10",                   -- free text; "Capital" or "Any" are fine
    hook = "One line. Under 120 characters. This is what the card shows.",
    lore = {
        "Paragraph of 2-5 sentences, 60 to 900 characters.",
        "Two to four paragraphs in total. Three is usually right.",
    },
    didYouKnow = "Optional. One curiosity, the thing a lore nerd would lean in for.",
    readMore = { "Wowpedia: Elwynn Forest" },   -- optional; see below
}
```

Locales inside a zone go through `ns.SubsOf`, which fills in `parent`:

```lua
ns.SubsOf("Elwynn Forest", {
    {
        name = "Goldshire", faction = "Alliance", levels = "5-12",
        hook = "...",
        lore = { "...", "..." },
    },
})
```

Dungeons, raids and battlegrounds use `ns.Instance{...}`, with `aliases` for any
other name the client might report:

```lua
ns.Instance{
    name = "The Temple of Atal'Hakkar", continent = "Eastern Kingdoms",
    faction = "Hostile", levels = "50-60",
    hook = "...",
    lore = { "..." },
    aliases = { "Sunken Temple" },
}
```

## The readMore format matters

Keep the exact `"Wowpedia: <Article Title>"` shape. The addon strips the prefix
and turns the rest into a real web address, so the part after the colon must be
the wiki article title spelled exactly, with no extra words, no parenthetical
and no trailing punctuation. `"Wowpedia: Zul'Gurub"` works. `"Wowpedia: the
Zul'Gurub raid"` gives a dead link. The validator checks every reference builds
a valid address, but it cannot tell whether the article actually exists, so
only cite titles you have seen.

## Length targets

| field        | target                                  |
|--------------|-----------------------------------------|
| `hook`       | 60-115 characters, one sentence, no full stop needed |
| `lore`       | 2-3 paragraphs for a locale, 3-4 for a zone |
| paragraph    | 60-900 characters                       |
| `didYouKnow` | one or two sentences, under 500 characters |

## Output rules

- Return **only** Lua, ready to append to a file in `ForAllTheNerds/Data/`.
- Assume the file already starts with `local addonName, ns = ...` and has
  `local Zone, SubsOf, Instance = ns.Zone, ns.SubsOf, ns.Instance` in scope,
  or use the `ns.` prefixed forms.
- Use tabs for indentation, to match the existing files.
- Escape nothing unusual; these are plain double-quoted Lua strings, so the only
  character that needs care is a literal `"` inside the text. Use single quotes
  in prose instead.
- Do not wrap the output in prose or explanation. Lua only.

## After generating

Run the validator, which will reject anything malformed and warn about stub
paragraphs and over-long hooks:

```
lua tools/validate.lua
```
