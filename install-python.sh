#!/bin/bash

## Install Python 2 but updates to 3.8.2
sudo apt install python3-picamera python-pip python-dev python-rpi.gpio -y
sudo apt-get install sudo apt-get install build-essential checkinstall -y
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
cd /usr/src
Sudo wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
sudo tar xzf Python-3.8.2.tgz
cd Python-3.8.2

## Compile Python 3.8.2
sudo -s
bash configure
make altinstall
exit
