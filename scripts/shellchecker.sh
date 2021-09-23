#! /bin/sh
SCRIPT_DIR="$HOME/.config/scripts"

die()
{
	echo "Could not enter $1"
	exit
}

cwd=$(pwd)
cd "$SCRIPT_DIR" || die "$SCRIPT_DIR"
for file in *.sh
do
	echo "$file"
	echo "Shellcheck:"
	shellcheck "$file"
	echo "Checkbashisms"
	checkbashisms "$file"
done
cd "$cwd" || die "$cwd"
