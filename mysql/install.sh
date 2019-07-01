#!/usr/bin/env bash
apt-get update

# Install mysql
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server

# Replace mysql congig
service mysql stop
cat /vagrant/my.cnf > /etc/mysql/my.cnf
service mysql start

/usr/bin/mysqladmin -u root password 'password'

# Creating db, user, privileges for user
mysql -u root -ppassword -e "CREATE DATABASE wordpress;"
mysql -u root -ppassword -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
