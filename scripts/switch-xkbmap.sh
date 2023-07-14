#!/bin/sh

get_xkb_map()
{
	setxkbmap -print -verbose 10 | grep variant | cut -d: -f2 | trim
}

toggle_xkb_map()
{
	map="$(get_xkb_map)"

	if [ "$map" = "us" ]
	then
		setxkbmap ja kana
	else
		setxkbmap ja us
	fi
}

if [ -z "$1" ]
then
	toggle_xkb_map
else
	setxkbmap "$1"
fi
