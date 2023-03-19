#! /bin/sh
line="$(echo "$1" + 1 | calc -p)"
map="$HOME/.wallpapermap"
lecho -f "$map" -l "$line" | cut -d, -f2 | sed 's/^ //g'
