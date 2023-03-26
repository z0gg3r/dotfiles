#!/bin/sh
filename="$1"
num_spaces=$(((`tput cols`-`awk 'length > m { m = length } END { print m }' "$filename"`)/2))
spaces=""
if [ $num_spaces -gt 0 ]
then
	spaces=$(printf "%*s" $num_spaces " ")
fi
sed "s/^/$spaces/" "$filename" | less
