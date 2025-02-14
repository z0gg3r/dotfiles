#!/bin/sh

title="$1"
url="$2"
db="$HOME/.config/pmb/bookmarks.db"

if [ -z "$title" ]
then
	printf "Enter title: "
	read -r title
fi

if [ -z "$url" ]
then
	printf "Enter url: "
	read -r url
fi

if [ -z "$title" ] || [ -z "$url" ]
then
	echo "Aborting."
else
	pmb -f "$db" -a n="$title",u="$url"
fi
