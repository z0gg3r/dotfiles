#! /bin/sh
PROG_DIR="$HOME/programs"
BAK="$HOME/.program_repos"

die()
{
	echo "$1"
	exit
}

update()
{
	rm "$BAK"
	cwd=$(pwd)
	cd "$PROG_DIR" || die "Cannot enter $PROG_DIR"
	for dir in *
	do
		echo "Entering $dir"
		cd "$dir" || die "Cannot enter $dir"
		if [ -e ".git/" ]
		then
			remote="$(git remote get-url origin)"
			echo "${remote%/} $dir" >> "$BAK"
		fi
		cd ..
	done
	cd "$cwd" || die "Cannot enter $cwd"
}

deploy()
{
	cwd=$(pwd)
	uris=$(cat "$BAK")
	cd "$PROG_DIR" || die "Cannot enter $PROG_DIR"
	for uri in $uris
	do
		dir=$(cut -d " " -f2 "$uri")
		if ! [ -e "$dir" ]
		then
			git clone "$uri"
		fi
	done
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
esac
