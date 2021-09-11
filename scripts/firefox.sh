#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="/home/zocki/.config/adblocklist" \
	--private \
	--trace \
	firefox
