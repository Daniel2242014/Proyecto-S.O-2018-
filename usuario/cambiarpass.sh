#!/bin/bash
tput sgr 0
tput setab 7
tput setaf 4
clear
echo -e "Ingrese su clave actual:"
tput cup 0 24
read -s clave
clavencrypt=`echo $clave| base64`
dpto=`cat ../BBDD/DatosTemporales/temp1.txt`
if test `grep ":$dpto:$clavencrypt:" ../BBDD/Tablas/datosLogin.txt| wc -l` -eq 1
then	
	clear
	echo -e "Ingrese nueva clave:"
	tput cup 0 20
	read -s newkey
	if test -z $newkey
	then
		tput sgr 0
		tput setaf 0
		tput setab 1
		clear
		echo "Escriba una clave"
		read -s pause
		tput sgr 0
		sh menuUsuario.sh
	fi
	newkeyencrypt=`echo $newkey| base64`
	clear
	echo -e "Ingrese clave nuevamente:"
	tput cup 0 25
	read -s newkeycheck
	if test $newkeycheck -eq $newkey
	then
		for tupla in `cat ../BBDD/Tablas/datosLogin.txt`
		do
			if test $tupla != ":$dpto:$clavencrypt:"
			then
				echo $tupla>> ../BBDD/Tablas/datosLoginAUX.txt 
			fi
		done
		rm ../BBDD/Tablas/datosLogin.txt
		mv ../BBDD/Tablas/datosLoginAUX.txt ../BBDD/Tablas/datosLogin.txt
		rm ../BBDD/Tablas/datosLoginAUX.txt		
		echo ":$dpto:$newkeyencrypt:">> ../BBDD/Tablas/datosLogin.txt
		tput sgr 0
		tput setaf 0
		tput setab 2
		clear
		echo "La clave se cambio satisfactoriamente"
		read -s pause
		clear
		tput sgr 0
		#sh menuUsuario.sh
	else
		tput sgr 0
		tput setaf 0
		tput setab 1
		clear
		echo "Las claves no coinciden"
		read -s pause
		tput sgr 0
		#sh menuUsuario.sh
	fi
else
	tput sgr 0
	tput setaf 0
	tput setab 1
	clear
	echo "La clave ingresada no es correcta"
	tput setab 1
	read -s pause
	clear
	tput sgr 0
fi
