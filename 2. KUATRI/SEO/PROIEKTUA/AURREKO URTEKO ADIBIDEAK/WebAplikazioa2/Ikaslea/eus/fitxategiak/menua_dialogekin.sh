#Beste fitxero batzuetako funtzioak inportatu
. ./funtzioak/apacheInstalatu.sh
source ./funtzioak/bukatu.sh


#Konstanteen definizioa
FICH_OPC_MENU="temp/opcion.txt"

### Programa hasiera ###
opcionMenuPpal=0

while test $opcionMenuPpal -ne 2
do
	#Menua erakutsi
	dialog --backtitle "Proiektua SE" --title "Web Aplikazioa" \
			--menu "\nAukeratu aukera bat:" 20 70 20 \
			1 "Apache web zerbitzaria instalatu"\
			2 "Irten"\
			2> $FICH_OPC_MENU

	if test $? -eq 0
	then
		#Menuan erabiltzaileak sartu duen aukera lortu
		opcionMenuPpal=`more $FICH_OPC_MENU`

		#Erabiltzailearen erantzuna duen fitxategi tenporala borratu
		rm $FICH_OPC_MENU

		#Erabiltzaileak burutu nahi duen ekintza aukeratu
		case $opcionMenuPpal in
			1)apacheInstalatu;;
			2)bukatu;;
			*) ;;
		esac #Erabiltzailearen aukeraketa bukaera
	else
		opcionMenuPpal=2
	fi

done #Bukle nagusiaren bukaera
dialog --backtitle "Proiektua" --title "Web Aplikazioa" \
--msgbox "Egileak:\n\n\
MA\nLO\nAV" 10 30 #Dialog bat gure izenak erakusteko
dialog --msgbox "BAGOAZ, EGUN ONA IZAN!!! \n" 5 30	#Programa bukaera
exit 0 #Programa bukaera
