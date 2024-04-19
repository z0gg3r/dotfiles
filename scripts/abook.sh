#!/bin/sh
TMP_FILE="/tmp/abook"
PERS_FILE="$HOME/.config/abook/addressbook"
. "$HOME/.local/scripts/remapper.sh"

die()
{
	notify-send "Nothing selected, Aborting."
	rm "$TMP_FILE"
	exit 1
}

abook --convert --infile "$PERS_FILE" --outfile "$TMP_FILE" --outformat csv

chosen=$(cut -d ',' -f1 "$TMP_FILE" | replace "\"" "" | rofi -dmenu)
if [ -z "$chosen" ]
then
	die
fi

mail=$(abook --datafile "$PERS_FILE" --mutt-query "$chosen" | cut -f1 | rofi -dmenu)

if [ -z "$mail" ]
then
	die
fi

rm "$TMP_FILE"

$DOTOOL "$mail"
