#!/bin/bash

# Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle)
sudo apt-get remove --purge wolfram-engine libreoffice* scratch* minecraft-pi sonic-pi dillo gpicview penguinspuzzle -y

# Autoremove
sudo apt-get autoremove -y

# Clean
sudo apt-get autoclean -y

# Update
sudo apt-get update

# Install Samba
sudo apt-get install samba samba-common-bin

#MK Dir Share
mkdir ~/Share


