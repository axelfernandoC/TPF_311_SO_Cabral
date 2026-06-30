#!/bin/bash

ROL=$1

echo "Configurando permisos para el rol $ROL"

echo "Aplicando permisos en Servicios..."

sudo chmod 755 /home/vagrant/$ROL/Servicios/Web
sudo chmod 700 /home/vagrant/$ROL/Servicios/Base_de_Datos
sudo chmod 644 /home/vagrant/$ROL/Servicios/Cache

echo "Aplicando permisos en Monitoreo..."

sudo chmod u=rwx,g=rx,o=r /home/vagrant/$ROL/Monitoreo/Logs
sudo chmod u=rwx,g=,o= /home/vagrant/$ROL/Monitoreo/Alertas
sudo chmod u=rwx,g=rx,o=rx /home/vagrant/$ROL/Monitoreo/Metricas

echo "Generando archivo de validacion..."

ls -la /home/vagrant/$ROL/Servicios > permisos_output.txt
ls -la /home/vagrant/$ROL/Monitoreo >> permisos_output.txt

echo " Punto D finalizado correctamente "
