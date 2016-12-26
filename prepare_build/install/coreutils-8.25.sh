#!/bin/bash

./configure --prefix=/tools --enable-install-program=hostname

make

make install
