#!/bin/bash
tput setab 7
tput setaf 0
clear 
tput cup 2 5
echo "Apartamento"
tput cup 2 23
echo "Clave"
tput cup 2 38
echo "Estado"
tput cup 2 52

contadorFilas=4
#Imprime la raya entre los titulos y la lista
for var in $(seq 2 1 50)
do
	tput cup 3 $var
	echo "_"
done

#imprime los datos correspondientes
for tupla in `cat ../BBDD/Tablas/datosLogin.txt`
do 
	nro=`echo $tupla|cut -d":" -f2`
	clav=`echo $tupla|cut -d":" -f3`
	clave=`echo $clav|base64 -d`
	tput cup $contadorFilas 5	
	echo $nro
	tput cup $contadorFilas  23
	echo $clave
	tput cup $contadorFilas  38
	echo "Habilitado"
	contadorFilas=$[$contadorFilas+1]
done 

#Imprime mensaje de salida
tput cup $[$contadorFilas+3] 5
tput setaf 1
echo "Ingrese cualquier tecla para volver al menu "
read -s pause
tput sgr0
clear
