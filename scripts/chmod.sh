#!/bin/sh
for file in "$HOME"/.local/scripts/*.sh
do
	chmod 755 "$file"
done
