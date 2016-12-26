#!/bin/bash

./configure --prefix=/usr \
 --exec-prefix= \
 --libdir=/usr/lib \
 --docdir=/usr/share/doc/procps-ng-3.3.12 \
 --disable-static \
 --disable-kill

make

make install

mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
