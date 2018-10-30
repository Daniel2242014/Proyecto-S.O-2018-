#!/bin/bash
tput setab 7
tput setaf 0
	clear 
	tput cup 2 5
	echo -e "\e[0;47;30m Numero denuncia"
	tput cup 2 25
	echo "Denunciado"
	tput cup 2 39
	echo "Denunciante"
	tput cup 2 51
	echo "Fecha denuncia"
	tput cup 2 69
	echo "Autorizada"

	contadorFilas=4
	numPuerta=$(cat ../BBDD/DatosTemporales/temp1.txt)

	for var1 in $(seq 3 1 82)
	do
		tput cup 3 $var1
		echo "_"
	done

	for var2 in $(cat ../BBDD/Tablas/denuncias.txt)
	do 
		if test $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f3) -eq $numPuerta
		then
			tput cup $contadorFilas 5
			echo $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f2)
			tput cup $contadorFilas  25
			echo $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f3)
			tput cup $contadorFilas  39
			echo $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f4)
			tput cup $contadorFilas  51
			echo $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f5) 
			tput cup $contadorFilas  69
			if test $(grep $var2 ../BBDD/Tablas/denuncias.txt|cut -d: -f6) -eq -2
			then 
				echo "NO"
			else 
				echo "SI"
			fi
		contadorFilas=$[$contadorFilas+1]		
		fi


		
	done



	tput cup $[$contadorFilas+2] 22
	tput setab 1
	tput setaf 7
	echo "Toque cualquier boton para continuar"
	tput setab 7
	read fff
	
