#!/bin/bash

###########################################################
#   5) PHP INSTALATU                       
###########################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"

function phpInstalatu()
{
#echo "#################### phpInstalatu funtzioa"

instalatuta php #&> /dev/null
if [ "$?" = "0" ]; then
	echo "php eta libapache2-mod-php instalatzen..."
	yes | sudo apt install php
	echo "Instalatuta!"
else
	echo "php instalatuta dago jada"
fi

sudo service apache2 restart &>/dev/null 
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}

