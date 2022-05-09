#! /bin/sh

chosen="$(cut -d ';' -f1 $HOME/.config/emojimap | rofi -dmenu | sed "s/ .*//")"

[ -z "$chosen" ] && exit

xdotool type "$chosen"
