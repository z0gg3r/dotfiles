#! /bin/sh

. "$HOME/.config/autostart/00-exports.sh"

export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XMODIFIERS=@im=uim

pgrep "uim-xim" > /dev/null || start "uim-xim"
pgrep uim-toolbar > /dev/null || start "uim-toolbar-gtk3-systray"
