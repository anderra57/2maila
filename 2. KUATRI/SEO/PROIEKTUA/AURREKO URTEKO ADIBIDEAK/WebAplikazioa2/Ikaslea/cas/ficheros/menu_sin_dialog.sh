##Instalación y Mantenimiento de una Aplicación Web
#Importar funciones de otros ficheros
function instalarapache()
{
estado=`sudo aptitude show apache2 | grep "Estado:"`
echo $estado | grep "sin"
if test $? = 0
then 
    echo "instalando ..."
    sudo apt install apache2
else
  echo "apache ya estaba instalado"
fi 
}
#. ./instalarapache.sh

function configurarapache()
{
sudo cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.backup
sudo cp /home/kepa/Escritorio/index.html /var/www
sudo sed 's|/var/www/html|/var/www/php|' /etc/apache2/sites-enabled/000-default.conf > temp/000-default.conf
sudo mv ./temp/000-default.conf /etc/apache2/sites-enabled/
echo -e "Reiniciando apache ..."
sudo sudo systemctl restart apache2.service
}
function salirppal()
{
	echo -e "¿Quieres salir del programa?(S/N)\n"
        read respuesta
	if [ $respuesta == "N" ] 

		then
			opcionMenuPpal=0
		fi
		

}
### Comienzo del programa ###
opcionMenuPpal=0
while test $opcionMenuPpal -ne 3
do
	#Mostrar menu
	echo -e "1 Instalación de Apache \n"
	echo -e "2 Configurar Apache \
n"
	echo -e "3 Salir \n"
	read -p "Introduce una opción:" opcionMenuPpal
	#Realizar acción especifica en base a la elección del usuario
	case $opcionMenuPpal in
			1) instalarapache;;
			2) configurarapache;;
			3) salirppal;;
			*) ;;

	esac #Fin selección de acción especifica del usuario
done #Fin del bucle ppal

echo "Programa terminado" #Fin del programa
exit 0 #Fin del programa
