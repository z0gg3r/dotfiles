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
