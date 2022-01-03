#! /bin/sh

remove_file()
{
	if [ -e "$1" ]
	then
		rm "$1"
	fi
}

remove_file $HOME/.calc_history
remove_file $HOME/.wget-hsts
remove_file $HOME/.xsession-errors.old
remove_file $HOME/.sqlite_history

notify-send "Removed useless files"
