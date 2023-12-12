#!/bin/bash

# Solicitar la dirección IP al usuario
read -p "Ingresa la dirección IP a escanear con Nmap: " ip_address

# Ejecutar Nmap con los parámetros especificados y guardar los resultados en nmap.txt
nmap_command="nmap -p- -sS -sC -sV --open --min-rate 2000 -vvv -n -oN nmap.txt $ip_address"
echo "Ejecutando Nmap con el comando: $nmap_command"
eval $nmap_command

# Verificar si el archivo nmap.txt contiene información sobre el puerto 80 abierto
if grep -q "80/" nmap.txt; then
    echo "Se encontró el puerto 80 abierto en $ip_address"

    # Ejecutar Gobuster dos veces con diferentes diccionarios y guardar los resultados en archivos distintos
    gobuster_command1="gobuster dir -u http://$ip_address:80 -w /usr/share/dirbuster/wordlists/directory-list-lowercase-2.3-medium.txt -t 50 -o fuzz1.txt"
    echo "Ejecutando Gobuster 1 con el comando: $gobuster_command1"
    eval $gobuster_command1

    gobuster_command2="gobuster dir -u http://$ip_address:80 -w /usr/share/wfuzz/wordlist/general/medium.txt -o fuzz2.txt"
    echo "Ejecutando Gobuster 2 con el comando: $gobuster_command2"
    eval $gobuster_command2

    echo "El fuzzing con Gobuster ha finalizado. Revisa fuzz1.txt y fuzz2.txt para ver los resultados."
else
    echo "El puerto 80 no está abierto en $ip_address. No se puede ejecutar Gobuster."
fi
