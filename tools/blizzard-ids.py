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


def cmd_probe(tok):
    """Find out what this namespace actually serves, and say so honestly.

    An earlier version called HTTP 200 on the search endpoint a success even
    when it returned zero rows. A 200 with no results proves nothing: it looks
    identical whether the document type is unindexed or the filter is wrong.
    So the checks below are ordered to separate those cases, with a realm
    search as the control, since the docs say realm IS searchable.
    """
    print(f"region {REGION}, namespace {NAMESPACE}")
    print()
    verdict = {}

    def show(label, code, note=""):
        print(f"  {label:<26} HTTP {code}  {note}")

    # 1. Credentials and namespace.
    code, data = get(tok, "/data/wow/creature-type/index", cache_key="creature-type-index")
    if code != 200:
        show("creature-type index", code, str(data)[:120])
        print("\n  Stopping: if this fails, nothing else will.")
        return
    show("creature-type index", 200, f"{len(data.get('creature_types', []))} types -- credentials work")

    # 2. A single document in this namespace, to separate "no creature data"
    #    from "single reads do not work here at all".
    code, data = get(tok, "/data/wow/creature-type/1", cache_key="creature-type-1")
    show("creature-type/1", code,
         "single-document reads work" if code == 200 else str(data)[:120])

    # 3. Does ANY creature document resolve? Hogger is 448 in the 1.12 world
    #    database. Sample a few more of the ids from tools/creature-ids.tsv in
    #    case Blizzard's coverage is as sparse as Creature.db2's 189 rows.
    ids = ["448"]
    f = Path("tools/creature-ids.tsv")
    if f.exists():
        for line in f.read_text(encoding="utf8").splitlines():
            t = line.strip().split("\t")[0]
            if t.isdigit() and t not in ids:
                ids.append(t)
            if len(ids) >= 6:
                break
    found = []
    for cid in ids:
        code, data = get(tok, f"/data/wow/creature/{cid}")
        if code == 200:
            nm = data.get("name")
            nm = nm.get(LOCALE) if isinstance(nm, dict) else nm
            found.append((cid, nm, sorted(data.keys())))
            show(f"creature/{cid}", 200, f"name {nm!r}")
        else:
            show(f"creature/{cid}", code, "not found" if code == 404 else str(data)[:90])
    verdict["byid"] = bool(found)
    if found:
        fields = found[0][2]
        print(f"    fields on a creature:    {fields}")
        loc = [k for k in fields if any(
            w in k.lower() for w in ("zone", "area", "map", "location", "spawn"))]
        print(f"    location-ish fields:     {loc or 'NONE -- no placement data, as expected'}")

    # 4. Control. The Classic search guide says realm is supported, so if this
    #    returns nothing the search machinery itself is the problem.
    code, data = get(tok, "/data/wow/search/realm", params={"_pageSize": "1"})
    realms = len(data.get("results", [])) if code == 200 else 0
    verdict["realm_search"] = realms > 0
    show("search/realm (control)", code,
         f"{realms} result(s) -- search machinery works" if realms else
         (str(data)[:120] if code != 200 else "0 results -- search itself is not working"))

    # 5. Decisive: an UNFILTERED creature search. Zero here means the document
    #    type is not indexed, whatever the endpoint index claims.
    code, data = get(tok, "/data/wow/search/creature", params={"_pageSize": "1"})
    unfiltered = len(data.get("results", [])) if code == 200 else 0
    verdict["creature_search_any"] = unfiltered > 0
    show("search/creature (no filter)", code,
         f"{unfiltered} result(s)" if code == 200 else str(data)[:120])

    # 6. And the filtered case we actually want.
    code, data = get(tok, "/data/wow/search/creature", params={"name.en_US": "Hogger"})
    named = len(data.get("results", [])) if code == 200 else 0
    verdict["creature_search_named"] = named > 0
    show("search/creature (Hogger)", code,
         f"{named} result(s)" if code == 200 else str(data)[:120])

    # Conclusion, drawn from the combination rather than from any one status.
    print()
    print("  verdict:")
    if verdict.get("creature_search_named"):
        print("    Creature search works. Use: blizzard-ids.py names tools/characters.tsv")
    elif verdict.get("creature_search_any"):
        print("    Creature documents ARE indexed, but the name filter matched")
        print("    nothing. The filter syntax is wrong, not the endpoint.")
    elif verdict.get("byid"):
        print("    Creature search returns nothing, so there is no name-to-id")
        print("    resolution. Lookup by id works, so use:")
        print("      blizzard-ids.py ids tools/creature-ids.tsv")
    elif verdict.get("realm_search"):
        print("    Search works for realms and not for creatures, and no creature")
        print("    id resolved either. This namespace carries no usable creature")
        print("    data, which matches the Classic search guide over the endpoint")
        print("    index. This route is a dead end; nothing else to try here.")
    else:
        print("    Credentials are fine but neither search nor creature lookup")
        print("    returned anything. Check BLIZZARD_NAMESPACE.")


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
