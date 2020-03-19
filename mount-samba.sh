#!/bin/bash

# Create a folder and bind it to the /var/www/html folder
sudo mkdir -p /home/pi/webserver

# Add the bind to /etc/fstab
sudo cp /etc/fstab /tmp/fstab
sudo echo "/var/www/html /home/pi/webserver none bind 0 0" >> /tmp/fstab
sudo cp /tmp/fstab /etc/fstab
sudo mount -o bind /var/www/html /home/pi/webserver
sudo chown pi:pi /home/pi/webserver
