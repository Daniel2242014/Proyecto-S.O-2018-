#!/bin/bash
seleccion=1
while test $seleccion -ne 0
do
tput sgr 0
tput setab 7
tput civis
clear
echo -e "\e[0;47;34m1. \e[0;47;30mVer denuncias"
echo -e "\e[0;47;34m2. \e[0;47;30mActualizar pagos"
echo -e "\e[0;47;34m3. \e[0;47;30mDenuncia Por roptura del salon"
echo -e "\e[0;47;34m4. \e[0;47;30mHabilitar apartamento"
echo -e "\e[0;47;34m5. \e[0;47;30mDeshabilitar apartamento"
echo -e "\e[0;47;34m6. \e[0;47;30mListar apartamentos habilitados"
echo -e "\e[0;47;34m0. \e[0;47;30mCerrar sesion"
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
		sh ../admin/denunciasPorRoptura.sh
	;;
	4)
		tput sgr 0
		tput cnorm	
		sh ../admin/altaDpto.sh
	;;
	5)
		tput sgr 0
		tput cnorm	
		sh ../admin/bajaDpto.sh
	;;
	6)
		tput sgr 0
		tput cnorm	
		sh ../admin/listarDptos.sh
	;;	
	0)
		rm ../BBDD/DatosTemporales/temp1.txt
		touch ../BBDD/DatosTemporales/temp1.txt
		tput setab 2
		tput setaf 0		
		clear
		echo "Ha cerrado la sesion"
		read -s pause
		tput cnorm
	    	tput sgr 0
		seleccion=0
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
		seleccion=9
		clear
	;;
esac
done
