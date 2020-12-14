#!/bin/bash -e
set -x #echo on
yum install -y gcc-toolset-9 gcc-toolset-9-gcc-c++ gcc-toolset-9-binutils gcc-toolset-9-libquadmath-devel gcc-toolset-9-gdb gcc-toolset-9-gdb-gdbserver gcc-toolset-9-perftools gcc-toolset-9-libasan-devel gcc-toolset-9-liblsan-devel gcc-toolset-9-libtsan-devel gcc-toolset-9-libubsan-devel; yum clean all -y
