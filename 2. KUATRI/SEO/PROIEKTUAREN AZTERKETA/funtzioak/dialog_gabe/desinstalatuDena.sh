#!/bin/bash

############################################################
#   0) DESINSTALATU 
############################################################

function desinstalatuDena()
{
echo "Fitxategiak eta paketeak guztiz ezabatzen..."
sudo service apache2 stop &>/dev/null 
yes | sudo apt update &>/dev/null 
yes | sudo apt upgrade &>/dev/null 
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

echo "Ezabatuta!"
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
