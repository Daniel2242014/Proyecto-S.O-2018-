#!/bin/bash
selector=1
while test $selector -ne 0
do
	tput setab 9
  	tput setaf 4
	clear
	tput cup 3 10
	echo "Menu reservas" 	
	tput cup 5 5
	echo "1 - Ingresar reserva" 
	tput cup 7 5
	echo "2 - Ver reservas"
	tput cup 9 5
	echo "3 - volver al menu"
	tput cup 11 5
	echo "0 - Volver al menu principal"

	verficar=0
	while test $verficar -eq 0
	do
		tput cup 13 8
		tput setaf 9
		read selector
		if test $selector -eq 1 2>/dev/null|| test $selector -eq 0 2>/dev/null||t est $selector -eq 2 2>/dev/null|| test $selector -eq 3 2>/dev/null
		then 
			verficar=1
		else
			verficar=0
			tput cup 15 8
			tput setaf 1
			echo "Entrada Invalida $verficar"
		fi
	done

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
	;;

	esac

done

