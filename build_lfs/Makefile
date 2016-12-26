.ONESHELL:
SHELL := /bin/bash

SOURCES = /sources
INSTALL = $(shell pwd)/install

packages = linux-4.7.2-api-headers man-pages-4.07 glibc-2.24 \
adjust-toolchain zlib-1.2.8 file-5.28 binutils-2.27 gmp-6.1.1 mpfr-3.1.4 \
mpc-1.0.3 gcc-6.2.0 bzip2-1.0.6 pkg-config-0.29.1 ncurses-6.0 attr-2.4.47 \
acl-2.2.52 libcap-2.25 sed-4.2.2 shadow-4.2.1 psmisc-22.21 iana-etc-2.30 \
m4-1.4.17 bison-3.0.4 flex-2.6.1 grep-2.25 readline-6.3 bash-4.3.30 bc-1.06.95 \
libtool-2.4.6 gdbm-1.12 gperf-3.0.4 expat-2.2.0 inetutils-1.9.4 perl-5.24.0 \
XML-Parser-2.44 intltool-0.51.0 autoconf-2.69 automake-1.15 xz-5.2.2 kmod-23 \
gettext-0.19.8.1 procps-ng-3.3.12 e2fsprogs-1.43.1 coreutils-8.25 \
diffutils-3.5 gawk-4.1.3 findutils-4.6.0 groff-1.22.3 grub-2.02~beta3 less-481 \
gzip-1.8 iproute2-4.7.0 kbd-2.0.3 libpipeline-1.4.1 make-4.2.1 patch-2.7.5 \
sysklogd-1.5.1 sysvinit-2.88dsf eudev-3.2 util-linux-2.28.1 man-db-2.7.5 \
tar-1.29 texinfo-6.1 vim-7.4

define install
pushd $(SOURCES) && tar -xvf $(@).* && pushd $(@) && \
source $(INSTALL)/$(@).sh && popd && rm -rf $(@) && popd && \
touch $(@)
endef

all: $(packages)

linux-4.7.2-api-headers:
	pushd $(SOURCES) && tar -xvf linux-4.7.2.* && pushd linux-4.7.2 && \
	source $(INSTALL)/$(@).sh && popd && rm -rf linux-4.7.2 && popd && \
	touch $(@)

man-pages-4.07: linux-4.7.2-api-headers
	$(install)

glibc-2.24: man-pages-4.07
	$(install)

adjust-toolchain: glibc-2.24
	source $(INSTALL)/$(@).sh && touch $(@)

zlib-1.2.8: adjust-toolchain
	$(install)

file-5.28: zlib-1.2.8
	$(install)

binutils-2.27: file-5.28
	$(install)

gmp-6.1.1: binutils-2.27
	$(install)

mpfr-3.1.4: gmp-6.1.1
	$(install)

mpc-1.0.3: mpfr-3.1.4
	$(install)

gcc-6.2.0: mpc-1.0.3
	$(install)

bzip2-1.0.6: gcc-6.2.0
	$(install)

pkg-config-0.29.1: bzip2-1.0.6
	$(install)

ncurses-6.0: pkg-config-0.29.1
	$(install)

attr-2.4.47: ncurses-6.0
	$(install)

acl-2.2.52: attr-2.4.47
	$(install)

libcap-2.25: acl-2.2.52
	$(install)

sed-4.2.2: libcap-2.25
	$(install)

shadow-4.2.1: sed-4.2.2
	$(install)

psmisc-22.21: shadow-4.2.1
	$(install)

iana-etc-2.30: psmisc-22.21
	$(install)

m4-1.4.17: iana-etc-2.30
	$(install)

bison-3.0.4: m4-1.4.17
	$(install)

flex-2.6.1: bison-3.0.4
	$(install)

grep-2.25: flex-2.6.1
	$(install)

readline-6.3: grep-2.25
	$(install)

bash-4.3.30: readline-6.3
	$(install)

bc-1.06.95: bash-4.3.30
	$(install)

libtool-2.4.6: bc-1.06.95
	$(install)

gdbm-1.12: libtool-2.4.6
	$(install)

gperf-3.0.4: gdbm-1.12
	$(install)

expat-2.2.0: gperf-3.0.4
	$(install)

inetutils-1.9.4: expat-2.2.0
	$(install)

perl-5.24.0: inetutils-1.9.4
	$(install)

XML-Parser-2.44: perl-5.24.0
	$(install)

intltool-0.51.0: XML-Parser-2.44
	$(install)

autoconf-2.69: intltool-0.51.0
	$(install)

automake-1.15: autoconf-2.69
	$(install)

xz-5.2.2: automake-1.15
	$(install)

kmod-23: xz-5.2.2
	$(install)

gettext-0.19.8.1: kmod-23
	$(install)

procps-ng-3.3.12: gettext-0.19.8.1
	$(install)

e2fsprogs-1.43.1: procps-ng-3.3.12
	$(install)

coreutils-8.25: e2fsprogs-1.43.1
	$(install)

diffutils-3.5: coreutils-8.25
	$(install)

gawk-4.1.3: diffutils-3.5
	$(install)

findutils-4.6.0: gawk-4.1.3
	$(install)

groff-1.22.3: findutils-4.6.0
	$(install)

grub-2.02~beta3: groff-1.22.3
	$(install)

less-481: grub-2.02~beta3
	$(install)

gzip-1.8: less-481
	$(install)

iproute2-4.7.0: gzip-1.8
	$(install)

kbd-2.0.3: iproute2-4.7.0
	$(install)

libpipeline-1.4.1: kbd-2.0.3
	$(install)

make-4.2.1: libpipeline-1.4.1
	$(install)

patch-2.7.5: make-4.2.1
	$(install)

sysklogd-1.5.1: patch-2.7.5
	$(install)

sysvinit-2.88dsf: sysklogd-1.5.1
	$(install)

eudev-3.2: sysvinit-2.88dsf
	$(install)

util-linux-2.28.1: eudev-3.2
	$(install)

man-db-2.7.5: util-linux-2.28.1
	$(install)

tar-1.29: man-db-2.7.5
	$(install)

texinfo-6.1: tar-1.29
	$(install)

vim-7.4: texinfo-6.1
	pushd $(SOURCES) && tar -xvf $(@).* && pushd vim74 && \
	source $(INSTALL)/$(@).sh && popd && rm -rf vim74 && popd && \
	touch $(@)

lfs-bootscripts-20150222:
	$(install)

linux-4.7.2:
	pushd $(SOURCES) && tar -xvf linux-4.7.2.* && pushd linux-4.7.2 && \
	source $(INSTALL)/$(@).sh && popd && rm -rf linux-4.7.2 && popd && \
	touch $(@)

clean:
	rm -rf $(packages) lfs-bootscripts-20150222 linux-4.7.2
