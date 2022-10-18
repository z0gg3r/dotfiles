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
	vimb -i "$1"
#	surf-viewer -u "$SURF_USERAGENT" -s -g -n -m "$1"
