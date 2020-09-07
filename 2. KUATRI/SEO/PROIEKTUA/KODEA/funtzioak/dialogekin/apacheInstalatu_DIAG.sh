#!/bin/bash

###########################################################
#   1) APACHE INSTALATU                     
###########################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"


function apacheInstalatu()
{
instalatuta apache2 #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
          --msgbox "APACHE INSTALATUKO DA" 10 50	
	
	yes | sudo apt-get install apache2 

	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHE INSTALATU DA" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHE JADANIK INSTALATUTA DAGO" 10 50
fi
instalatuta net-tools #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "NET-TOOLS INSTALATUKO DA" 10 50
	yes | sudo apt install net-tools 
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "NET-TOOLS INSTALATU DA" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "NET-TOOLS JADANIK INSTALATUTA DAGO" 10 50
fi
sudo usermod -a -G www-data $USER
sudo chown -R www-data /var/www/
sudo chgrp -R www-data /var/www/
#sudo chmod -R g+rwxs /var/www/
}
