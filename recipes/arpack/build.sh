#!/bin/sh

mkdir build && cd build

for shared_libs in OFF ON
do
  cmake \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=${shared_libs} \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib" \
    ..

  make install -j${CPU_COUNT}
done
ctest --output-on-failure -j${CPU_COUNT}
