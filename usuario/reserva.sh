#!/bin/bash
selecion=1
while test $selecion -eq 1 2> /dev/null
do

while test $selecion -eq 1 2> /dev/null
do
tput setab 7
tput setaf 8
clear
tput cup 1 20
echo "Sistema de reservas"
tput cup 4 2 
echo "Año:"
tput cup 6 2 
echo "Mes (ej:4):"
tput cup 8 2 
echo "Dia:"
tput cup 4 50
echo "Hora:"
tput cup 6 50 
echo "Minuto:"
tput cup 8 50
echo "Duracion (N° horas):"


	tput setaf 8
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
		tput setab 1	
		echo "¿Quiere cambiar el dia? (0=no, 1=si)"
		tput cup 11 61
		tput setaf 8
		tput setab 7
		read selecion
		tput cup 11 22
		echo "                                                              "
	else
		tput cup 11 22	
		tput setab 1	
		echo "Entrada invalidad, toque enter para continuar"
		tput cup 11 67
		tput setab 7
		read /dev/null
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
	largo=1
	horas=0
	elementos=0
	contadorAmarillas=0
	conta=0
	if test $(grep ":$dia:$mes:$anio:" ../BBDD/Tablas/reserva.txt|wc -l) -eq 0
	then 
		elementos=0
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
					echo "$horas $duracion $horaInicio $minutoInicio" 					
		
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
			tput setaf 8			
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
			
		tput setaf 8
		tput setab 7	
		tput cup 20 $[$largo-3]
		echo "$horas"
		
	done
	
	tput setab 7
	tput setaf 8
	tput cup 20 $[$largo+1]
	echo "$[$var-16]"

#Ingreso de reservas 

tput cup 11 22	
tput setab 1
tput setaf 7
echo "¿Quiere cambiar la fecha?(1= si 0 = no)"
read selecion
tput cup 11 22	
tput setab 7
tput setaf 8
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

if test $hora -ge 7 && test $hora -le 2 && test $minuto -ge 0 && test $minuto -lt 60 && test $duracion -gt 0 && test $duracion -le 6 
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
tput cup 11 22	
tput setab 1
tput setaf 7
echo "ESTADO $validacion / $horaMax $minMax"
read ff
done

	
	



