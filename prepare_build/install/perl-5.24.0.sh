#!/bin/bash

sh Configure -des -Dprefix=/tools -Dlibs=-lm

make

cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.24.0
cp -Rv lib/* /tools/lib/perl5/5.24.0
