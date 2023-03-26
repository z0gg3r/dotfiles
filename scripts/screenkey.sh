#!/bin/sh
if ! pgrep -u "$USER" "screenkey" > /dev/null
then
	notify-send "Starting screenkey..."
	daemonize "$(which screenkey)"
else
	notify-send "Killing screenkey..."
	killall screenkey
fi
