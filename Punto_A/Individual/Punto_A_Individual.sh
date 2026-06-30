#!/bin/bash

# Directorios punto A del rol sysadmin

mkdir -p ~/sysadmin/Servicios/{Cache,Base_de_Datos,Web}
mkdir -p ~/sysadmin/Monitoreo/{Logs,Alertas,Metricas}

touch ~/sysadmin/Servicios/{Cache,Base_de_Datos,Web}/.gitkeep
touch ~/sysadmin/Monitoreo/{Logs,Alertas,Metricas}/.gitkeep

echo "Directorios sysadmin ¡Listos! "

# Directorios del rol manager

mkdir -p ~/manager/Servicios/{Cache,Base_de_Datos,Web}
mkdir -p ~/manager/Monitoreo/{Logs,Alertas,Metricas}

touch ~/manager/Servicios/{Cache,Base_de_Datos,Web}/.gitkeep
touch ~/manager/Monitoreo/{Logs,Alertas,Metricas}/.gitkeep
