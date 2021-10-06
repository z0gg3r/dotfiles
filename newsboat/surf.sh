#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="/home/zocki/.config/adblocklist" \
	--private \
	--trace \
	surf -u "$SURF_USERAGENT" -s -g -m -n "$1"
