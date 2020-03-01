#!/bin/bash

# Remove bloatware (Wolfram Engine, Libre Office, Minecraft Pi, sonic-pi dillo gpicview penguinspuzzle)
sudo apt-get remove --purge libreoffice* minecraft-pi sonic-pi dillo gpicview penguinspuzzle -y

# Autoremove
sudo apt-get autoremove -y

# Clean
sudo apt-get autoclean -y

# Update
sudo apt-get update
printf "########## PASSED CLEAN 01\n"

pass="kongo78"
# Start Samba Instalation -------------
# Install Samba
sudo apt-get install samba samba-common-bin  -y

printf "########## PASSED SAMBA INSTALL\n"

sudo mkdir /home/pi/swap

#Setup share on Samba
cp /etc/samba/smb.conf /home/pi/swap/
sudo echo '[global]' >> /home/pi/smb.conf
sudo echo 'netbios name = Pi' >> /home/pi/smb.conf
sudo echo 'server string = The Pi File Center' >> /home/pi/smb.conf
sudo echo 'workgroup = WORKGROUP' >> /home/pi/smb.conf
sudo echo ' ' >> /home/pi/smb.conf
sudo echo '[HOMEPI]' >> /home/pi/smb.conf
sudo echo 'path = /' >> /home/pi/smb.conf
sudo echo 'comment = No comment' >> /home/pi/smb.conf
sudo echo 'writeable=Yes' >> /home/pi/smb.conf
sudo echo 'create mask=0777' >> /home/pi/smb.conf
sudo echo 'directory mask=0777' >> /home/pi/smb.conf
sudo echo 'public=no' >> /home/pi/smb.conf
sudo cp /home/pi/swap/smb.conf /etc/samba/smb.conf 

printf "########## PASSED WRITING SAMBA CONFIG TO /etc/samba/smb.conf\n"
printf "########## ADD PASSWORD FOR SAMBA\n"

#Set samba password
#sudo smbpasswd -a pi
printf "\n\n########## NO SAMBA PASSWORD\n\n"
sudo service smbd restart

#Setup my Pi Kiosk
printf "\n\n\n\n########## SETTING KIOSK MODE\n\n\n\n"
sudo apt-get purge scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common -y
sudo apt-get clean
sudo apt-get autoremove -y
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install xdotool unclutter sed  -y
sudo raspi-config

#Create Kiosk script
sudo touch /home/pi/kiosk.sh
#sudo chmod +x /home/pi/kiosk.sh

printf "### CREATED kiosk.sh Script ####\n"
cp /home/pi/smb.conf /home/pi/swap/
sudo echo '#!/bin/bash' >> /home/pi/kiosk.sh
sudo echo 'xset s noblank' >> /home/pi/kiosk.sh
sudo echo 'xset s off' >> /home/pi/kiosk.sh
sudo echo 'xset -dpms' >> /home/pi/kiosk.sh
sudo echo ' ' >> /home/pi/kiosk.sh
sudo echo 'unclutter -idle 0.5 -root &' >> /home/pi/kiosk.sh
sudo echo ' ' >> /home/pi/kiosk.sh
sudo echo 'sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences' >> /home/pi/kiosk.sh
sudo echo 'sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences' >> /home/pi/kiosk.sh
sudo echo ' ' >> /home/pi/kiosk.sh
sudo echo '/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk --incognito https://datastudio.google.com/embed/reporting/d4fbfe6c-fdf1-41f7-a4f6-a972959261eb/page/a5o1 https://datastudio.google.com/embed/reporting/6627889d-3abc-4cb9-8e1a-ec3ba3fe8646/page/a5o1 https://datastudio.google.com/embed/reporting/84984260-6b53-429b-a5b5-7921996a8b57/page/a5o1 https://datastudio.google.com/embed/reporting/cd30b870-6f63-4dd2-9ed6-6eada083d4b9/page/a5o1 https://datastudio.google.com/embed/reporting/46b0b8e2-3e54-4239-bda8-9fdd3a4f6393/page/a5o1 &' >> /home/pi/kiosk.sh
sudo echo ' ' >> /home/pi/kiosk.sh
sudo echo 'while true; do' >> /home/pi/kiosk.sh
sudo echo '   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;' >> /home/pi/kiosk.sh
sudo echo '   sleep 10' >> /home/pi/kiosk.sh
sudo echo 'done' >> /home/pi/kiosk.sh
sudo cp /home/pi/swap/smb.conf /home/pi/

echo $DISPLAY

cp /lib/systemd/system/kiosk.service /home/pi/swap/
sudo echo '[Unit]' >> /lib/systemd/system/kiosk.service
sudo echo 'Description=Chromium Kiosk' >> /lib/systemd/system/kiosk.service
sudo echo 'Wants=graphical.target' >> /lib/systemd/system/kiosk.service
sudo echo 'After=graphical.target' >> /lib/systemd/system/kiosk.service
sudo echo ' ' >> /lib/systemd/system/kiosk.service
sudo echo '[Service]' >> /lib/systemd/system/kiosk.service
sudo echo 'Environment=DISPLAY=:0.0' >> /lib/systemd/system/kiosk.service
sudo echo 'Environment=XAUTHORITY=/home/pi/.Xauthority' >> /lib/systemd/system/kiosk.service
sudo echo 'Type=simple' >> /lib/systemd/system/kiosk.service
sudo echo 'ExecStart=/bin/bash /home/pi/kiosk.sh' >> /lib/systemd/system/kiosk.service
sudo echo 'Restart=on-abort' >> /lib/systemd/system/kiosk.service
sudo echo 'User=pi' >> /lib/systemd/system/kiosk.service
sudo echo 'Group=pi' >> /lib/systemd/system/kiosk.service
sudo echo ' ' >> /lib/systemd/system/kiosk.service
sudo echo '[Install]' >> /lib/systemd/system/kiosk.service
sudo echo 'WantedBy=graphical.target' >> /lib/systemd/system/kiosk.service
sudo cp /home/pi/swap/kiosk.service /lib/systemd/system/

#Enable Kiosk Service
sudo systemctl enable kiosk.service

#Start Kiosk Service
sudo systemctl start kiosk.service

#sudo systemctl status kiosk.service
#sudo systemctl restart kiosk.service
#sudo systemctl disable kiosk.service

