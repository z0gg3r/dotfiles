#! /bin/sh
URI_BASE="https://time.is"

if [ -z "$1" ]
then
	exit 1
fi

curl -sL "$URI_BASE/$1" | hq time text
