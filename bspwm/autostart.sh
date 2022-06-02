#!/bin/sh

# $1 is the process name
# $2 is the binary name
# $3+ are options

# run nm-applet
pgrep /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 > /dev/null || daemonize /usr/lib/polkit-gnome/polkti-gnome-authentication-agent-1
daemonize "$(which  numlockx)" on
pgrep uim-toolbar > /dev/null || daemonize "$(which uim-toolbar-gtk3-systray)"
pgrep flameshot > /dev/bull || daemonize "$(which flameshot)"
pgrep caffeine > /dev/null || daemonize "$(which caffeine)"
pgrep dunst > /dev/null || daemonize "$(which dunst)"

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

