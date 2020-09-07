function eliminarContactoUsuario() #Pide al usuario nombre y dos apellidos, borra sus datos
{
	#Definir constantes de la funcion	
	NOMBRET="temp/nombre.txt"
	PRIMAPELLIDOT="temp/apellido.txt"
	SEGAPELLIDOT="temp/segapellido.txt"

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

	#Comprobación, si ya existe no se elimina y avisa
	if existe $PRIMAPELLIDO $SEGAPELLIDO $NOMBRE
		then	
			#El contacto ya existe
			eliminarContacto $PRIMAPELLIDO $SEGAPELLIDO $NOMBRE
		else
			#El contacto no existe
			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--msgbox "El contacto no existe." 10 50
		
	fi

	#Borrar archivos temporales ya obsoletos
	rm $NOMBRET
	rm $PRIMAPELLIDOT
	rm $SEGAPELLIDOT
}

function eliminarContacto() #Elimina un contacto, recibe parametros
{
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
        	--yesno "¿Seguro que deseas eliminar el contacto siguiente?\n\
Nombre: $3\n\
Apellido: $1\n\
Segundo apellido: $2" 10 50

	if test $? -eq 0
 	then #Copia en rtdoTemp todo menos el que se elimina
			less contactos.txt | grep -v "$1;$2;$3;"  > temp/rtdoTemp.txt 	
			cat temp/rtdoTemp.txt > contactos.txt #Copia rtdoTemp sobre rtdo borrando 											el contacto
			dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--msgbox "Contacto eliminado." 10 50

			rm temp/rtdoTemp.txt
  	else
		dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--msgbox "El contacto no ha sido eliminado" 10 50
	fi
}
