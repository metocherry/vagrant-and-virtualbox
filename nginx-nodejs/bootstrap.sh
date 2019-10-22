#!/usr/bin/env bash

# 1. Register Repository
# 2. Intalll Git
# 3. Install NginX
# 4. Install NodeJS


# Register Repository

sudo rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7

sudo rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
sudo yum install -y epel-release
sudo yum --enablerepo=epel update -y

sudo rpm --import https://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-el7
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum --enablerepo=webtatic update -y

yum repolist


# Install Git

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


# Install NginX

if [ ! -f /etc/yum.repos.d/nginx.repo ]; then
sudo bash -c 'cat <<EOF >> /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgkey=http://nginx.org/keys/nginx_signing.key
enabled=1
EOF'
fi

# add nginx sign key
# wget --quiet http://nginx.org/keys/nginx_signing.key && rpm --import nginx_signing.key
# sudo yum-config-manager --disable nginx
sudo yum install -y nginx


# Install PHP

sudo yum install -y php71w php71w-cli
sudo yum install -y yum install php71w-xml php71w-xmlrpc php71w-soap php71w-mbstring php71w-json php71w-gd php71w-mcrypt php71w-mysql
sudo yum install -y php71w-fpm php71w-common

# sudo vi /etc/php-fpm.d/www.conf
# listen = 127.0.0.1:9000 -> /var/run/php-fpm/php-fpm.sock
# listen.owner = nginx
# listen.group = nginx

# sudo vi /etc/nginx/conf.d/default.conf
# root   /usr/share/nginx/html;
# index  index.php index.html index.htm;
# location / {
#   try_files $uri $uri/ =404;
# }
# 


# sudo systemctl start nginx
# sudo systemctl start php-fpm

# Install Composer
# HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
# php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# rm -rf composer-setup.php

# curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
# yarn install --no-bin-links

# sudo chown -R nginx:nginx application/
# sudo chmod -R 777 application/
