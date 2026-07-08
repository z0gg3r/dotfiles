#!/bin/sh

. "$HOME/.local/scripts/remapper.sh"

DB_PATH="$HOME/.config/pmb"

die()
{
	exit 1
}

db="bookmarks.db"
PMB="pmb -f $DB_PATH/$db"

chosen=$($PMB -p field=name | rofi -dmenu)
if [ -z "$chosen" ] 
then
	die "No bookmark was chosen"
fi

url=$($PMB -s name="$chosen",field=url)

if [ -z "$url" ]
then
	die "No url could be queried"
fi

do_tool "$url"
# do_tool_key KP_ENTER
