#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="/home/zocki/.config/adblocklist" \
	--private \
	--trace \
	surf -s -g -m -n "$1"
