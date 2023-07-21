#!/bin/sh

. "$HOME/.local/scripts/wallpaper-exports.sh"

wallpaper="$(readlink "$WALLPAPERS_DST" | cut -b 24- | replace ".png" "")"
line="$(echo "$wallpaper" + 1 | calc -p)"
description="$(lecho -f "$WALLPAPERS_MAP" -l "$line" | cut -d, -f2 | trim | replace " " "_")"

echo "Current wallpaper is: $wallpaper.png or $description.png"
