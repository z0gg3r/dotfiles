#!/bin/sh

me=$(whoami)

if [ "$me" = "root" ]
then
	SCANLIST="/tmp/scanlist"
else
	SCANLIST="$HOME/.local/share/cvechecker/scanlist"
fi

list=$(find / -path /mnt -prune -o -path /media -prune -o -type f -perm -o+x)
proc_ver=$(cat /proc/version)

echo "$list" > "$SCANLIST"
echo "$proc_ver" >> "$SCANLIST"
