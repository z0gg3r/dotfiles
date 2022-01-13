#! /bin/sh
if [ -z "$PROGRAMS" ]
then
	PROG_DIR="$HOME/programs"
else
	PROG_DIR="$PROGRAMS"
fi
BAK="$HOME/.program_repos"

die()
{
	echo "Cannot enter $1"
	exit 1
}

update()
{
	rm "$BAK"
	cwd=$(pwd)
	cd "$PROG_DIR" || die "$PROG_DIR"
	for dir in *
	do
		cd "$dir" || die "$dir"
		if [ -e ".git/" ]
		then
			echo "Entering $dir..."
			remote="$(git remote get-url origin)"
			echo "${remote%/} $dir" >> "$BAK"
		fi
		cd ..
	done
	cd "$cwd" || die "$cwd"
}

deploy()
{
	cwd=$(pwd)
	cd "$PROG_DIR" || die "$PROG_DIR"
	cat "$BAK" | while read -r line
	do
		rep=$(echo "$line" | cut -d ' ' -f2)
		if ! [ -e "$rep" ]
		then
			git clone "$line"
		fi
	done
	cd "$cwd" || die "$cwd"
}

if [ -z "$1" ]
then
	update
fi

case $1 in
	"update") update ;;
	"up" ) update ;;
	"deploy" ) deploy ;;
	"dep" ) deploy ;;
	*) update ;;
esac
