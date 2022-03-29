#!/bin/bash

set -euxo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$DIR")"

cd ${PROJECT_DIR}

mkdir -p cc

rm -rf cc

mkdir -p cc

# copy cc assets
cp -r ${PROJECT_DIR}/../clinic-service-ui/packages/clinic-web/dist ${PROJECT_DIR}/cc

# rm .map files
cd ${PROJECT_DIR}/cc/dist && rm *.map
