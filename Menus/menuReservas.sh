#!/bin/bash
selector=1
while test $selector -ne 0
do
	tput setab 7
	clear
        tput civis
	tput cup 3 10
	echo -e "\e[0;47;34mMenu reservas" 	
	tput cup 5 5
	echo -e "\e[0;47;34m1. \e[0;47;30mIngresar reserva" 
	tput cup 7 5
	echo -e "\e[0;47;34m2. \e[0;47;30mVer reservas"
	tput cup 9 5
	echo -e "\e[0;47;34m3. \e[0;47;30mEliminar reserva"
	tput cup 11 5
	echo -e "\e[0;47;34m0. \e[0;47;30mVolver al menu principal"
	read selector
	
	case $selector in

	1)sh ../usuario/reserva.sh 
	;;
	2)sh ../usuario/verMisReservas.sh
	;;
	3)sh ../usuario/eliminarReserva.sh
	;;
	0) tput sgr 0
	;;
	*) tput setaf 0	
	tput setab 1 
	clear		
	echo "Entrada Invalida"
	selector=4 
	read -s pause
	tput cnorm 
	tput sgr 0
	clear sh 
	;;
	esac
done

