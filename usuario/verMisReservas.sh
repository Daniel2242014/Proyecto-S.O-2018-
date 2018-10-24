#!/bin/bash
tput setab 7
tput setaf 0
clear 
tput cup 2 5
echo "Numero reserva"
tput cup 2 23
echo " Fecha     "
tput cup 2 38
echo "Hora Inicio"
tput cup 2 52
echo "Duracion"
tput cup 2 63
echo "Tipo pago"

contadorFilas=4
numPuerta=$(cat ../BBDD/DatosTemporales/temp1.txt)

for var1 in $(seq 3 1 74)
do
	tput cup 3 $var1
	echo "_"
done




for var2 in $(grep $numPuerta ../BBDD/Tablas/reserva.txt)
do 
	numReserva=$(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f3)
	if test $(grep ":$numReserva:R:" ../BBDD/Tablas/deuda.txt|wc -l) -eq 0
	then 
		tipoPago="Contado"	
	else
		tipoPago="Cuota"
	fi
	tput cup $contadorFilas 5
	echo $numReserva
	tput cup $contadorFilas  23
	echo $(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f4)/$(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f5)/$(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f6)
	tput cup $contadorFilas  38
	echo $(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f7):$(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f8):00
	tput cup $contadorFilas  52
	echo $(grep $var2 ../BBDD/Tablas/reserva.txt|cut -d: -f9)H
	tput cup $contadorFilas  63
	echo $tipoPago


	contadorFilas=$[$contadorFilas+1]
done 

tput cup $[$contadorFilas+3] 22
tput setab 1
tput setaf 7
echo " Ingrese cualquier tecla para volver al menu "
 
read jj



