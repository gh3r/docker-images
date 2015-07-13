#!/bin/bash

_INSTALL_PATH="/setup-base"

# Get essentials
yum update -y
yum groupinstall -y development
yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget man tar tree

# Create temp directory
mkdir setup-base
cd $_INSTALL_PATH

# Get python 2.7 and setuptools
wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz && tar -zxvf Python-2.7.6.tgz
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz && tar -xvf setuptools-1.4.2.tar.gz

# Install python 2.7
cd $_INSTALL_PATH/Python-2.7.6
./configure --prefix=/usr/local
make
make altinstall
export PATH="/usr/local/bin:$PATH"

# Install setuptools 1.4.2
cd $_INSTALL_PATH/setuptools-1.4.2
python2.7 setup.py install
# install pip
easy_install-2.7 -U pip
# upgrade pip and setuptools
pip install -U setuptools pip

# Do a cleanup
cd /
rm -rf setup-base
