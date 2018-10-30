#!/bin/bash
dia=0
mes=0
anio=0
selecion=1
while test $selecion -eq 1 2> /dev/null
do

while test $selecion -eq 1 2> /dev/null
do
tput setab 7
tput setaf 0
clear
tput cup 1 20
echo -e "\e[0;47;34mSistema de reservas"
tput cup 4 2 
echo -e "\e[0;47;30mAnio:"
tput cup 6 2 
echo -e "\e[0;47;30mMes (\e[0;47;34mej:4\e[0;47;30m):"
tput cup 8 2 
echo -e "\e[0;47;30mDia:"
tput cup 4 50
echo -e "\e[0;47;30mHora:"
tput cup 6 50 
echo -e "\e[0;47;30mMinuto:"
tput cup 8 50
echo -e "\e[0;47;30mDuracion (\e[0;47;34mN° horas\e[0;47;30m):"
	tput setaf 0
	tput cup 4 8
	read anio
	tput cup 6 14
	read mes
	tput cup 8 8
	read dia
	
	tput setaf 7
	if cal $dia $mes $anio 2> /dev/null && (test $anio -gt $(date +%Y) || (test $anio -eq $(date +%Y) && ((test $mes -ge $(date +%m) && test $dia -ge $(date +%d))|| test $mes -gt $(date +%m))))
	then
		tput cup 11 22		
		tput setaf 1	
		tput civis
		echo "Quiere cambiar el dia? (0.No/ 1.Si/ 2.Salir al menu)"
		tput cup 11 82
		read selecion
		tput cnorm
		if test $selecion -eq 2
		then	
			exit
		fi
		tput cup 11 22
		echo "                                                              "
	else
		tput cup 11 22	
		tput setaf 1
		tput civis	
		echo "Entrada invalida, toque enter para continuar (2.Ir al menu)"
		tput cup 11 85
		tput setab 7
		read fff
		tput cnorm
		if test $fff -eq 2
		then	 
			exit	
		fi
		tput cup 11 22
		echo "                                                              "
		
	
		tput cup 4 8
		echo "    "
		tput cup 6 14
		echo "    "
		tput cup 8 8
		echo "    "
	fi	

done

#graficador
	tput setaf 1
	tput cup 13 15
	echo "Ocupado por evento"
	tput setaf 2
	tput cup 14 15
	echo "Libre"
	tput setaf 3
	tput cup 15 15
	echo "Ocupado por limpieza"
	tput setaf 0
	largo=1
	horas=0
	elementos=0
	contadorAmarillas=0
	conta=0
	if test $(grep ":$dia:$mes:$anio:" ../BBDD/Tablas/reserva.txt|wc -l) -eq 0
	then 
		elementos=0 > ../BBDD/DatosTemporales/tempReserba.txt
		echo "" 
	else
		elementos=1
		grep ":$dia:$mes:$anio:" ../BBDD/Tablas/reserva.txt > ../BBDD/DatosTemporales/tempReserba.txt
	fi
	
	for var in $(seq 0 1 18)
	do	
		if test $[$var+7] -lt 24
		then
			horas=$[$var+7]
		else	
			horas=$[$var-17]
		fi		
		
		for var2 in $(seq 0 1 3)
		do		
			let largo=$largo+1
			tput setab 2	
			conta=1			
			if test $elementos -eq 1 
			then
				for var3 in $(grep ":$dia:$mes:$anio:" ../BBDD/Tablas/reserva.txt)
				do	
					duracion=$(grep "$var3" ../BBDD/DatosTemporales/tempReserba.txt|cut -d: -f9)
					horaInicio=$(grep "$var3" ../BBDD/DatosTemporales/tempReserba.txt|cut -d: -f7)
					minutoInicio=$(grep "$var3" ../BBDD/DatosTemporales/tempReserba.txt|cut -d: -f8)
					tput cup 22 1 					
		
					if ((test $horas -lt $[$horaInicio+$duracion]||(test $horas -eq $[$horaInicio+$duracion]&& test $minutoInicio -eq 0 && test $var2 -eq 0))||(test $horas -le $[$horaInicio+$duracion] && test $[$var2*15] -lt $minutoInicio))&&(test $horas -gt $horaInicio || (test $horas  -ge $horaInicio && test $[$var2*15] -ge $minutoInicio)) 
					then 
						tput setab 1 	
						contadorAmarillas=4;
						conta=0	
					else
						if test $contadorAmarillas -gt 0 && test $conta -eq 1
						then 
							tput setab 3 
							let contadorAmarillas=$contadorAmarillas-1
							conta=0
						fi 									
					fi
	
				done									
			fi			
			tput setaf 0			
			tput cup 18 $largo			
			if test $var2 -eq 0
			then 
				echo "|"			
			else
				echo " "
			fi			
			tput cup 19 $largo			
			if test $var2 -eq 0
			then 
				echo "|"			
			else
				echo "-"
			fi
			
			
		done
			
		tput setaf 0
		tput setab 7	
		tput cup 20 $[$largo-3]
		echo "$horas"
		
	done
	
	tput setab 7
	tput setaf 0
	tput cup 20 $[$largo+1]
	echo "$[$var-16]"

