#!/bin/bash

###########################################################
#   13) AZTERKETAKO ARIKETA 2
###########################################################

function azterketa()
{

# apache martxan nadago gelditu

echo "apache matxan badago, gelditu."
echo ""

apache_running=$(service apache2 status 2>/dev/null |grep "active (running)")
if [ "$apache_running" == "" ]; then
	echo "apache EZ dago aktibo"
	
else
	echo "apache AKTIBO dago"
	sudo service apache2 stop
	echo "apache geldirik"
	
fi 

echo -e "##########################################"
# apache desinstalatu instalatuta badago
# "apache ez dago" ez badago

echo 'apache instalatuta badago desinstalatu; bestela, "apache ez dago" mezua pantailaratu.'
echo ""

instalatuta apache2 #&> /dev/null
if [ "$?" = "0" ]; then
	echo "apache EZ dago instalatuta"
	#yes | sudo apt-get install apache2 
	#echo "Instalatuta!"
else
	echo "apache instalatuta dago jada"
	sudo service apache2 stop &>/dev/null 
	sudo rm -rf /etc/apache2 &>/dev/null 
	sudo rm -rf /var/www &>/dev/null 
	yes | sudo apt purge apache2 &>/dev/null
	echo "Desinstalatuta!"
fi

echo -e "##########################################"
#php eta php moduluak badago, desinstalatu EGINDA

echo "php eta php moduluak instalatuta badaude, desinstalatu"
echo ""

instalatuta php #&> /dev/null
if [ "$?" = "0" ]; then
	echo "php EZ DAGO instalatuta"
else
	echo "php instalatuta dago jada"
	yes | sudo apt purge php &>/dev/null 
	echo "Desinstalatuta!"
fi

instalatuta libapache2-mod-php7.2 #&> /dev/null
if [ "$?" = "0" ]; then
	echo "libapache2-mod-php7.2 EZ DAGO instalatuta"
else
	echo "libapache2-mod-php7.2 instalatuta dago jada"
	yes | sudo apt purge libapache2-mod-php7.2 &>/dev/null 
	echo "Desinstalatuta!"
fi


echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo	
}
