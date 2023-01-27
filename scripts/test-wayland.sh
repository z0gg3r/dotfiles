#! /bin/sh

if pgrep "xinit" > /dev/null
then
	false
else
	true
fi
