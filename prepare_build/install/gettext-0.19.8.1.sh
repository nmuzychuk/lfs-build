#!/bin/bash

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
