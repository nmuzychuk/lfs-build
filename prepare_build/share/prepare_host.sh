#!/bin/bash

# Host System Requirements
sudo ln -sfv /bin/bash /bin/sh

# Creating a New Partition
if [ ! -b /dev/sdb1 ]; then
  echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdb
else
  echo "LFS partition is already present"
fi

# Creating a File System on the Partition
if ! sudo blkid /dev/sdb1 | grep "ext4"; then
  sudo mkfs -v -t ext4 /dev/sdb1
else
  echo "LFS filesystem is already present"
fi

# LFS user
USER=$(id -u)
GROUP=$(id -g)

sudo mkdir -pv $LFS

# Mounting the New Partition
if ! mount | grep lfs; then
  sudo mount -v -t ext4 /dev/sdb1 $LFS
  sudo chown ${USER}:${GROUP} $LFS
else
  echo "LFS filesystem is already mounted"
fi

# Packages and Patches
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources

wget -q -O wget-list http://www.linuxfromscratch.org/lfs/downloads/wget-list
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

pushd $LFS/sources
wget -q -O md5sums http://www.linuxfromscratch.org/lfs/downloads/md5sums
md5sum -c md5sums
popd

# Creating the $LFS/tools Directory
mkdir -pv $LFS/tools

sudo ln -sfv $LFS/tools /

chown -v ${USER} $LFS/tools
chown -v ${USER} $LFS/sources

set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
