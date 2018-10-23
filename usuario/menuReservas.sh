#!/bin/bash

selector=0
while test $selector -ne 0
do
	tput setab 9
  	tput setaf 4
	clear
	tput cup 5 10
	echo "Menu reservas" 	
	tput cup 8 5
	echo "1 - Ingresar reserva" 
	tput cup 10 5
	echo "2 - Ver reservas"
	tput cup 12 5
	echo "3 - volver al menu"
	tput cup 14 5
	echo "0 - Volver al menu principal"

	verficar=0
	while $verificar -eq 0
	do
		read selector
		if test $verificar -eq 1|| test $verificar -eq 0||t est $verificar -eq 2|| test $verificar -eq 3
		then 
			verificar=1
		else
			verificar=0
			tput cup 18 8
			tput setaf 1
			echo "Entrada Invalida"
		fi
	done
echo

done

