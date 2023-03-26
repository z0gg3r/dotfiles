#!/bin/sh
gi="https://gitignore.io/api/$1"

shift
while [ $# -ge 1 ]
do
	gi="$gi,$1"
	shift
done
curl -sL "$gi"
