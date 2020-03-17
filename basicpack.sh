#!/bin/bash
## --------- INSTRUCTIONS & COMMANDS ----------
## Run command bellow will clean up the pi and add the Samba server configs
## Run basickpack.sh directly from GitHub:
## sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/basicpack.sh | bash
## Download GitHub kiosk.sh file:
## curl -OL https://raw.githubusercontent.com/tadeubanzato/DashPi/blob/master/kiosk.sh

## Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle)
sudo apt-get remove --purge libreoffice* minecraft-pi sonic-pi dillo gpicview penguinspuzzle -y

## Autoremove  & Celan
sudo apt-get autoremove -y && sudo apt-get autoclean -y

## Update and Upgrade Distribution
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
sleep 3

## Start Samba Instalation -------------
sudo apt-get install samba samba-common-bin  -y
cd /tmp/ && curl -OL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/smb.conf
sudo cp /tmp/smb.conf /etc/samba/smb.conf
cd /home/pi/
# Run: sudo smbpasswd -a pi to setup password
# Run: sudo service smbd restart to restart the service

printf "#--------> PASSED SAMBA INSTALL\n"
sleep 2

## Install Python
sudo apt install python3-picamera
printf "#--------> PASSED PYTHON INSTALL\n"
sleep 2

## Bind /var/www/html to samba share
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/mount_samba.sh | bash
printf "#--------> BINDED /var/www/html to Samba share\n"
printf "#--------> You can access over /home/pi/webserver and changes will affect /var/www/html automatically\n"
sleep 5

## Install NGINX as webserver and remove Apache
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/installWebserver.sh | bash
printf "#--------> PASSED NGINX INSTALL\n"
sleep 2
