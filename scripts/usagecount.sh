#!/bin/sh

usage()
{
	if [ -n "$1" ]
	then
		grep -a "$prog" "$HISTFILE"  | cut -d ';' -f2 | grep -a -c -E "^$prog"
	else
		grep -a "doas" "$HISTFILE" | cut -d ';' -f2 | grep -a -c -E "^doas"
	fi
}

prog="$1"

count=$(usage "$prog")
echo "Usage of $prog is $count time(s)."

if [ -z "$1" ]
then
	exit
fi

shift
while [ "$#" -ge 1 ]
do
	prog="$1"
	count=$(usage "$prog")
	echo "Usage of $prog is $count time(s)."
	shift
done
