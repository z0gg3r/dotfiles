#!/bin/sh

usage()
{
	if [ -n "$1" ]
	then
		grep -a "$prog" "$HISTFILE"  | cut -d ';' -f2 | grep -a -c -E "^$prog"
	else
		cut -d' ' -f1 < "$HISTFILE" | sort | uniq -c | sort -r
	fi
}

[ -z "$1" ] && usage

prog="$1"
usage "$1"
