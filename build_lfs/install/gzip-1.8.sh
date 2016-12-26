#!/bin/bash

./configure --prefix=/usr

make

make install

mv -v /usr/bin/gzip /bin
