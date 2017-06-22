# LFS Build
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d76fc92f5fc64747a42fd3cb71930aa0)](https://www.codacy.com/app/nmuzychuk/lfs-build)

## Overview
LFS Build is a tool which automatically builds and configures a [Linux from Scratch](http://www.linuxfromscratch.org/lfs/) system.

The tool is applicable to LFS version 7.10. The following software is used:
* linux-4.7.2
* glibc-2.24
* gcc-6.2.0
* bash-4.3.30
* grub-2.02

Building your own Linux system from source is a time-consuming process. Here are some real-world examples of how long it may take:

| System Specs       | Build Time    |
| ------------------ |:-------------:|
| Intel Core i5, SSD | 182m17.485s   |
| Intel Atom, HDD    | 385m32.365s   |

## Getting started

### Build
Create a new virtual machine. Additional disk is automatically created for a new LFS installation
```
vagrant up
```
Log in to the VM
```
vagrant ssh
```
Build the system. The following command:
* Prepares a new partition which will host the LFS system
* Downloads all required source packages
* Installs packages that will form the toolchain which is used to build the actual system
* Builds the full LFS system
* Installs kernel, bootloader and sets up configuration

```
bash /vagrant/lfs.sh build
```
After the build is done you can examine and reconfigure your LFS system. Or just exit and leave the default settings
```
exit
```
Gracefully shutdown the VM
```
vagrant halt
```
Create a new virtual machine using the lfs disk file `box-disk2.vmdk`

Obtain the root password
```
cat ROOT_PASS
```

### Clean up
```
vagrant destroy
bash lfs.sh clean
rm -f box-disk2.vmdk ROOT_PASS
```

## License
LFS Build is licensed under the [MIT License](LICENSE)
