# Publishing ForAllTheNerds

**Curse and CurseForge are the same place.** Curse was the old brand; the
platform is CurseForge now, run by Overwolf. There is nothing separate to
publish to.

CurseForge already carries **Forever as its own flavour**, at game version
**1.60.1**, which is interface **16001**, the number this addon's `.toc`
declares. Addons do not appear for Forever users automatically, though: the
author has to upload a file tagged for that game version. Plenty of addons have
not yet, which is why some things people expect are missing from Forever.

There are two routes. The manual one works today and needs no GitHub. The
automated one is worth setting up once you expect to release more than twice.

---

## Route 1: manual upload

### Build the zip

```bash
bash tools/build-zip.sh
```

That stages only the addon files, excludes `tools/` and the development docs,
and writes `ForAllTheNerds-<version>.zip` with the folder at the right depth.

### Create the project

1. Sign in at **https://authors.curseforge.com** with a Battle.net, Twitch,
   Google or email account.
2. Open the author dashboard and create a new project, choosing **World of
   Warcraft** as the game. (CurseForge has moved this page around more than
   once; if the dashboard does not offer project creation, the WoW addon
   listing at **https://www.curseforge.com/wow/addons** has a create link.)
3. Fill in:

| Field | Suggested value |
|---|---|
| Name | ForAllTheNerds |
| Summary | Tells you the history of the places you walk through, from whole zones down to individual towns, ruins and dungeons, with no spoilers. |
| Avatar | `media/logo-400.png` (or `logo-512.png`). Square, transparent-free, reads at list size. |
| Category | Quests & Leveling (secondary: Map & Minimap) |
| License | MIT (the `LICENSE` file is in the repo) |
| Description | Paste `curseforge-description.md` wholesale. Set the editor to Markdown first. |

### The summary field

CurseForge wants one English sentence saying what the addon is and does. Use
this, at 134 characters:

> Tells you the history of the places you walk through, from whole zones down to individual towns, ruins and dungeons, with no spoilers.

Shorter, if you want it tighter:

> Tells you the history of the places you walk through, down to individual
> towns, ruins and dungeons.

The longer **Description** field is separate. `curseforge-description.md` is
written for it and goes in as-is; switch the CurseForge editor to Markdown
before pasting, or the formatting arrives as literal asterisks.

### Artwork

`media/` holds the project avatar: `logo.svg` is the source, with PNGs rendered
at 512, 400, 256 and 64. Upload the 400 or the 512. The 64 is there as a check,
because the avatar is shown very small in CurseForge's lists and a logo that
only works large is no use.

The mark is an open book under a map pin, on a dark plate with a gold rim, in
the addon's own palette. It is deliberately a strong two-shape silhouette so it
survives being shrunk.

### Upload the file

On the project's **Files** tab, upload the zip and set:

- **Release type**: Release
- **Game versions**: tick **Forever 1.60.1**. Also tick **Classic Era
  1.15.x**, because the `.toc` declares `16001, 11509` and the vanilla lore
  applies there unchanged. Do **not** tick retail.
- **Changelog**: paste the current section of `CHANGELOG.md`.

Approval is usually quick but it is a human review, so the first upload can sit
for a while.

### A note on the CurseForge app

The app has a game-version selector. Anyone installing for Forever has to set
it to Forever first, or the app quietly fetches retail builds of things. Worth
saying in your description, because it generates support questions.

---

## Route 2: automated releases

The repo is already set up for this. The addon's `.toc` sits at the repository
root, which is what the [BigWigs packager](https://github.com/BigWigsMods/packager)
expects, and `.pkgmeta` tells it what not to ship.

### One-time setup

1. Push the repo to GitHub.
2. Get a CurseForge API token from the author dashboard, under API tokens.
3. In the GitHub repo: **Settings → Secrets and variables → Actions → New
   repository secret**, named `CF_API_KEY`, holding that token.
4. In **Settings → Actions → General**, set workflow permissions to
   **Read and write**. Without this the packager cannot create the release and
   fails with "Resource not accessible by integration".
5. Create the CurseForge project manually first (route 1), then uncomment the
   `## X-Curse-Project-ID:` line in `ForAllTheNerds.toc` and put the project's
   id in it. The id is in the **About Project** box on the project page.

### Releasing

```bash
git tag -a 1.1.0 -m "1.1.0"
```

```bash
git push origin 1.1.0
```

The workflow in `.github/workflows/release.yml` then runs the validator, builds
the zip and uploads it. **The tag must be the version number and nothing else**,
because the packager takes the version from the tag name. Use an annotated tag
(`-a`), or the changelog generation misbehaves.

The validator runs first deliberately, so a broken build cannot be published.

### A wrinkle worth knowing

The packager's README and its wiki disagree about what the CurseForge token
environment variable is called: the README says `CF_API_TOKEN`, the wiki says
`CF_API_KEY`. The workflow sets both from the same secret, which costs nothing
and works whichever one the action actually reads. If uploads fail with an
authentication error, that is the first thing to check against the action's
current `action.yml`.

---

## Other hosts

The same workflow uploads to these if you add the tokens as secrets. No other
changes needed.

- **Wago.io** uses `WAGO_API_TOKEN`. Historically the quickest to add new game
  flavours, which matters for something this new.
- **WoWInterface** uses `WOWI_API_TOKEN`. Smaller audience, no client app.

---

## Before the first upload

- [ ] `lua tools/validate.lua` passes
- [ ] The version in `ForAllTheNerds.toc` matches `CHANGELOG.md`
- [ ] `bash tools/build-zip.sh` produces a zip whose `.toc` is at
      `ForAllTheNerds/ForAllTheNerds.toc`
- [ ] The zip installs and `/ftn` works in game
- [ ] `LICENSE` is present
- [ ] The description says the lore stops at patch 1.12 and contains no
      spoilers, and that Forever's new zones are off by default
