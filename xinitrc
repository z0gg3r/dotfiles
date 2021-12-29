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
start uim-toolbar-gtk3-systray

xset s 0

case "$1" in
	"dwm") exec dwm ;;
	"gnome") XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec gnome-session ;;
	"xfce") exec startxfce4 ;;
	"bspwm") exec bswpm ;;
	"kde") DESKTOP_SESSION=plasma exec startplasma-x11 ;;
	*) exec awesome ;;
esac
