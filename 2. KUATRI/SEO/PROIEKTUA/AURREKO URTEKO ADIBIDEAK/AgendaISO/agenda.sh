#########################################
#				Agenda					#
#	Proyecto de ISO 2o cuatri 2012		#
#	Autores: Arkaitz Duro				#
#			 David Espino				#
#			 Alexander Mariel			#
#										#
#########################################


#Importar funciones de otros ficheros
. ./funciones/realizarCopiaAgenda.sh
. ./funciones/vaciarAgenda.sh
. ./funciones/despedirse.sh
. ./funciones/pedirAnadirContacto.sh
. ./funciones/eliminar.sh
. ./funciones/existe.sh
. ./funciones/modificarContacto.sh
. ./funciones/verTodosContactos.sh
. ./funciones/mostrarContacto.sh

#Definicion de constantes
FICH_OPC_MENU="temp/opcion.txt"

### Comienzo del programa ###
opcionMenuPpal=0

while test $opcionMenuPpal -ne 8
do
	#Mostrar menu
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--menu "\n¿Qué deseas hacer?:" 20 70 20 \
			1 "Añadir un nuevo contacto"\
			2 "Eliminar un contacto existente"\
			3 "Ver datos de un contacto"\
			4 "Modificar un contacto existente"\
			5 "Realizar una copia de la agenda en su estado actual"\
			6 "Vaciar la agenda"\
			7 "Ver todos los contactos de la agenda"\
			8 "Salir"\
			2> $FICH_OPC_MENU

	if test $? -eq 0
	then
		#Extraer opcion marcada por el usuario
		opcionMenuPpal=`more $FICH_OPC_MENU`

		#Borrar el fichero temporal con la respuesta del usuario
		rm $FICH_OPC_MENU

		#Realizar accion especifica en base a la eleccion del usuario
		case $opcionMenuPpal in
			1) pedirContacto;;
			2) eliminarContactoUsuario;;
			3) mostrarContacto;;
			4) modificarContacto;;
			5) realizarCopia;;
			6) vaciarAgenda;;
			7) verTodosContactos;;
			8) despedirse;;
			*) ;;
		esac #Fin seleccion de accion especifica del usuario
	else
		opcionMenuPpal=8
	fi

done #Fin del bucle ppal

echo "Programa terminado" #Fin del programa
exit 0 #Fin del programa
