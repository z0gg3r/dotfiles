#!/bin/sh
#shellcheck disable=2086
#shellcheck disable=2153

CONFIGURE_REGISTER="$HOME/.config/configure.sh"
CONFIGURE_CONFIGS="$HOME/.local/share/configure.sh"

get_opts()
{
	cat "$CONFIGURE_CONFIGS/$1/opts"
}

get_cflags()
{
	cat "$CONFIGURE_CONFIGS/$1/cflags" 2> /dev/null || printf '%b' "$CFLAGS"
}

get_ldflags()
{
	cat "$CONFIGURE_CONFIGS/$1/ldflags" 2> /dev/null || printf '%b' "$LDFLAGS"
}

get_cxxflags()
{
	cat "$CONFIGURE_CONFIGS/$1/cxxflags" 2> /dev/null || printf '%b' "$CXXFLAGS"
}

do_configure()
{
	opts="$(get_opts "$1")"
	cflags="$(get_cflags "$1")"
	ldflags="$(get_ldflags "$1")"
	cxxflags="$(get_cxxflags "$1")"

	configure "$opts" "$cflags" "$ldflags" "$cxxflags"
}

configure()
{
	if [ -e './configure' ]
	then
		CFLAGS="$2" LDFLAGS="$3" CXXFLAGS="$4" ./configure $1
		printf "Configure options were: %b\n" "$1"
		printf "CFLAGS: %b\n" "$2"
		printf "LDFLAGS: %b\n" "$3"
		printf "CXXFLAGS: %b\n" "$4"
	else
		printf 'CFLAGS="%b" LDFLAGS="%b" CXXFLAGS="%b" ./configure %b\n' "$2" "$3" "$4" "$1"
	fi
}

chosen=$(find "$CONFIGURE_REGISTER" -type f | fzy | xargs basename)

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

do_configure "$chosen"
