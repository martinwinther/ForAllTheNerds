#!/usr/bin/env bash
# Build a CurseForge-ready zip by hand, for manual uploads.
#
# Mirrors what .pkgmeta tells the BigWigs packager to do: stage only the addon
# files into a folder named ForAllTheNerds, and leave the tooling behind.
#
#   bash tools/build-zip.sh
#
# Writes ForAllTheNerds-<version>.zip in the repository root.

set -euo pipefail

cd "$(dirname "$0")/.."
ROOT="$(pwd)"
NAME="ForAllTheNerds"

VERSION="$(grep -m1 '^## Version:' "$NAME.toc" | sed 's/^## Version:[[:space:]]*//')"
if [ -z "$VERSION" ]; then
	echo "could not read '## Version:' out of $NAME.toc" >&2
	exit 1
fi

echo "building $NAME $VERSION"

# Refuse to package something that does not validate.
if command -v lua >/dev/null 2>&1; then
	echo "running the validator first..."
	lua tools/validate.lua >/dev/null || { echo "validation FAILED, not packaging" >&2; exit 1; }
	echo "validation passed"
else
	echo "warning: no lua interpreter found, skipping validation" >&2
fi

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
DEST="$STAGE/$NAME"
mkdir -p "$DEST"

# The addon itself, and nothing else.
cp "$NAME.toc" "$DEST/"
cp ./*.lua "$DEST/"
cp -R Data UI "$DEST/"
cp LICENSE "$DEST/"
# Install notes ride along so they reach whoever gets the zip directly.
[ -f INSTALL.md ] && cp INSTALL.md "$DEST/"

find "$STAGE" -name '.DS_Store' -delete

OUT="$ROOT/$NAME-$VERSION.zip"
rm -f "$OUT"
( cd "$STAGE" && zip -r -X -q "$OUT" "$NAME" )

echo
echo "wrote $OUT"

# Capture the listing once. Piping into `grep -q` under `set -o pipefail` is a
# trap: grep exits the moment it matches, unzip takes SIGPIPE, and the whole
# pipeline reports failure even though the zip is fine.
LISTING="$(unzip -l "$OUT")"

printf '%s\n' "$LISTING" | tail -3
echo

if grep -q " $NAME/$NAME\.toc\$" <<<"$LISTING"; then
	echo "ok: $NAME.toc is at the right depth"
else
	echo "PROBLEM: $NAME.toc is not where the game expects it" >&2
	exit 1
fi

# Nothing from the development side should have crept in.
STRAYS="$(grep -E "$NAME/(tools|media|\.git)" <<<"$LISTING" || true)"
if [ -n "$STRAYS" ]; then
	echo "PROBLEM: development files are in the zip:" >&2
	printf '%s\n' "$STRAYS" >&2
	exit 1
fi
echo "ok: no tooling, media or dotfiles in the package"

FILES="$(grep -c '^ ' <<<"$LISTING" || true)"
echo "ok: $(printf '%s' "$FILES") entries packaged"
