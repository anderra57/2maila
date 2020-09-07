function verTodosContactos()
{
	FICH_CONTACTOS_PRECIOSOS="temp/contactosPreciosos.txt"

	#Funcionamiento: Me creo un fichero con cabecera y todos
	#los contactos puestos bonitos. Despues lo muestro en una caja

	echo -e "1er Apellido	2o Apellido	    Nombre	   Telefono    Email \n" > $FICH_CONTACTOS_PRECIOSOS

	awk '{ printf "%-15s%-20s%-15s%-12s%s\n",$1,$2,$3,$4,$5}' \
FS=\; "contactos.txt" >>$FICH_CONTACTOS_PRECIOSOS

	dialog --backtitle "Agenda 2012 - ISO" --title "Agenda" \
		--textbox $FICH_CONTACTOS_PRECIOSOS 0 0

	rm $FICH_CONTACTOS_PRECIOSOS
}
