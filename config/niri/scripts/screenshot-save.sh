#!/usr/bin/env sh
set -eu

kind="${1:-}"
case "$kind" in
  screen|window) ;;
  *) exit 2 ;;
esac

dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"

ts="$(date '+%Y-%m-%d %H-%M-%S')"
out="$dir/Screenshot from $ts.png"

case "$kind" in
  screen) niri msg action screenshot-screen >/dev/null ;;
  window) niri msg action screenshot-window >/dev/null ;;
esac

# niri always copies the screenshot to the clipboard.
wl-paste --type image/png > "$out"
