#!/bin/sh

. "$HOME/.config/scripts/wallpaper-exports.sh"

date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
lim="$(/bin/ls "$WALLPAPERS_SRC" | grep -c png)"
num="$(rnum -r "$lim")"
wallpaper="$num.png"
name="$(lecho -f "$WALLPAPERS_MAP" -l $num | cut -d, -f2 | trim)"
ln -sf "$WALLPAPERS_SRC/$wallpaper" "$WALLPAPERS_DST"
wallpaperlog.sh "$num"
