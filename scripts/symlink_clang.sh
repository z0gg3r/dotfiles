#! /bin/sh

BASE_PATH="/opt/current-llvm/bin"

check_symbolic_link()
{
	foo=$(file "$1" | cut -d: -f2 | cut -d" " -f2)

	if [ "$foo" = "symbolic" ]
	then
		return 0
	else
		return 1
	fi
}

prefix_binary()
{
	name="$(echo "$1" | replace "$BASE_PATH/" "")"
	prefix=""

	if echo "$name" | grep -iv "^clang" > /dev/null && echo "$name" | grep -iv "^llvm" > /dev/null
	then
		prefix="y"
	fi

	if [ -n "$prefix" ]
	then
		echo "/opt/bin/clang-$name"
	else
		echo "/opt/bin/$name"
	fi
}


for file in /opt/current-llvm/bin/*
do
	if check_symbolic_link "$file"
	then
		true
	else
		target=$(prefix_binary "$file")

		echo "$target"
		doas ln -s "$file" "$target"
	fi
done
