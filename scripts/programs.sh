#! /bin/sh
PROG_DIR="/home/zocki/programs"
ENTER="\033[34;48m"
LEAVE="\033[33;48m"
ERROR="\033[31;48m"
END="\033[0m"

die()
{
	echo "Could not enter a directory!"
	exit
}

git_pull()
{
	if [ -e .git ]
	then
		echo "$(git remote get-url origin)"
		git pull
	else
		echo -e "$ERROR $(pwd) is not a git repo. $END"
	fi
}

curr_dir=$(pwd)
cd "$PROG_DIR" || die

for dir in *
do
	cd "$dir" || die
	echo -e "$ENTER Entering $dir $END"
	git_pull
	echo -e "$LEAVE Leaving $dir $END"
	cd ..
done

cd "$curr_dir" || die
