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

trap __exit INT QUIT TERM

timer.sh kernel-compile

cd /usr/src/linux || die '/usr/src/linux does not exist'

if ! [ -e '.config' ]
then
	zcat /proc/config.gz > .config

	make olddefconfig || die 'config provisioning failed'
fi

make -j24 -l30 || die 'kernel compile failed'

make -j24 -l30 headers || die 'kernel header preparation failed'

doas make modules_install headers_install install -j24 -l30 || die 'kernel install failed'

doas emerge -atv @module-rebuild || die 'module rebuild failed'

doas dracut --reproducible --lz4 --early-microcode --printsize --force --kver "$(make kernelrelease)" || die 'dracut failed'

doas grub-mkconfig -o /boot/grub/grub.cfg || die 'update-grub failed'

timer.sh kernel-compile
