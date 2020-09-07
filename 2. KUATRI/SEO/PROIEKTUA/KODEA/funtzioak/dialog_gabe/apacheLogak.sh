#!/bin/bash


##########################################################
#   10) APACHE ERROREAK BISTARATU
##########################################################
function apacheLogak()
{
	#echo "#################### apacheLogak funtzioa"
echo "Apacheko logak erakusten..."
tail -n 100 /var/log/apache2/error.log | less
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
