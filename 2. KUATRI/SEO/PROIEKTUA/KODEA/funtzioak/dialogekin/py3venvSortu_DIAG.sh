#!/bin/bash
	

#############################################################
#    7) PYTHON3 INGURUNE BIRTUALA SORTU
#############################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"

function py3venvSortu()
{
#	echo "#################### py3venvSortu funtzioa"

instalatuta virtualenv #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --infobox "PYTHON3 INGURUNE BIRTUALA SORTZEN..." 10 50
	yes | sudo apt-get install virtualenv &>/dev/null
	virtualenv /var/www/html/erraztest/python3envmetrix --python=python3 &>/dev/null
	sudo chown -R www-data /var/www/html/erraztest/
	sudo chgrp -R www-data /var/www/html/erraztest/
	sudo chmod -R g+rwxs /var/www/html/erraztest/
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "SORTUTA" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PYTHON3 INGURUNE BIRTUALA SORTUTA DAGO JADA..." 10 50
fi

}
