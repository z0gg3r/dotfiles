#!/bin/sh

id=$(timer.sh start)

if ! [ "$1" = "update" ]
then
	doas emerge -atv "$@"
else
	doas emerge -autND @world
fi

timer.sh "$id"
