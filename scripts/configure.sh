#! /bin/sh

pwd=$(pwd)

chosen=$(/bin/ls /home/zocki/.config/configures | rofi -dmenu)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

config=$(cat "/home/zocki/.config/configures/$chosen")

cd "/home/zocki/programs/$chosen" || exit

./configure $config

cd "$pwd" || exit
