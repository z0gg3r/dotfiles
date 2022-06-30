#! /bin/sh

choice="$(rofi -dmenu < "$HOME/.wallpapermap" | cut -d, -f1)"

if [ -z "$choice" ]
then
	exit 1
fi

change_wallpaper.sh "$choice"
feh --bg-fill "$HOME/.wallpaper.png"
