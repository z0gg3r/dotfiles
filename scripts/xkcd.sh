#!/bin/sh
START="https://xkcd.com"
END="info.0.json"
IMAGE_VIEWER="img2sixel"

if [ -z "$1" ]
then
	URI="$START/$END"
else
	URI="$START/$1/$END"
fi

curl -s "$URI" | jq ".img" | xargs wget -q -O /tmp/xkcd.png
$IMAGE_VIEWER /tmp/xkcd.png && rm /tmp/xkcd.png
