#!/bin/bash

###########################################################
#   6) PHP TESTEATU
###########################################################

function phpTestatu()
{
	#echo "#################### phpTestatu funtzioa"
#6.1
if [ ! -f /var/www/html/erraztest/test.php ]; then
    sudo echo -e "<?php phpinfo(); ?>" > /var/www/html/erraztest/test.php
    sudo chown -R www-data /var/www/html/erraztest/
    sudo chgrp -R www-data /var/www/html/erraztest/
fi

#6.2

perm_1 = $(ls -l /var/www/html/erraztest/test.php | awk '{print $1;}')&>/dev/null
perm_2 = $(ls -l /var/www/html/erraztest/index.html | awk '{print $1;}')&>/dev/null

if [ "$perm1" == "$perm2" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "INDEX.HTML ETA TEST.PHP FITXATEGIAK BAIMEN BERDINAK DITUZTE" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "INDEX.HTML ETA TEST.PHP FITXATEGIA EZ DITUZTE BAIMEN BERDINAK" 10 50
fi

instalatuta php #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PHP EZ DAGO INSTALATUTA ETA WEB ORRIA EZ DA ONDO IKUSIKO" 10 50
	firefox http://localhost:8080/test.php &
	sleep 1
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "RUNNING" 10 50
	firefox http://localhost:8080/test.php &
	sleep 1
fi

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
