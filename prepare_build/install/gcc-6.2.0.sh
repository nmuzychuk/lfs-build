#!/bin/bash

tar -xf ../mpfr-3.1.4.tar.xz
mv -v mpfr-3.1.4 mpfr
tar -xf ../gmp-6.1.1.tar.xz
mv -v gmp-6.1.1 gmp
tar -xf ../mpc-1.0.3.tar.gz
mv -v mpc-1.0.3 mpc

for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
 cp -uv $file{,.orig}
 sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
 -e 's@/usr@/tools@g' $file.orig > $file
 echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
 touch $file.orig
done

mkdir -v build
cd build

../configure \
 --target=$LFS_TGT \
 --prefix=/tools \
 --with-glibc-version=2.11 \
 --with-sysroot=$LFS \
 --with-newlib \
 --without-headers \
 --with-local-prefix=/tools \
 --with-native-system-header-dir=/tools/include \
 --disable-nls \
 --disable-shared \
 --disable-multilib \
 --disable-decimal-float \
 --disable-threads \
 --disable-libatomic \
 --disable-libgomp \
 --disable-libmpx \
 --disable-libquadmath \
 --disable-libssp \
 --disable-libvtv \
 --disable-libstdcxx \
 --enable-languages=c,c++

make

make install
