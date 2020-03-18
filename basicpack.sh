#!/bin/bash
## --------- INSTRUCTIONS & COMMANDS ----------
## Run command bellow will clean up the pi and add the Samba server configs
## Run basickpack.sh directly from GitHub:
## sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/basicpack.sh | bash
## Download GitHub kiosk.sh file:
## curl -OL https://raw.githubusercontent.com/tadeubanzato/DashPi/blob/master/kiosk.sh

# ## Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle)
# sudo apt-get remove --purge libreoffice* minecraft-pi sonic-pi dillo gpicview penguinspuzzle -y
#
# ## Autoremove  & Celan
# sudo apt-get autoremove -y && sudo apt-get autoclean -y
#
# ## Update and Upgrade Distribution
# sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
# sleep 2

## Install Samba files
# sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-samba.sh | bash
# printf "#--------> PASSED SAMBA INSTALL\n"
# sleep 4

## Install Python
sudo apt install python3-picamera -y
printf "#--------> PASSED PYTHON INSTALL\n"
sleep 4

## Install NGINX as webserver and remove Apache
# sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/install-webserver.sh | bash
# printf "#--------> PASSED NGINX INSTALL\n"
# sleep 4

## Bind /var/www/html to samba share
# sudo curl -fsSL https://raw.githubusercontent.com/tadeubanzato/SetMyPi/master/mount-samba.sh | bash
# printf "#--------> BINDED /var/www/html to Samba share\n"
# sleep 4
# printf "#--------> You can access over /home/pi/webserver and changes will affect /var/www/html automatically\n"
# sleep 6

## Run update once finished
sudo apt-get update
