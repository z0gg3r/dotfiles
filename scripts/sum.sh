#!/bin/sh

if ! [ -e "$1" ]
then
	echo "$1 does not exist"
fi

if [ -z "$2" ]
then
	echo "Cannot determine which field to sum."
fi

CSV="$1"
FIELD="$2"
DELIM="$3"

if [ -z "$DELIM" ]
then
	DELIM=","
fi

cut -d "$DELIM" -f "$FIELD" "$CSV" | paste -s -d + | calc -p
