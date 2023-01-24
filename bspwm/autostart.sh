#!/bin/sh

dash "$HOME/.config/autostart/00-Autostart.sh" 2> /tmp/log & 
dash "$HOME/.config/autostart/00-Xorg.sh" &
