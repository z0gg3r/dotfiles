#! /bin/sh

# chosen="$(cut -d ';' -f1 /home/zocki/.config/codemap | rofi -dmenu | sed "s/ .*//")"
chosen="$(cut -d ';' -f1 /home/zocki/.config/codemap | rofi -dmenu)"

[ -z "$chosen" ] && exit

xdotool type "$chosen"
