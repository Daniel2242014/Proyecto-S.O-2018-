#!/bin/bash
tput sgr 0
tput setab 7
tput setaf 4
tput civis
clear
if test -z $(cat ../BBDD/Tablas/pagos.txt)
then
        tput sgr 0
        tput setab 1
        tput setaf 0
        clear
        echo "No hay pagos para mostrar"
        read -s pause
        tput sgr 0
        sh ../Menus/menuAdministrador.sh
fi
for var in $(cat ../BBDD/Tablas/pagos.txt)
do
        numPuerta=$(grep "$var" ../BBDD/Tablas/pagos.txt| cut -d ":" -f2)
        numMonto=$(grep "$var" ../BBDD/Tablas/pagos.txt| cut -d ":" -f3)
        numMes=$(grep "$var" ../BBDD/Tablas/pagos.txt| cut -d ":" -f4)
        numAnio=$(grep "$var" ../BBDD/Tablas/pagos.txt| cut -d ":" -f5)
        echo -e "\e[30m-------------------------------"
        echo -e "\e[34mNumero de Puerta: \e[32m$numPuerta"
        echo -e "\e[34mMonto: \e[32m$numMonto"
        echo -e "\e[34mFecha de pago: \e[32m$numMes/$numAnio"
        echo -e "\e[30m-------------------------------"

done
read -s pause
tput sgr 0
tput cnorm
clear
sh ../Menus/menuAdministrador.sh
