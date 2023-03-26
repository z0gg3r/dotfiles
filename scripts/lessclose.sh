#!/bin/sh
if [ -e /tmp/less.lock ]
then
	rm "/tmp/less" "/tmp/less.lock"
fi
