#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

start()
{
	daemonize -u "zocki" "$(which "$1")"
}

# Nvidia
start nvidia-settings --load-config-only

# UIM
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XMODIFIERS=@im=uim
start uim-xim

xset s 0

wm="awesome"

case "$1" in
	"dwm") wm="dwm" ;;
	"gnome") XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec gnome-session ;;
	*) wm="awesome" ;;
esac

exec $wm
