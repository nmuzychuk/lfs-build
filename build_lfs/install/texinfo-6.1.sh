#!/bin/bash

./configure --prefix=/usr --disable-static

make

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
rm -v dir
for f in *
 do install-info $f dir 2>/dev/null
done
popd
