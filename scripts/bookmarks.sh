#!/bin/sh

DB_PATH="$HOME/.config/pmb"

die()
{
#	if [ -z "$1" ]
#	then
#		notify-send "Could not get selection/url. Aborting!"
#	else
#		notify-send "$1"
#	fi
	exit 1
}
db=$(/bin/ls "$DB_PATH"/*.db | replace "$DB_PATH/" ""  | rofi -dmenu)
if [ -z "$db" ]
then
	die "No db was chosen"
fi

PMB="pmb -f "$DB_PATH/$db""

chosen=$($PMB -p field=name | rofi -dmenu)
if [ -z "$chosen" ] 
then
	die "No bookmark was chosen"
fi

url=$($PMB -s name="$chosen",field=url)

if [ -z "$url" ]
then
	die "No url could be queried"
fi

xdotool type --delay 0 "$url"
xdotool key KP_Enter
