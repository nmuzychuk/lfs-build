#!/bin/bash

./configure --prefix=/usr

make

make install

mkdir -v /usr/share/doc/gawk-4.1.3
cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.1.3
