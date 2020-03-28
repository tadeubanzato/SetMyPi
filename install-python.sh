#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

## Install Python 2 but updates to 3.8.2
sudo apt install python-pip python-dev python-rpi.gpio -y
sudo apt-get install build-essential checkinstall tk-dev libncurses5-dev libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev libc6-dev -y

## Download Python 3.8.2
printf "\n\n ${YELLOW}--------> DOWNLOADING PYTHON 3.8.2 ${NC}\n\n"
wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
sudo tar zxf Python-3.8.2.tgz
cd /home/pi/Python-3.8.2/
sudo ./configure --enable-optimizations
printf "\n\n ${YELLOW}--------> CONFIGURING PYTHON 3.8.2 AS STANDARD ${NC}\n\n"
sudo make -j 4
sudo make altinstall
echo "alias python=/usr/local/bin/python3.8" >> ~/.bashrc
source ~/.bashrc

printf "\n\n ${YELLOW}--------> INSTALLING PYTHON MODULES ${NC}\n\n"

## Install Tweepy
pip install tweepy logging django oauth2client gspread requests pprint

# ## Install Logging
# pip install logging
#
# ## Install Djangoe
# pip install django
#
# ## Install oAuth for Google API
# pip install oauth2client
#
# ## Install gspread to use with Google Sheets API
# pip install gspread
#
# ## Install requests to use with WebHook
# pip install requests
#
# ## Install oAuth to use with WebHook
# pip install pprint
