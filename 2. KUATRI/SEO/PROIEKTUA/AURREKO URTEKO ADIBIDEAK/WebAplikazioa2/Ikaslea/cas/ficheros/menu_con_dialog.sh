#Importar funciones de otros ficheros
. ./funciones/apacheInstalar.sh
. ./funciones/terminar.sh


#Definición de constantes
FICH_OPC_MENU="temp/opcion.txt"

### Comienzo del programa ###
opcionMenuPpal=0

while test $opcionMenuPpal -ne 2
do
	#Mostrar Menú
	dialog --backtitle "Proyecto SO" --title "Aplición Web" \
			--menu "\nElige una opción:" 20 70 20 \
			1 "Instalar un servidor web apache"\
			2 "Salir"\
			2> $FICH_OPC_MENU

	if test $? -eq 0
	then
		#Obtener la opción del menú seleccionada por el usuario
		opcionMenuPpal=`more $FICH_OPC_MENU`

		#Borrar el fichero temporal que contiene la respuesta del usuario
		rm $FICH_OPC_MENU

		#Seleccionar la acción que quiere realizar el usuario
		case $opcionMenuPpal in
			1)apacheInstalar;;
			2)terminar;;
			*) ;;
		esac #Fin de la selección del usuario
	else
		opcionMenuPpal=2
	fi

done #Fin del bucle principal
dialog --backtitle "Proyecto" --title "Aplicación Web" \
--msgbox "Autores:\n\n\
MA\nLO\nAV" 10 30 #Dialog para mostrar nuestros nombres
dialog --msgbox “NOS VAMOS, BUENOS DÍAS!!! \n" 5 30	#Fin del programa
exit 0 #Fin del programa
