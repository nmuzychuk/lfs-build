#!/bin/bash

./configure --prefix=/usr --disable-static

make

make install

install -v -dm755 /usr/share/doc/expat-2.2.0
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.0
