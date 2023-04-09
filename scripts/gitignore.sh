#!/bin/sh

[ -z "$1" ] && exit 1

legacy()
{
	gi="https://gitignore.io/api/$1"
	shift
	while [ $# -ge 1 ]
	do
		gi="$gi,$1"
		shift
	done

	curl -sL "$gi"
}

if ! command -V trurl > /dev/null
then
	legacy "$@"
	exit
fi

BASE_URI="https://gitignore.io/api"
request=""

request=$(trurl "$BASE_URI" --query-separator , -a "query=$1")

shift
while [ $# -ge 1 ]
do
	request=$(trurl "$request" --query-separator , -a "query=$1")
	shift
done

echo "$request" | tr '?' '/' | xargs curl -sL
