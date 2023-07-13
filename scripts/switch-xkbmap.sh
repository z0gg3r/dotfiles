#!/bin/sh

change_xkb_map()
{
	setxkbmap "$1"
}

get_xkb_map()
{
	setxkbmap -print -verbose 10 | grep layout | cut -d: -f2 | trim
}

toggle_xkb_map()
{
	map="$(get_xkb_map)"
	if [ "$map" = "us" ]
	then
		change_xkb_map ja us
	else
		change_xkb_map us
	fi
}

if [ -z "$1" ]
then
	toggle_xkb_map
else
	switch_xkb_map "$1"
fi
