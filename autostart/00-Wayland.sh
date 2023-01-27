#! /bin/sh

for script in "$HOME"/.config/autostart/30-*.sh
do
	dash "$script"
done
