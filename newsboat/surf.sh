#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="/home/zocki/.config/adblocklist" \
	--private \
	--nodvd \
	--nosound \
	--notv \
	--nou2f \
	--novideo \
	--private-cache \
	surf-viewer -u "$SURF_USERAGENT" -s -g -n -m "$1"
#	vimb -i "$1"
