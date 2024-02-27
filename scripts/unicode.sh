#!/bin/sh

chosen="$(rofi -normalize-match -matching fuzzy -dmenu < "$HOME/.config/codemap" | cut -d ';' -f1)"
[ -z "$chosen" ] && exit
xdotool type "$chosen"
printf '%b' "$chosen" | xclip -selection clipboard
