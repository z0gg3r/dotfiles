#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]
then
	export DOTOOL="wtype -d 15"
	export DOTOOL_KEY="wtype -k"
	export CLIPTOOL="wl-clopy"
	export BGTOOL="daemonize /usr/bin/swaybg -m fill -i"
	export KILL_WALLPAPER="killall swaybg; killall mpvpaper"
else
	export DOTOOL="xdotool type --delay 15"
	export DOTOOL_KEY="xdotool key"
	export CLIPTOOL="xclip -selection clipboard"
	export BGTOOL="feh --no-fehbg --bg-fill"
	export KILL_WALLPAPER=""
fi
