#!/bin/bash

# Update Centos with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen wget

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL/MariaDB
yum install -y mariadb mariadb-server mariadb-devel
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/rdhall129/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/rdhall129/vagrant/master/files/info.php
systemctl restart httpd