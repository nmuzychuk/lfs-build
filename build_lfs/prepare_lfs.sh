#!/bin/bash

# Preparing Virtual Kernel File Systems
sudo mkdir -pv $LFS/{dev,proc,sys,run}

# Creating Initial Device Nodes
sudo mknod -m 600 $LFS/dev/console c 5 1
sudo mknod -m 666 $LFS/dev/null c 1 3

# Mounting and Populating /dev
sudo mount -v --bind /dev $LFS/dev

# Mounting Virtual Kernel File Systems
sudo mount -vt devpts devpts "$LFS/dev/pts" -o gid=5,mode=620
sudo mount -vt proc proc "$LFS/proc"
sudo mount -vt sysfs sysfs "$LFS/sys"
sudo mount -vt tmpfs tmpfs "$LFS/run"

if [ -h $LFS/dev/shm ]; then
 sudo mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

sudo mkdir -p "$LFS/vagrant"
sudo mount --bind /vagrant "$LFS/vagrant"
