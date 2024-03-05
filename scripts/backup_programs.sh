#!/bin/sh
if [ -z "$PROGRAMS" ]
then
	PROG_DIR="$HOME/programs"
else
	PROG_DIR="$PROGRAMS"
fi
BAK="$HOME/.program_repos"

die()
{
	printf 'Cannot enter %b\n' "$1"
	exit 1
}

update()
{
	list="$(find "$PROG_DIR" -mindepth 1 -type d)"
	rm "$BAK"
	printf '%b\n' "$list" | while read -r dir
	do
		(
		_dir="$(basename "$dir")"
		cd "$dir" || die "$dir"
		if [ -e ".git/" ]
		then
			printf 'Entering %b...\n' "$_dir"
			remote="$(git remote get-url origin)"
			echo "${remote%/} $_dir" >> "$BAK"
		fi
		)
	done
}

update
