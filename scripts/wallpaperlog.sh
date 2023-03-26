#!/bin/sh

WALLPAPERLOG="$HOME/.config/wallpaperlog"

if [ -z "$2" ]
then
	mode="[A]"
else
	mode="[M]"
fi

date="$(date +%Y-%m-%d) @ $(date +%H:%M:%S)"

wallpaper="$1"
wallpaper2="$(echo "$1 1 +pq" | dc)"
name="$(lecho -f "$HOME/.wallpapermap" -l "$wallpaper2" | cut -d, -f2 | trim)"
wallpaper="$(pad -s "$wallpaper" -c "0" -l 5 -m left)"

printf "%b %b -> %b.png\t(%b)\n" "$mode" "$date" "$wallpaper" "$name" >> $WALLPAPERLOG
