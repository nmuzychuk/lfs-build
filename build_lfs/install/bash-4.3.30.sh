#!/bin/bash

patch -Np1 -i ../bash-4.3.30-upstream_fixes-3.patch

./configure --prefix=/usr \
 --docdir=/usr/share/doc/bash-4.3.30 \
 --without-bash-malloc \
 --with-installed-readline

make

make install
mv -vf /usr/bin/bash /bin
