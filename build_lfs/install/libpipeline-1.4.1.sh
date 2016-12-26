#!/bin/bash

PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr

make

make install
