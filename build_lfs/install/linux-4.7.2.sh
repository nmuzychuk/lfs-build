#!/bin/bash

make mrproper

make defconfig

make

make modules_install

cp -v arch/x86/boot/bzImage /boot/vmlinuz-4.7.2-lfs-7.10

cp -v System.map /boot/System.map-4.7.2

cp -v .config /boot/config-4.7.2

install -d /usr/share/doc/linux-4.7.2
cp -r Documentation/* /usr/share/doc/linux-4.7.2

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf
install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true
# End /etc/modprobe.d/usb.conf
EOF
