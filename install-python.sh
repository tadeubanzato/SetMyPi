#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

## Install Python 2 but updates to 3.8.2
sudo apt install python-pip python-dev python-rpi.gpio -y
sudo apt-get install build-essential checkinstall tk-dev libncurses5-dev libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev libatlas-base-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev libc6-dev -y

## Download Python 3.8.2
printf "\n\n ${YELLOW}--------> INSTALLING PYTHON 3.7 ${NC}\n\n"
sudo apt install python3 idle3
sudo apt install python3-pip

printf "\n\n ${YELLOW}--------> INSTALLING PYTHON MODULES ${NC}\n\n"

# ## Install LibAtlas
sudo apt-get install libatlas-base-dev

# ## Install Requirements
curl -OL https://github.com/tadeubanzato/SetMyPi/blob/master/requirements.txt
pip3 install -r requirements.txt
