#!/bin/bash

sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in

sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile

./configure --prefix=/usr \
 --bindir=/bin \
 --disable-static

make

make install install-dev install-lib
chmod -v 755 /usr/lib/libattr.so

mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
