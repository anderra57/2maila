#!/bin/bash


#################################################################
#    11) SSH LOGak KUDEATU 
#################################################################

source "$(dirname "$0")/funtzioak/instalatuta.sh"

function sshLogak()
{
#	echo "#################### sshLogak funtzioa"

instalatuta ssh #&> /dev/null
if [ "$?" = "0" ]; then
	echo "ssh instalatzen..."
	yes | sudo aptitude install ssh 
	echo "Instalatuta!"
fi

echo "SSH bidezko konexio saiakerak azken hilabetean ondokoak izan dira:"
sudo -u $USER cat /var/log/auth.log* | grep -a 'sshd' > tempauth.txt
awk '{ if ( $6 == "Failed" ) {print "\042Status: [fail] Account name:", $4, "Date:", $1",", $2",", $3"\042"} else if ( $6 == "Accepted" ) {print "\042Status: [accept] Account name:", $4, "Date:", $1",", $2",", $3"\042"} }' tempauth.txt
rm tempauth.txt

echo -e "##########################################"
read -p 'Sakatu enter aurrera jarraitzeko ' input_introa
echo
}
