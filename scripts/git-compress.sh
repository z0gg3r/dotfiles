#! /bin/sh
TARGET="$1"

die()
{
	echo "$1"
	exit 1
}

size_format()
{
	if [ -z "$2" ]
	then
		num="$1"
	else
		num="$(echo "$1" | cut -d "$(printf "\t")" -f1)"
		dir="$(echo "$1" | cut -d "$(printf "\t")" -f2)"
	fi
	unit="K"

	num=$(echo "$num / 1024" | calc -p)

	if [ -z "$dir" ]
	then
		printf "%.2f%b" "$num" "$unit"
	else
		printf "%.2f%b\t%b" "$num" "$unit" "$dir"
	fi
}

size_diff()
{
	before="$(echo "$1" | cut -d "$(printf "\t")" -f1)"
	after="$(echo "$2" | cut -d "$(printf "\t")" -f1)"
	diff=$(echo "$after - $before" | calc -p)
	diff=$(echo "$diff / 1024" | calc -p)
	printf "%b\n" "$(size_format "$diff")"

}

git_compress()
{
	cd "$1" || die "cannot cd into $1"
	before=$(du -s ".git")
	printf "before:\t%b\n" "$(size_format "$before" ".")" | replace ".git" "$1"
	git repack -AdflF 2> /dev/null
	after=$(du -s ".git")
	cd "$2" || die "cannot cd into $2"
	printf "after:\t%b\n" "$(size_format "$after" ".")" | replace ".git" "$1"
	printf "diff:\t%b\n" "$(size_diff "$before" "$after")"
}

if [ -z "$TARGET" ]
then
	die "Please provide an Argument."
elif [ -e "$TARGET/.git" ]
then
	git_compress "$TARGET" "$(pwd)"
else
	cwd="$(pwd)"
	if [ -e "$cwd/$TARGET" ]
	then
		TARGET="$cwd/$TARGET"
	fi
	cd "$TARGET" || die "cannot cd into $TARGET"
	before=$(du -s "$TARGET")
	printf "before:\t%b\n\n" "$(size_format "$before" ".")"
	for dir in *
	do
		if [ -d "$dir" ] && [ -e "$dir/.git" ]
		then
			git_compress "$dir" "$TARGET"
		fi
	done
	after=$(du -s "$TARGET")
	printf "\nafter:\t%b\n" "$(size_format "$after" ".")"
	printf "diff:\t%b\n" "$(size_diff "$before" "$after")"
	cd "$cwd" || die "cannot cd into $cwd"
fi

