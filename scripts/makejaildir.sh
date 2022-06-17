#! /bin/sh
BASE="$HOME/Documents"

if [ -z "$1" ]
then
	echo "No target specified"
	exit 1
fi

target="$BASE/$1"

if [ -d "$target" ]
then
	echo "$1 already exists"
	exit 1
fi

cp -r "$HOME/.local/share/skel" "$target"
