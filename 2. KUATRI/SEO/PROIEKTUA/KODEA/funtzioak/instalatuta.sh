#!/bin/bash

function instalatuta(){
apt_si=$(dpkg-query -W -f='${Status}' aptitude 2>/dev/null | grep -c "ok installed")
if [ "$apt_si" = "0" ]; then
	yes | sudo apt-get install aptitude &>/dev/null
fi

aux=$(aptitude show $1 | grep "State: installed")
aux2=$(aptitude show $1 | grep "Estado: instalado")
aux3=$aux$aux2
if [ -z "$aux3" ];
then
	return 0
else
	return 1
fi
}
