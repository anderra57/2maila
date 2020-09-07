#!/bin/bash

###########################################################
#   2) WEB APACHE ZERBITZUA PROBATU/TESTEATU         
###########################################################

function apacheTestatu()
{
apache_running=$(service apache2 status 2>/dev/null |grep "active (running)")
if [ "$apache_running" == "" ]; then
	echo "not running"
	
else
	echo "running"
	echo -e "##########################################"
fi 

if sudo netstat -anp|grep apache |grep 80 > /dev/null 2>&1; then
	 firefox http://localhost:80 &
else
	echo "Arazoa egon da; ez du zerbitzaria 80 portuan aurkitu."
	echo -e "##########################################"
	sudo service apache2 restart &>/dev/null
	
fi

read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
