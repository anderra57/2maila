function modificarContacto() #si el contacto existe modifica, sino error
{
	#Definir constantes de la funcion	
	NOMBRET="temp/nombre.txt"
	PRIMAPELLIDOT="temp/apellido.txt"
	SEGAPELLIDOT="temp/segapellido.txt"
	TELEFONOT="temp/telefono.txt"
	EMAILT="temp/email.txt"
	MODIFICADOT="temp/ContactoModificar.txt"


	#Pedimos los datos al usuario, se guardan en los ficheros temporales
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Nombre del contacto:" 10 50\
			2> $NOMBRET

	if test $? -eq 1
	then
		return 1
	fi

	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Apellido del contacto:" 10 50\
			2> $PRIMAPELLIDOT

	if test $? -eq 1
	then
		return 1
	fi
	
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Segundo apellido del contacto:" 10 50\
			2> $SEGAPELLIDOT

	if test $? -eq 1
	then
		return 1
	fi

	#Extraer los datos dados por el usuario
	NOMBRE=`more $NOMBRET`
	PRIMAPELLIDO=`more $PRIMAPELLIDOT`
	SEGAPELLIDO=`more $SEGAPELLIDOT`
	
	#Borramos temporales que ya no hacen falta por ahora
	rm $NOMBRET
	rm $PRIMAPELLIDOT
	rm $SEGAPELLIDOT

	#Si no existe no podemos modificar
	if existe $PRIMAPELLIDO $SEGAPELLIDO $NOMBRE
		then	
			#El contacto existe, guardamos sus variables para modificarlas
			grep "$PRIMAPELLIDO;$SEGAPELLIDO;$NOMBRE" contactos.txt > $MODIFICADOT
			MODIFICADO=`more $MODIFICADOT`

			#Nombres y apellidos ya tenemos guardados al pedir quien queriamodificar
			echo $MODIFICADO | cut -d ";" -f 4 > $TELEFONOT
			echo $MODIFICADO | cut -d ";" -f 5 > $EMAILT
			TELEFONO=`more $TELEFONOT`
			EMAIL=`more $EMAILT`
			
			#Borramos temporales
			rm $TELEFONOT
			rm $EMAILT

			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--msgbox "Ahora puede modificar el contacto, realice los\n\
ajustes necesarios sobre cada campo." 10 50
			#Mostramos al usuario los datos anteriores para si quiere pueda modificarlos
			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Introduzca nombre" 0 0 $NOMBRE \
				2> $NOMBRET

			if test $? -eq 1
			then
				return 1
			fi

			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Introduzca primer apellido" 0 0 $PRIMAPELLIDO \
				2> $PRIMAPELLIDOT

			if test $? -eq 1
			then
				return 1
			fi

		    dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Introduzca segundo apellido" 0 0 $SEGAPELLIDO \
				2> $SEGAPELLIDOT

			if test $? -eq 1
			then
				return 1
			fi

		    dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Introduzca numero" 0 0 $TELEFONO \
				2> $TELEFONOT

			if test $? -eq 1
			then
				return 1
			fi

		    dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--inputbox "Introduzca email" 0 0 $EMAIL \
				2> $EMAILT

			if test $? -eq 1
			then
				return 1
			fi

			NOMBRE2=`more $NOMBRET`
			PRIMAPELLIDO2=`more $PRIMAPELLIDOT`
			SEGAPELLIDO2=`more $SEGAPELLIDOT`
			TELEFONO2=`more $TELEFONOT`
			EMAIL2=`more $EMAILT`

			dialog --yesno "Son estos datos correctos?\n\
Nombre: $NOMBRE2\n\
Apellido: $PRIMAPELLIDO2\n\
Segundo apellido: $SEGAPELLIDO2\n\
Teléfono: $NUMTELEF2\n\
Email: $EMAIL2" 0 0

			if test $? -eq 0
				then
					#Eliminamos el contacto para introducir posteriormente los nuevos datos
					less contactos.txt | grep -v "$PRIMAPELLIDO;$SEGAPELLIDO;$NOMBRE;$TELEFONO;$EMAIL"  > temp/rtdoTemp.txt 	
					cat temp/rtdoTemp.txt > contactos.txt
					rm temp/rtdoTemp.txt #Borra el archivo temporal
					#Anyadimos el contacto modificado
					anadirContacto $PRIMAPELLIDO2 $SEGAPELLIDO2 $NOMBRE2 $TELEFONO2 $EMAIL2

					if test $? -eq 0
						then
							dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
--msgbox "Contacto modificado." 10 50
						else
							dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
--msgbox "Fallo al crear el contacto, debes completar los 5 campos." 10 50
					fi
				else
					dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
--msgbox "Modificacion cancelada." 5 50
			fi

		else
			#El contacto no existe
			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--msgbox "El contacto no existe, no se puede modificar." 5 50
		
	fi

	#Borramos archivos temporales
	rm $NOMBRET
	rm $PRIMAPELLIDOT
	rm $SEGAPELLIDOT
	rm $TELEFONOT
	rm $EMAILT
	rm $MODIFICADOT

}
