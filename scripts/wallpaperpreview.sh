#! /bin/sh

image="/home/zocki/wallpapers/$1.png"

png2ff < "$image" > /tmp/image.ff

lel /tmp/image.ff

rm /tmp/image.ff
