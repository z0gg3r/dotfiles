#! /bin/sh


start()
{
	start2 "$(which "${1}")"
}

export start

start2()
{
	daemonize "${1}"
}

export start2

start3()
{
	daemonize "$(which "${1}")" "${@}"
}

export start3

_disable()
{
	exit
}

export _disable

start_openrc()
{
	rc-service --ifnotstarted --user "${1}" start
}

export start_openrc

force_start_openrc()
{
	rc-service --ifstarted --user "${1}" stop
	start_openrc "${1}"
}

export force_start_openrc
