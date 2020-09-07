#!/bin/bash


############################################################
#   8) APPa INSTALATU
############################################################

function appaInstalatu()
{
	#echo "#################### appaInstalatu funtzioa"

# 8.aukera
#8.1
instalatuta python3-pip #&> /dev/null
if [ "$?" = "0" ]; then
	echo "python3-pip instalatzen..."
	yes | sudo apt install python3-pip 
	echo "Instalatuta!"
else
	echo "python3-pip instalatuta dago jada"
fi

instalatuta dos2unix #&> /dev/null
if [ "$?" = "0" ]; then
	echo "dos2unix instalatzen..."
	yes | sudo apt install dos2unix 
	echo "Instalatuta!"
else
	echo "dos2unix instalatuta dago jada"
fi


#8.2
#/var/www/html/erraztest/python3envmetrix/lib/python3.6/site-packages/argparse.py
if [ ! -f /var/www/html/erraztest/python3envmetrix/lib/python3.6/site-packages/argparse.py ]; then
    echo "numpy, nltk eta argparse instalatzen..."
    source /var/www/html/erraztest/python3envmetrix/bin/activate  &>/dev/null
	yes | pip3 install numpy 
	yes | pip3 install nltk 
	yes | pip3 install argparse 
	deactivate
    echo "Instalatuta!"
fi

	

#8.3
#fitxategiak kopiatu (badgo)

if [ ! -f /var/www/html/erraztest/index.php ]; then
    cp -r "$(dirname "$0")/erraztest/textos" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/index.php" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/complejidadtextual.py" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/webprocess.sh" /var/www/html/erraztest/
 
    sudo chmod g+rwxs /var/www/html/erraztest/index.php
    sudo chmod g+rwxs /var/www/html/erraztest/complejidadtextual.py
    sudo chmod g+rwxs /var/www/html/erraztest/webprocess.sh
fi

#8.4
echo
echo "english.doc.txt testua prozesatzen..."
sudo bash /var/www/html/erraztest/webprocess.sh /var/www/html/erraztest/textos/english.doc.txt
#8.5





echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
