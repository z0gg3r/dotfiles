#!/bin/sh

list="$(printf "random\nkeep\n%b" "$(cat "$HOME"/.wallpapermap)")"
choice="$(echo "$list" | rofi -dmenu | cut -d, -f1)"

if [ -z "$choice" ]
then
	exit 1
fi

if [ "$choice" = "random" ]
then
	wallpaper.sh
elif [ "$choice" = "keep" ]
then
	true
else
	change_wallpaper.sh "$choice"
fi
feh --bg-fill "$HOME/.wallpaper.png"
