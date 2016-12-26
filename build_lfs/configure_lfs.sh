#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SHARE=${DIR}/share

pushd ${DIR}
make lfs-bootscripts-20150222
popd

# Creating Custom Udev Rules
bash /lib/udev/init-net-rules.sh

cd /etc/sysconfig/
cat > ifconfig.enp0s3 << "EOF"
ONBOOT=yes
IFACE=enp0s3
SERVICE=ipv4-static
IP=10.0.2.10
GATEWAY=10.0.2.2
PREFIX=24
BROADCAST=10.0.2.255
EOF

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf
domain localdomain
nameserver 8.8.8.8
nameserver 8.8.4.4
# End /etc/resolv.conf
EOF

echo "lfs" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts (network card version)
127.0.0.1 localhost
<192.168.1.1> <HOSTNAME.example.org> [alias1] [alias2 ...]
# End /etc/hosts (network card version)
EOF

cat > /etc/inittab << "EOF"
# Begin /etc/inittab
id:3:initdefault:
si::sysinit:/etc/rc.d/init.d/rc S
l0:0:wait:/etc/rc.d/init.d/rc 0
l1:S1:wait:/etc/rc.d/init.d/rc 1
l2:2:wait:/etc/rc.d/init.d/rc 2
l3:3:wait:/etc/rc.d/init.d/rc 3
l4:4:wait:/etc/rc.d/init.d/rc 4
l5:5:wait:/etc/rc.d/init.d/rc 5
l6:6:wait:/etc/rc.d/init.d/rc 6
ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now
su:S016:once:/sbin/sulogin
1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600
4:2345:respawn:/sbin/agetty tty4 9600
5:2345:respawn:/sbin/agetty tty5 9600
6:2345:respawn:/sbin/agetty tty6 9600
# End /etc/inittab
EOF

cat > /etc/sysconfig/clock << "EOF"
# Begin /etc/sysconfig/clock
UTC=1
# Set this to any options you might need to give to hwclock,
# such as machine hardware clock type for Alphas.
CLOCKPARAMS=
# End /etc/sysconfig/clock
EOF

cat > /etc/shells << "EOF"
# Begin /etc/shells
/bin/sh
/bin/bash
# End /etc/shells
EOF

# Chapter 8. Making the LFS System Bootable
cat > /etc/fstab << "EOF"
# Begin /etc/fstab
# file system mount-point type options dump fsck
# order
/dev/sda1 / ext4 defaults 1 1
proc /proc proc nosuid,noexec,nodev 0 0
sysfs /sys sysfs nosuid,noexec,nodev 0 0
devpts /dev/pts devpts gid=5,mode=620 0 0
tmpfs /run tmpfs defaults 0 0
devtmpfs /dev devtmpfs mode=0755,nosuid 0 0
# End /etc/fstab
EOF

pushd ${DIR}
make linux-4.7.2
popd

# Using GRUB to Set Up the Boot Process
grub-install /dev/sdb

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5
insmod ext4
set root=(hd0,1)
menuentry "GNU/Linux, Linux 4.7.2-lfs-7.10" {
 linux /boot/vmlinuz-4.7.2-lfs-7.10 root=/dev/sda1 ro
}
EOF

# Chapter 9. The End
echo 7.10 > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="7.10"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

ROOT_PASS=$(date +%s | sha256sum | base64 | head -c 7)
echo $ROOT_PASS > /vagrant/ROOT_PASS
echo "root:$ROOT_PASS" | chpasswd
