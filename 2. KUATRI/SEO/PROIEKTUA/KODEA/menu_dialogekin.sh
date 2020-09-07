#!/bin/bash
source "$(dirname "$0")/funtzioak/instalatuta.sh"
source "$(dirname "$0")/funtzioak/dialogekin/desinstalatuDena_DIAG.sh" #0
source "$(dirname "$0")/funtzioak/dialogekin/apacheInstalatu_DIAG.sh" #1
source "$(dirname "$0")/funtzioak/dialogekin/apacheTestatu_DIAG.sh" #2
source "$(dirname "$0")/funtzioak/dialogekin/virtualHostSortu_DIAG.sh" #3
source "$(dirname "$0")/funtzioak/dialogekin/virtualHostaTestatu_DIAG.sh" #4
source "$(dirname "$0")/funtzioak/dialogekin/phpInstalatu_DIAG.sh" #5
source "$(dirname "$0")/funtzioak/dialogekin/phpTestatu_DIAG.sh" #6
source "$(dirname "$0")/funtzioak/dialogekin/py3venvSortu_DIAG.sh" #7
source "$(dirname "$0")/funtzioak/dialogekin/appaInstalatu_DIAG.sh" #8
source "$(dirname "$0")/funtzioak/dialogekin/appaBistaratu_DIAG.sh" #9
source "$(dirname "$0")/funtzioak/dialogekin/apacheLogak_DIAG.sh" #10
source "$(dirname "$0")/funtzioak/dialogekin/sshLogak_DIAG.sh" #11
source "$(dirname "$0")/funtzioak/dialogekin/irten_DIAG.sh" #12
source "$(dirname "$0")/funtzioak/updupg.sh"



############
### Main ###
############
menukoaukera=0
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
          --infobox "ERREPOSITORIOA EGUNERATZEN DABIL..." 10 50
updupg
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
          --msgbox "BADAGO! ONGI ETORRI" 10 50
FICH_OPC_MENU="temp/opcion.txt"
while test $menukoaukera -ne 12
do
	#Menua erakutsi
        dialog --backtitle "Proiektua SEO" --title "Web Aplikazioa" \
                        --menu "\nAukeratu aukera bat:" 20 70 20 \
                        0 "DESINSTALATU"\
			1 "APACHE INSTALATU"\
			2 "APACHE GAITU ETA TESTATU"\
			3 "APACHE HOST BIRTUALA SORTU"\
			4 "APACHE HOST BIRTUALA TESTATU"\
			5 "PHP INSTALATU"\
			6 "PHP TESTATU"\
			7 "PYTHON3 INGURUNE BIRTUALA SORTU"\
			8 "APPa INSTALATU"\
			9 "APPa TESTATU"\
			10 "APACHE ERROREAK BISTARATU"\
			11 "SSH SAIAKERAK BISTARATU"\
                        12 "Irten"\
                        2> $FICH_OPC_MENU

	if test $? -eq 0
        then
                #Menuan erabiltzaileak sartu duen aukera lortu
                menukoaukera=`more $FICH_OPC_MENU`
		rm $FICH_OPC_MENU


	case $menukoaukera in
		0) desinstalatuDena;;
		1) apacheInstalatu;;
		2) apacheTestatu;;
		3) virtualHostSortu;;
		4) virtualHostaTestatu;;
		5) phpInstalatu;;
		6) phpTestatu;;
		7) py3venvSortu;;
		8) appaInstalatu;;
		9) appaBistaratu;;
		10) apacheLogak;;
		11) sshLogak;;
		12) irten;;
		*) ;;
	esac 
	fi
done 
