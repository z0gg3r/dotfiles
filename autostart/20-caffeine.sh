#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

_disable

pgrep "caffeine" > /dev/null || start caffeine
