#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -eq 1 ]; then
  INPUT="$1"
  TEMP=$(mktemp -d)
  pushd $TEMP
  aws-okta exec fullstack -- aws s3 cp --recursive "s3://optly-fs-travisci-artifacts/optimizely/full-stack-benchmark-suite/${INPUT%.*}/$INPUT/mprof/" .
  open $TEMP/home/travis/mprof/*.png
else
  echo "example: $0 589.1"
fi
