#!/bin/sh
pgrep waybar > /dev/null && pkill waybar
daemonize /usr/bin/waybar -c "$HOME/.config/waybar/config"
