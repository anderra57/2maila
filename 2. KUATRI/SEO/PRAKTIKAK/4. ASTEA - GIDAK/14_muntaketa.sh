#!/bin/bash

### create a virtual file system
# dd - convert and copy a file
# 1024*1024*10 B = 10485760 B = 10 MB = 512*(2*1024*10) = 512*20480
# block_size=512, number_of_blocks = 20480
# /dev/zero is a special file that provides as many null characters (ASCII NUL, 0x00) as are read from it.
cd ~/zzz
dd if=/dev/zero of=diskoa00.raw bs=512 count=20480
# dd if=/dev/zero of=diskoa00.raw bs=10485760 count=1 # baliokidea
ls -l
sudo mkfs.ext4 diskoa00.raw 

### mount diskoa00.raw
mkdir mnt
sudo mount -t ext4 diskoa00.raw mnt/
sudo touch proba.txt
ls -l mnt/
sudo blkid # UUID begiratzeko
sudo umount mnt/
ls -l mnt/
df -h

### mount diskoa00.raw, aukerekin eta jabea ni izan nadila ez root-a
sudo mount -t ext4 -o noexec diskoa00.raw mnt/
sudo chown -R iperona mnt/
sudo chgrp -R iperona mnt/
ls -l .
ls -l mnt
# noexec-en efektua probatu
cd mnt
vim kaixo_mundua.c
gcc kaixo_mundua.c # a.out exekutagarria sortu
./a.out # noexec => Permission denied
sudo umount mnt/

sudo mount -t ext4 -o exec,rw,usrquota,sync,nosuid diskoa00.raw mnt/
# exec-en efektua probatu
cd mnt/
./a.out
# nosuid-en efektua probatu mnt-en barruan
vim suid_sgid.c
gcc suid_sgid.c # a.out exekutagarria sortu
ls -l
sudo chown root a.out
sudo chgrp root a.out
sudo chmod u+s a.out
ls -l
chmod u+s a.out
./a.out # UID: 1000 eta EUID: 1000
# nosuid-en efektua probatu mnt-tik kanpo
cp a.out .. # mnt fitxategi sistematik kanpo probatzeko
cd ..
ls -l
sudo chown root a.out
sudo chgrp root a.out
sudo chmod u+s a.out
ls -l
./a.out # UID: 1000 eta EUID: 0
sudo umount mnt/
