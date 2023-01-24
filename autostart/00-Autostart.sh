#! /bin/sh

for script in "$HOME"/.config/autostart/10-*.sh
do
	dash "$script"
done
