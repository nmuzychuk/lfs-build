#!/bin/bash

./configure --prefix=/usr \
 --sbindir=/sbin \
 --sysconfdir=/etc \
 --disable-efiemu \
 --disable-werror

make

make install
