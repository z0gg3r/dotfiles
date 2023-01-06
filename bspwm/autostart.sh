#!/bin/sh

pgrep uim-toolbar > /dev/null || daemonize "$(which uim-toolbar-gtk3-systray)"
pgrep flameshot > /dev/null || daemonize "$(which flameshot)"
pgrep caffeine > /dev/null || daemonize "$(which caffeine)"
pgrep dunst > /dev/null || daemonize "$(which dunst)"
pgrep pipewire > /dev/null || daemonize "$(which gentoo-pipewire-launcher)"
pgrep polkit-gnome-authentication-agent-1 > /dev/null || daemonize "/usr/libexec/polkit-gnome-authentication-agent-1"

sct 6000 0.7
numlockx on
