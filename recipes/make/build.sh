./configure --prefix=$PREFIX
export PERL_USE_UNSAFE_INC=1
make -j${CPU_COUNT}
make check
make install
