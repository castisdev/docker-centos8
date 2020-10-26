#!/bin/bash -e
yum -y install bzip2-devel which valgrind-devel patch; yum -y clean all
cd ~
wget --no-check-certificate https://dl.bintray.com/boostorg/release/1.74.0/source/boost_1_74_0.tar.gz
tar xzf boost_1_74_0.tar.gz
cd boost_1_74_0

./bootstrap.sh --prefix=/usr/local/boost_1_74_0
./b2 --without-python -j$(nproc) install
./b2 boost.locale.icu=off --with-locale -j$(nproc) install

./bootstrap.sh --prefix=/usr/local/boost_1_74_0_valgrind
./b2 --without-python -j$(nproc) valgrind=on install

cd ~
rm -rf boost_*
