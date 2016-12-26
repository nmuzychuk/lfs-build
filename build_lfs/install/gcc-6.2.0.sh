#!/bin/bash

mkdir -v build
cd build

SED=sed \
../configure --prefix=/usr \
 --enable-languages=c,c++ \
 --disable-multilib \
 --disable-bootstrap \
 --with-system-zlib

make

make install

ln -sv ../usr/bin/cpp /lib

ln -sv gcc /usr/bin/cc

install -v -dm755 /usr/lib/bfd-plugins
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/6.2.0/liblto_plugin.so \
 /usr/lib/bfd-plugins/

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
