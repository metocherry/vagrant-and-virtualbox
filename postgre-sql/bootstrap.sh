#!/usr/bin/env bash

info() {
    message=$1
    echo -e "\033[40;37m[INFO] $message \033[0m"
}

# Install Repository

sudo rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7

sudo rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
sudo yum install -y epel-release
sudo yum --enablerepo=epel update -y

sudo rpm --import https://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum --enablerepo=webtatic update -y

yum repolist

