#!/bin/bash
tput sgr0
tput setab 7
clear
echo -e "\e[0;47;34mIngrese el apartamento a habilitar:"
tput cup 0 36
read dpto
#Comprueba que el apartamento no este vacio
if test -z $dpto
then 
	tput sgr 0
	tput setab 1
	tput setaf 0
	clear
	echo "Debe ingresar un numero de apartamento"
	read -s pause
	tput sgr0
	clear
	exit
fi	
#Fin de comprobacion apartamento

#Comprueba que no se repita
if test `grep "$dpto" ../BBDD/Tablas/datosLogin.txt|cut -d":" -f2|wc -l` -ne 0
then
	tput sgr 0
	tput setab 1
	tput setaf 0
	clear
	echo "Dicho apartamento ya se encuentra habilitado"
	read -s pause
	tput sgr0
	clear
	exit
fi
#Fin comprobacion repeticion

#Verifica que se trate de un apartamento (numero entero)
if test $dpto -eq $dpto 2>/dev/null
then
	clear
	echo -e "\e[0;47;34mIngrese su clave:"
	tput cup 2 0
	echo -e "\e[0;47;34mIngrese su Nombre:"
	tput cup 4 0
	echo -e "\e[0;47;34mIngrese su Apellido:"
	tput cup 0 18
	read clave
	tput cup 2 20
	read nom
	tput cup 4 22
	read apl
	#Verifica que se haya ingresado una clave
	if test -z $clave
	then
		tput sgr 0
		tput setab 1
		tput setaf 0
		clear
		echo "Debe ingresar una clave"
		read -s pause
		tput sgr0
		clear
		exit
	fi
	#Se encodea la clave a b64
	clavencrypt=`echo $clave| base64`
	#Se guarda en el archivo	
	echo ":$dpto:$clavencrypt:">> ../BBDD/Tablas/datosLogin.txt
	echo :$nom:$apl:$dpto:NO:0:$(date -d "1 month " +%m):$(date -d "1 month " +%Y): >> ../BBDD/Tablas/usuario.txt
	tput setab 2
	tput setaf 0
	clear
	echo -e "Se ha habilitado: \e[0;42;34m$dpto"
	read -s pause
	tput sgr 0
	clear
else
	#Mensaje de error "default" por si no es un numero entero
	tput sgr 0
	tput setab 1
	tput setaf 0
	clear
	echo "Debe ingresar un numero de apartamento"
	read -s pause
	tput sgr0
	clear
	exit
fi
