#! /bin/sh
if ! [ -e "$1" ]
then
	echo "$1 does not exist"
	exit 1
fi

latexmk -xelatex "$1"
latexmk -c
