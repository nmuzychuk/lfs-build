#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly PREPARE_BUILD_DIR="$SCRIPT_DIR/prepare_build"
readonly BUILD_LFS_DIR="$SCRIPT_DIR/build_lfs"

function build_lfs() {
  # Setting The $LFS Variable
  export LFS=/mnt/lfs

  # Preparing for the Build
  source "$PREPARE_BUILD_DIR/prepare_build.sh"

  # Preparing Virtual Kernel File Systems
  source "$BUILD_LFS_DIR/prepare_lfs.sh"

  # Installing Basic System Software
  sudo chroot "$LFS" /tools/bin/env -i \
    HOME=/root \
    TERM="$TERM" \
    PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h \
    -c "source /vagrant/build_lfs/build_lfs.sh"

  # System Configuration
  sudo chroot "$LFS" /usr/bin/env -i \
    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login \
    -c "source /vagrant/build_lfs/configure_lfs.sh"
}

function clean_lfs() {
  pushd "$PREPARE_BUILD_DIR" && make clean && popd
  pushd "$BUILD_LFS_DIR" && make clean && popd
}

function test_lfs() {
  find . -name "*.sh" -print0 | xargs -0 bash -n && \
  find . -maxdepth 1 -name "*.sh" -print0 | xargs -0 shellcheck
}

case "$1" in
  build)
    build_lfs
    ;;
  clean)
    clean_lfs
    ;;
  test)
    test_lfs
    ;;
  *)
    echo "Usage: $0 {build|clean|test}"
    exit 1
esac
