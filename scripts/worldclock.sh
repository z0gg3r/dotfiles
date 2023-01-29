#! /bin/sh
URI_BASE="https://time.is"

if [ -z "$1" ]
then
	exit 1
fi
echo "Local Time: $(date +%T)"
printf "%b: " "$1"
curl -sL "$URI_BASE/$1" -A "$SURF_USERAGENT" | htmlq --text time
