#! /bin/sh

MONITORS="$(bspc query -M | while read -r line; do printf "%b," "$line"; done)"

LEFT="$(echo $MONITORS | cut -d, -f1)"
MID="$(echo $MONITORS | cut -d, -f2)"
RIGHT="$(echo $MONITORS | cut -d, -f3)"

current_monitor=$(bspc query -M -m focused.focused)
code="$1"

if [ "$current_monitor" = "$LEFT" ]
then
	case $code in
		1) bspc node -d  "^1" --follow ;;
		2) bspc node -d  "^2" --follow ;;
		3) bspc node -d  "^3" --follow ;;
		4) bspc node -d  "^4" --follow ;;
		5) bspc node -d  "^5" --follow ;;
		6) bspc node -d  "^6" --follow ;;
		7) bspc node -d  "^7" --follow ;;
		8) bspc node -d  "^8" --follow ;;
		9) bspc node -d  "^9" --follow ;;
		0) bspc node -d  "^10" --follow ;;
	esac
elif [ "$current_monitor" = "$MID" ]
then
	case $code in
		1) bspc node -d  "^11" --follow ;;
		2) bspc node -d  "^12" --follow ;;
		3) bspc node -d  "^13" --follow ;;
		4) bspc node -d  "^14" --follow ;;
		5) bspc node -d  "^15" --follow ;;
		6) bspc node -d  "^16" --follow ;;
		7) bspc node -d  "^17" --follow ;;
		8) bspc node -d  "^18" --follow ;;
		9) bspc node -d  "^19" --follow ;;
		0) bspc node -d  "^20" --follow ;;
	esac
elif [ "$current_monitor" = "$RIGHT" ]
then
	case $code in
		1) bspc node -d  "^21" --follow ;;
		2) bspc node -d  "^22" --follow ;;
		3) bspc node -d  "^23" --follow ;;
		4) bspc node -d  "^24" --follow ;;
		5) bspc node -d  "^25" --follow ;;
		6) bspc node -d  "^26" --follow ;;
		7) bspc node -d  "^27" --follow ;;
		8) bspc node -d  "^28" --follow ;;
		9) bspc node -d  "^29" --follow ;;
		0) bspc node -d  "^30" --follow ;;
	esac
fi
