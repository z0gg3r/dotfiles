#!/bin/sh
#shellcheck disable=2016

echo 'Server = https://ftp.halifax.rwth-aachen.de/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist
pacman-key --init
pacman-key --populate
pacman -Sy && pacman -S --noconfirm archlinux-keyring && pacman -Syu --noconfirm
