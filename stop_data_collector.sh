#!/usr/bin/env bash
set -euo pipefail

for sar_pid in $(pidof sar); do
  kill "$sar_pid"
done
