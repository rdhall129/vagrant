#!/bin/bash

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# Download Starter Content
cd /var/www/html
sudo wget -q https://raw.githubusercontent.com/rdhall129/vagrant/master/files/index.html
sudo wget -q https://raw.githubusercontent.com/rdhall129/vagrant/master/files/info.php
systemctl restart httpd