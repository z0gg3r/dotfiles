#! /bin/sh

chosen=$(sqlite3 -csv "$HOME/.config/pmb/stores.db" "SELECT * FROM bookmark;" | fzy)

if [ -z "$chosen" ]
then
	exit
fi

chosen=$(echo "$chosen" | cut -d, -f1)

sqlite3 "$HOME/.config/pmb/stores.db" "DELETE FROM bookmark WHERE id=$chosen;"
