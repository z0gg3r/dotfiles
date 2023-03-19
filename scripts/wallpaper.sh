#! /bin/sh
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="$HOME/wallpapers"
lim="$(/bin/ls $dir | grep -c png)"
num="$(rnum -r "$lim")"
wallpaper="$num.png"
name="$(lecho -f $HOME/.wallpapermap -l $num | cut -d, -f2 | trim)"
ln -sf "$dir/$wallpaper" $HOME/.wallpaper.png
wallpaperlog.sh "$num"
