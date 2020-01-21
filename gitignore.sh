#! /bin/sh
gi="https://www.gitignore.io/api/"
while (( $# > 0 ))
do
	gi=$gi"$1,"
	shift
done
gi="${gi::-1}"
curl -sL "$gi"
