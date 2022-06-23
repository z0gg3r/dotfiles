#! /bin/sh

killall -q polybar


MONITOR="HDMI-1" polybar -c /home/zocki/.config/polybar/config main &
MONITOR="HDMI-0" polybar -c /home/zocki/.config/polybar/config side &
MONITOR="DVI-D-0" polybar -c /home/zocki/.config/polybar/config side &
