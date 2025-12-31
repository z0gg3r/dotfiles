#!/bin/sh
. "$HOME/.local/scripts/remapper.sh"

chosen="$(rofi -normalize-match -matching fuzzy -dmenu < "$HOME/.config/codemap" | cut -d ';' -f1)"
[ -z "$chosen" ] && exit
do_tool "$chosen"
printf '%b' "$chosen" | cliptool
