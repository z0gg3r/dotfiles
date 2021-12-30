#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

start()
{
	daemonize -u "zocki" "$(which "$1")"
}

xset s 0

# Nvidia
start nvidia-settings --load-config-only

# UIM
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XMODIFIERS=@im=uim
start uim-xim

case "$1" in
	"gnome") XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec gnome-session ;;
	"xfce") exec startxfce4 ;;
	"kde") DESKTOP_SESSION=plasma exec startplasma-x11 ;;
	*) exec awesome ;;
esac
