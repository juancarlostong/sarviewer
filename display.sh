#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "example: $0 5727.2"
  exit 1
fi

INPUT="$1"
TEMP=$(mktemp -d)
pushd $TEMP
aws-okta exec fullstack -- aws s3 cp --recursive "s3://optly-fs-travisci-artifacts/optimizely/full-stack-benchmark-suite/${INPUT%.*}/$INPUT/sar/" .
open $TEMP/home/travis/sarviewer/graphs/*.png
