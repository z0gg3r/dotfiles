#! /bin/sh

pwd=$(pwd)

chosen=$(/bin/ls /home/zocki/.config/configures | fzy)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

config=$(cat "/home/zocki/.config/configures/$chosen")

cd "/home/zocki/programs/$chosen" || exit

./configure $config

echo "Configure options were: $config"

cd "$pwd" || exit
