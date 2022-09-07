#! /bin/sh
PROG_DIR="$HOME/programs"
BLUE="\033[34;48m"
YELLOW="\033[33;48m"
ERROR="\033[31;48m"
END="\033[0m"

BANNER="==============================================================================="

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
		GIT_CONFIG_GLOBAL="/dev/null" git pull
	else
		printf "%b%b is not a git repo.%b\n" "$ERROR" "$(pwd)" "$END"
	fi
}

curr_dir=$(pwd)
cd "$PROG_DIR" || die

for dir in *
do
	(
	cd "$dir" || die
	git_pull
	printf "%b%b%b\n" "$BLUE" "$BANNER" "$END"
	printf "%b%b%b\n" "$YELLOW" "$BANNER" "$END"
)
done

cd "$curr_dir" || die
