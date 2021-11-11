#!/bin/bash

# The original speedscope/scripts/build-release reports error when running `node scripts/generate-file-format-schema-json.js` line,
# so I cope it here and comment that line code.

set -euxo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$DIR")"
cd ${PROJECT_DIR}/speedscope

OUTDIR=`pwd`/dist/release

# Typecheck
node_modules/.bin/tsc --noEmit

# Run unit tests
npm run jest

# Clean out the release directory
rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"

# Place info about the current commit into the build dir to easily identify releases
npm ls -depth -1 | head -n 1 | cut -d' ' -f 1 > "$OUTDIR"/release.txt
date >> "$OUTDIR"/release.txt
git rev-parse HEAD >> "$OUTDIR"/release.txt

# Place a json schema for the file format into the build directory too
# node scripts/generate-file-format-schema-json.js > "$OUTDIR"/file-format-schema.json

# Build the compiled assets
node_modules/.bin/parcel build assets/index.html --no-cache --out-dir "$OUTDIR" --public-url "./" --detailed-report