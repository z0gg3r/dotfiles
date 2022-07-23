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
		git remote get-url origin
		git pull
	else
		printf "%b%b is not a git repo.%b\n" "$ERROR" "$(pwd)" "$END"
	fi
}

curr_dir=$(pwd)
cd "$PROG_DIR" || die

for dir in *
do
	cd "$dir" || die
	printf "%bEntering %b...%b\n" "$ENTER" "$dir" "$END"
	git_pull
	printf "%bLeaving %b...%b\n" "$LEAVE" "$dir" "$END"
	cd ..
done

cd "$curr_dir" || die
