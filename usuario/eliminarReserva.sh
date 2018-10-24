#!/bin/bash 
verificar=0
while test $verificar -eq 0 
do
	verificar=1
	tput setab 7
	tput setaf 0
	clear
	tput cup 1 2
	echo "ELIMINAR UNA RESERVA" 
	tput cup 3 2
	echo "Ayuda: Si no conoce el codigo de la reserva, vaya a 'Ver reservas' y busquelo"
	tput cup 5 4
	tput setaf 1
	echo "Codigo Reserva( -1 para salir):"
	tput cup 8 4
	tput setaf 0
	echo "Datos de la reserva" 
	tput cup 10 4
	echo "Fecha"
	tput cup 12 4
	echo "Hora inicio"
	tput cup 14 4
	echo "Duracion"
	tput cup 16 4
	echo "Tipo pago"

	tput cup 5 36
	read codeReserva 
	if test $codeReserva -ne -1
		then		
		numPuerta=$(cat ../BBDD/DatosTemporales/temp1.txt)
		if test $(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|wc -l) -eq 1
		then
			tput setaf 0
			tput cup 10 25
			echo $(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f4)/$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f5)/$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f6)
			tput cup 12 25
			echo $(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f7):$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f8)
			tput cup 14 25
			echo $(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f9) horas
			if test $(grep ":$codeReserva:R:" ../BBDD/Tablas/deuda.txt|wc -l) -eq 0
			then 
				tipoPago="Contado"	
			else
				tipoPago="Cuota"	
			fi
			tput cup 16 25		
			echo $tipoPago

			tput cup 10 12
			tput setaf 1
			echo "Ingrese 0 para eliminar, 1 para volver a elegir una reserva y 2 para salir"
			read accion
			if test $accion -eq 0
			then 
			#codigo de eliminacion
			else
				if test $accion -eq 1
				then 
					verificar=0
				fi
			fi		

		else
			tput cup 19 12
			tput setaf 1
			echo "Esta reserva no le corresponde o no exsiste"
			read
			verificar=0	
		fi
		
	fi

done

