#!/usr/bin/env bash
# pod-dx-play.sh <file>
# Typewriter-print a Pod data-exchange transcript line by line, then hold the window open.
# Used by pod-data-exchange.sh to render the conference live in a Terminal window.
set -euo pipefail

F="${1:?usage: pod-dx-play.sh <transcript-file>}"

clear 2>/dev/null || true
printf '\033[1;36m'            # bright cyan
echo "================================"
echo "   POD DATA EXCHANGE  // live"
echo "================================"
printf '\033[0m\n'

if [ ! -f "$F" ]; then
  echo "[ error: transcript not found: $F ]"
  exit 1
fi

while IFS= read -r line; do
  printf '%s\n' "$line"
  sleep 0.35
done < "$F"

printf '\n\033[2m[ transcript saved: %s ]\033[0m\n' "$F"
