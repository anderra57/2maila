#!/bin/bash
	

#############################################################
#    7) PYTHON3 INGURUNE BIRTUALA SORTU
#############################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"

function py3venvSortu()
{
#	echo "#################### py3venvSortu funtzioa"

instalatuta virtualenv #&> /dev/null
if [ "$?" = "0" ]; then
	echo "python3 ingurune birtuala sortzen..."
	yes | sudo apt-get install virtualenv &>/dev/null
	virtualenv /var/www/html/erraztest/python3envmetrix --python=python3 &>/dev/null
	sudo chown -R www-data /var/www/html/erraztest/
	sudo chgrp -R www-data /var/www/html/erraztest/
	sudo chmod -R g+rwxs /var/www/html/erraztest/
	echo "Sortuta!"	
else
	echo "python3 ingurune birtuala sortuta dago jada"
fi





echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
}
