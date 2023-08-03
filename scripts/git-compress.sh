#!/bin/sh

_du()
{
	du -sh .git | replace ".git" "$1"
}

[ -z "$1" ]  && exit

! [ -d "$1" ] && exit

! [ -e "$1/.git" ] && exit

(cd "$1" || exit; _du "$1"; /usr/bin/git repack -AdflF; _du "$1")
