#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]
then
	export DOTOOL="wtype -d 15"
	export CLIPTOOL="wl-clopy"
	export BGTOOL="swaybg -m fill -i"
else
	export DOTOOL="xdotool type --delay 15"
	export CLIPTOOL="xclip -selection clipboard"
	export BGTOOL="feh --no-fehbg --bg-fill"
fi
