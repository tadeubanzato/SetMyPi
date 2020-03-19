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
sleep 2

## Install Samba files
printf "\n\n#--------> STARTING SAMBA INSTALL\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-samba.sh | bash
printf "\n\n#--------> PASSED SAMBA INSTALL\n\n"
sleep 4

## Install Python
printf "\n\n#--------> STARTING PYTHON INSTALL\n\n"
sudo apt install python3-picamera -y
printf "\n\n#--------> PASSED PYTHON INSTALL\n\n"
sleep 4

## Install NGINX as webserver and remove Apache
printf "\n\n#--------> STARTING NGINX INSTALL\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-webserver.sh | bash
printf "\n\n#--------> PASSED NGINX INSTALL\n\n"
sleep 4

## Bind /var/www/html to samba share
printf "\n\n#--------> START BINDING Samba Share\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/mount-samba.sh | bash
printf "\n\n#--------> BINDED /var/www/html to Samba share\n\n"
sleep 4
printf "\n\n#--------> You can access over /home/pi/webserver and changes will affect /var/www/html automatically\n\n"
sleep 6

## Run update once finished
sudo apt-get update
