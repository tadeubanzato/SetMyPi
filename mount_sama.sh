#!/bin/bash

# Create a folder and bind it to the /var/www/html folder
sudo mkdir -p /home/pi/webserver

# Add the bind to /etc/fstab
sudo echo "/var/www/html /home/pi/webserver none bind 0 0" >> /etc/fstab
sudo mount -o bind /var/www/html /home/pi/webserver
sudo chown pi:pi /home/pi/webserver
