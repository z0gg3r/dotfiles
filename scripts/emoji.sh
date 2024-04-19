#!/bin/sh
. "$HOME/.local/scripts/remapper.sh"

chosen="$(cut -d ';' -f1 "$HOME/.config/emojimap" | rofi -dmenu | sed "s/ .*//")"
[ -z "$chosen" ] && exit
$DOTOOL "$chosen"
