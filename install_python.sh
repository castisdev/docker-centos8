#!/bin/sh -e
set -x #echo on
yum module install -y python38
pip3 install -U pip setuptools
