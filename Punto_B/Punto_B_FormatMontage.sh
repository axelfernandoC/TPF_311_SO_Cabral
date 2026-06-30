#!/bin/bash

# Agregar las particiones a /etc/fstab

sudo cp /etc/fstab /etc/fstab.bak

echo "Agregando particiones principales a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc1) /home/vagrant/manager/Servicios ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc2) /home/vagrant/manager/Monitoreo ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando particiones principales..."

sudo mount /home/vagrant/manager/Servicios
sudo mount /home/vagrant/manager/Monitoreo

echo "Creando carpetas internas..."

sudo mkdir -p /home/vagrant/manager/Servicios/Web
sudo mkdir -p /home/vagrant/manager/Servicios/Cache
sudo mkdir -p /home/vagrant/manager/Servicios/Base_de_Datos

sudo mkdir -p /home/vagrant/manager/Monitoreo/Logs
sudo mkdir -p /home/vagrant/manager/Monitoreo/Alertas
sudo mkdir -p /home/vagrant/manager/Monitoreo/Metricas

echo "Agregando particiones logicas a /etc/fstab..."

echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc5) /home/vagrant/manager/Servicios/Web ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc6) /home/vagrant/manager/Servicios/Cache ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=$(sudo blkid -s UUID -o value /dev/sdc7) /home/vagrant/manager/Monitoreo/Logs ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Montando todas las particiones..."

sudo mount -a

echo "Generando archivo de validacion..."

df -h > /home/vagrant/TPF_311_SO_Cabral/Punto_B/df_output_manager.txt

echo "Montaje configurado correctamente."
