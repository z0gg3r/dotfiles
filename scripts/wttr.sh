#!/bin/sh
WTTR="https://wttr.in"
CITY="$1"

if [ -z "$CITY" ]
then
	exit 1
fi

if [ -z "$2" ]
then
	curl -sL "$WTTR/$CITY"
else
	curl -sL "$WTTR/$CITY,$2"
fi
