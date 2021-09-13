#! /bin/sh

UPTODATE_COLOUR_START="\033[32;48m"
CHANGE_COLOUR_START="\033[33;48m"
ERROR_COLOUR_START="\033[31;48m"
INFO_COLOUR_START="\033[30;47m"
IGNORE_COLOUR_START="\033[34;48m"
COLOUR_END="\033[0m"

update() {
	if ! [ -z "$2"  ]
	then
		if ! [ -e "$2" ]
		then
			echo "$ERROR_COLOUR_START $2 does not exist $COLOUR_END"
		elif ! [ -e "$1" ]
		then
			echo "$CHANGE_COLOUR_START Creating $1 $COLOUR_END"
			cp "$2" "$1"
		elif diff "$1" "$2" > /dev/null
		then
			echo "$UPTODATE_COLOUR_START $1 is up-to-date $COLOUR_END"
		else
			echo "$CHANGE_COLOUR_START Updating $1 $COLOUR_END"
			cp "$2" "$1"
		fi
	elif ! [ -e "$HOME/.$1" ]
	then
		echo "$ERROR_COLOUR_START $1 does not exist in $HOME $COLOUR_END"
	elif ! [ -e "$1" ]
	then
		echo "$CHANGE_COLOUR_START Creating $1 $COLOUR_END"
		cp "$HOME/.$1" "$1"
	elif  diff "$1" "$HOME/.$1" > /dev/null
	then
		echo "$UPTODATE_COLOUR_START $1 is up-to-date $COLOUR_END"
	else
		echo "$CHANGE_COLOUR_START Updating $1 $COLOUR_END"
	       	cp "$HOME/.$1" "$1"
	fi
}

dir_update() {
	mkdir -p "$1"
	echo "$INFO_COLOUR_START Checking $1... $COLOUR_END"
	for file in $(/usr/bin/ls "$HOME"/.config/"$1")
	do
		case $2 in
			*$file*) ignore="yes" ;;
		esac
		if ! [ -z "$ignore" ]
		then
			echo "$IGNORE_COLOUR_START $file will be ignored. $COLOUR_END"
		elif ! [ -e "$1/$file" ]
		then
			echo "$CHANGE_COLOUR_START Creating $1/$file $COLOUR_END"
			cp "$HOME/.config/$1/$file" "$1/$file"
		elif diff "$1" "$HOME/.config/$1/$file" > /dev/null
		then
			echo "$UPTODATE_COLOUR_START $file is up-to-date $COLOUR_END"
		else
			echo "$CHANGE_COLOUR_START Updating $1/$file $COLOUR_END"
			cp "$HOME/.config/$1/$file" "$1/$file"
		fi
		ignore=""
	done
}


echo "Using $HOME as home"
update vimrc
update zshrc
update gitconfig
update tmux.conf
update wallpapermap

if [ -e "$HOME/.config/scripts" ]
then
	dir_update scripts
fi

if [ -e "$HOME/.config/env" ]
then
	dir_update env
fi

if [ -e "$HOME/.config/configures" ]
then
	dir_update configures
fi

if [ -e "$HOME/.config/newsboat" ]
then
	dir_update newsboat cache.db
fi
