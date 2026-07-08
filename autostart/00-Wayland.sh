#! /bin/sh

for script in "$HOME"/.local/share/autostart/30-*.sh
do
	dash "$script"
done
