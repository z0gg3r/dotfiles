#!/bin/sh
WTTR="https://wttr.in"
CITY="$1"
COUNTRY="$2"

if [ -z "$CITY" ]
then
	exit 1
fi

if [ -z "$COUNTRY" ]
then
	curl -sL "$WTTR/$CITY"
else
	curl -sL "$WTTR/$CITY,$COUNTRY"
fi
