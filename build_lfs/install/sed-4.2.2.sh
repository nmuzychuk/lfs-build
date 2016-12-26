#!/bin/bash

./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.2

make
make html

make install
make -C doc install-html
