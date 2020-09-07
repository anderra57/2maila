#!/bin/bash


############################################################
#   8) APPa INSTALATU
############################################################

function appaInstalatu()
{
	#echo "#################### appaInstalatu funtzioa"

# 8.aukera
#8.1
instalatuta python3-pip #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PYTHON3-PIP INSTALATUKO DA" 10 50
	yes | sudo apt install python3-pip
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PYTHON3-PIP INSTALATUTA!" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "PYTHON3-PIP INSTALATUTA DAGO JADA" 10 50
fi

instalatuta dos2unix #&> /dev/null
if [ "$?" = "0" ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "DOS2UNIX INSTALATUKO DA" 10 50
	yes | sudo apt install dos2unix 
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "DOS2UNIX INSTALATUTA!" 10 50
else
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "DOS2UNIX INSTALATUTA DAGO JADA" 10 50
fi


#8.2
#/var/www/html/erraztest/python3envmetrix/lib/python3.6/site-packages/argparse.py
if [ ! -f /var/www/html/erraztest/python3envmetrix/lib/python3.6/site-packages/argparse.py ]; then
	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "NUMPY,NLTK,ARGPARSE INSTALATUKO DIRA" 10 50
    source /var/www/html/erraztest/python3envmetrix/bin/activate  &>/dev/null
	yes | pip3 install numpy 
	yes | pip3 install nltk
	yes | pip3 install argparse 
	deactivate
    dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "NUMPY,NLTK,ARGPARSE INSTALATUTA!" 10 50
fi

	

#8.3
#fitxategiak kopiatu (badgo)

if [ ! -f /var/www/html/erraztest/index.php ]; then
    cp -r "$(dirname "$0")/erraztest/textos" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/index.php" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/complejidadtextual.py" /var/www/html/erraztest/
    cp "$(dirname "$0")/erraztest/webprocess.sh" /var/www/html/erraztest/
 
    sudo chmod g+rwxs /var/www/html/erraztest/index.php
    sudo chmod g+rwxs /var/www/html/erraztest/complejidadtextual.py
    sudo chmod g+rwxs /var/www/html/erraztest/webprocess.sh
fi

#8.4
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "ENGLISH.DOC.TXT TESTUA PROZESATZEN..." 10 50
sudo bash /var/www/html/erraztest/webprocess.sh /var/www/html/erraztest/textos/english.doc.txt > bistaratu 
dialog --title 'TEXTU KONPLEXUTASUNA' --textbox bistaratu 0 0; clear
rm bistaratu

#8.5
dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
                --msgbox "JARRAITU" 10 50
}
