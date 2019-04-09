#!/usr/bin/env bash

if [ ! -f /etc/yum.repos.d/MariaDB.repo ]; then
sudo bash -c 'cat <<EOF >> /etc/yum.repos.d/MariaDB.repo
# MariaDB 10.1 CentOS repository list 
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF'
fi

sudo yum install -y MariaDB-server MariaDB-clien
