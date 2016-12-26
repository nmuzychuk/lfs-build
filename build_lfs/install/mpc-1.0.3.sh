#!/bin/bash

./configure --prefix=/usr \
 --disable-static \
 --docdir=/usr/share/doc/mpc-1.0.3

make
make html

make install
make install-html
