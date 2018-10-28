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
		dia=$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f4)
		mes=$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f5)
		anio=$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f6)
		hora=$(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|cut -d: -f7)
		if test $(grep ":$numPuerta:$codeReserva:" ../BBDD/Tablas/reserva.txt|wc -l) -eq 1 && ( test $anio -gt $(date +%Y) || ( (test $anio -eq $(date +%Y) && test $mes -gt $(date +%m) ) || (test $anio   -eq $(date +%Y) && test $mes -eq $(date +%m) && test $dia -gt $(date +%d) ) || (test $anio -eq $(date +%Y) && test $mes -eq $(date +%m) && test $dia -eq $(date +%d) && test $hora -gt $(date +%H))))
		then	
				tput setaf 0
				tput cup 10 25
				echo $dia/$mes/$anio
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

				tput cup 18 5
				tput setaf 1
				echo "Ingrese 0 para eliminar, 1 para volver a elegir una reserva y 2 para salir"
				tput setaf 8			
				read accion
				tput setaf 7
				tput cup 18 5
				echo "                                                                          "

				if test $accion -eq 0
				then 
					contador1=0
					echo $(head -n1 ../BBDD/Tablas/reserva.txt ) > ../BBDD/DatosTemporales/tempEliminacion
					for var3 in $(cat ../BBDD/Tablas/reserva.txt)
					do
						if test $(grep $var3 ../BBDD/Tablas/reserva.txt | cut -d: -f3) -ne $codeReserva 2> /dev/null
						then 
							echo $var3 >> ../BBDD/DatosTemporales/tempEliminacion
						else	
							contador1=$[$contador1+1]								
							if test $contador1 -eq 2
							then						
								dia2=$(date -d "2 days" +%d)
								mes2=$(date -d "2 days" +%m)
								anio2=$(date -d "2 days" +%Y)
								hora2=$(date -d "2 days" +%H)
								if test $anio2 -gt $anio || ( (test $anio2 -eq $anio && test $mes2 -gt $mes) || ( (test $anio2 -eq $anio && test $mes2 -eq $mes && test $dia2 -gt $dia)||( test $anio2 -eq $anio && test $mes2 -eq $mes && test $dia2 -eq $dia && test $hora2 -gt $hora) ) )
								then 
									tput cup 18 5
									tput setaf 1
									echo "Esta cancelando dentro de las 48 horas antes del evento, debra pagar 400$"
									tput setaf 8			
									read ffff
									tput setaf 7
									tput cup 18 5
									echo "                                                                          "
								fi

							fi
						fi
					done					

					cat ../BBDD/DatosTemporales/tempEliminacion > ../BBDD/Tablas/reserva.txt
					echo $(head -n1 ../BBDD/Tablas/deuda.txt )  > ../BBDD/DatosTemporales/tempEliminacion	
					efectivo=2

					for var3 in $(cat ../BBDD/Tablas/deuda.txt)
					do
						if test $(grep $var3 ../BBDD/Tablas/deuda.txt | cut -d: -f9) -ne $codeReserva 2>/dev/null
						then 
							echo $var3 >> ../BBDD/DatosTemporales/tempEliminacion
						else
							efectivo=$[$efectivo-1]
						fi
					done	
					if test $efectivo -gt 0 
					then	
						tput cup 18 20
						tput setaf 1					
						echo "Por pagar en efectivo el salon, se le pagara 900$"
						read fff
						tput cup 18 20					
						tput setaf 7 
						echo "                                                 "
						tput setaf 1
						tput cup 18 20					
						echo "Pago realizado "
						read fff
					fi
						 
					cat ../BBDD/DatosTemporales/tempEliminacion > ../BBDD/Tablas/deuda.txt
				

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
tput setaf 8

