#!/usr/bin/env bash
# pod-data-exchange.sh <slug>
# Read a Pod data-exchange transcript from stdin, save it to the user's Documents folder,
# and open a new Terminal window that streams the conference live.
#
# Usage:
#   printf '%s\n' "...transcript..." | pod-data-exchange.sh my-topic
#
# Prints the saved file path on stdout.
set -euo pipefail

# Sanitize the slug to a safe filename fragment.
RAW_SLUG="${1:-session}"
SLUG="$(printf '%s' "$RAW_SLUG" | tr -c 'A-Za-z0-9_-' '-' | sed 's/-\{2,\}/-/g; s/^-//; s/-$//')"
[ -n "$SLUG" ] || SLUG="session"

DIR="$HOME/Documents"
mkdir -p "$DIR"
OUT="$DIR/pod-data-exchange-${SLUG}-$(date +%Y%m%d-%H%M%S).md"

# Capture the transcript from stdin into the Documents file.
cat > "$OUT"

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLAY="$HERE/pod-dx-play.sh"
chmod +x "$PLAY" 2>/dev/null || true

# Open a live window. macOS: a new Terminal window playing the transcript.
if command -v osascript >/dev/null 2>&1; then
  osascript \
    -e "tell application \"Terminal\" to do script \"bash '$PLAY' '$OUT'\"" \
    -e "tell application \"Terminal\" to activate" >/dev/null 2>&1 || bash "$PLAY" "$OUT"
else
  # No GUI terminal available: stream inline as a fallback.
  bash "$PLAY" "$OUT"
fi

echo "$OUT"
