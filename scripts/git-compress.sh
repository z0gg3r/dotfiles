#! /bin/sh
TARGET="$1"

die()
{
	echo "$1"
	exit 1
}

git_compress()
{
	cd "$1" || die "cannot cd into $1"
	before=$(du -sh ".git")
	git repack -AdflF 2> /dev/null
	after=$(du -sh ".git")
	cd "$2" || die "cannot cd into $2"
	printf "before: %b\nafter: %b\n" "$before" "$after" | replace ".git" "$1"
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
	for dir in *
	do
		if [ -d "$dir" ] && [ -e "$dir/.git" ]
		then
			git_compress "$dir" "$TARGET"
		fi
	done
	cd "$cwd" || die "cannot cd into $cwd"
fi