#Ingreso de reservas 

tput cup 11 22	
tput setaf 1
tput civis
echo "Quiere cambiar la fecha?(1.Si/ 0.No)"
read selecion
tput cnorm
tput cup 11 22	
tput setab 7
tput setaf 0
echo "                                                                                      "
done

validacion=0

while test $validacion -eq 0
do
	tput cup 4 56
	echo "      "
	tput cup 6 58
	echo "      "
	tput cup 8 72
	echo "      "

	tput cup 4 56
	read hora
	tput cup 6 58
	read minuto
	tput cup 8 72
	read duracion
 
	horaMax=26
	minMax=0

	if ((test $hora -ge 7 2> /dev/null && test $hora -le 23 2> /dev/null)||(test $hora -ge 0 2> /dev/null && test $hora -le 2 2> /dev/null)) && test $minuto -ge 0 2> /dev/null && test $minuto -lt 60 2> /dev/null && test $duracion -gt 0 2> /dev/null && test $duracion -le 6 2> /dev/null 
	then
		validacion=1
	fi

	if test $hora -le 2
	then 
		let hora=$hora+24
	fi
	
	if test $(cat ../BBDD/DatosTemporales/tempReserba.txt|wc -l) -gt 0 && test $validacion -eq 1
	then
		for var4 in $(cat ../BBDD/DatosTemporales/tempReserba.txt)
		do
			inicio=$(grep "$var4" ../BBDD/DatosTemporales/tempReserba.txt |cut -d: -f7)
			if test $inicio -le 2
			then 
				let inicio=$inicio+24
			fi
			inicioMin=$(grep "$var4" ../BBDD/DatosTemporales/tempReserba.txt |cut -d: -f8)	
			duracion2=$(grep "$var4" ../BBDD/DatosTemporales/tempReserba.txt |cut -d: -f9)
			let fin=$hora+$duracion+1
			let fin2=$inicio+$duracion2+1
		
		
			if (test $inicio -lt $horaMax || (test $inicio -eq $horaMax && test $inicioMin -lt $minMax)) && (test $inicio -gt $hora || (test $hora -eq $inicio && test $inicioMin -gt $minuto )) 
			then 
				horaMax=$inicio
				minMax=$inicioMin
			fi

			if ((test $hora -gt $inicio || (test $hora -eq $inicio && test $minuto -gt $inicioMin)) && (test $hora -lt $fin2 || (test $hora -eq $fin2 && test $minuto -lt $inicioMin))) 
			then
				validacion=0
			else
				if test $fin -gt $horaMax || (test $fin -eq $horaMax && test $minuto -gt $minMax)
				then
					validacion=0	
				fi
				echo ""
			fi
	
		done
	fi	
	tput cup 11 10	
	tput setaf 1
	if test $validacion -eq 0
	then	
		tput civis
		echo "Datos incorrectos (2.Ir al menu)"
		tput setab 7		
		tput setaf 0
		read fff
		tput cnorm
		if test $fff -eq 2
		then	 
			exit	
		fi
		
	else
		tput civis
		tput setaf 1
		echo "Datos correctos, confirma la hora? (0.No/ 1.Si/ 2.Volver a empezar)"
		tput setaf 0	
		read validacion
		tput cnorm
	fi 
	tput cup 11 10
	echo  "                                                                               "
done

