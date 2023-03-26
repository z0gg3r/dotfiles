#!/bin/sh
# touch $HOME/.wallpaper_change
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="$HOME/wallpapers"
wallpaper="$dir/$1.png"
ln -sf "$wallpaper" $HOME/.wallpaper.png
num="$(echo "$1 + 1" | calc -p)"
name="$(lecho -f "$HOME/.wallpapermap" -l "$num" | cut -d, -f2 | sed 's/^ //g')"
wallpaperlog.sh "$1" "manual"
