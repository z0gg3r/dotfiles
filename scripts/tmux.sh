#!/bin/sh

if [ -z "$TMUX" ]
then
	exec tmux new-session -s "$$"
else
	tmux attach
fi
