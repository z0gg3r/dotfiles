#!/bin/sh

. "$HOME/.local/scripts/wallpaper-exports.sh"

wallpaper="$(readlink "$WALLPAPERS_DST" | cut -b 24- | replace ".png" "")"
wallpaper_id="$(readlink "$WALLPAPERS_SRC/$wallpaper.png" | xargs basename)"
line="$(echo "$wallpaper" + 1 | calc -p)"
description="$(lecho -f "$WALLPAPERS_MAP" -l "$line" | cut -d, -f2 | trim)"

printf 'Current wallpaper is %b (currently index %b), depicting %b%b%b\n' "$wallpaper_id" "$wallpaper" "'" "$description" "'"
