#! /bin/sh

GREEN="\033[32;48m"
RED="\033[31;38m"
END="\033[0m"

deploy()
{
	if [ -z "$2" ]
	then
		echo "$GREEN Moving $1 to $HOME/.$1 $END"
		cp "$1" "$HOME/.$1"
	else
		echo "$GREEN Moving $1 to $2 $END"
		cp "$1" "$2"
	fi
}

deploy_dir()
{
	if ! [ -e "$2" ]
	then
		echo "$RED $2 does not exist. $END"
	else
		echo "$GREEN Moving contents of $1 to $2 $END"
		for file in $1/*
		do
			deploy "$file" "$2"
		done
	fi
}

echo "Using $HOME as \$HOME"

deploy zshrc
deploy vimrc
deploy wallpapermap
deploy gitconfig
deploy tmux.conf

deploy_dir scripts $HOME/.config/scripts
deploy_dir env $HOME/.config/env
deploy_dir configures $HOME/.config/configures
deploy_dir newsboat $HOME/.config/newsboat
