#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

start()
{
	prog="$1"
	shift
	daemonize -u "$USER" "$(which "$prog")" "$@"
}

xset s off

# Nvidia
start nvidia-settings --load-config-only

# UIM
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XMODIFIERS=@im=uim
start uim-xim
gnome-keyring-daemon --start
export SSH_AUTH_SOCK

case "$1" in
	"gnome") XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec gnome-session ;;
	"xfce") DESKTOP_SESSION=xfce exec startxfce4 ;;
	"kde") DESKTOP_SESSION=plasma exec startplasma-x11 ;;
	"plasma") DESKTOP_SESSION=plasma exec startplasma-x11 ;;
	*) exec awesome ;;
esac
