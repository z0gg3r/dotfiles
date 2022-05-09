#! /bin/sh

title="$1"
url="$2"
db="$3"

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

if [ -z "$db" ]
then
	printf "Enter database: "
	read -r db
fi

if [ -z "$db" ]
then
	db="$HOME/.config/pmb/bookmarks.db"
else
	db="$HOME/.config/pmb/$db.db"
fi

if [ -z "$title" ] || [ -z "$url" ]
then
	echo "Aborting."
else
	pmb -f "$db" -a n="$title",u="$url"
fi
