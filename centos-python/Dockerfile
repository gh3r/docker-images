############################################################
# Dockerfile to build python environment on CentOS
# Build on bastianb/centos6.5 image
############################################################

# Pull base image from dockerhub
FROM bastianb/centos6.5

# File Author / Maintainer
MAINTAINER Marcin Godlewski gher13@gmail.com

# Get setup File
COPY ./install-python.sh /tmp/install-python.sh

# Install base software for python environment
RUN ["chmod", "+x", "/tmp/install-python.sh"]
RUN /tmp/install-python.sh

# Set environment variable.
ENV HOME /code

# Define working directory.
WORKDIR /code

# Define default command.
CMD ["/bin/bash"]