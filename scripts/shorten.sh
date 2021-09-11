#! /bin/sh

if [ -z "$1" ]
then
	echo "No URL specified!"
	exit
fi

uri="$1"

short="$(curl -sL "https://v.gd/create.php?format=simple&url=$uri")"

echo "$short"
