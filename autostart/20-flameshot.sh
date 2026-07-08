#! /bin/sh

. "$HOME/.local/share/autostart/00-exports.sh"

pgrep flameshot > /dev/null || start flameshot
