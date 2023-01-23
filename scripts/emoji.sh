#! /bin/sh

if test-wayland.sh
then
	chosen="$(cut -d ';' -f1 "$HOME/.config/emojimap" | wofi -d | sed "s/ .*//")"
	[ -z "$chosen" ] && exit
	wtype "$chosen"
else
	chosen="$(cut -d ';' -f1 "$HOME/.config/emojimap" | rofi -dmenu | sed "s/ .*//")"
	[ -z "$chosen" ] && exit
	xdotool type "$chosen"
fi
