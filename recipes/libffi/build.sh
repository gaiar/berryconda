#!/usr/bin/env bash

shopt -s extglob

export CFLAGS="${CFLAGS//-fvisibility=+([! ])/}"
export CXXFLAGS="${CXXFLAGS//-fvisibility=+([! ])/}"

autoreconf -vfi

if [[ $(uname) == "Linux" ]]; then
  # this changes the install dir from ${PREFIX}/lib64 to ${PREFIX}/lib
  sed -i 's:@toolexeclibdir@:$(libdir):g' Makefile.in */Makefile.in
  sed -i 's:@toolexeclibdir@:${libdir}:g' libffi.pc.in
fi

./configure --build=${BUILD} --host=${HOST} \
            --disable-debug --disable-dependency-tracking \
            --prefix="${PREFIX}" --includedir="${PREFIX}/include" \
  || { cat config.log; exit 1;}

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install

# This overlaps with libgcc-ng:
rm -rf ${PREFIX}/share/info/dir
