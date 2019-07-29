#!/usr/bin/env bash
set -euo pipefail

sleep 5
for sar_pid in $(pidof sar); do
  kill "$sar_pid"
done
