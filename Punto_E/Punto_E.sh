#!/bin/bash

echo "Memoria RAM total:" > Filtro_basico.txt
grep "MemTotal" /proc/meminfo >> Filtro_basico.txt

echo "Modelo del microprocesador:" >> Filtro_basico.txt
grep "model name" /proc/cpuinfo | head -n 1 >> Filtro_basico.txt

echo "Frecuencia del microprocesador:" >> Filtro_basico.txt
grep "cpu MHz" /proc/cpuinfo | head -n 1 >> Filtro_basico.txt
