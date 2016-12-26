#!/bin/bash

patch -Np1 -i ../bc-1.06.95-memory_leak-1.patch

./configure --prefix=/usr \
 --with-readline \
 --mandir=/usr/share/man \
 --infodir=/usr/share/info

make

make install
