#!/bin/bash -e
cd ~
wget https://github.com/Kitware/CMake/releases/download/v3.18.4/cmake-3.18.4-Linux-x86_64.sh --no-check-certificate
chmod +x cmake-3.18.4-Linux-x86_64.sh
./cmake-3.18.4-Linux-x86_64.sh --skip-license --prefix=/usr/local
cmake --version
cd ~
rm -rf cmake-*