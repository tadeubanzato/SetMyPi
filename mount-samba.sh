#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

printf "\n\n${YELLOW}--------> START BINDING Samba Share${NC}\n\n"
# Create a folder and bind it to the /var/www/html folder
sudo mkdir -p /home/pi/webserver

# Add the bind to /etc/fstab

cd /tmp/ && curl -OL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/fstab
sudo cp /tmp/fstab /etc/fstab

# sudo cp /etc/fstab /tmp/fstab
# sudo echo "/var/www/html /home/pi/webserver none bind 0 0" >> /tmp/fstab
# sudo cp /tmp/fstab /etc/fstab

sudo mount -o bind /var/www/html /home/pi/webserver
sudo chown pi:pi /home/pi/webserver
