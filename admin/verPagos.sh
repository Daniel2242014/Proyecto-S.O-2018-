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
        echo "-------------------------------"
        echo "Numero de Puerta: $numPuerta"
        echo "Monto: $numMonto"
        echo "Fecha de pago: $numMes/$numAnio"
        echo "-------------------------------"
done
read -s pause
tput sgr 0
tput cnorm
clear
sh ../Menus/menuAdministrador.sh
