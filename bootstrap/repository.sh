#!/usr/bin/env bash

# 1. Update
sudo rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7

# 2. Install EPEL(Extra Packages of Enterprise Linux) Repository
sudo rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
sudo yum install -y epel-release
sudo yum --enablerepo=epel update -y

# 3. Install Webtatic Repository
sudo rpm --import https://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum --enablerepo=webtatic update -y

# show yum repository list
yum repolist

# remi repository
# sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
# sudo rpm -ivh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# sudo yum --enablerepo=remi update remi-release
# ls -lh /etc/pki/rpm-gpg/
