function instalado() {
#Comprueba a ver si está instalado el paquete apache2
aux=$(aptitude show apache2 | grep "State: installed")
aux2=$(aptitude show apache2 | grep "Estado: instalado")
aux3=$aux$aux2
if [ -z "$aux3" ]
then
	return 0
else
	return 1
fi
}

function apacheInstalar(){
dialog --backtitle "Proyecto" --title "Aplicación Web" \
--msgbox "Esta opción hará lo siguiente:\n\n\
Instala el servidor web Apache, comprueba si ya está instalado, y sino lo instala" 10 50 #Dialog para mostrar nuestros nombres

# Llamamos a la función
instalado $1 &> /dev/null

# Comprobamos el resultado... si el resultado es 1 quiere decir que ya está instalado, si es 0 entonces no está instalado
if [ "$?" = "1" ]
then

#Si el paquete está instalado entonces se envía el mensaje

sleep 1
dialog --msgbox "Ya tienes instalado el paquete apache2\n" 5 50	

#Si no está instalado, lo instalamos 

else
dialog --msgbox "Como no está instalado, procederemos a la instalación\n" 5 60	
sudo apt-get install apache2
sleep 1
dialog --msgbox "Apache ha sido instalado.\n" 5 40	

fi
sleep 1
}
