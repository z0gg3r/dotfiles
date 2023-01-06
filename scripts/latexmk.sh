#! /bin/sh

build_all()
{
	for file in *.tex
	do
		ltx_build "$file"
	done
}

ltx_build()
{
	latexmk -bibtex -gg -quiet -xelatex "$1"
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

ltx_build "$1"
