#!/bin/sh

die()
{
	printf '%b\n' "${@}"
	__exit
}

__exit()
{
	timer.sh kernel-compile
	exit 1
}

notify()
{
	notify-send \
		--app-name='Kernel Compilation' \
		--urgency=low \
		--expire-time=2000 \
		"${@}"
}

trap __exit INT QUIT TERM

timer.sh kernel-compile

cd /usr/src/linux || die '/usr/src/linux does not exist'

if ! [ -e '.config' ]
then
	zcat /proc/config.gz > .config

	make olddefconfig || die 'config provisioning failed'
	notify 'Kernel configuration finished'
fi

make -j24 -l30 V=12 || die 'kernel compile failed'
notify 'Kernel compilation finished'

make -j24 -l30 headers V=12 || die 'kernel header preparation failed'
notify 'Kernel header preperation finished'

INSTALL_HDR_PATH=/usr doas make modules_install headers_install install -j24 -l30 || die 'kernel install failed'
notify 'Kernel installation finished'

doas emerge -atv @module-rebuild || die 'module rebuild failed'
notify 'Kernel module rebuild finished'

doas dracut --reproducible --lz4 --early-microcode --printsize --force --kver "$(make kernelrelease)" || die 'dracut failed'
notify 'Initramfs generation finished'

doas grub-mkconfig -o /boot/grub/grub.cfg || die 'update-grub failed'
notify 'Grub config update finished'

timer.sh kernel-compile
