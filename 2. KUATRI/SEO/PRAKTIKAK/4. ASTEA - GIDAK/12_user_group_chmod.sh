#!/bin/bash

### makinan eskuragarri ditugun komando guztiak
man -k .
man -k . | grep 'group'
man -k . | grep 'user'

### sortu erab00
sudo useradd -m erab00 -s /bin/bash
sudo passwd erab00 # p4s4h1tz4
tail /etc/passwd
ls /home

### sortu erab01
sudo useradd -m erab01 -s /bin/bash
sudo passwd erab01 # p4s4h1tz4

### sortu erab02
sudo useradd -m erab02 -s /bin/bash
sudo passwd erab02 # p4s4h1tz4

### sartu erab00
ssh erab00@localhost # sudo apt-get install ssh
whoami
echo $0
pwd
users # aktibo dauden erabiltzaileak

### sartu erab01-era beste terminal-leiho batean
ssh erab01@localhost

### sartu erab02-era beste terminal-leiho batean
ssh erab02@localhost

### taldea sortu (sudo egin dezakeen erabiltzailearekin, iperona nire kasuan)
sudo groupadd taldea00
sudo usermod -a -G taldea00 erab00 # taldea esleitu
sudo usermod -a -G taldea00 erab01 # taldea esleitu
sudo gpasswd -A erab00 taldea00 # arduraduna esleitu
tail /etc/group

### bi erabiltzaileek editatu dezaketen fitxategia
ssh erab00@localhost
touch proba.txt
chgrp taldea00 proba.txt
vim proba.txt

ssh erab01@localhost
cd /home/erab00/
vim proba.txt

### baimenekin jolastu, erab00 (user), taldea00 (group) eta erab02 (others) izanik
ssh erab00@localhost
chmod o-rwx proba.txt
chmod 770 proba.txt
# ...
# eta konprobatu erabiltzaile ezberdinekin irakurri/editatu/exekuta daitekeen

### ezabatu erabiltzaileak eta taldeak
sudo userdel -r erab00
sudo userdel -r erab01
sudo groupdel taldea00
tail /etc/passwd
tail /etc/group

