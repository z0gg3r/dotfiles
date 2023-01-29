#!/bin/sh

cd "$HOME" || exit 1

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

exec Hyprland
