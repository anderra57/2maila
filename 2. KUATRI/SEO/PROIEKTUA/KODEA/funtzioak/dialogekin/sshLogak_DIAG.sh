#!/bin/bash


#################################################################
#    11) SSH LOGak KUDEATU 
#################################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"

function sshLogak()
{
#	echo "#################### sshLogak funtzioa"

instalatuta ssh #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "SSH INSTALATUKO DA" 10 50
	yes | sudo aptitude install ssh 
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "SSH INSTALATUTA!" 10 50
fi


echo "SSH bidezko konexio saiakerak azken hilabetean ondokoak izan dira:"
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "SSH BIDEZKO KONEXIO SAIAKERAK AZKEN HILABETEAN ONDOKOAK DIRA" 10 50

sudo -u $USER cat /var/log/auth.log* | grep -a 'sshd' > tempauth.txt
awk '{if ( $6 == "Failed" ) {print "\042Status: [fail] Account name:", $4, "Date:", $1",", $2",", $3"\042"} else if ( $6 == "Accepted" ) {print "\042Status: [accept] Account name:", $4, "Date:", $1",", $2",", $3"\042"}}' tempauth.txt > bistaratu.txt
dialog --title 'APACHE LOGAK' --textbox bistaratu.txt 0 0; clear
rm bistaratu.txt
rm tempauth.txt


dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
