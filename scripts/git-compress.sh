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
	git repack -AdflF > /dev/null
	after=$(du -sh ".git")
	cd "$2" || die "cannot cd into $2"
	printf "before: %b\nafter: %b\n" "$before" "$after"
}

if [ -e "$TARGET/.git" ]
then
	git_compress "$TARGET" "$(pwd)"
else
	cwd="$(pwd)"
	cd "$TARGET" || die "cannot cd into $TARGET"
	for dir in *
	do
		if [ -d "$dir" ]
		then
			git_compress "$dir" "$TARGET"
		fi
	done
	cd "$cwd" || die "cannot cd into $cwd"
fi

