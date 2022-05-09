#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

start()
{
	prog="$1"
	shift
	daemonize "$(which "$prog")" "$@"
}

# Boilerplate

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]
then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]
then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]
then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]
then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]
then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh
	do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi


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
