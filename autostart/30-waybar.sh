#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

pgrep waybar > /dev/null || start waybar
