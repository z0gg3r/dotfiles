#!/bin/sh
cache="$(sort -u < "$HOME/.local/share/run.sh.cache")"
chosen="$(echo "$cache" | rofi -dmenu)"

if [ -z "$chosen" ]
then
	exit 1
fi

if ! [ -e "$chosen" ]
then
	exit 1
fi
printf "%b\n%b\n" "$chosen" "$cache" > "$HOME/.local/share/run.sh.cache"
exec "$chosen"
