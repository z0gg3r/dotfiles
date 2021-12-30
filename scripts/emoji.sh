#! /bin/sh

chosen="$(cut -d ';' -f1 /home/zocki/.config/emojimap | rofi -dmenu | sed "s/ .*//")"

[ -z "$chosen" ] && exit

xdotool type "$chosen"
