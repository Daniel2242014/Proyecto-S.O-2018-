#!/bin/bash
tput sgr0
tput setab 7
clear
echo -e "\e[0;47;34mIngrese el apartamento a inhabilitar:"
tput cup 0 38
read dpto

if test "$dpto" = "admin"
	then
		tput sgr 0
		tput setab 1
		tput setaf 0
		clear
		echo "No se puede eliminar al administrador del Sistema"
		read -s pause
		tput sgr0
		clear
		exit
fi

if test `grep "$dpto" ../BBDD/Tablas/datosLogin.txt|cut -d":" -f2|wc -l` -ne 1
then
	tput sgr 0
	tput setab 1
	tput setaf 0
	clear
	echo "Dicho apartamento no se encuentra habilitado o no existe"
	read -s pause
	tput sgr0
	clear
	exit
fi

for tupla in `cat ../BBDD/Tablas/datosLogin.txt`
do
	dptostr=`echo $tupla|cut -d":" -f2`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/datosLoginAUX.txt 
	fi
done
rm ../BBDD/Tablas/datosLogin.txt
mv ../BBDD/Tablas/datosLoginAUX.txt ../BBDD/Tablas/datosLogin.txt
rm ../BBDD/Tablas/datosLoginAUX.txt
tput setab 2
tput setaf 0
clear
echo -e "Se ha deshabilitado: \e[0;42;34m$dpto"
read -s pause
tput sgr 0
clear

