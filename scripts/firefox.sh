#! /bin/sh
firejail \
	--noprofile \
	--hosts-file="$HOME/.config/adblocklist" \
	--private \
	--trace \
	firefox
