#! /bin/sh

time_stamp()
{
	file="/tmp/$1"
	if [ -e "$file" ]
	then
		start=$(cat "$file")
		now=$(/bin/date "+%s")
		diff=$(echo "$now - $start" | calc -p)
		printf "Took %bs\n" "$diff"
		rm "$file"
	else
		/bin/date "+%s" > "$file"
	fi
}

if [ -z "$1" ]
then
	exit 1
fi

case $1 in
	"start")
		id=$(uuidgen)
		time_stamp "$id"
		echo "$id"
		;;
	*)
		time_stamp "$1" ;;
esac
