#!/bin/sh

name()
{
	case $1 in
		1|11|21) echo  "一" ;;
		2|12|22) echo "二" ;;
		3|13|23) echo "三" ;;
		4|14|24) echo "四" ;;
		5|15|25) echo "五" ;;
		6|16|26) echo "六" ;;
		7|17|27) echo "七" ;;
		8|18|28) echo "八" ;;
		9|19|29) echo "九" ;;
		10|20|30) echo "十" ;;
	esac
}

monitor="$(swaymsg -t get_outputs | jq -r 'map(.focused == true) | index(true)')"
operation="${1}"
number="${2}"

workspace=$(( number + 10 * monitor ))

# [ "${monitor}" != "0" ] && workspace=$(( workspace - 1 ))
workspace="${workspace}:$(name "${workspace}")"

case "${operation}" in
	switch) swaymsg workspace number "${workspace}" ;;
	move) 
		swaymsg move container to workspace "${workspace}"; 
		swaymsg workspace "${workspace}"
		;;
	*) true ;;
esac
