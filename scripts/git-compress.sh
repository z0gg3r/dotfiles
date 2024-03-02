#!/bin/sh

_du()
{
	du -sh .git | replace ".git" "$1"
}

_run()
{
	[ -z "$1" ]  && return

	! [ -d "$1" ] && return

	! [ -e "$1/.git" ] && return

	(cd "$1" || return; _du "$1"; /usr/bin/git repack -AdflF; _du "$1")
}

[ $# -eq 0 ] && exit 1

while [ $# -ge 1 ]
do
	_run "$1"
	shift
done
