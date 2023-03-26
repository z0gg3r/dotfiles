#!/bin/sh
TMP="/tmp/less"
fold -sw 80 < "$1" > "$TMP" && touch /tmp/less.lock
echo "$TMP"
