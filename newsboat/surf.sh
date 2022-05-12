#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="/home/zocki/.config/adblocklist" \
	--private \
	--trace \
	--nodvd \
	--nosound \
	--notv \
	--nou2f \
	--novideo \
	--private-cache \
	surf-viewer -u "$SURF_USERAGENT" -s -g -m -n "$1"
