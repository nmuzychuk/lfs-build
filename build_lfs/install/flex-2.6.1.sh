#!/bin/bash

./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.1

make

make install

ln -sv flex /usr/bin/lex
