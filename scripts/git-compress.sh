#!/bin/sh
TARGET="$1"

die()
{
	echo "$1"
	exit 1
}

colour_format()
{
	if [ 1 -eq "$(echo "$1 > 0" | bc)" ]
	then
		echo "\033[31;48m$1\033[0m"
	elif [ 1 -eq "$(echo "$1 < 0" | bc)" ]
	then
		echo "\033[32;48m$1\033[0m"
	else
		echo "\033[35;48m$1\033[0m"
	fi
}

size_format()
{
	choice="dir"
	if [ -z "$2" ]
	then
		choice="single"
		num="$1"
	else
		num="$(echo "$1" | cut -d "$(printf "\t")" -f1)"
		dir="$(echo "$1" | cut -d "$(printf "\t")" -f2)"
	fi
	unit=""

	if [ "$choice" = "single" ]
	then
		num=$(printf "%b" "$num")
		echo "$(colour_format "$num")$unit"
	else
		printf "%b%b\t%b" "$num" "$unit" "$dir"
	fi
}

size_diff()
{
	if [ -e "/tmp/diff" ]
	then
		printf "+" >> /tmp/diff
	fi
	before="$(echo "$1" | cut -d "$(printf "\t")" -f1)"
	after="$(echo "$2" | cut -d "$(printf "\t")" -f1)"
	diff=$(echo "$after - $before" | calc -p)
	printf "%b" "$diff" >> "/tmp/diff"
	printf "%b\n" "$(size_format "$diff")"

}

git_compress()
{
	cd "$1" || die "cannot cd into $1"
	if ! [ -e ".git" ]; then return; fi
	before=$(du -s ".git")
	start=$(/bin/date "+%s")
	printf "before:\t%b\n" "$(size_format "$before" ".")" | replace ".git" "$1"
	git repack -AdflF 2> /dev/null
	after=$(du -s ".git")
	end=$(/bin/date "+%s")
	time_diff=$(echo "$end - $start" | calc -p)
	cd "$2" || die "cannot cd into $2"
	printf "after:\t%b\n" "$(size_format "$after" ".")" | replace ".git" "$1"
	echo "diff:$(printf "\t")$(size_diff "$before" "$after")"
	printf "took %bs\n" "$time_diff"
}

if [ -z "$TARGET" ]
then
	die "Please provide an Argument."
elif [ -e "$TARGET/.git" ]
then
	git_compress "$TARGET" "$(pwd)"
else
	cwd=$(pwd)

	if [ -e "$cwd/$TARGET" ]
	then
		TARGET="$cwd/$TARGET"
	fi

	cd "$TARGET" || die "cannot cd into $TARGET"

	before=$(du -sh "$TARGET")
	before="$(size_format "$before" ".")"

	printf "before:\t%b\n\n" "$before"

	shift
	skip="false"

	for dir in *
	do
		skip="false"
		case "$1" in
			*$dir*) skip="true" ;;
		esac

		if [ $skip = "false" ]
		then
			if [ -d "$dir" ] && [ -e "$dir/.git" ]
			then
				git_compress "$dir" "$TARGET"
			fi
		fi
	done
	after=$(du -sh "$TARGET")
	after="$(size_format "$after" ".")"
	printf "\nafter:\t%b\n" "$after"
	printf "\n" >> /tmp/diff
	echo "diff:$(printf "\t")$(colour_format "$(cat /tmp/diff | calc -p)")"
	rm /tmp/diff
	cd "$cwd" || die "cannot cd into $cwd"
fi
