#!/bin/bash
selector=1
while test $selector -ne 0
do
	tput setab 9
  	tput setaf 7
	clear
	tput cup 3 10
	echo "Menu reservas" 	
	tput cup 5 5
	echo "1 - Ingresar reserva" 
	tput cup 7 5
	echo "2 - Ver reservas"
	tput cup 9 5
	echo "3 - Eliminar reserva"
	tput cup 11 5
	echo "0 - Volver al menu principal"
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

