#!/bin/sh
die()
{
	echo "Could not enter directory $1"
	exit 1
}

size_of_dir()
{
	cwd="$(pwd)"
	cd "$1" || die "$1"
	for dir in *
	do
		/usr/bin/du -sh "$dir"
	done | sort -h
	dir=$(du -sh "." | cut -d "$(printf "\t")" -f1)
	printf "%b\t%b\n" "$dir" "$1"
	cd "$cwd" || die "$cwd"
}

if [ -z "$1" ]
then
	exit 1
fi
echo "sizeof $1"

if [ -d "$1" ]
then
	size_of_dir "$1"
else
	/usr/bin/du -sh "$1"
fi

shift
while [ "$#" -ge 1 ]
do
	echo "sizeof $1"
	if [ -d "$1" ]
	then
		size_of_dir "$1"
	else
		/usr/bin/du -sh "$1"
	fi
	shift
done
