#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]
then
	export DOTOOL="wtype -d 15"
	export DOTOOL_KEY="wtype -k"
	export CLIPTOOL="wl-copy"
	export BGTOOL="daemonize /usr/bin/swaybg -m fill -i"
	export KILL_WALLPAPER="killall swaybg; killall mpvpaper"
else
	export DOTOOL="xdotool type --delay 15"
	export DOTOOL_KEY="xdotool key"
	export CLIPTOOL="xclip -selection clipboard"
	export BGTOOL="feh --no-fehbg --bg-fill"
	export KILL_WALLPAPER=""
fi

do_tool()
{
	if [ "${XDG_SESSION_TYPE}" = "wayland" ]
	then
		do_tool_wayland "${@}"
	else
		do_tool_x11 "${@}"
	fi

}

do_tool_key()
{
	if [ "${XDG_SESSION_TYPE}" = "wayland" ]
	then
		do_tool_key_wayland "${@}"
	else
		do_tool_key_x11 "${@}"
	fi
}

cliptool()
{
	if [ "${XDG_SESSION_TYPE}" = "wayland" ]
	then
		cliptool_wayland "${@}"
	else
		cliptool_x11 "${@}"
	fi
}

bgtool()
{
	if [ "${XDG_SESSION_TYPE}" = "wayland" ]
	then
		bgtool_wayland "${@}"
	else
		bgtool_x11 "${@}"
	fi
}

kill_wallpaper()
{
	if [ "${XDG_SESSION_TYPE}" = "wayland" ]
	then
		kill_wallpaper_wayland "${@}"
	else
		kill_wallpaper_x11 "${@}"
	fi
}

do_tool_wayland()
{
	if pgrep -f startplasma-wayland
	then
		# https://git.sr.ht/~geb/dotool
		printf 'type %b' "${@}" | wdotool
	else
		wtype -d 15 "${@}"
	fi
}

do_tool_key_wayland()
{
	if pgrep -f startplasma-wayland > /dev/null
	then
		printf 'type %b' "${@}" | wdotool
	else
		wtype -k "${@}"
	fi
}

cliptool_wayland()
{
	wl-copy "${@}"
}

bgtool_wayland()
{
	# assuming ${1} is the file
	case "${1}" in
		*mp4) mpvpaper -p -f -o 'no-audio loop' 'ALL' "${@}" ;;
		*)  daemonize /usr/bin/swaybg -m fill -i "${@}" ;;
	esac
}

kill_wallpaper_wayland()
{
	killall  swaybg
	killall mpvpaper
}

do_tool_x11()
{
	xdotool type --delay 15 "${@}"
}

do_tool_key_x11()
{
	xdotool key "${@}"
}

cliptool_x11()
{
	xclip --selection clipboard "${@}"
}

bgtool_x11()
{
	feh --no-fehbg --bg-fill "${@}"
}

kill_wallpaper_x11()
{
	:
}

export do_tool
export do_tool_key
export cliptool
export bgtool
export kill_wallpaper
