#! /bin/sh
line="$(echo "$1" + 1 | calc -p)"
map="$HOME/.wallpapermap"
lecho -c -f "$map" -l "$line"
