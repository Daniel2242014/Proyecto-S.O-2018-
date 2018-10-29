#/bin/bash
tput sgr 0
tput setab 7
tput setaf 4
clear
echo "ingrese numero de denunciado:"
tput cup 0 30
read denunciado 

#Ingreso denuncia descripcion >> carpeta denuncias
if test $(grep ":$denunciado:" ../BBDD/Tablas/usuario.txt|wc -l) -eq 1 
then	
	tput cup 2 0
	echo "ingrese una descripcion:"
	tput cup 2 24
	read descripcion
	numDenuncia=$[$(cat ../Denuncia/noAutorizadas.txt|wc -l)+1]
	echo $numDenuncia
	clear
	echo "Ingrese el dia:"
	echo "Ingrese el mes:"
	echo "Ingrese el año:"
	
	#Lee Fecha
	tput cup 0 15
	read dia 
	tput cup 1 15
	read mes
	tput cup 2 15
	read anio

	#Verifica Fecha

	if cal $dia $mes $anio 2> /dev/null && ((test $anio -lt $(date +%Y)) || (test $anio -eq $(date +%Y) && ((test $mes -lt $(date +%m) && test $dia -lt $(date +%d))|| test $mes -lt $(date +%m))))
	then
		echo "valido" 
	else
		echo "Fecha No Valida, presione enter"
		read dklbhag
		exit		
	fi
	
	#Escribe Datos
	clear
	echo $(grep $denunciado ../BBDD/Tablas/reserva.txt|grep $dia|grep $anio)>>../BBDD/DatosTemporales/temp1.txt
	numDenunciante=$(cat ../BBDD/DatosTemporales/1.txt)
	

	echo ":$numDenuncia:$denunciado:$descripcion:$numDenunciante:">>../Denuncia/noAutorizadas.txt
	echo "Presione enter para continuar"
	read yyyyy
	rm ../BBDD/DatosTemporales/aux1.txt 
	

else 
	clear
	echo "Numero no valido, presione enter"
	read ighlkdajfñd
	exit
fi
exit


