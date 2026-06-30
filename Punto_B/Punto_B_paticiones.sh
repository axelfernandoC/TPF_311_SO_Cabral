#!/bin/bash

echo " Creando particiones en /dev/sdc "

sudo fdisk /dev/sdc <<EOF
o
n
p
1

+1G
n
p
2

+1G
n
e
3


n

+2730M
n

+2730M
n


w
EOF

echo "Actualizando tabla de particiones"

sudo partprobe /dev/sdc
sudo udevadm settle
sleep 2

echo " Formateando particiones en ext4 "

sudo mkfs.ext4 -F /dev/sdc1
sudo mkfs.ext4 -F /dev/sdc2
sudo mkfs.ext4 -F /dev/sdc5
sudo mkfs.ext4 -F /dev/sdc6
sudo mkfs.ext4 -F /dev/sdc7

echo "Verificando particiones "

lsblk -f

echo "Particiones creadas y formateadas correctamente "
