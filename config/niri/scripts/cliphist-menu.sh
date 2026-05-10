#!/usr/bin/env sh
set -eu

if ! command -v cliphist >/dev/null 2>&1; then
  exit 0
fi

if ! command -v wl-copy >/dev/null 2>&1; then
  exit 0
fi

if ! command -v fuzzel >/dev/null 2>&1; then
  exit 0
fi

sel="$(cliphist list | fuzzel --dmenu --prompt 'clipboard> ')" || exit 0

if [ -z "$sel" ]; then
  exit 0
fi

printf '%s' "$sel" | cliphist decode | wl-copy
