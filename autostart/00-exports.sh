#! /bin/sh


start()
{
	start2 "$(which "$1")"
}

export start

start2()
{
	daemonize "$1"
}

export start2

start3()
{
	daemonize "$(which "$1")" "$@"
}

export start3

_disable()
{
	exit
}

export _disable
