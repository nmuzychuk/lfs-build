.ONESHELL:
SHELL := /bin/bash

LFS = /mnt/lfs
SOURCES = $(LFS)/sources
INSTALL = $(shell pwd)/install

targets = binutils-2.27 gcc-6.2.0 linux-4.7.2 glibc-2.24 libstdcpp-6.2.0 \
binutils-2.27-2 gcc-6.2.0-2 tcl-core8.6.6 expect5.45 dejagnu-1.6 check-0.10.0 \
ncurses-6.0 bash-4.3.30 bzip2-1.0.6 coreutils-8.25 diffutils-3.5 file-5.28 \
findutils-4.6.0 gawk-4.1.3 gettext-0.19.8.1 grep-2.25 gzip-1.8 m4-1.4.17 \
make-4.2.1 patch-2.7.5 perl-5.24.0 sed-4.2.2 tar-1.29 texinfo-6.1 \
util-linux-2.28.1 xz-5.2.2

define install
pushd $(SOURCES) && tar -xvf $(@).* && pushd $(@) && \
source $(INSTALL)/$(@).sh && popd && rm -rf $(@) && popd && \
touch $(@)
endef

all: $(targets)

binutils-2.27:
	$(install)

gcc-6.2.0: binutils-2.27
	$(install)

linux-4.7.2: gcc-6.2.0
	$(install)

glibc-2.24: linux-4.7.2
	$(install)

libstdcpp-6.2.0: glibc-2.24
	pushd $(SOURCES) && tar -xvf gcc-6.2.0.* && pushd gcc-6.2.0 && \
	source $(INSTALL)/libstdcpp-6.2.0.sh && popd && rm -rf gcc-6.2.0 && popd && \
	touch libstdcpp-6.2.0

binutils-2.27-2: libstdcpp-6.2.0
	pushd $(SOURCES) && tar -xvf binutils-2.27.* && pushd binutils-2.27 && \
	source $(INSTALL)/binutils-2.27-2.sh && popd && rm -rf binutils-2.27 && popd && \
	touch binutils-2.27-2

gcc-6.2.0-2: binutils-2.27-2
	pushd $(SOURCES) && tar -xvf gcc-6.2.0.* && pushd gcc-6.2.0 && \
	source $(INSTALL)/gcc-6.2.0-2.sh && popd && rm -rf gcc-6.2.0 && popd && \
	touch gcc-6.2.0-2

tcl-core8.6.6: gcc-6.2.0-2
	pushd $(SOURCES) && tar -xvf tcl-core8.6.6-src.* && pushd tcl8.6.6 && \
	source $(INSTALL)/tcl-core8.6.6.sh && popd && rm -rf tcl8.6.6 && popd && \
	touch tcl-core8.6.6

expect5.45: tcl-core8.6.6
	$(install)

dejagnu-1.6: expect5.45
	$(install)

check-0.10.0: dejagnu-1.6
	$(install)

ncurses-6.0: check-0.10.0
	$(install)

bash-4.3.30: ncurses-6.0
	$(install)

bzip2-1.0.6: bash-4.3.30
	$(install)

coreutils-8.25: bzip2-1.0.6
	$(install)

diffutils-3.5: coreutils-8.25
	$(install)

file-5.28: diffutils-3.5
	$(install)

findutils-4.6.0: file-5.28
	$(install)

gawk-4.1.3: findutils-4.6.0
	$(install)

gettext-0.19.8.1: gawk-4.1.3
	$(install)

grep-2.25: gettext-0.19.8.1
	$(install)

gzip-1.8: grep-2.25
	$(install)

m4-1.4.17: gzip-1.8
	$(install)

make-4.2.1: m4-1.4.17
	$(install)

patch-2.7.5: make-4.2.1
	$(install)

perl-5.24.0: patch-2.7.5
	$(install)

sed-4.2.2: perl-5.24.0
	$(install)

tar-1.29: sed-4.2.2
	$(install)

texinfo-6.1: tar-1.29
	$(install)

util-linux-2.28.1: texinfo-6.1
	$(install)

xz-5.2.2: util-linux-2.28.1
	$(install)

clean:
	rm -rf $(targets)
