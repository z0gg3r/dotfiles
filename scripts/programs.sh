#! /bin/sh
PROG_DIR="$HOME/programs"
ENTER="\033[34;48m"
LEAVE="\033[33;48m"
ERROR="\033[31;48m"
END="\033[0m"

die()
{
	echo "Could not enter a directory!"
	exit 1
}

git_pull()
{
	if [ -e .git ]
	then
		echo "$(git remote get-url origin)"
		git pull
	else
		echo "$ERROR $(pwd) is not a git repo. $END"
	fi
}

curr_dir=$(pwd)
cd "$PROG_DIR" || die

for dir in *
do
	cd "$dir" || die
	echo "$ENTER Entering $dir $END"
	git_pull
	echo "$LEAVE Leaving $dir $END"
	cd ..
done

cd "$curr_dir" || die
