#!/bin/bash
source "$(dirname "$0")/funtzioak/instalatuta.sh"
source "$(dirname "$0")/funtzioak/dialog_gabe/desinstalatuDena.sh" #0
source "$(dirname "$0")/funtzioak/dialog_gabe/apacheInstalatu.sh" #1
source "$(dirname "$0")/funtzioak/dialog_gabe/apacheTestatu.sh" #2
source "$(dirname "$0")/funtzioak/dialog_gabe/virtualHostSortu.sh" #3
source "$(dirname "$0")/funtzioak/dialog_gabe/virtualHostaTestatu.sh" #4
source "$(dirname "$0")/funtzioak/dialog_gabe/phpInstalatu.sh" #5
source "$(dirname "$0")/funtzioak/dialog_gabe/phpTestatu.sh" #6
source "$(dirname "$0")/funtzioak/dialog_gabe/py3venvSortu.sh" #7
source "$(dirname "$0")/funtzioak/dialog_gabe/appaInstalatu.sh" #8
source "$(dirname "$0")/funtzioak/dialog_gabe/appaBistaratu.sh" #9
source "$(dirname "$0")/funtzioak/dialog_gabe/apacheLogak.sh" #10
source "$(dirname "$0")/funtzioak/dialog_gabe/sshLogak.sh" #11
source "$(dirname "$0")/funtzioak/dialog_gabe/aukera12.sh" #12
source "$(dirname "$0")/funtzioak/dialog_gabe/azterketa.sh" #13
source "$(dirname "$0")/funtzioak/dialog_gabe/irten.sh" #14
source "$(dirname "$0")/funtzioak/updupg.sh"



############
### Main ###
############
menukoaukera=0
echo "Errepositorioak eguneratzen..."
updupg
echo "Badago! Ongi etorri"
echo
while test $menukoaukera -ne 14
do
	#Muestra el menu
	echo -e "Zer egin nahi duzu?"
	echo -e "0 Desinstalatu"
	echo -e "1 Apache instalatu"
	echo -e "2 Apache gaitu eta testatu"
	echo -e "3 Apache host birtuala sortu" 
	echo -e "4 Apache host birtuala testatu" 
	echo -e "5 PHP instalatu"
	echo -e "6 PHP testatu"
	echo -e "7 Python3 ingurune birtuala sortu"
	echo -e "8 APPa instalatu"
	echo -e "9 APPa testatu"
	echo -e "10 Apache erroreak bistaratu"
	echo -e "11 SSH saiakerak bistaratu"
	echo -e "12 12. aukera"
	echo -e "13 azterketako funtzioa"
	echo -e "14 Irten"
	read -p "Hautatu ezazu aukera bat: " menukoaukera
	echo -e "##########################################"
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
		12) aukera12;;
		13) azterketa;;
		14) irten;;
		*) ;;
	esac 
done 

echo "SCRIPT-aren amaiera" 
echo
exit 0 
