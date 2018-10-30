#!/bin/bash
tput sgr0
tput setab 7
clear
echo "Ingrese el apartamento a inhabilitar:"
read dpto

for tupla in `cat ../BBDD/Tablas/datosLogin.txt`
do
	if test $tupla != ":$dpto:"
	then
		echo $tupla>> ../BBDD/Tablas/datosLoginAUX.txt 
	fi
done
rm ../BBDD/Tablas/datosLogin.txt
mv ../BBDD/Tablas/datosLoginAUX.txt ../BBDD/Tablas/datosLogin.txt
rm ../BBDD/Tablas/datosLoginAUX.txt	