if test $validacion -eq 1
then 
	sh ../admin/actualizarpagos.sh
	numPuerta=$(cat ../BBDD/DatosTemporales/temp1.txt)
	if test $(grep $numPuerta ../BBDD/Tablas/usuario.txt | cut -d: -f5) == "NO"
	then
		
		tput cup 11 5	
		tput setaf 1
		tput civis
		echo "El primer uso del salon es grais, pulse cualquier tecla para continuar"
		read fff
		tput cnorm
		tput cup 11 5	
		tput setaf 0
		echo "                                                                      "
		echo "" > ../BBDD/DatosTemporales/temp2.txt
		for var6 in $(cat ../BBDD/Tablas/usuario.txt)
		do
			if test $(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f4) -eq $numPuerta
			then
				echo :$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f2):$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f3):$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f4):SI:$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f6):$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f7):$(grep $var6 ../BBDD/Tablas/usuario.txt| cut -d: -f8) >> ../BBDD/DatosTemporales/temp2.txt
			else	
				echo $var6 >> ../BBDD/DatosTemporales/temp2.txt
			fi
		done
		cat ../BBDD/DatosTemporales/temp2.txt >../BBDD/Tablas/usuario.txt
	else
		if test $(grep $numPuerta ../BBDD/Tablas/usuario.txt|cut -d: -f6) -gt 0
		then
			tput cup 11 2	
			tput setaf 1
			tput civis
			echo "Al tener deuda debera pagar en contado el salon, toque cualquier tecla para continuar "		
			read fff
			tput cnorm			
			tput cup 11 2	
			tput setaf 0                          
			echo "                                                                                           "
			tput cup 11 2	
			tput setaf 1
			tput civis
			echo "Pago completado"
			read fff
			tput cnorm
			tput cup 11 2
			tput setaf 0
			echo "                  "

		else
			verificado=0
			while test $verificado -eq 0
			do 
			verificado=1	
			tput cup 11 10	
			tput civis				
			tput setaf 1
			tput setab 7
			echo "Lo pagara en contado o en cuotas? (0.Contado/ 1.En cuotas)"
			tput cup 11 75		
			read tipoPago
			tput cnorm
			tput cup 11 10	
			tput setaf 0		
			echo "                                                              "
			
			case $tipoPago in
				0)
				tput cup 11 25	
				tput civis					
				tput setaf 1
				tput setab 7
				echo "Pago completado"
				read fff
				tput cnorm
				tput cup 11 25	
				tput setaf 0
				echo "               "	
				;;
			
				1)	
				verificadorNumCuota=0				
				while test $verificadorNumCuota -eq 0
				do
					verificadorNumCuota=1
					tput cup 11 25	
					tput setaf 1
					tput civis
					tput setab 7
					echo "Cuantas coutas (1 a 6 cuotas)"	
					tput cup 11 54
					tput setaf 0
					read montoCuota
					tput cnorm
					tput cup 11 25	
					tput setaf 0
					echo "                              "
					if test $montoCuota -gt 6 || test $montoCuota -lt 1
					then 
						tput cup 11 25	
						tput civis 
						tput setaf 1
						echo "Dato incorecto"
						read fff
						tput cnorm
						tput setaf 0
						tput cup 11 25
						echo "		    "
						verificadorNumCuota=0
					fi
								
				done 				
				codeFactura=$(tail -n1 ../BBDD/Tablas/deuda.txt|cut -d: -f2)
				# :codeFactura:numPuerta:pagoRestantes:monto:cuotas:sigienteMes:sigienteAño:codeReserva/codeDeuda:tipoCode(R=reserva/D=denuncias)
				mesS=$[$mes+1]
				anioS=$anio
				if test $mesS -ge 13
				then 
					mesS=1
					anioS=$[$anio+1]
				fi
				echo :$[$codeFactura+1]:$numPuerta:$montoCuota:900:$montoCuota:$mesS:$anioS:$[$(tail -n1 ../BBDD/Tablas/reserva.txt| cut -d: -f3)+1]:R: >>../BBDD/Tablas/deuda.txt

				;;
			
				*)
				tput cup 20 10	
				tput setaf 1
				tput civis
				echo "Entrada incorrecta"
				read fff
				tput setaf 0
				tput cnorm
				verificado=0
				;;
			esac
			done
		fi
	fi	

	echo :$numPuerta:$[$(tail -n1 ../BBDD/Tablas/reserva.txt| cut -d: -f3)+1]:$dia:$mes:$anio:$hora:$minuto:$duracion:  >>../BBDD/Tablas/reserva.txt
	tput cup 11 20	
	tput setaf 1
	tput civis
	tput setab 7
	echo "Reserva registrada " 
	read fff
	tput cnorm
	tput setaf 0
	
else
	tput setaf 1
	tput sgr0
fi




	
	



