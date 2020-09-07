function realizarCopia()
{
	#Definir constantes de la funcion
	FICH_NOM_COPIA="temp/nom_copia.txt"

	#Pedir nombre del archivo backup al usuario
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Como se ha de llamar la copia?\n\
No puede contener espacios\n\
No es necesario que escribas la extension del archivo" 10 50\
			2> $FICH_NOM_COPIA

	if test $? -eq 0
	then
		#Anyadir extension del archivo a la eleccion del usuario
		echo ".txt" >> $FICH_NOM_COPIA

		#Extraer el nombre del archivo elegido por el usuario
		nomFichBak=`more $FICH_NOM_COPIA`

		#Borrar archivos temporales ya obsoletos
		rm $FICH_NOM_COPIA

		#Realizar copia de la agenda
		cp contactos.txt $nomFichBak

		#Mostrar confirmacion
		dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
				--msgbox "Se ha creado en la carpeta principal del programa el\
 backup. El nombre del archivo es: "$nomFichBak 10 50

	else
		dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
				--msgbox "Copia cancelada.\nAhora volveras al menu principal" 10 50
	fi
}
