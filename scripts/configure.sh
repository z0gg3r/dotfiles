#!/bin/sh

pwd=$(pwd)

chosen=$(find "$HOME/.config/configures" | fzy)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

#config=$(cat "$HOME/.config/configures/$chosen")
config="$(cat "$chosen")"

cd "$HOME/programs/$(basename "$chosen")" || exit

./configure $config

echo "Configure options were: $config"
echo "CFLAGS: $CFLAGS"
echo "LDFLAGS: $LDFLAGS"
echo "CXXFLAGS: $CXXFLAGS"

cd "$pwd" || exit
