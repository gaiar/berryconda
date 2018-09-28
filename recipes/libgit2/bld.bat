mkdir build && cd build
cmake ^
	-G "NMake Makefiles"                     ^
	-DCMAKE_BUILD_TYPE=Release               ^
	-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%     ^
	-DCMAKE_FIND_ROOT_PATH=%LIBRARY_PREFIX%  ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%  ^
	-DBIN_INSTALL_DIR=%LIBRARY_BIN%     ^
	-DLIB_INSTALL_DIR=%LIBRARY_LIB%     ^
	-DINCLUDE_INSTALL_DIR=%LIBRARY_INC% ^
	-DSTATIC_CRT=off                    ^
	..

cmake --build . --config Release --target INSTALL
