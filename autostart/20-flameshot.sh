#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

pgrep flameshot > /dev/null || start flameshot
