#!/bin/bash

./configure --prefix=/usr \
 --with-internal-glib \
 --disable-compile-warnings \
 --disable-host-tool \
 --docdir=/usr/share/doc/pkg-config-0.29.1

make

make install
