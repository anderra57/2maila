function instalatuta() {
#Apache2 paketea ea instalatua dagoen konprobatzen du
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

function apacheInstalatu(){
dialog --backtitle "Proiektua" --title "Web Aplikazioa" \
--msgbox "Honakoa egingo du aukera honek:\n\n\
Apache web zerbitzaria instalatu, paketea dagoeneko instalatuta badago adierazi eta bestela instalatu" 10 50 #Dialog bat gure izenak erakusteko

# Funtzioari deitzen diogu
instalatuta $1 &> /dev/null

# Emaitza konprobatzen dugu... emaitza 1 bada instalatuta dagoela esan nahi du, 0 bada ez dagoela instalatuta
if [ "$?" = "1" ]
then

	#Paketea instalatuta badago mezua bidali

	sleep 1
	dialog --msgbox "Badaukazu jadanik apache2 instalaturik\n" 5 50	

#Ez badago instalatuta instalatu egingo dugu 

else
	dialog --msgbox "Ez daukazunez instalaturik, instalaketari ekingo diogu\n" 5 60	
	sudo apt-get install apache2
	sleep 1
	dialog --msgbox "Apache instalatu da\n" 5 40	

fi
sleep 1
}
