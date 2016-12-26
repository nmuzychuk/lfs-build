#!/bin/bash

./configure --prefix=/tools \
  --without-python \
  --disable-makeinstall-chown \
  --without-systemdsystemunitdir \
  PKG_CONFIG=""

make

make install
