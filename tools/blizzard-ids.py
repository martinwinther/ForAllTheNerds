#!/usr/bin/env python3
"""Check creature names and ids against Blizzard's own Classic Era data.

This is the one route to NPC ids with no licence question attached: it is
Blizzard's data, from Blizzard's documented API, fetched with your own
credentials. Compare tools/npc-ids.md, where routes 2 and 4 both come with
conditions.

Read tools/npc-ids.md before assuming this will help. Three limits matter:

  1. There is NO Forever namespace. The documented ones are
     static-classic1x-{region} for Classic Era, static-classic-{region} for
     Mists Progression and static-classicann-{region} for Burning Crusade
     Anniversary. Nothing for 1.60.1. This can speak for Classic Era, which is
     the addon's other declared interface, and not for Forever.
  2. There is no zone or area endpoint at all, so this says nothing about where
     anything stands. Same server-side reason Creature.db2 has none.
  3. Blizzard's docs contradict themselves on whether creature search works.
     The Classic game data index lists /data/wow/search/creature, and the
     Classic search guide says only realm and connected-realm document types
     are supported. Which is true cannot be settled without credentials, so
     this script probes it and says which.

Credentials come from a .env file, or from the environment. Make the pair at
https://develop.battle.net under API Access, then:

    cp .env.example .env
    chmod 600 .env          # and put the two values in it

.env is gitignored, so it is never committed. Environment variables take
priority over the file, which makes a one-off override easy:

    BLIZZARD_CLIENT_ID=... BLIZZARD_CLIENT_SECRET=... python3 -I tools/blizzard-ids.py probe

Point BLIZZARD_ENV_FILE elsewhere to keep the file outside the repository
altogether. Do not paste either value into a chat window. This script never
prints or logs them, and a failed token request deliberately does not echo the
request that carried the secret.

Usage:

    python3 -I tools/blizzard-ids.py probe
    python3 -I tools/blizzard-ids.py names tools/characters.tsv
    python3 -I tools/blizzard-ids.py ids <file-of-creature-ids>

Every response is cached under the cache directory, so a rerun costs nothing.
"""

import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from base64 import b64encode
from pathlib import Path

TOKEN_URL = "https://oauth.battle.net/token"
LOCALE = "en_US"
PAUSE = 0.12  # polite; Blizzard's published ceiling is far above this
UA = "ForAllTheNerds-dev/1.0 (WoW addon development)"


def die(msg):
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def load_env_file(path):
    """Read KEY=VALUE pairs out of a .env file. Missing file is not an error.

    Tolerates blank lines, # comments, a leading `export `, and one layer of
    matching quotes, because those are what people actually write in these.
    """
    if not path.exists():
        return {}
    try:
        text = path.read_text(encoding="utf8")
    except OSError as e:
        die(f"cannot read {path}: {e}")

    out = {}
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("export "):
            line = line[len("export "):].lstrip()
        if "=" not in line:
            continue
        k, v = line.split("=", 1)
        k, v = k.strip(), v.strip()
        if len(v) >= 2 and v[0] == v[-1] and v[0] in "\"'":
            v = v[1:-1]
        if k:
            out[k] = v
    return out


def warn_if_exposed(path):
    """A secret in a file other accounts can read is not much of a secret."""
    try:
        mode = path.stat().st_mode
    except OSError:
        return
    if mode & 0o077:
        print(f"warning: {path} is readable by other accounts on this machine.\n"
              f"         chmod 600 {path}", file=sys.stderr)


# The file is read before anything else is settled, because it supplies the
# region and namespace as well as the credentials. .env.example advertises all
# four, and an earlier version only honoured the two credentials from the file,
# silently ignoring the rest.
ENV_FILE = Path(os.environ.get("BLIZZARD_ENV_FILE", ".env"))
_FILE_ENV = load_env_file(ENV_FILE)
if _FILE_ENV:
    warn_if_exposed(ENV_FILE)
    # Real environment variables win, so a one-off override needs no edit.
    for _k, _v in _FILE_ENV.items():
        os.environ.setdefault(_k, _v)

REGION = os.environ.get("BLIZZARD_REGION", "us")
HOST = f"https://{REGION}.api.blizzard.com"
NAMESPACE = os.environ.get("BLIZZARD_NAMESPACE", f"static-classic1x-{REGION}")
CACHE = Path(os.environ.get("BLIZZARD_CACHE", ".blizzard-cache"))


