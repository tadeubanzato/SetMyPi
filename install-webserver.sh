#!/bin/bash

## Remove Apache
sudo apt-get remove apache* -y
sudo apt-get autoremove -y

## Install NGINX from repository and start NGINX
sudo apt-get install nginx -y
sudo systemctl start nginx

## No PHP support is installed, if you want to install PHP follow steps at https://pimylifeup.com/raspberry-pi-nginx/
