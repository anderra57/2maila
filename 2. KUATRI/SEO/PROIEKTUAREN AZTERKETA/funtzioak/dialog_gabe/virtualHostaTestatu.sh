#!/bin/bash

###########################################################
#   4) TESTATU BIRTUAL HOSTa
###########################################################

function virtualHostaTestatu()
{
	#echo "#################### virtualHostaTestatu funtzioa"
if sudo netstat -anp|grep apache |grep 8080 > /dev/null 2>&1; then
	firefox http://localhost:8080 &
	echo "running"
else
	echo "Arazoa egon da; ez du zerbitzaria 8080 portuan aurkitu."
	
fi
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
