#!/bin/bash

###########################################################
#   1) APACHE INSTALATU                     
###########################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"


function apacheInstalatu()
{

instalatuta apache2 #&> /dev/null
if [ "$?" = "0" ]; then
	echo "apache instalatzen..."
	yes | sudo apt-get install apache2 
	echo "Instalatuta!"
else
	echo "apache instalatuta dago jada"
fi
instalatuta net-tools #&> /dev/null
if [ "$?" = "0" ]; then
	echo "net-tools instalatzen..."
	yes | sudo apt install net-tools 
	echo "Instalatuta!"
else
	echo "net-tools instalatuta dago jada"
fi
sudo usermod -a -G www-data $USER
sudo chown -R www-data /var/www/
sudo chgrp -R www-data /var/www/
#sudo chmod -R g+rwxs /var/www/
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}

