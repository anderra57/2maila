function pedirContacto() #Pide los datos del contacto y los guarda en un archivo
{
	#Definir constantes de la funcion	
	NOMBRET="temp/nombre.txt"
	PRIMAPELLIDOT="temp/apellido.txt"
	SEGAPELLIDOT="temp/segapellido.txt"
	NUMTELEFT="temp/telefono.txt"
	EMAILT="temp/email.txt"

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
	
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Teléfono del contacto:" 10 50\
			2> $NUMTELEFT

	if test $? -eq 1
	then
		return 1
	fi
	
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Email del contacto:" 10 50\
			2> $EMAILT

	if test $? -eq 1
	then
		return 1
	fi

	#Extraer los datos dados por el usuario
	NOMBRE=`more $NOMBRET`
	PRIMAPELLIDO=`more $PRIMAPELLIDOT`
	SEGAPELLIDO=`more $SEGAPELLIDOT`
	NUMTELEF=`more $NUMTELEFT`
	EMAIL=`more $EMAILT`

	#Mostramos los datos al usuario
	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			--yesno "Añadir el siguiente contacto?\n\
Nombre: $NOMBRE\n\
Apellido: $PRIMAPELLIDO\n\
Segundo apellido: $SEGAPELLIDO\n\
Teléfono: $NUMTELEF\n\
Email: $EMAIL" 0 0

	if test $? -eq 0
	then
		#Comprobación, si ya existe no se anade y avisa
		if existe $PRIMAPELLIDO $SEGAPELLIDO $NOMBRE
			then	
				#El contacto ya existe
				dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
				--msgbox "El contacto ya existe." 10 50
			else
				#El contacto no existe
				anadirContacto $PRIMAPELLIDO $SEGAPELLIDO $NOMBRE $NUMTELEF $EMAIL	

				if test $? -eq 0
					then
						dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
	--msgbox "Contacto añadido." 10 50
					else
						dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
	--msgbox "Fallo al crear el contacto, debes completar los 5 campos." 10 50
				fi
					
		
		fi
	fi

	#Borrar archivos temporales ya obsoletos
	rm $NOMBRET
	rm $PRIMAPELLIDOT
	rm $SEGAPELLIDOT
	rm $NUMTELEFT
	rm $EMAILT
}

function anadirContacto() #Recibe por parámetros los datos y los guarda en un archivo
{	
	#Comprueba si recibe 5 parametros no vacios
	if [ $# == 5 ] && [ $1 != "" ] && [ $2 != "" ] && [ $3 != "" ] && [ $4 != "" ] && [ $5 != "" ]
	then
		#Guarda el contacto en la agenda y devuelve correcto
		echo "$1;$2;$3;$4;$5" >> contactos.txt
		return 0
	else
		#Devolver error
		return 1
	fi
}
