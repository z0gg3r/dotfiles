#!/bin/sh
firejail \
	--noprofile \
	--private \
	--nodvd \
	--nosound \
	--notv \
	--nou2f \
	--novideo \
	--private-cache \
	$@
