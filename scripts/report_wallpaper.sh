#!/bin/sh

. "$HOME/.local/scripts/wallpaper-exports.sh"

line="$(echo "$1" + 1 | calc -p)"
lecho -f "$WALLPAPERS_MAP" -l "$line" | cut -d, -f2 | sed 's/^ //g'
