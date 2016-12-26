#!/bin/bash

./configure --prefix=/tools --without-guile

make

make install
