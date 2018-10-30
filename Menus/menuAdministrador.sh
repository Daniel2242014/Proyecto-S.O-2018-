#!/bin/bash
seleccion=0
while test $seleccion -ne 4
do
tput sgr 0
tput setab 7
tput civis
clear
echo -e "\e[0;47;34m1. \e[0;47;30mVer denuncias"
echo -e "\e[0;47;34m2. \e[0;47;30mActualizar pagos"
echo -e "\e[0;47;34m3. \e[0;47;30mEditar usuarios"
echo -e "\e[0;47;34m4. \e[0;47;30mCerrar sesion"
read seleccion
case $seleccion in
	1) 
		tput sgr 0
	    	tput cnorm
		sh ../admin/verdenuncias.sh
	;;
	2)
		tput sgr 0
    		tput cnorm	
		sh ../admin/verPagos.sh
	;;
	3)
		tput sgr 0
		tput cnorm	
		sh ../admin/editarusers.sh
	;;
	4)
		rm ../BBDD/DatosTemporales/temp1.txt
		touch ../BBDD/DatosTemporales/temp1.txt
		tput setab 2
		tput setaf 0		
		clear
		echo "Ha cerrado la sesion"
		read -s pause
		tput cnorm
	    	tput sgr 0
		clear
		exit
	;;
	*)
		tput setab 1
		tput setaf 0
		clear
		echo "Ingrese una opcion valida"
		read -s pause
		tput cnorm
		tput sgr 0
		clear
	;;
esac
done
