#!/bin/bash

###########################################################
#   3) APACHEn HOST BIRTUAL BAT SORTU
###########################################################

function virtualHostSortu()
{
#echo "#################### virtualHostaSortu funtzioa"

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APACHE HOST BIRTUALA SORTUKO DA" 10 50

#paso1->crear directorio (karpeta kopiatu)

SCRIPT=$(readlink -f $0)
dir_base=`dirname $SCRIPT`

if [ ! -f /etc/apache2/sites-available/erraztest.conf ]; then

		mkdir -p /tmp/erraztest/
		sudo mv /tmp/erraztest/ /var/www/html/

		sudo chown -R www-data /var/www/html/erraztest/
		sudo chgrp -R www-data /var/www/html/erraztest/
		sudo chmod -R g+rwxs /var/www/html/erraztest/
		#sudo chmod -R 755 /var/www/html/erraztest/
		cp -R $dir_base/erraztest/index.html /var/www/html/erraztest/


		#paso2 -> .conf sortu eta aldatu

		sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/erraztest.conf
		sudo sed -i 's|www/html|www/html/erraztest|' /etc/apache2/sites-available/erraztest.conf
		sudo sed -i '1 d' /etc/apache2/sites-available/erraztest.conf
		sudo sed -i '1 i\<VirtualHost \*:8080>' /etc/apache2/sites-available/erraztest.conf	


		#paso3 -> portua ireki apachen

		sudo sed -i '/\<Listen 80\>/ a Listen 8080' /etc/apache2/ports.conf 


		#paso4 -> 

		sudo a2ensite erraztest.conf &>/dev/null 
		sudo service apache2 restart &>/dev/null 
fi

dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "SORTUTA" 10 50	
}
