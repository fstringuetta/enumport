#!/bin/bash

echo -e "Enumerando portas...."
portas=$(sudo nmap -sS --open -p- -Pn $1 -oA ALL-TCP | grep '^[0-9]' | awk -F'/' '{print $1}'| xargs | sed 's/ /,/g')
printf "\e[1;33;40mPortas abertas\e[0m: \e[1;32m$portas\e[0m"
echo ""
echo "Verificando Serviços"
nmap -sC -sV -p $portas -Pn $1 -oA Services-TCP
