function mostrarContacto()
{
	TERMINOT="temp/termino.txt"

	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--inputbox "Introduzca un termino por el\n\
que buscar el contacto:" 10 50\
			2> $TERMINOT

	if test $? -eq 1
	then
			return 1
	fi

	#Buscamos contactos en base al temrino introducido
	TERMINO=`more $TERMINOT`
	grep "$TERMINO" contactos.txt > temp/coincidencias.txt

	#Hallamos el numero de coincidencias
	coincidencias=`wc -l temp/coincidencias.txt`
	coincidencias=`echo $coincidencias | cut -c1-1`

	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--msgbox "Se han dado $coincidencias coincidencias" 10 50

    sacarPorPantalla

	rm $TERMINOT

}

function sacarPorPantalla() #Muestra los contactos de coincidencias.txt uno a uno
{

	NOMBRET="temp/nombre.txt"
	PRIMAPELLIDOT="temp/apellido.txt"
	SEGAPELLIDOT="temp/segapellido.txt"
	TELEFONOT="temp/telefono.txt"
	EMAILT="temp/email.txt"
	a=1

	while read line
	do
		#Separamos los datos de la linea
		echo $line | cut -d ";" -f 3 > $NOMBRET
		echo $line | cut -d ";" -f 1 > $PRIMAPELLIDOT
		echo $line | cut -d ";" -f 2 > $SEGAPELLIDOT
		echo $line | cut -d ";" -f 4 > $TELEFONOT
		echo $line | cut -d ";" -f 5 > $EMAILT
		#Guardamos datos en variables
		NOMBRE=`less $NOMBRET`
		PRIMAPELLIDO=`less $PRIMAPELLIDOT`
		SEGAPELLIDO=`less $SEGAPELLIDOT`
		TELEFONO=`less $TELEFONOT`
		EMAIL=`less $EMAILT`

		dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
			   --msgbox "Coincidencia $a\n \
	Nombre:	$NOMBRE\n \
	Apellido:	$PRIMAPELLIDO\n \
	Segundo apellido:	$SEGAPELLIDO\n \
	Teléfono:	$TELEFONO\n \
	Email:	$EMAIL" 10 50

		#Borramos temporales
		rm $NOMBRET
		rm $PRIMAPELLIDOT
		rm $SEGAPELLIDOT
		rm $TELEFONOT
		rm $EMAILT

		a=$(($a+1))

	done < "temp/coincidencias.txt"	

	rm temp/coincidencias.txt
}
