#! /bin/sh
URI_BASE="https://time.is"

if [ -z "$1" ]
then
	exit 1
fi

/home/zocki/.config/newsboat/surf.sh "$URI_BASE/$1"
