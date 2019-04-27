#!/bin/bash

# MySQL/MariaDB
yum install -y mariadb mariadb-server mariadb-devel
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";