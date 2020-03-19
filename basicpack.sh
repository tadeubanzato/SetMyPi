#!/bin/bash
## --------- INSTRUCTIONS & COMMANDS ----------
## Run command bellow will clean up the pi and add the Samba server configs
## Run basickpack.sh directly from GitHub:
## sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/basicpack.sh | bash
## Download GitHub kiosk.sh file:
## curl -OL https://raw.githubusercontent.com/tadeubanzato/DashPi/blob/master/kiosk.sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

sudo raspi-config

## Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle)
sudo apt-get remove --purge libreoffice* minecraft-pi sonic-pi dillo gpicview penguinspuzzle -y

## Autoremove  & Celan
sudo apt-get autoremove -y && sudo apt-get autoclean -y

## Update and Upgrade Distribution
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
sleep 2

## Install Samba files
printf "\n\n${YELLOW}--------> STARTING SAMBA INSTALL${NC}\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-samba.sh | bash
printf "\n\n${GREEN}--------> PASSED SAMBA INSTALL${NC}\n\n"
sleep 4

## Install Python
printf "\n\n${YELLOW}--------> STARTING PYTHON INSTALL${NC}\n\n"
sudo apt install python3-picamera -y
sudo apt-get install python-pip -y
sudo apt-get install python-dev -y
sudo apt-get install python-rpi.gpio -y
printf "\n\n${GREEN}--------> PASSED PYTHON INSTALL${NC}\n\n"
sleep 4

## Install Git
printf "\n\n${YELLOW}--------> STARTING GIT INSTALL${NC}\n\n"
sudo apt-get install git -y
printf "\n\n${GREEN}--------> PASSED GIT INSTALL${NC}\n\n"
sleep 4

## Install NGINX as webserver and remove Apache
printf "\n\n${YELLOW}--------> STARTING NGINX INSTALL${NC}\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-webserver.sh | bash
printf "\n\n${GREEN}--------> PASSED NGINX INSTALL${NC}\n\n"
sleep 4

## Bind /var/www/html to samba share
printf "\n\n${YELLOW}--------> START BINDING Samba Share${NC}\n\n"
sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/mount-samba.sh | bash
printf "\n\n${GREEN}--------> BINDED /var/www/html to Samba share${NC}\n\n"
sleep 4
printf "\n\n${BLUE}--------> You can access over /home/pi/webserver and changes will affect /var/www/html automatically${NC}\n\n"
sleep 6

## Run update once finished
sudo apt-get update
