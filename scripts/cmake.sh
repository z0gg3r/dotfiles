#! /bin/sh
mkdir build
cmake .. . && time make -j $(nproc) && doas make install
cd ..
rm -rf build
