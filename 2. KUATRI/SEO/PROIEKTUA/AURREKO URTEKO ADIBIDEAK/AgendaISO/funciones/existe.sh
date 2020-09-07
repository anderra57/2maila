function existe() #Dados el nombre y dos apellidos, devuelve 1 si existe, 0 si no
{
	if grep -q "$1;$2;$3" contactos.txt
		then
			#El contacto existe devuelve 0
			return 0
		else
			#El contacto no existe devuelve 1
			return 1
	fi
}
