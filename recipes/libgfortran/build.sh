#!/bin/bash

LIB=$PREFIX/lib
mkdir $LIB
cd $LIB

if [ `uname -m` == 'armv7l' ]; then
    cp /usr/lib/arm-linux-gnueabihf/libgfortran.so.3.0.0 .
    ln -s libgfortran.so.3.0.0 libgfortran.so.3
fi
if [ `uname -m` == 'armv6l' ]; then
    cp /usr/lib/arm-linux-gnueabihf/libgfortran.so.3.0.0 .
    ln -s libgfortran.so.3.0.0 libgfortran.so.3
fi
if [ `uname -m` == 'aarch64' ]; then
    cp /usr/lib/aarch64-linux-gnu/libgfortran.so.3.0.0 .
    ln -s libgfortran.so.3.0.0 libgfortran.so.3
fi