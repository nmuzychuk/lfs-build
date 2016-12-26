#!/bin/bash

./configure --prefix=/tools --without-bash-malloc

make

make install

ln -sv bash /tools/bin/sh
