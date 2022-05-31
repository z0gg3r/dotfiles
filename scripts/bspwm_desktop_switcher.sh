#! /bin/sh

MONITORS="$(bspc query -M | while read -r line; do printf "$line,"; done)"

LEFT="$(echo $MONITORS | cut -d, -f1)"
MID="$(echo $MONITORS | cut -d, -f2)"
RIGHT="$(echo $MONITORS | cut -d, -f3)"

current_monitor=$(bspc query -M -m focused.focused)
code="$1"

if [ "$current_monitor" = "$LEFT" ]
then
	case $code in
		1) bspc desktop -f "^1" ;;
		2) bspc desktop -f "^2" ;;
		3) bspc desktop -f "^3" ;;
		4) bspc desktop -f "^4" ;;
		5) bspc desktop -f "^5" ;;
		6) bspc desktop -f "^6" ;;
		7) bspc desktop -f "^7" ;;
		8) bspc desktop -f "^8" ;;
		9) bspc desktop -f "^9" ;;
		0) bspc desktop -f "^10" ;;
	esac
elif [ "$current_monitor" = "$MID" ]
then
	case $code in
		1) bspc desktop -f "^11" ;;
		2) bspc desktop -f "^12" ;;
		3) bspc desktop -f "^13" ;;
		4) bspc desktop -f "^14" ;;
		5) bspc desktop -f "^15" ;;
		6) bspc desktop -f "^16" ;;
		7) bspc desktop -f "^17" ;;
		8) bspc desktop -f "^18" ;;
		9) bspc desktop -f "^19" ;;
		0) bspc desktop -f "^20" ;;
	esac
elif [ "$current_monitor" = "$RIGHT" ]
then
	case $code in
		1) bspc desktop -f "^21" ;;
		2) bspc desktop -f "^22" ;;
		3) bspc desktop -f "^23" ;;
		4) bspc desktop -f "^24" ;;
		5) bspc desktop -f "^25" ;;
		6) bspc desktop -f "^26" ;;
		7) bspc desktop -f "^27" ;;
		8) bspc desktop -f "^28" ;;
		9) bspc desktop -f "^29" ;;
		0) bspc desktop -f "^30" ;;
	esac
fi
