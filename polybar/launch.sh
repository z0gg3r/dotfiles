#! /bin/sh

killall -q polybar


MONITOR="HDMI-0" polybar -c "${HOME}/.config/polybar/config" main &
MONITOR="HDMI-1" polybar -c "${HOME}/.config/polybar/config" side &
MONITOR="DVI-D-0" polybar -c "${HOME}/.config/polybar/config" side &
