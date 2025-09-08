#!/bin/sh

cd /usr/src/linux || exit 1

if ! [ -e '.config' ]
then
	zcat /proc/config.gz > .config

	make olddefconfig || exit 1
fi

make -j24 -l30 || exit 1

make -j24 -l30 headers || exit 1

doas make modules_install headers_install install -j24 -l30 || exit 1

doas emerge -atv @module-rebuild || exit 1

doas dracut --reproducible --lz4 --early-microcode --printsize --force --kver "$(make kernelrelease)" || exit 1

doas grub-mkconfig -o /boot/grub/grub.cfg || exit 1
