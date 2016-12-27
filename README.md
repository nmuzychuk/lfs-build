# LFS Build
LFS Build is a tool which automatically builds and configures a [Linux from Scratch](http://www.linuxfromscratch.org/lfs/) system.

## Information
The tool is applicable to LFS version 7.10. The following software is used:
* Linux-4.7.2
* Glibc 2.24
* GCC 6.2.0
* Bash-4.3.30
* GRUB-2.02~beta3

An LFS system is built with the help of [Vagrant](https://www.vagrantup.com/) which should be installed.

Building your own Linux system from source is a time-consuming process. Here are some real-world examples of how long it may take:

| System Specs       | Build Time    |
| ------------------ |:-------------:|
| Intel Core i5, SSD | 182m17.485s   |
| Intel Atom, HDD    | 385m32.365s   |

## Quick Start
Create a new virtual machine. Additional disk is automatically created for a new LFS installation
```console
vagrant up
```
Log in to the VM
```console
vagrant ssh
```
Build the system. The following command:
* Prepares a new partition which will host the LFS system
* Downloads all required source packages
* Installs packages that will form the toolchain which is used to build the actual system
* Builds the full LFS system
* Installs kernel, bootloader and sets up configuration

```console
bash /vagrant/lfs.sh build
```
After the build is done you can examine and reconfigure your LFS system. Or just exit and leave the default settings
```console
exit
```
Gracefully shutdown the VM
```console
vagrant halt
```
Create a new virtual machine using the lfs disk file `box-disk2.vmdk`

Obtain the root password
```console
cat ROOT_PASS
```

### Clean up
```console
vagrant destroy
```
```console
bash lfs.sh clean
```
```console
rm -f box-disk2.vmdk ROOT_PASS
```

## Test
Static code analysis is used. Requires [ShellCheck](https://github.com/koalaman/shellcheck)
```console
bash lfs.sh test
```
