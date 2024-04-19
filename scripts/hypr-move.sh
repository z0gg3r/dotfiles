#!/bin/sh

# Get currrently active workspace
active="$(hyprctl -j activeworkspace | jq .id)"

# If len($active) == 1, zero-pad it
tmp="$(printf '%b' "$active" | tr -d '\n' | wc -c)"
[ "$tmp" = "1" ] && active="0$active"

# Get the mon/id values
mon="$(printf '%b' "$active" | cut -c -1)"
[ -z "$mon" ] && mon="0"
id="$(printf '%b' "$active" | cut -c 2-)"
[ -z "$id" ] && id="$active"

# Change monitor to the one left of it
mon="$(printf '%b 1 -pq' "$mon" | dc)"
[ "$mon" = "-1" ] && mon="2"

hyprctl dispatch movetoworkspace "$mon$id"
