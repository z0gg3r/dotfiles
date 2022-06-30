#! /bin/sh

WALLPAPERLOG="$HOME/.config/wallpaperlog"

if [ -z "$2" ]
then
	mode="[A]"
else
	mode="[M]"
fi

date="$(date +%Y-%m-%d) @ $(date +%H:%M:%S)"

wallpaper="$1"
name="$(lecho -c -f $HOME/.wallpapermap -l "$wallpaper" | trim)"

printf "%b %b -> %b.png\t(%b)\n" "$mode" "$date" "$wallpaper" "$name" >> $WALLPAPERLOG
