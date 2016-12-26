#!/bin/bash

sed -i s/mawk// configure

./configure --prefix=/tools \
  --with-shared \
  --without-debug \
  --without-ada \
  --enable-widec \
  --enable-overwrite

make

make install
