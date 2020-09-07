#!/bin/bash

#############################################################
#   9) APPa BISTARATU
#############################################################
function appaBistaratu()
{
echo "Aplikazioa irekitzen..."
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "APLIKAZIOA IREKITZEN..." 10 50
firefox http://localhost:8080/index.php &
sleep 1
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
