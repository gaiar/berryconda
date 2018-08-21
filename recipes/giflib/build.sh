#!/bin/bash

./configure --prefix=${PREFIX} --build=$BUILD --host=$HOST
make -j$CPU_COUNT
if [[ $(uname) == Linux ]]; then
    make check
fi
make install
