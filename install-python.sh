#!/bin/bash

## Install Python 2 but updates to 3.8.2
sudo apt install python3-picamera python-pip python-dev python-rpi.gpio -y
sudo apt-get install build-essential checkinstall tk-dev libncurses5-dev libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev libc6-dev -y

## Download Python 3.8.2
wget https://www.python.org/ftp/python/3.8.0/Python-3.8.2.tgz
sudo tar zxf Python-3.8.2.tgz
cd Python-3.8.2
sudo ./configure --enable-optimizations
sudo make -j 4
sudo make altinstall
echo "alias python=/usr/local/bin/python3.8" >> ~/.bashrc
source ~/.bashrc


## Install Tweepy
pip install tweepy

## Install Logging
pip install logging

## Install Djangoe
pip install django

## Install uWSGI
pip install uwsgi
# sudo -u www-data uwsgi --ini uwsgi.ini --need-app

## Install oAuth for Google API
pip install oauth2client

## Install gspread to use with Google Sheets API
pip install gspread

## Install requests to use with WebHook
pip install requests

## Install oAuth to use with WebHook
pip install pprint
