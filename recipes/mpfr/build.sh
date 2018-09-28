#!/bin/bash

export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH

./configure --prefix=$PREFIX \
            --with-gmp=$PREFIX \
            --enable-static
make -j "${CPU_COUNT}"
make check
make install
