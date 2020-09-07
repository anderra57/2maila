function vaciarAgenda()
{
	#Definicion de constantes
	FICH_OPC_YESNO="temp/opcion_yesno.txt"

	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--yesno "Seguro que quieres borrar todos los contactos?\n
Despues no podras recuperarlos, piensatelo bien" 10 50 \

	if test $? -eq 0
	then rm contactos.txt
		 touch contactos.txt
		 dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--msgbox "Contactos borrados" 10 50
	else
		dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--msgbox "NO se ha vaciado la agenda" 10 50
	fi		
}
