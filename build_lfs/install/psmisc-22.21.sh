#!/bin/bash

./configure --prefix=/usr

make

make install

mv -v /usr/bin/fuser /bin
mv -v /usr/bin/killall /bin
