#!/bin/sh

URI="https://lore.kernel.org"
SURF_OPTS="-g -d -B -M -n -s -T -c /tmp/lore.cookies -C $HOME/.surf/styles/lore-kernel-org.css"

exec surf-viewer $SURF_OPTS "$URI"
