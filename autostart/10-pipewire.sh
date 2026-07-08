#! /bin/sh

. "$HOME/.local/share/autostart/00-exports.sh"

force_start_openrc pipewire
force_start_openrc wireplumber
force_start_openrc pipewire-pulse
