#! /bin/sh
for file in $HOME/.config/scripts/*.sh
do
	chmod +x "$file"
done
