#! /bin/sh
touch /home/zocki/.wallpaper_change
date=$(date +%Y-%m-%d)
time=$(date +%H:%M:%S)
dir="/home/zocki/wallpapers"
wallpaper="$dir/$1.png"
ln -sf "$wallpaper" /home/zocki/.wallpaper.png
num="$(echo "$1 + 1" | calc -p)"
name="$(lecho -c -f /home/zocki/.wallpapermap -l "$num" | trim)"
echo "[Manual Change]    $date @ $time -> $wallpaper ($name)" >> /home/zocki/.config/wallpaperlog
