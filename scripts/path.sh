#! /bin/sh
if [ -z "$1" ]
then
	echo "No Options supplied, only echoing path!"
	echo "$PATH"
else
	echo "Appending $1 to the path!"
	echo "$1:$PATH" > /home/zocki/.config/env/path
fi
