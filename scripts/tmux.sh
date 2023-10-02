#!/bin/sh

if ! pgrep bspwm > /dev/null
then
	exit
fi

if [ -z "$TMUX" ]
then
	exec tmux new-session -s "$$"
else
	tmux attach
fi
