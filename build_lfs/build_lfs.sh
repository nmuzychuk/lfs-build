#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SHARE=${SCRIPT_DIR}/share

# Creating Essential Directories, Files and Symlinks
source ${SHARE}/create_files.sh

# Installing Basic System Software
pushd ${SCRIPT_DIR}
make
popd
