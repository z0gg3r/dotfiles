#! /bin/sh
touch $HOME/.wallpaper_change
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="$HOME/wallpapers"
wallpaper="$dir/$1.png"
ln -sf "$wallpaper" $HOME/.wallpaper.png
num="$(echo "$1 + 1" | calc -p)"
name="$(lecho -c -f $HOME/.wallpapermap -l "$num" | trim)"
printf "[Manual Change]\t%b @ %b -> %b\t(%b)\n" "$date" "$time" "$wallpaper" "$name" >> "$HOME/.config/wallpaperlog"
