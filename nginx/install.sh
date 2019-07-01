#!/usr/bin/env bash

# Install nginx
apt-get update
apt-get install -y nginx

# Replacing config for php-fpm
service nginx stop
cat /vagrant/default > /etc/nginx/sites-enabled/default
service nginx start
