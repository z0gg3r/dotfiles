#!/bin/sh

pwd=$(pwd)

chosen=$(/bin/ls $HOME/.config/configures | fzy)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

config=$(cat "$HOME/.config/configures/$chosen")

cd "$HOME/programs/$chosen" || exit

./configure $config

echo "Configure options were: $config"
echo "CFLAGS: $CFLAGS"
echo "LDFLAGS: $LDFLAGS"
echo "CXXFLAGS: $CXXFLAGS"

cd "$pwd" || exit