def token():
    # .env has already been merged in at import time.
    cid = os.environ.get("BLIZZARD_CLIENT_ID")
    secret = os.environ.get("BLIZZARD_CLIENT_SECRET")
    if not cid or not secret:
        die(
            f"No credentials found. Copy .env.example to {ENV_FILE} and fill it in:\n"
            "\n"
            f"    cp .env.example {ENV_FILE}\n"
            f"    chmod 600 {ENV_FILE}\n"
            "\n"
            "then put the two values from https://develop.battle.net (API Access)\n"
            "into it. The file is gitignored and never committed.\n"
            "\n"
            "Environment variables work too and take priority:\n"
            "\n"
            "    export BLIZZARD_CLIENT_ID=... BLIZZARD_CLIENT_SECRET=...\n"
            "\n"
            "Do not paste either value into a chat window."
        )
    body = urllib.parse.urlencode({"grant_type": "client_credentials"}).encode()
    basic = b64encode(f"{cid}:{secret}".encode()).decode()
    req = urllib.request.Request(
        TOKEN_URL,
        data=body,
        headers={"Authorization": f"Basic {basic}", "User-Agent": UA},
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            tok = json.load(r).get("access_token")
    except urllib.error.HTTPError as e:
        # Deliberately does not echo the request: it carries the secret.
        die(f"token request failed: HTTP {e.code}.\n"
            f"Check the id and secret in {ENV_FILE}, or in the environment.")
    if not tok:
        die("token request returned no access_token")
    return tok


def get(tok, path, params=None, cache_key=None):
    """GET a path. Returns (status, parsed-json-or-text). Caches by key."""
    if cache_key:
        f = CACHE / f"{cache_key}.json"
        if f.exists():
            return 200, json.loads(f.read_text())

    q = dict(params or {})
    q.setdefault("namespace", NAMESPACE)
    q.setdefault("locale", LOCALE)
    url = f"{HOST}{path}?{urllib.parse.urlencode(q)}"
    req = urllib.request.Request(
        url, headers={"Authorization": f"Bearer {tok}", "User-Agent": UA}
    )
    time.sleep(PAUSE)
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            data = json.load(r)
    except urllib.error.HTTPError as e:
        return e.code, e.read().decode("utf8", "replace")[:400]
    except urllib.error.URLError as e:
        return 0, str(e)

    if cache_key:
        CACHE.mkdir(parents=True, exist_ok=True)
        (CACHE / f"{cache_key}.json").write_text(json.dumps(data))
    return 200, data


def search_total(data):
    """Total matches for a search response, not just the rows on this page.

    A search result carries page metadata. Counting len(results) after asking
    for a one-row page reports 1 whether there is one match or ten thousand,
    which is exactly the mistake the first two probes made.
    """
    if not isinstance(data, dict):
        return None, {}
    meta = {k: data.get(k) for k in
            ("page", "pageSize", "maxPageSize", "pageCount", "resultCountCapped")
            if k in data}
    for key in ("resultCount", "totalResults", "total"):
        if isinstance(data.get(key), int):
            return data[key], meta
    # No explicit total. pageCount with a known pageSize still bounds it.
    rows = len(data.get("results") or [])
    if isinstance(meta.get("pageCount"), int) and isinstance(meta.get("pageSize"), int):
        if meta["pageCount"] <= 1:
            return rows, meta
        return None, meta  # more than one page, exact total unstated
    return rows, meta


def cmd_probe(tok):
    """Report what this namespace serves, without guessing.

    Two corrections are baked in. Realms are DYNAMIC data, so the control used
    to run against the static namespace and came back empty, which said nothing
    about search. And asking for a one-row page then counting the rows reports
    1 regardless of the real total.
    """
    print(f"region {REGION}, namespace {NAMESPACE}")
    print()

    def show(label, code, note=""):
        print(f"  {label:<30} HTTP {code}  {note}")

    code, data = get(tok, "/data/wow/creature-type/index", cache_key="creature-type-index")
    if code != 200:
        show("creature-type index", code, str(data)[:110])
        print("\n  Stopping: if this fails, nothing else will.")
        return
    show("creature-type index", 200,
         f"{len(data.get('creature_types', []))} types -- credentials work")

    code, data = get(tok, "/data/wow/creature-type/1", cache_key="creature-type-1")
    show("creature-type/1", code,
         "single-document reads work" if code == 200 else str(data)[:110])

    # Control, in the DYNAMIC namespace where realms actually live.
    dyn = NAMESPACE.replace("static-", "dynamic-", 1)
    code, data = get(tok, "/data/wow/search/realm", params={"namespace": dyn})
    total, meta = search_total(data) if code == 200 else (None, {})
    show(f"search/realm in {dyn}", code,
         f"total {total}, meta {meta}" if code == 200 else str(data)[:110])
    control_ok = bool(total)

    # The real question, with no page-size games.
    code, data = get(tok, "/data/wow/search/creature")
    ctotal, cmeta = search_total(data) if code == 200 else (None, {})
    rows = (data.get("results") or []) if code == 200 else []
    show("search/creature (no filter)", code,
         f"total {ctotal}, rows here {len(rows)}, meta {cmeta}"
         if code == 200 else str(data)[:110])

    # What IS that document? If search returns creatures, take an id straight
    # from it and try fetching it, which settles whether by-id is broken or
    # whether those six ids simply are not in this dataset.
    sample_id = None
    if rows:
        d = rows[0].get("data") or {}
        sample_id = d.get("id")
        nm = d.get("name")
        nm = nm.get(LOCALE) if isinstance(nm, dict) else nm
        print(f"    first indexed creature:     id {sample_id}, name {nm!r}")
        print(f"    its fields:                 {sorted(d.keys())}")
        if sample_id is not None:
            code2, data2 = get(tok, f"/data/wow/creature/{sample_id}")
            show(f"creature/{sample_id} (from search)", code2,
                 "by-id works for an id that IS in this dataset" if code2 == 200
                 else "by-id 404s even for an id search just returned")

    # Six ids from the 1.12 database, for contrast.
    missing = 0
    for cid in ["448", "234", "239"]:
        code3, _ = get(tok, f"/data/wow/creature/{cid}")
        if code3 != 200:
            missing += 1
    show("creature/448,234,239 (cmangos)", "---", f"{missing} of 3 not found")

    # Filter syntax, several forms, since the field name is the open question.
    print()
    print("  name filter forms:")
    for params in ({"name.en_US": "Hogger"}, {"name.en_us": "Hogger"},
                   {"name": "Hogger"}, {"name.en_US": "hogger"}):
        code4, data4 = get(tok, "/data/wow/search/creature", params=params)
        t4, _ = search_total(data4) if code4 == 200 else (None, {})
        key = list(params)[0] + "=" + list(params.values())[0]
        print(f"    {key:<26} HTTP {code4}  total {t4}")

    print()
    print("  verdict:")
    if not control_ok:
        print("    The control still returns nothing, so read the rest with care:")
        print("    something broader than creatures may be wrong.")
    if ctotal in (None, 0):
        print("    No creature documents are indexed in this namespace.")
    elif ctotal and ctotal < 100:
        print(f"    Only {ctotal} creature document(s) exist here. The addon needs")
        print("    thousands, so this dataset cannot serve as a roster whatever")
        print("    the filter syntax turns out to be. Dead end.")
    else:
        print(f"    {ctotal} creature documents are indexed. If a name form above")
        print("    returned a total, names mode can use it.")


def read_names(path):
    out = []
    for line in Path(path).read_text(encoding="utf8").splitlines():
        if not line.strip() or line.startswith("#"):
            continue
        p = line.split("\t")
        if len(p) < 3 or p[0] == "zone":
            continue
        out.append(p[2].strip())
    return out


def cmd_names(tok, path):
    names = read_names(path)
    print(f"resolving {len(names)} names against {NAMESPACE}\n")
    print("name\tblizzard_id\tblizzard_name")
    hits = 0
    for name in names:
        code, data = get(tok, "/data/wow/search/creature",
                         params={"name.en_US": name},
                         cache_key="search-" + "".join(
                             c if c.isalnum() else "_" for c in name))
        if code != 200:
            print(f"{name}\t-\tHTTP {code}")
            continue
        res = data.get("results") or []
        if not res:
            print(f"{name}\t-\tno match")
            continue
        d = res[0].get("data", {})
        cid = d.get("id", "-")
        nm = (d.get("name") or {}).get(LOCALE, "")
        print(f"{name}\t{cid}\t{nm}")
        hits += 1
    print(f"\n# resolved {hits} of {len(names)}", file=sys.stderr)


def cmd_ids(tok, path):
    ids = []
    for line in Path(path).read_text(encoding="utf8").splitlines():
        t = line.strip().split("\t")[0]
        if t.isdigit():
            ids.append(t)
    print(f"checking {len(ids)} ids against {NAMESPACE}\n")
    print("id\tblizzard_name\tstatus")
    for cid in ids:
        code, data = get(tok, f"/data/wow/creature/{cid}", cache_key=f"creature-{cid}")
        if code != 200:
            print(f"{cid}\t-\tHTTP {code}")
            continue
        nm = (data.get("name") or {})
        nm = nm.get(LOCALE) if isinstance(nm, dict) else nm
        print(f"{cid}\t{nm}\tok")


def main():
    if len(sys.argv) < 2:
        die(__doc__)
    cmd = sys.argv[1]

    # Check the arguments BEFORE authenticating, or a mistyped command comes
    # back as a credentials error and sends you looking in the wrong place.
    if cmd not in ("probe", "names", "ids"):
        die(f"unknown command {cmd!r}. One of: probe, names, ids.")
    if cmd in ("names", "ids"):
        if len(sys.argv) < 3:
            die(f"usage: blizzard-ids.py {cmd} <file>")
        if not Path(sys.argv[2]).exists():
            die(f"no such file: {sys.argv[2]}")

    tok = token()
    if cmd == "probe":
        cmd_probe(tok)
    elif cmd == "names":
        cmd_names(tok, sys.argv[2])
    else:
        cmd_ids(tok, sys.argv[2])


if __name__ == "__main__":
    main()
