#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

pgrep "pipewire" > /dev/null || start "gentoo-pipewire-launcher"
