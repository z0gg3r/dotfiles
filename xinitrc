#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

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

if [ -d /etc/X11/xinit/xinitrc.d ] 
then
	for f in /etc/X11/xinit/xinitrc.d/?* 
	do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Fix Java Apss
export _JAVA_AWT_WM_NONREPARENTING="1"

# Disable .NET Telmetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Fix webkitgtk...
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# nvidia-vaapi
export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json
export NVD_BACKEND=direct

# Always use LC_COLLATE=C
export LC_COLLATE=C

# Set ibus as IME
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus 
ibus-daemon -drx

exec bspwm
