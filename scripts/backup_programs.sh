#! /bin/sh
PROG_DIR="$1"
BAK="$HOME/.program_repos"

die()
{
	echo "$1"
	exit
}

cwd=$(pwd)
cd $PROD_DIR || die "Cannot enter $PROG_DIR."

for dir in *
do
	cd "$dir" || die "Cannot enter $dir"
	if [ -e ".git/" ]
	then
		remote="$(git remote get-url origin)"
		echo "$remote" >> $BAK
	fi
	cd ..
done

cd "$cwd" || die "Cannot enter $cwd"
