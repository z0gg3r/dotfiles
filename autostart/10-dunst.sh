#! /bin/sh
. "$HOME/.config/autostart/00-exports.sh"

pgrep dunst > /dev/null || start dunst
