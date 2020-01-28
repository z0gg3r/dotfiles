#! /bin/sh
gi="https://www.gitignore.io/api/"
gi=$gi"$1"
while [ $# -ge 1 ]
do
	shift
	gi=$gi",$1"
done
curl -sL "$gi"
