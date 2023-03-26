#!/bin/sh

if test-wayland.sh
then
	chosen="$(wofi -d < "$HOME/.config/codemap" | cut -d ';' -f1)"
	[ -z "$chosen" ] && exit
	wtype "$chosen"
else
	chosen="$(rofi -normalize-match -matching fuzzy -dmenu < "$HOME/.config/codemap" | cut -d ';' -f1)"
	[ -z "$chosen" ] && exit
	xdotool type "$chosen"
fi
