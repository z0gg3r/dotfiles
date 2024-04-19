#!/bin/sh

LEFT='53'
MIDDLE='82'
RIGHT='24'

active="$(hyprctl -j monitors | grep -n '"focused": true,' | cut -d: -f1)"

action="$1"
code="$2"

if [ "$active" = "$LEFT" ]
then
	hyprctl dispatch "$action" "$code"
elif [ "$active" = "$MIDDLE" ]
then
	hyprctl dispatch "$action" "1$code"
elif [ "$active" = "$RIGHT" ]
then
	hyprctl dispatch "$action" "2$code"
fi
