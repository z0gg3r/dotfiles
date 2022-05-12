#! /bin/sh

# chosen="$(cut -d ';' -f1 /$HOME/.config/codemap | rofi -dmenu | sed "s/ .*//")"
chosen="$(cut -d ';' -f1 $HOME/.config/codemap | rofi -dmenu)"

[ -z "$chosen" ] && exit

xdotool type "$chosen"
