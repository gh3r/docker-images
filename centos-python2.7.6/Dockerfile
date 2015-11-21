############################################################
# Dockerfile to build python environment on CentOS
# Build on bastianb/centos6.5 image
############################################################

# Pull base image from dockerhub
FROM bastianb/centos6.5

# File Author / Maintainer
MAINTAINER Marcin Godlewski <gher13@gmail.com>

# Download essentials 
RUN \
	yum update -y && \
	yum groupinstall -y development && \
	yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget tar

# Get python and setuptools
RUN \
	wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz && \
	tar -zxvf Python-2.7.6.tgz -C /tmp/ && \
	wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz && \
	tar -xvf setuptools-1.4.2.tar.gz -C /tmp/

# Install python, setuptools and pip
RUN \
	cd /tmp/Python-2.7.6 && \
	./configure --prefix=/usr/local && \
	make && make altinstall && \
	export PATH="/usr/local/bin:$PATH" && \
	cd /tmp/setuptools-1.4.2 && \
	python2.7 setup.py install && \
	easy_install-2.7 -U pip && \
	pip install -U setuptools pip

# Do a cleanup
RUN \
	cd /tmp/ && \
	rm -rf Python-2.7.6 setuptools-1.4.2

# Set environment variable.
ENV HOME /code

# Define working directory.
WORKDIR /code

# Define default command.
CMD ["/bin/bash"]
