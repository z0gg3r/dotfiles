#! /bin/sh

if [ -z "$1" ]
then
	exit 1
fi

echo "Kernel Version is: $1"
echo "Continue?"

read -r answer

if [ "$answer" = "y" ]
then
	doas dracut --reproducible --zstd --early-microcode  --force --kver "$1"
fi
