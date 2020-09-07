#!/bin/bash

###########################################################
#   4) TESTATU BIRTUAL HOSTa
###########################################################

function virtualHostaTestatu()
{
	#echo "#################### virtualHostaTestatu funtzioa"
if sudo netstat -anp|grep apache |grep 8080 > /dev/null 2>&1; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "RUNNING" 10 50
	firefox http://localhost:8080 &
	sleep 1
	
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "ARAZOA EGON DA; EZ DU ZERBITZARIA 8080 PORTUAN AURKITU" 10 50
	
fi
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
echo
}
