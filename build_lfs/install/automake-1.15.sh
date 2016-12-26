#!/bin/bash

sed -i 's:/\\\${:/\\\$\\{:' bin/automake.in

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.15

make

make install
