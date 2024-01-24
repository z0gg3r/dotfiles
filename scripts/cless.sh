#!/bin/sh
if [ -z "$1" ]
then
	echo "No arguments provided"
	exit 1
fi

if ! [ -e "$1" ]
then
	printf '%b does not exist\n' "$1"
	exit 1
fi

cat "$1" | fold -s | while read -r line
do
	pad -m center -s "$line"
done | less
