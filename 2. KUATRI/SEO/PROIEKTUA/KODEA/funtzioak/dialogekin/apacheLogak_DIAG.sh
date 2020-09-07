#!/bin/bash


##########################################################
#   10) APACHE ERROREAK BISTARATU
##########################################################
function apacheLogak()
{
	#echo "#################### apacheLogak funtzioa"
echo "Apacheko logak erakusten..."
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHEKO LOGAK ERAKUSTEN..." 10 50
tail -n 100 /var/log/apache2/error.log | less > bistaratu
dialog --title 'APACHE LOGAK' --textbox bistaratu 0 0; clear
rm bistaratu
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
