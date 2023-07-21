#!/bin/sh

if ! command -V png2ff > /dev/null
then
	exit 1
fi

if ! command -V lel > /dev/null
then
	exit 1
fi

. "$HOME/.local/scripts/wallpaper-exports.sh"

chosen="$(rofi -normalize-match -matching fuzzy -dmenu < "$WALLPAPERS_MAP")"

image="$WALLPAPERS_SRC/$(echo "$chosen" | cut -d, -f1 | sed 's/ //g')"

png2ff < "$image.png" > /tmp/image.ff

lel /tmp/image.ff

rm /tmp/image.ff
