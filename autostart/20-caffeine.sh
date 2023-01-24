#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

pgrep "caffeine" > /dev/null || start caffeine
