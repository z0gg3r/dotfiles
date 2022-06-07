#! /bin/sh

chosen="$(rofi -dmenu < "$HOME/.config/codemap" | cut -d ';' -f1)"

[ -z "$chosen" ] && exit

xdotool type "$chosen"
