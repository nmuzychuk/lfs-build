#!/bin/bash

patch -Np1 -i ../coreutils-8.25-i18n-2.patch

FORCE_UNSAFE_CONFIGURE=1 ./configure \
 --prefix=/usr \
 --enable-no-install-program=kill,uptime

FORCE_UNSAFE_CONFIGURE=1 make

make install

mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin && hash -r # rehash mv
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8

mv -v /usr/bin/{head,sleep,nice,test,[} /bin
