#!/bin/bash
tput setab 7
tput setaf 8
clear
tput cup 1 20
echo "Sistema de reserbas"
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
selecion=1
while test $selecion -eq 1 2> /dev/null
do
	tput setaf 8
	tput cup 4 8
	read anio
	tput cup 6 14
	read mes
	tput cup 8 8
	read dia
	
	tput setaf 7
	if cal $dia $mes $anio 2> /dev/null && test $anio -ge $(date +%Y) && ((test $mes -eq $(date +%m) && test $dia -ge $(date +%d))|| test $mes -gt $(date +%m))
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
	
		if test $selecion -eq 1 2> /dev/null
		then
			tput cup 4 8
			echo "    "
			tput cup 6 14
			echo "    "
			tput cup 8 8
			echo "    "
		fi
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
	largo=2
	echo $datos
	for var in $(seq 0 1 18)
	do	
			
		
		for var2 in $(seq 0 1 3)
		do		
						
			tput setab 2							
			tput cup 18 $largo			
			echo " "
			tput cup 19 $largo			
			echo " "
			let largo=$largo+1
			
		done
			
		tput setaf 8
		tput setab 7	
		tput cup 20 $[$largo-4]
		if test $[$var+7] -lt 24
		then
			echo "$[$var+7]"
		else	
			echo "$[$var-17]"
		fi	
	done
	tput setab 7
	tput setaf 8
	tput cup 20 $[$largo]
	echo "$[$var-16]"
	
	
