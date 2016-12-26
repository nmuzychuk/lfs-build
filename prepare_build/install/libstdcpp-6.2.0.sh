#!/bin/bash

mkdir -v build
cd build

../libstdc++-v3/configure \
  --host=$LFS_TGT \
  --prefix=/tools \
  --disable-multilib \
  --disable-nls \
  --disable-libstdcxx-threads \
  --disable-libstdcxx-pch \
  --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/6.2.0

make

make install
