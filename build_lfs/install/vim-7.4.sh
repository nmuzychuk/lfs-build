#!/bin/bash

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make

make install

ln -sv vim /usr/bin/vi
for L in /usr/share/man/{,*/}man1/vim.1; do
 ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim74/doc /usr/share/doc/vim-7.4

# Configuring Vim
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc
set nocompatible
set backspace=2
syntax on
if (&term == "iterm") || (&term == "putty")
 set background=dark
endif
" End /etc/vimrc
EOF
