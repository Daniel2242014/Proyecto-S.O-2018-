#!/bin/bash
tput sgr 0
tput setab 7
tput setaf 4
clear
tput cup 1 7 
tput setaf 0
echo "Denuncias"
tput cup 3 2
tput setaf 1
echo "Ingrese numero de denunciado (para salir -1):"
tput cup 3 49
read denunciado

if test $denunciado -eq -1
then 
	exit
fi

#Ingreso denuncia descripcion >> carpeta denuncias
if test $(grep ":$denunciado:" ../BBDD/Tablas/usuario.txt|wc -l) -eq 1 
then	
	tput cup 5 2
	tput setaf 0
	echo "ingrese una descripcion"
	tput cup 8 0
	read descripcion
	numDenuncia=$[$(tail -n1 ../BBDD/Tablas/denuncias.txt|cut -d: -f2)+1]

	#Escribe Datos
	numDenunciante=$(cat ../BBDD/DatosTemporales/temp1.txt)
	
		
	tput cup 6 30
	tput setaf 7
	tput setab 1
	echo "1=Aceptar y 2=No enviar " 
	read fff
	if test $fff -eq 2
	then 
		exit 	
	fi 
	echo ":$numDenuncia:$denunciado:$numDenunciante:$(date +%d)/$(date +%m)/$(date +%Y):-2:" >>../BBDD/Tablas/denuncias.txt
	touch ../BBDD/denuncias/$numDenuncia
	echo $descripcion > ../BBDD/denuncias/$numDenuncia
	
else 
	tput cup 5 2
	echo "Numero no valido, presione enter"
	read fff
	exit
fi
exit


