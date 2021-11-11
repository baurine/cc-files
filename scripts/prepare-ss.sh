#!/bin/bash

set -euxo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$DIR")"

# npm install
cd ${PROJECT_DIR}/speedscope && npm install

# build speedscope
cd ${PROJECT_DIR} && ./scripts/build-release.sh
# rm .map files
cd ${PROJECT_DIR}/speedscope/dist/release && rm *.map
