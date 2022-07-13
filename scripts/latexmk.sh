#! /bin/sh

build_all()
{
	for file in *
	do
		ltx_build "$file"
	done
}

ltx_build()
{
	latexmk -xelatex "$1"
	latexmk -c
}

if [ -z "$1" ]
then
	build_all
	exit
fi

if ! [ -e "$1" ]
then
	echo "$1 does not exist"
	exit 1
fi

latexmk -xelatex "$1"
latexmk -c
