#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SHARE=${SCRIPT_DIR}/share

# Preparing the Host System
source ${SHARE}/prepare_host.sh

# Constructing a Temporary System
pushd ${SCRIPT_DIR}
make
popd

# Changing Ownership
sudo chown -R root:root $LFS/tools
