#!/bin/sh

pgrep uim-toolbar > /dev/null || daemonize "$(which uim-toolbar-gtk3-systray)"
pgrep flameshot > /dev/null || daemonize "$(which flameshot)"
pgrep caffeine > /dev/null || daemonize "$(which caffeine)"
pgrep dunst > /dev/null || daemonize "$(which dunst)"
pgrep pipewire > /dev/null || daemonize "$(which gentoo-pipewire-launcher)"

sct 6000 0.85
numlockx on
