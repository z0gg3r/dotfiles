#! /bin/sh

image="/home/zocki/wallpapers/$1"

png2ff < "$image.png" > /tmp/image.ff

lel /tmp/image.ff

rm /tmp/image.ff
