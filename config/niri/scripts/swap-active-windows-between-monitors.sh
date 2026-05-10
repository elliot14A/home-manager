#!/usr/bin/env sh
set -eu

if ! command -v jq >/dev/null 2>&1; then
  exit 0
fi

workspaces_json="$(niri msg -j workspaces)"

focused_ws="$(printf '%s' "$workspaces_json" | jq -r '.[] | select(.is_focused == true) | @base64' | head -n 1)"
if [ -z "$focused_ws" ]; then
  exit 0
fi

decode_ws() {
  printf '%s' "$1" | base64 -d | jq -r "$2"
}

out_a="$(decode_ws "$focused_ws" '.output')"
win_a="$(decode_ws "$focused_ws" '(.active_window_id // "") | tostring')"

other_ws="$(
  printf '%s' "$workspaces_json" \
    | jq -r --arg out "$out_a" '.[] | select(.output != $out and .is_active == true) | @base64' \
    | head -n 1
)"

if [ -z "$other_ws" ]; then
  exit 0
fi

out_b="$(decode_ws "$other_ws" '.output')"
win_b="$(decode_ws "$other_ws" '(.active_window_id // "") | tostring')"

if [ -z "$win_a" ] || [ "$win_a" = "null" ] || [ -z "$win_b" ] || [ "$win_b" = "null" ]; then
  exit 0
fi

niri msg action move-window-to-monitor --id "$win_a" "$out_b" >/dev/null
niri msg action move-window-to-monitor --id "$win_b" "$out_a" >/dev/null

# Keep you on the original monitor and focus the swapped-in window.
niri msg action focus-monitor "$out_a" >/dev/null 2>&1 || true
niri msg action focus-window --id "$win_b" >/dev/null 2>&1 || true
