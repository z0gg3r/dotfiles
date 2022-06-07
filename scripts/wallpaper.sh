#! /bin/sh
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="$HOME/wallpapers"
lim="$(/usr/bin/ls $dir | grep -c png)"
num="$(rnum -r "$lim")"
rep="$(echo "$num + 1" | calc -p)"
wallpaper="$num.png"
name="$(lecho -c -f $HOME/.wallpapermap -l $rep | trim)"
ln -sf "$dir/$wallpaper" $HOME/.wallpaper.png
printf "[Automatic Change] %b @ %b -> %b/%b\t(%b)\n" "$date" "$time" "$dir" "$wallpaper" "$name" >> "$HOME/.config/wallpaperlog"
