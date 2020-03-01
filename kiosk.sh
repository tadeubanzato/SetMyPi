sudo touch /home/pi/kiosk.sh
sudo chmod +x /home/pi/kiosk.sh

printf "\n\n### CREATED kiosk.sh Script ####\n\n"

#sudo cp /home/pi/kiosk.sh /tmp/
printf "\n\n### Copied kiosk.sh to TMP Script ####\n\n"

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
#sudo cp /home/pi/kiosk.sh /home/pi/

printf "\n\n### CREATED kiosk.sh /home/pi/ ####\n\n"
