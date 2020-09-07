#!/bin/bash

#############################################################
#   9) APPa BISTARATU
#############################################################
function appaBistaratu()
{
echo "Aplikazioa irekitzen..."
firefox http://localhost:8080/index.php &
echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
