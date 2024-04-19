#!/bin/sh

dash "$HOME/.config/autostart/10-dunst.sh"
dash "$HOME/.config/autostart/10-polkit.sh"
dash "$HOME/.config/autostart/10-pipewire.sh"

pgrep waybar > /dev/null || daemonize /usr/bin/waybar
pgrep wlsunset > /dev/null || daemonize /usr/local/bin/wlsunset -t 4499 -T 4500 -g 0.7
pgrep -f ibus > /dev/null || daemonize /usr/bin/ibus-daemon -dr
# pgrep -f ibus > /dev/null || /usr/libexec/ibus-ui-gtk3 --enable-wayland-im --exec-daemon --daemon-args "--xim --panel disable"
