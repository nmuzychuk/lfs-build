#!/bin/bash

./configure --prefix=/usr \
 --docdir=/usr/share/doc/man-db-2.7.5 \
 --sysconfdir=/etc \
 --disable-setuid \
 --with-browser=/usr/bin/lynx \
 --with-vgrind=/usr/bin/vgrind \
 --with-grap=/usr/bin/grap

make

make install

sed -i "s:man root:root root:g" /usr/lib/tmpfiles.d/man-db.conf
