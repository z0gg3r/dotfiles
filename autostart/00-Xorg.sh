#! /bin/sh

for script in "$HOME"/.config/autostart/20-*.sh
do
	dash "$script"
done
