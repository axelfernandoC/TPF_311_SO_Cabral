#!/bin/bash

# Armo el script completo solo con sysadmin (Entiendo que el sysadmin deberia tener el control) y aparte quiero ahorrar tiempo xD
echo "Creamos grupos"

sudo groupadd g_sysadmin
sudo groupadd g_manager
sudo groupadd g_dev
sudo groupadd g_infra


echo "Creamos usuarios"

sudo useradd -m -g g_sysadmin -G g_infra -s /bin/bash -p "$(openssl passwd -6 u_sysadmin)" u_sysadmin

sudo useradd -m -g g_manager -G g_infra -s /bin/bash -p "$(openssl passwd -6 u_manager)" u_manager

sudo useradd -m -g g_dev -G g_infra -s /bin/bash -p "$(openssl passwd -6 u_dev)" u_dev



echo "Archivos .txt para finalizar"

id u_sysadmin > id_output.txt
id u_manager >> id_output.txt
id u_dev >> id_output.txt
