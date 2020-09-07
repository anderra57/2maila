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
	echo "index.html eta test.php fitxategiek baimen berdinak dituzte"
else
	echo "KONTUZ! index.html eta test.php fitxategiek EZ DITUZTE baimen berdinak"
fi

instalatuta php #&> /dev/null
if [ "$?" = "0" ]; then
	echo "php ez dago instalatuta eta web orria ez da ondo ikusiko"
	read -p 'Sakatu enter web orria ikusteko ' input_introa
	firefox http://localhost:8080/test.php &
else
	echo "running"
	firefox http://localhost:8080/test.php &
fi

echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
