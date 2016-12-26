#!/bin/bash

./configure --prefix=/usr \
 --disable-static \
 --enable-thread-safe \
 --docdir=/usr/share/doc/mpfr-3.1.4

make
make html

make check

make install
make install-html
