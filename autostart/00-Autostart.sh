#! /bin/sh

for script in "$HOME"/.local/share/autostart/10-*.sh
do
	dash "$script"
done
