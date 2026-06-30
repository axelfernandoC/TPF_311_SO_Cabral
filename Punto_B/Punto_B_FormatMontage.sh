#!/bin/bash

# Agregar las particiones a /etc/fstab

sudo cp /etc/fstab /etc/fstab.bak

echo "Agregando particiones principales a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc1) /home/vagrant/sysadmin/Servicios ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc2) /home/vagrant/sysadmin/Monitoreo ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando particiones principales..."

sudo mount /home/vagrant/sysadmin/Servicios
sudo mount /home/vagrant/sysadmin/Monitoreo

echo "Creando carpetas internas..."

sudo mkdir -p /home/vagrant/sysadmin/Servicios/Web
sudo mkdir -p /home/vagrant/sysadmin/Servicios/Cache
sudo mkdir -p /home/vagrant/sysadmin/Servicios/Base_de_Datos

sudo mkdir -p /home/vagrant/sysadmin/Monitoreo/Logs
sudo mkdir -p /home/vagrant/sysadmin/Monitoreo/Alertas
sudo mkdir -p /home/vagrant/sysadmin/Monitoreo/Metricas

echo "Agregando particiones logicas a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc5) /home/vagrant/sysadmin/Servicios/Web ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc6) /home/vagrant/sysadmin/Servicios/Cache ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc7) /home/vagrant/sysadmin/Monitoreo/Logs ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando todas las particiones..."

sudo mount -a

echo "Generando archivo de validacion..."

df -h > /home/vagrant/TPF_311_SO_Cabral/Punto_B/df_output_sysadmin.txt

echo "Montaje configurado correctamente."
