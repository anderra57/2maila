#!/bin/bash

############################################################
#   0) DESINSTALATU 
############################################################

function desinstalatuDena()
{
FICH_OPC_YESNO="temp/opcion_yesno.txt"

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                        --yesno "PROIEKTUKO DATU GUZTIAK EZABATU NAHI DITUZU?\n
EZIN IZANGO DITUZU BERRESKURATU" 10 50 \


if test $? -eq 0
then
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --infobox "DESINSTALATZEN..." 10 50
sudo service apache2 stop &>/dev/null
#yes | sudo apt update &>/dev/null 
#yes | sudo apt upgrade &>/dev/null 
sudo rm -rf /etc/apache2 &>/dev/null 
yes | sudo apt purge apache2 &>/dev/null 
yes | sudo apt remove net-tools &>/dev/null 
yes | sudo apt remove php &>/dev/null 
yes | sudo apt remove libapache2-mod-php &>/dev/null
yes | sudo apt remove libapache2-mod-php7.2 &>/dev/null
yes | sudo apt purge php &>/dev/null 
yes | sudo apt purge libapache2-mod-php7.2 &>/dev/null 
yes | sudo apt-get remove python3-pip &>/dev/null 
yes | sudo apt purge python3-pip &>/dev/null 
yes | sudo apt-get remove dos2unix &>/dev/null
source /var/www/html/erraztest/python3envmetrix/bin/activate &>/dev/null
	yes | pip3 uninstall numpy &>/dev/null
	yes | pip3 uninstall nltk &>/dev/null
	yes | pip3 uninstall argparse &>/dev/null
	deactivate &>/dev/null
sudo rm -rf /var/www &>/dev/null
yes | sudo apt purge virtualenv &>/dev/null 
yes | sudo apt remove ssh &>/dev/null 
yes | sudo apt -f install &>/dev/null
yes | sudo apt autoremove &>/dev/null 
yes | sudo apt autoclean &>/dev/null  

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "GUZTIA DESINSTALATU DA" 10 50

else
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "EZ DA EZER DESINSTALATU" 10 50
fi
}
