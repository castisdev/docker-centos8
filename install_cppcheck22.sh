#!/bin/bash -e
cd ~
yum -y install bzip2; yum -y clean all
wget --no-check-certificate --content-disposition https://github.com/danmar/cppcheck/archive/2.2.tar.gz
tar xf cppcheck-2.2.tar.gz
cd cppcheck-2.2
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf cppcheck*
