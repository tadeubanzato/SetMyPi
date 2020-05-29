#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

## Remove Apache
sudo apt-get remove apache* -y
sudo apt-get autoremove -y

## Install NGINX from repository and start NGINX
sudo apt-get install nginx -y
sudo apt-get install php-fpm php-mysql -y
sudo systemctl start nginx

## No PHP support is installed, if you want to install PHP follow steps at https://pimylifeup.com/raspberry-pi-nginx/
