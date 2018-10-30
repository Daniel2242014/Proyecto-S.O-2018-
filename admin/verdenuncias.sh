#!/bin/bash
tput setab 7
tput setaf 0
repetir=0
numDenuncia=0
numPuerta=0
while test $repetir -eq 0
tput setab 7
tput setaf 0
do
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
	done



	tput cup $[$contadorFilas+2] 22
	tput setab 1
	tput setaf 7
	echo "0 = selecionar una denuncia, 1 = salir"
	tput setab 7
	read fff
	tput cup $[$contadorFilas+2] 22
	tput setab 7
	echo "                                      "
	
	if test $fff -eq 1	
	then 
		exit
	fi

	tput cup $[$contadorFilas+2] 22
	tput setab 1
	tput setaf 7
	jjj=-1	
	while test  $jjj -eq -1
	do	
		jjj=-1	
		tput cup $[$contadorFilas+2] 22
		tput setab 1
		tput setaf 7
		echo "Ingrese el numero de denuncia"
		tput setab 7		
		tput cup $[$contadorFilas+3] 22
		read numDenuncia
		echo "                             "
		for var5 in $(cat ../BBDD/Tablas/denuncias.txt)
		do
			if test $(grep $var5 ../BBDD/Tablas/denuncias.txt| cut -d: -f2 ) -eq $numDenuncia
			then					
				jjj=1
					
			fi
		done
		if test $jjj -eq -1
		then
			tput cup $[$contadorFilas+2] 22			
			tput setab 1			
			echo "Numero incorrecto"
			tput setab 7
			read fff
			tput cup $[$contadorFilas+2] 22			
			tput setab 7
			echo "                 "
		fi
		
	done
	tput setaf 7
	tput setab 1 
	numPuerta=$(grep ":$numDenuncia:" ../BBDD/Tablas/denuncias.txt|cut -d: -f3)
	tput cup $[$contadorFilas+2] 22
	echo "1 = autorizar, 0= descripcion"
	read fff
	if test $fff -eq 1
	then
		if test $(grep ":$numDenuncia:" ../BBDD/Tablas/denuncias.txt|cut -d: -f6) -eq -2
		then 
			echo "" > ../BBDD/DatosTemporales/tempVerDenuncias			
			for var7 in $(cat ../BBDD/Tablas/denuncias.txt)
			do			
				if test $(grep $var7 ../BBDD/Tablas/denuncias.txt|cut -d: -f2) -eq $numDenuncia
				then 
					echo :$(grep $var7 ../BBDD/Tablas/denuncias.txt|cut -d: -f2):$(grep $var7 ../BBDD/Tablas/denuncias.txt|cut -d: -f3):$(grep $var7 ../BBDD/Tablas/denuncias.txt|cut -d: -f4):$(grep $var7 ../BBDD/Tablas/denuncias.txt|cut -d: -f5):-1: >> ../BBDD/DatosTemporales/tempVerDenuncias
				else	
					echo $var7 >> ../BBDD/DatosTemporales/tempVerDenuncias
				fi		   

			done
			cat ../BBDD/DatosTemporales/tempVerDenuncias > ../BBDD/Tablas/denuncias.txt


			echo "" > ../BBDD/DatosTemporales/tempVerDenuncias			
			for var7 in $(cat ../BBDD/Tablas/usuario.txt)
			do			
				if test $(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f4) -eq $numPuerta 2> /dev/null
				then 
					echo :$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f2):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f3):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f4):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f5):$[$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f6)+(1081*2)]:$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f7):$(grep $var7 ../BBDD/Tablas/usuario.txt|cut -d: -f8):>> ../BBDD/DatosTemporales/tempVerDenuncias
				else	
					echo $var7 >> ../BBDD/DatosTemporales/tempVerDenuncias
				fi		   

			done
			cat ../BBDD/DatosTemporales/tempVerDenuncias > ../BBDD/Tablas/usuario.txt
			echo "" > ../BBDD/DatosTemporales/tempVerDenuncias
		else	
			tput cup $[$contadorFilas+2] 22			
			tput setab 1			
			echo "Esta denuncia ya fue autorizada"
			tput setab 7
			read fff
			tput cup $[$contadorFilas+2] 22			
			tput setab 7
			echo "                               "
		fi
	else	
		tput setaf 0
		tput setab 7
		clear 
		tput cup 1 2
		echo -e "\e[0;47;1mNumero reserva \e[0;47m$numDenuncia "
		tput cup 3 2		
		echo -e "\e[0;47;1mNumero puerta denunciante \e[0;47m    "$(grep ":$numDenuncia:" ../BBDD/Tablas/denuncias.txt|cut -d: -f4)
		tput cup 5 2
		echo -e "\e[0;47;1mNumero puerta denunciado\e[0;47m    "$(grep ":$numDenuncia:" ../BBDD/Tablas/denuncias.txt|cut -d: -f3)
		tput cup 7 2
		echo -e "\e[0;47;1mFecha de la denuncia \e[0;47m    "$(grep ":$numDenuncia:" ../BBDD/Tablas/denuncias.txt|cut -d: -f5)
		tput cup 9 2	
		echo -e "\e[0;47;1mDescripcion"
		tput cup 11 0
		echo -e "\e[0;47m$(cat ../BBDD/denuncias/$numDenuncia)"	
		read fff

	fi
done






