#!/bin/bash

patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch

make -C src

make -C src install
