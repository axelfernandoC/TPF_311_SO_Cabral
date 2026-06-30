#!/bin/bash

# Agregar las particiones a /etc/fstab

sudo cp /etc/fstab /etc/fstab.bak

echo "Agregando particiones principales a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc1) /home/vagrant/dev/Servicios ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc2) /home/vagrant/dev/Monitoreo ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando particiones principales..."

sudo mount /home/vagrant/dev/Servicios
sudo mount /home/vagrant/dev/Monitoreo

echo "Creando carpetas internas..."

sudo mkdir -p /home/vagrant/dev/Servicios/Web
sudo mkdir -p /home/vagrant/dev/Servicios/Cache
sudo mkdir -p /home/vagrant/dev/Servicios/Base_de_Datos

sudo mkdir -p /home/vagrant/dev/Monitoreo/Logs
sudo mkdir -p /home/vagrant/dev/Monitoreo/Alertas
sudo mkdir -p /home/vagrant/dev/Monitoreo/Metricas

echo "Agregando particiones logicas a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc5) /home/vagrant/dev/Servicios/Web ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc6) /home/vagrant/dev/Servicios/Cache ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc7) /home/vagrant/dev/Monitoreo/Logs ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando todas las particiones..."

sudo mount -a

echo "Generando archivo de validacion..."

df -h > /home/vagrant/TPF_311_SO_Cabral/Punto_B/df_output_dev.txt

echo "Montaje configurado correctamente."
