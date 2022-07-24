#! /bin/sh
xinput set-prop "Wacom Intuos Pro S Pen stylus" --type=float "Coordinate Transformation Matrix" 0.333333 0 0.333333 0 1 0 0 0 1
xinput set-prop "Wacom Intuos Pro S Pen eraser" --type=float "Coordinate Transformation Matrix" 0.333333 0 0.333333 0 1 0 0 0 1
xsetwacom set "Wacom Intuos Pro S Pad pad" Button 2 "key +ctrl z -ctrl"
xsetwacom set "Wacom Intuos Pro S Pad pad" Button 3 "key +ctrl +alt l -alt -ctrl"
