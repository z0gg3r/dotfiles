#!/bin/sh

if pgrep "xinit" > /dev/null
then
	false
elif pgrep "sway" > /dev/null
then
	true
else
	false
fi
