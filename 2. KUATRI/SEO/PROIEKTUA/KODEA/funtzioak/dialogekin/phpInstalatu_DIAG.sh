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
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PHP INSTALATUKO DA" 10 50
	
	yes | sudo apt install php 

	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "INSTALATUTA" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PHP JADANIK INSTALATUTA DAGO" 10 50
fi

sudo service apache2 restart &>/dev/null 
}

