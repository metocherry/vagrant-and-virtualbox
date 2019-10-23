#!/usr/bin/env bash

info() {
  message=$1
  echo -e "\033[40;37m[INFO] $message \033[0m"
}

echo export LC_CTYPE="en_US.UTF-8" >> ~/.bash_profile 
echo export LC_ALL="en_US.UTF-8" >> ~/.bash_profile 

source ~/.bash_profile


info "UPDATE YUM"
yum update -y
yum install -y yum-utils


# Software Collections give you the power to build, install, and use
# multiple versions of software on the same system, without
# affecting system-wide installed packages.
# https://www.softwarecollections.org
info "INATALL SOFTWARE COLLECTIONS"

sudo yum install -y centos-release-scl

# On RHEL, enable RHSCL repository for you system:
sudo yum-config-manager --enable rhel-server-rhscl-7-rpms


# Developer Toolset is designed for developers working on CentOS or Red Hat Enterprise Linux platform.
# It provides current versions of the GNU Compiler Collection, GNU Debugger, and other development, debugging,
# and performance monitoring tools.
info "INATALL DEVTOOLSET"

sudo yum install -y devtoolset-7

# 로그인 할 때마다 devtoolset-7을 사용하도록 적용한다.
echo . /opt/rh/devtoolset-7/enable >> ~/.bash_profile

# Start using software collections
scl enable devtoolset-7 bash


info "INATALL SOFTWARE COLLECTIONS"

sudo yum -y groupinstall "Development Tools"
sudo yum -y install wget perl-CPAN gettext-devel perl-devel  openssl-devel  zlib-devel
sudo yum -y install curl-devel expat-devel

export GIT_VERSION="2.23.0"
wget https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz
tar -xvf v${GIT_VERSION}.tar.gz
rm -f v${GIT_VERSION}.tar.gz
cd git-*

sudo make prefix=/usr/local/git all
sudo make prefix=/usr/local/git install
sudo echo "export PATH=/usr/local/git/bin:$PATH" >> ~/.bashrc

source ~/.bashrc


info "INSTALL DOCKER"

# Set up the repositoy
sudo yum install -y device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install docker engine
# 특정 버전 설치가 필요한 경우
#   yum list docker-ce --showduplicates | sort -r
#   sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
