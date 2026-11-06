#!/usr/bin/env python3
"""
tools/lint-prose.py -- check a prose file for the phrasings this project bans.

tools/validate.lua enforces these on the shipped lore. This does the same for
anything else written for the project: the CurseForge description, release
notes, the README. Same list, plus the marketing tics that creep into store
copy specifically.

    python3 tools/lint-prose.py curseforge-description.md

Exits non-zero if anything is found.
"""

import re
import sys

# Fail outright. These are the formulas that make a piece read as generated.
BANNED = [
    (r"fair (?:summary|indicator|comment|measure|picture|illustration|reading)", "the 'is a fair summary of' verdict clause"),
    (r"\b(?:which|that) is the point\b", "'..., which is the point'"),
    (r"\bin miniature\b", "'X is Y in miniature'"),
    (r"\bwhich tells you\b", "'which tells you how/what'"),
    (r"\bnot (?:a coincidence|accidental|incidental)\b", "'which is not a coincidence'"),
    (r"\bnobody is winning\b", "'a fight nobody is winning'"),
    (r"\bin the (?:most literal|fullest) sense\b", "'in the most literal sense'"),
    (r"\bby a wide margin\b", "'by a wide margin'"),
    (r"\b(?:grim reminder|testament to|speaks to|hallmark of|underscores?|underpins?)\b", "stock evaluative phrase"),
    (r"\b(?:tapestry|nestled|veritable|myriad|boasts|delve|plethora)\b", "stock descriptive word"),
    (r"—", "em dash (use a comma, colon or full stop)"),
    # store-copy specific
    (r"\b(?:dive into|immerse yourself|unleash|supercharge|elevate your|take your .{0,20} to the next level)\b", "marketing filler"),
    (r"\b(?:seamless(?:ly)?|effortless(?:ly)?|cutting-edge|game-?changing|robust|comprehensive solution|state of the art)\b", "marketing adjective"),
    (r"\b(?:look no further|say goodbye to|and more!|perfect for anyone|whether you(?:'re| are) a)\b", "marketing cliche"),
    (r"\bin today's\b", "'in today's ...' opener"),
]

# Allowed, but not this often. (pattern, label, max per 1000 words)
RATE = [
    (r",\s+and it (?:is|was)\b", "', and it is'", 3),
    (r",\s+which\b", "', which' clause", 6),
    (r",\s+so\s", "', so' clause", 4),
    (r"\bsimply\b", "'simply'", 2),
    (r"\bgenuine(?:ly)?\b", "'genuine'", 2),
    (r"\bentirely\b", "'entirely'", 2),
    (r"\bactually\b", "'actually'", 3),
    (r"\bvery\b", "'very'", 3),
    (r"!", "exclamation mark", 1),
]


def strip_markdown(text):
    # A document that quotes the banned list (this project's README does) would
    # otherwise trip on every example. Wrap such a passage in
    # <!-- lint-prose:off --> ... <!-- lint-prose:on --> to exempt it.
    text = re.sub(r"<!--\s*lint-prose:off\s*-->.*?<!--\s*lint-prose:on\s*-->", " ", text, flags=re.S)
    text = re.sub(r"```.*?```", " ", text, flags=re.S)   # fenced code
    text = re.sub(r"`[^`]*`", " ", text)                 # inline code
    text = re.sub(r"^\s*\|[-: |]+\|\s*$", " ", text, flags=re.M)  # table rules
    text = re.sub(r"https?://\S+", " ", text)            # urls
    return text


def main(paths):
    problems = 0
    for path in paths:
        try:
            raw = open(path, encoding="utf-8").read()
        except OSError as exc:
            print(f"{path}: cannot read ({exc})")
            problems += 1
            continue

        text = strip_markdown(raw)
        words = len(text.split())
        per1k = max(words / 1000, 0.001)
        print(f"\n{path}  ({words} words)")

        found = 0
        for pattern, why in BANNED:
            for m in re.finditer(pattern, text, re.I):
                line = text[: m.start()].count("\n") + 1
                snippet = text[max(0, m.start() - 35): m.end() + 35].replace("\n", " ").strip()
                print(f"  BANNED  line ~{line}: {m.group(0)!r} -- {why}")
                print(f"          ...{snippet}...")
                found += 1

        for pattern, label, budget in RATE:
            n = len(re.findall(pattern, text, re.I))
            # A short file can blow a per-1000 budget on two uses, which says
            # nothing. Require a real count before calling it a tic.
            if n >= 4 and n / per1k > budget:
                print(f"  RATE    {label}: {n} times ({n / per1k:.1f} per 1000 words, budget {budget})")
                found += 1

        # three or more consecutive sentences opening "The "
        for para in re.split(r"\n\s*\n", text):
            sents = [s.strip() for s in re.split(r"(?<=[.!?])\s+", para) if s.strip()]
            run = 0
            for s in sents:
                run = run + 1 if s.startswith("The ") else 0
                if run >= 3:
                    print(f"  RHYTHM  three sentences in a row opening 'The ': {sents[0][:60]}...")
                    found += 1
                    break

        print("  clean" if not found else f"  {found} issue(s)")
        problems += found

    return 1 if problems else 0


if __name__ == "__main__":
    args = sys.argv[1:]
    if not args:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(args))
