#!/bin/sh

killall uim-helper-server
killall uim-candwin-gtk3
killall uim-toolbar-gtk3-systray
killall uim-xim

daemonize $(which uim-xim)
daemonize $(which uim-toolbar-gtk3-systray)
