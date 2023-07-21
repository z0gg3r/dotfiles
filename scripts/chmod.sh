#!/bin/sh
for file in $HOME/.local/scripts/*.sh
do
	chmod +x "$file"
done
