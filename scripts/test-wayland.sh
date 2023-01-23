#! /bin/sh

if pgrep "sway" > /dev/null
then
	true
else
	false
fi
