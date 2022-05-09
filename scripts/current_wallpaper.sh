#! /bin/sh
wallpaper="$(readlink $HOME/.wallpaper.png | cut -b 24- | replace ".png" "")"
line="$(echo "$wallpaper" + 1 | calc -p)"
description="$(lecho -f $HOME/.wallpapermap -l "$line" -c | trim | replace " " "_")"

echo "Current wallpaper is: $wallpaper.png or $description.png"
