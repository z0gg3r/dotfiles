#!/bin/sh

firejail \
	--noprofile \
	--hosts-file="$HOME/.config/adblocklist" \
	--private="/opt/firejail/mail_viewer" \
	--nodvd \
	--nosound \
	--notv \
	--nou2f \
	--novideo \
	--private-cache \
	links -g \
	-force-html \
	-no-connect \
	-save-cookies 0 \
	-save-url-history 0 \
	-enable-cookies 0 \
	"$1"
