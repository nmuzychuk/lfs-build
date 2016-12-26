#!/bin/bash

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools \
  --with-tcl=/tools/lib \
  --with-tclinclude=/tools/include

make

make SCRIPTS="" install
