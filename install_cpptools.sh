#!/bin/sh -e

cd ~
yum install -y python3-pip; yum clean all -y
pip3 install gcovr cpplint
