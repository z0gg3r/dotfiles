#! /bin/sh

usage()
{
	if ! [ -z "$1" ]
	then
		echo "$(grep "$prog" < /home/zocki/.zsh_history | cut -d ';' -f2 | grep -c -E "^$prog")"
	else
		echo "$(grep "doas" < /home/zocki/.zsh_history | cut -d ';' -f2 | grep -c -E "^doas")"
	fi
}

prog="$1"

count=$(usage "$prog")
echo "Usage of $prog is $count time(s)."
shift
while [ "$#" -ge 1 ]
do
	prog="$1"
	count=$(usage "$prog")
	echo "Usage of $prog is $count time(s)."
	shift
done
