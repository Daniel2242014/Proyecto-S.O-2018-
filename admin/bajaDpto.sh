#!/bin/bash
tput sgr0
tput setab 7
clear
echo -e "\e[0;47;34mIngrese el apartamento a inhabilitar:"
tput cup 0 38
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
#Fin comprobacion apartamento

#Comprueba que no sea el admin para no dejar inutil el sistema
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
#Fin de comprobacion de admin

#Verifica la existencia del apartamento
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
#Fin verificación de existencia

#Se recorren los archivos de la base de datos en busqueda del apartamento, para eliminar las tuplas correspondientes
for tupla in `cat ../BBDD/Tablas/datosLogin.txt`
do
	dptostr=`echo $tupla|cut -d":" -f2`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/datosLoginAUX.txt 
	fi
done

for tupla in `cat ../BBDD/Tablas/denuncias.txt`
do
	dptostr=`echo $tupla|cut -d":" -f3`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/denunciasAUX.txt 
	fi
done

for tupla in `cat ../BBDD/Tablas/deuda.txt`
do
	dptostr=`echo $tupla|cut -d":" -f3`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/deudaAUX.txt 
	fi
done

for tupla in `cat ../BBDD/Tablas/reserva.txt`
do
	dptostr=`echo $tupla|cut -d":" -f2`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/reservaAUX.txt 
	fi
done

for tupla in `cat ../BBDD/Tablas/usuario.txt`
do
	dptostr=`echo $tupla|cut -d":" -f4`
	if test "$dptostr" != "$dpto"
	then
		echo $tupla>> ../BBDD/Tablas/usuarioAUX.txt 
	fi
done
# ------------------------- Fin recorrido de base de datos ----------------------

#------------------ Escritura y reemplazo de archivos -----------
rm ../BBDD/Tablas/datosLogin.txt
mv ../BBDD/Tablas/datosLoginAUX.txt ../BBDD/Tablas/datosLogin.txt
rm ../BBDD/Tablas/datosLoginAUX.txt

rm ../BBDD/Tablas/denuncias.txt
mv ../BBDD/Tablas/denunciasAUX.txt ../BBDD/Tablas/denuncias.txt
rm ../BBDD/Tablas/denunciasAUX.txt

rm ../BBDD/Tablas/deuda.txt
mv ../BBDD/Tablas/deudaAUX.txt ../BBDD/Tablas/deuda.txt
rm ../BBDD/Tablas/deudaAUX.txt

rm ../BBDD/Tablas/reserva.txt
mv ../BBDD/Tablas/reservaAUX.txt ../BBDD/Tablas/reserva.txt
rm ../BBDD/Tablas/reservaAUX.txt

rm ../BBDD/Tablas/usuario.txt
mv ../BBDD/Tablas/usuarioAUX.txt ../BBDD/Tablas/usuario.txt
rm ../BBDD/Tablas/usuarioAUX.txt

#---------------- Fin de operacion con archivos -----------------

#Mensaje de eliminacion correcta
tput setab 2
tput setaf 0
clear
echo -e "Se ha deshabilitado: \e[0;42;34m$dpto"
read -s pause
tput sgr 0
clear

