#!/bin/sh
remove_auto()
{
	echo "Remove Autotools stuff"
	echo "rm -f config.h.in Makefile.in"
	echo "rm -f aclocal.m4 configure config.log config.status"
	echo "rm -rf autom4te*.cache"
	echo "rm -rf build-aux"
	echo "rm -rf src/.deps"
	rm -f config.h.in Makefile.in
	rm -f aclocal.m4 configure config.log config.status
	rm -rf autom4te*.cache
	rm -rf build-aux
	rm -rf src/.deps
}

add_auto()
{
	echo "Reconfigure Autotools"
	echo "mkdir build-aux"
	echo "autoreconf -vi"
	mkdir build-aux
	autoreconf -vi
}

help()
{
	echo "Run 'autogen.sh' to reconfigure"
	echo "Run 'autogen.sh remove' to remove generated files"
	echo "Run 'autogen.sh add' to achieve the same as running without args"
	echo "Run 'autogen.sh help' to show this"
}

if [ -z "$1" ]
then
	remove_auto
	add_auto
	exit
fi

case $1 in
	remove) remove_auto ;;
	add) remove_auto; add_auto ;;
	help) help ;;
	*) help ;;
esac
