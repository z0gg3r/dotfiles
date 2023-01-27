#! /bin/sh

if ! test-wayland.sh
then
	unset LIBVA_DRIVER_NAME
	unset GBM_BACKEND
	unset __GLX_VENDOR_LIBRARY_NAME
	unset MOZ_ENABLE_WAYLAND
	unset XDG_SESSION_TYPE
	unset WLR_NO_HARDWARE_CURSORS
else
	export LIBVA_DRIVER_NAME=nvidia
	export GBM_BACKEND=nvidia-drm
	export __GLX_VENDOR_LIBRARY_NAME=nvidia
	export MOZ_ENABLE_WAYLAND=1
	export XDG_SESSION_TYPE=wayland
	export WLR_NO_HARDWARE_CURSORS=1
fi
