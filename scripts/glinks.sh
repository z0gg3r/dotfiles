#! /bin/sh

links -g \
	-force-html \
	-no-connect \
	-save-cookies 0 \
	-save-url-history 0 \
	-enable-cookies 0 \
	"$1"
