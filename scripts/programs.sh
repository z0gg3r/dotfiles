#!/bin/sh
PROG_DIR="$HOME/programs"
BLUE="\033[34;48m"
YELLOW="\033[33;48m"
ERROR="\033[31;48m"
END="\033[0m"

BANNER="$(pad -s "" -c "=" -l 80)"

die()
{
	echo "Could not enter a directory!"
	exit 1
}

git_pull()
{
	if [ -e .git ]
	then
		cur="$(git log | head -n1 | cut -d' ' -f1)"
		git remote get-url origin
		GIT_CONFIG_GLOBAL="/dev/null" git pull --no-rebase --ff --recurse-submodules
		new="$(git log | head -n1 | cut -d' ' -f1)"

		[ "$cur" != "$new" ] && printf '%b\t->\t%b..%b\n' "$(pwd)" "$cur" "$new" | tee -a /tmp/update
	else
		printf "%b%b is not a git repo.%b\n" "$ERROR" "$(pwd)" "$END"
	fi
}

rm -f /tmp/update
cwd=$(pwd)
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

[ -e /tmp/update ] && printf 'The following programs have been updated:\n' && cat /tmp/update
rm -f /tmp/update
cd "$cwd" || die
