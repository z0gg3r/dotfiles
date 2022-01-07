#! /bin/sh
SCRIPT_DIR="$HOME/.config/scripts"

die()
{
	echo "Could not enter $1"
	exit
}

check_all()
{
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
}

check_script()
{
	cwd=$(pwd)
	cd "$SCRIPT_DIR" || die "$SCRIPT_DIR"
	for file in *.sh
	do
		echo "shellcheck $file"
		shellcheck "$file"
	done
	cd "$cwd" || die "$cwd"
}

check_bashisms()
{
	cwd=$(pwd)
	cd "$SCRIPT_DIR" || die "$SCRIPT_DIR"
	for file in *.sh
	do
		echo "checkbashisms $file"
		checkbashisms "$file"
	done
	cd "$cwd" || die "$cwd"
}

if [ -z "$1" ]
then
	check_all
	exit
fi

case $1 in
	"check") check_script ;;
	"bash") check_bashisms ;;
	*) check_both ;;
esac

