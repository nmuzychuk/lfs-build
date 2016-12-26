#!/bin/bash

sed -i /ARPD/d Makefile
sed -i 's/arpd.8//' man/man8/Makefile
rm -v doc/arpd.sgml

sed -i 's/m_ipt.o//' tc/Makefile

make

make DOCDIR=/usr/share/doc/iproute2-4.7.0 install
