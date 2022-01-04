#! /bin/sh
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="/home/zocki/wallpapers"
lim="$(/usr/bin/ls $dir | grep -c png)"
num="$(rnum -r "$lim")"
rep="$(echo "$num + 1" | calc -p)"
wallpaper="$num.png"
name="$(lecho -c -f /home/zocki/.wallpapermap -l $rep | trim)"
ln -sf "$dir/$wallpaper" /home/zocki/.wallpaper.png
echo "[Automatic Change] $date @ $time -> $dir/$wallpaper ($name)" >> /home/zocki/.config/wallpaperlog
