#!/bin/bash

mkdir -pv /var/lib/hwclock

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
 --docdir=/usr/share/doc/util-linux-2.28.1 \
 --disable-chfn-chsh \
 --disable-login \
 --disable-nologin \
 --disable-su \
 --disable-setpriv \
 --disable-runuser \
 --disable-pylibmount \
 --disable-static \
 --without-python \
 --without-systemd \
 --without-systemdsystemunitdir

make

make install
