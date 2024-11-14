#!/bin/sh

if pgrep "xinit" > /dev/null
then
	false
elif pgrep "sway" > /dev/null
then
	true
elif pgrep "river" > /dev/null
then
	true
elif pgrep "waybar" > /dev/null
then
	true
else
	false
fi
