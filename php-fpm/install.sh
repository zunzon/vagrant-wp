#!/usr/bin/env bash

# Install php-fpm and dependencies
apt-get update
apt-get install -y php-fpm
apt-get install php7.0-mysql

# Replacing php-fpm config
service php7.0-fpm stop
cat /vagrant/www.conf > /etc/php/7.0/fpm/pool.d/www.conf
service php7.0-fpm restart
