#!/bin/bash

mkdir -v build
cd build

../configure --prefix=/usr \
 --enable-shared \
 --disable-werror

make tooldir=/usr

make tooldir=/usr install
