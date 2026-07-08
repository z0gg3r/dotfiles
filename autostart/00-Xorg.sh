#! /bin/sh

for script in "$HOME"/.local/share/autostart/20-*.sh
do
	dash "$script"
done
