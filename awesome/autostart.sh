#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# $1 is the process name
# $2 is the binary name, if it is given. If not, $1 is the binary name
function start {
	if [ -z "$2" ]
	then
		pgrep -u "$USER" "$1" > /dev/null || daemonize $(which "$1")
	else
		pgrep -u "$USER" "$1" > /dev/null || daemonize $(which "$2")
	fi
}

run nm-applet
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on

# If we have set the wallpaper_change lock we do not call
# wallpaper.sh and instead remvoe it. If we have not set it
# we just call wallpaper.sh - after that we will set the
# wallpaper to .wallpaper.png
if ! [ -e /home/zocki/.wallpaper_change ]
then
	/bin/sh /home/zocki/.config/scripts/wallpaper.sh
else
	rm /home/zocki/.wallpaper_change
fi
feh --bg-fill /home/zocki/.wallpaper.png &

start flameshot
start caffeine
start uim-toolbar-gtk uim-toolbar-gtk3-systray
