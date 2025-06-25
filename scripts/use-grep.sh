#!/bin/sh

if ! command -V ag > /dev/null 2> /dev/null
then
	grep "${1}" /etc/portage/package.use/*
else
	ag "${1}" /etc/portage/package.use
fi
