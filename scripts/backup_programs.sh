#! /bin/sh
PROG_DIR="$HOME/programs"
BAK="$HOME/.program_repos"

die()
{
	echo "$1"
	exit
}
echo "Prog. Dir.:$PROG_DIR"
echo "Backup: $BAK"
cwd=$(pwd)
cd "$PROG_DIR" || die "Cannot enter $PROG_DIR."

for dir in *
do
	echo "Entering $dir"
	cd "$dir" || die "Cannot enter $dir"
	if [ -e ".git/" ]
	then
		remote="$(git remote get-url origin)"
		echo "$remote" >> "$BAK"
	fi
	cd ..
done

cd "$cwd" || die "Cannot enter $cwd"
