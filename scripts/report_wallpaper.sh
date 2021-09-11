#! /bin/sh
line="$(echo "$1" + 1 | calc -p)"
map="/home/zocki/.wallpapermap"
lecho -c -f "$map" -l "$line"
