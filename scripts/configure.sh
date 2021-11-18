#! /bin/sh

pwd=$(pwd)

chosen=$(/bin/ls /home/zocki/.config/configures | rofi -dmenu)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

config=$(lecho -l 1 < "/home/zocki/.config/configures/$chosen")

#env_add=$(lecho -l 2 < "/home/zocki/.config/configures/$chosen")

cd "/home/zocki/programs/$chosen" || exit

#"$env_add" ./configure $config
./configure $config

echo "Configure options were: $config"
#if ! [ -z "$env_add" ]
#then
#	echo "Enviorment modification was: $env_add"
#fi

cd "$pwd" || exit
