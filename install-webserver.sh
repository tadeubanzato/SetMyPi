#!/bin/bash

## Remove Apache
sudo apt-get remove apache*
sudo apt-get autoremove

## Install NGINX from repository and start NGINX
sudo apt-get install nginx
sudo systemctl start nginx

## No PHP support is installed, if you want to install PHP follow steps at https://pimylifeup.com/raspberry-pi-nginx/
