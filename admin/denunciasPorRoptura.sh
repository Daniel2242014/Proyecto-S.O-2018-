#!/bin/bash
tput sgr 0
tput setab 7
tput setaf 4
clear
tput cup 1 7 
tput setaf 0
echo "Roptura de los daños"
tput cup 3 2
tput setaf 1
echo "Ingrese numero de denunciado (para salir -1):"
tput cup 3 49
read denunciado

if test $denunciado -eq -1
then 
	exit
fi

if test $(grep ":$denunciado:" ../BBDD/Tablas/usuario.txt|wc -l) -eq 1 
then	
	tput cup 5 2
	tput setaf 0
	echo "Describa el costo de los daños"
	tput cup 5 33
	read costo 
	tput cup 7 2 
	echo "Describa los daños" 
	tput cup 10 0
	read descripcion
	numDenuncia=$[$(cat ../BBDD/Tablas/denuncias.txt|wc -l)+1]
	
	tput cup 8 30
	tput setaf 7
	tput setab 1
	echo "1=Aceptar y 2=No enviar " 
	read fff
	if test $fff -eq 2
	then 
		exit 	
	fi 
	echo ":$numDenuncia:$denunciado:admin:$(date +%d)/$(date +%m)/$(date +%Y):-1:" >>../BBDD/Tablas/denuncias.txt
	touch ../BBDD/denuncias/$numDenuncia
	echo $descripcion > ../BBDD/denuncias/$numDenuncia
	
	echo "" > ../BBDD/DatosTemporales/tempVerDenuncias			
	for var7 in $(cat ../BBDD/Tablas/usuario.txt)
	do			
		if test $(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f4) -eq $denunciado 2> /dev/null
		then 
			echo :$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f2):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f3):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f4):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f5):$[$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f6)+$costo]:$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f7):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f8):>> ../BBDD/DatosTemporales/tempVerDenuncias
		else	
			echo $var7 >> ../BBDD/DatosTemporales/tempVerDenuncias
		fi		   
	done
	cat ../BBDD/DatosTemporales/tempVerDenuncias > ../BBDD/Tablas/usuario.txt
	echo "" > ../BBDD/DatosTemporales/tempVerDenuncias
	
	
	
else 
	tput cup 5 2
	echo "Numero no valido, presione enter"
	read fff
	exit
fi
exit
