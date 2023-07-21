#!/bin/sh
# touch $HOME/.wallpaper_change

. "$HOME/.local/scripts/wallpaper-exports.sh"

date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
wallpaper="$WALLPAPERS_SRC/$1.png"
ln -sf "$wallpaper" "$WALLPAPERS_DST"
num="$(echo "$1 + 1" | calc -p)"
name="$(lecho -f "$WALLPAPERS_MAP" -l "$num" | cut -d, -f2 | sed 's/^ //g')"
wallpaperlog.sh "$1" "manual"
