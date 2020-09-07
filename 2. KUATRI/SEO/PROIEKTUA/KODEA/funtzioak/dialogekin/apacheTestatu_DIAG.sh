#!/bin/bash

###########################################################
#   2) WEB APACHE ZERBITZUA PROBATU/TESTEATU         
###########################################################

function apacheTestatu()
{
apache_running=$(service apache2 status 2>/dev/null |grep "active (running)")
if [ "$apache_running" == "" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHE EZ DAGO RUNEATZEN" 10 50
	
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHE RUNEATZEN DABIL" 10 50
	
fi 

if sudo netstat -anp|grep apache |grep 80 > /dev/null 2>&1; then
	firefox http://localhost:80 &
	sleep 1
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "ARAZOA EGON DA; EZ DU ZERBITZARIA 80 PORTUAN AURKITU" 10 50
	sudo service apache2 restart &>/dev/null
	
fi

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
