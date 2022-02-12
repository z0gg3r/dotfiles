#! /bin/sh
cache="$(cat "$HOME/.local/share/run.sh.cache" | sort -u)"
chosen="$(echo "$cache" | rofi -dmenu)"

if [ -z "$chosen" ]
then
	exit 1
fi

if ! [ -e "$chosen" ]
then
	exit 1
fi
echo "$chosen\n$cache" > "$HOME/.local/share/run.sh.cache"
exec "$chosen"
