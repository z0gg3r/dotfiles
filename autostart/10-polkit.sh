#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

pgrep -f "polkit-gnome-authentication-agent-1" || start2 "/usr/libexec/polkit-gnome-authentication-agent-1"
