#! /bin/sh

kver="$1"
if [ -z "$kver" ]
then
	cd /usr/src/linux || exit 1
	kver=$(make -s kernelversion)
fi

echo "Kernel Version is: $kver"
echo "Continue?"

read -r answer

if [ "$answer" = "y" ]
then
	doas dracut --reproducible --zstd --early-microcode  --force --kver "$kver"
fi
