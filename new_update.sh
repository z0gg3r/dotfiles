#! /bin/sh
UPTODATE="\033[32;48m"
CHANGE="\033[33;38m"
ERROR="\033[31;48m"
INFO="\033[30;48m"
IGNORE="\033[34;48m"
END="\033[0m"

echo "$INFO Using $HOME as \$HOME $END"

_diff()
{
	diff "$1" "$2" > /dev/null
}

update()
{
	if [ -z "$2" ] && [ -e "$HOME/.$1" ]
	then
		if ! _diff "$1" "$HOME/.$1"
		then
			echo "$CHANGE Updating $1! $END"
			cp "$HOME/.$1" "$1"
		else
			echo "$UPTODATE $1 is up-to-date! $END"
		fi
	elif ! [ -z "$2" ]
	then
		mkdir "$1"
		echo "$CHANGE Updating $1... $END"
		if [ -z "$3" ]
		then
			for file in $2
			do
				cp "$file" "$1"
			done
		else
			for file in $2
			do
				case $file in
					*$3*) ignore="y" ;;
				esac
				if [ -z "$ignore" ]
				then
					cp "$file" "$1"
				else
					echo "$IGNORE Ignoring $file! $END"
				fi
			done
		fi
	else
		echo "$ERROR Cannot update $1 $END"
	fi
}


update program_repos
