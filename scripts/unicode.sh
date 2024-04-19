#!/bin/sh
. "$HOME/.local/scripts/remapper.sh"

chosen="$(rofi -normalize-match -matching fuzzy -dmenu < "$HOME/.config/codemap" | cut -d ';' -f1)"
[ -z "$chosen" ] && exit
$DOTOOL "$chosen"
printf '%b' "$chosen" | $CLIPTOOL
