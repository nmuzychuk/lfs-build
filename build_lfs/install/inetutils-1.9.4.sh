#!/bin/bash

./configure --prefix=/usr \
 --localstatedir=/var \
 --disable-logger \
 --disable-whois \
 --disable-rcp \
 --disable-rexec \
 --disable-rlogin \
 --disable-rsh \
 --disable-servers

make

make install

mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin
