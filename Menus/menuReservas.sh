#!/bin/bash
selector=1
while test $selector -ne 0
do
	tput setab 7
	clear
	tput cup 3 10
	echo -e "\e[0;47;34mMenu reservas" 	
	tput cup 5 5
	echo -e "\e[0;47;34m1. \e[0;47;32mIngresar reserva" 
	tput cup 7 5
	echo -e "\e[0;47;34m2. \e[0;47;32mVer reservas"
	tput cup 9 5
	echo -e "\e[0;47;34m3. \e[0;47;32mEliminar reserva"
	tput cup 11 5
	echo -e "\e[0;47;34m0. \e[0;47;32mVolver al menu principal"
	read selector
	
	case $selector in

	1)sh ../usuario/reserva.sh 
	;;
	2)sh ../usuario/verMisReservas.sh
	;;
	3)sh ../usuario/eliminarReserva.sh
	;;
	0) 
	;;
	*) echo "Entrada Invalida"
	   selector=4
	;;

	esac

done

