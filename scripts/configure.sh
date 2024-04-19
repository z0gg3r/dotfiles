#!/bin/sh
#shellcheck disable=2086
#shellcheck disable=2153

CONFIGURE_CONFIGS="$HOME/.local/share/configure.sh"
CONFIGURE_LIST="$(find  "$CONFIGURE_CONFIGS" -mindepth 1 -type d)"

get_opts()
{
	cat "$CONFIGURE_CONFIGS/$1/opts" 2> /dev/null || printf ''
}

get_cmake_opts()
{
	cat "$CONFIGURE_CONFIGS/$1/cmake-opts" 2> /dev/null || printf ''
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
	cmake_opts="$(get_cmake_opts "$1")"
	cflags="$(get_cflags "$1")"
	ldflags="$(get_ldflags "$1")"
	cxxflags="$(get_cxxflags "$1")"

	configure "$opts" "$cflags" "$ldflags" "$cxxflags" "$cmake_opts"
}

configure()
{
	cmake_opts="$5"
	cflags="CFLAGS=\"$2\""
	ldflags="LDFLAGS=\"$3\""
	cxxflags="CXXFLAGS=\"$4"
	flags="$cflags $ldflags $cxxflags"
	if [ -n "$cmake_opts" ]
	then
		if [ -e "CMakeLists.txt" ]
		then
			cmake_configure "$cmake_opts" "$2" "$3" "$4"
		else
			printf 'Opts: %b\n%b\n%b\n%b\n' "$cmake_opts" "$cflags" "$ldflags" "$cxxflags"
		fi
	elif [ -e './configure' ]
	then
		./configure $1 "$flags"
		CFLAGS="$2" LDFLAGS="$3" CXXFLAGS="$4" ./configure $1
		printf 'Configure options were: %b\n' "$1"
		printf 'CFLAGS: %b\n' "$2"
		printf 'LDFLAGS: %b\n' "$3"
		printf 'CXXFLAGS: %b\n' "$4"
	else
		printf './configure %b %b\n' "$1" "$flags"
	fi
}

chosen="$(printf '%b' "$CONFIGURE_LIST" | fzy | xargs basename)"

if [ -z "$chosen" ]
then
	echo "Aborting."
	exit
fi

do_configure "$chosen"
