#!/bin/sh

kscripts="/usr/src/linux/scripts"

prog="$1"
shift

"$kscripts/$prog" "$@" 
