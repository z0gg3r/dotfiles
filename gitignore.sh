#! /bin/sh
gi="https://www.gitignore.io/api/"
while (( $# > 0 ))
do
	gi=$gi"$1,"
	shift
done
curl -sL "$gi"
