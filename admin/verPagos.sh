#!/bin/bash
sh ../admin/actualizarpagos.sh
verificar=0
numeroPuerta=0
while test $verificar -eq 0
do
tput setab 7
tput setaf 0 
clear

	verificar=0
	tput cup 1 5 
	tput setaf 1 
	echo "Ingrese el numero de puerta:"
	tput cup 1 35
	tput setaf 0 
	read numeroPuerta
	tput cup 1 5 
	tput setaf 7 
 
	if test $(grep ":$numeroPuerta:" ../BBDD/Tablas/usuario.txt|wc -l) -eq 1
	then 
		verificar=1
		tput cup 3 5 
		tput setaf 7
		tput setab 1
		echo " Entrada incorrecta (salir=2) "
		read fff
		if test $fff -eq 2
		then 
			exit
		fi
	fi
done
deuda=$(grep ":$numeroPuerta:" ../BBDD/Tablas/usuario.txt|cut -d: -f6)
mes=$(grep ":$numeroPuerta:" ../BBDD/Tablas/usuario.txt|cut -d: -f7)
anio=$(grep ":$numeroPuerta:" ../BBDD/Tablas/usuario.txt|cut -d: -f8)
gastosDeudas=0
gastosComunes=0

for var2 in $(grep ":$numeroPuerta:" ../BBDD/Tablas/deuda.txt)
do
	mesTemp=$(grep $var2 ../BBDD/Tablas/deuda.txt|cut -d: -f7)
	anioTemp=$(grep $var2 ../BBDD/Tablas/deuda.txt|cut -d: -f8)
	pagosTemp=$(grep $var2 ../BBDD/Tablas/deuda.txt|cut -d: -f4)	

	if test $pagosTemp -gt 0 && test $anioTemp -eq $(date +%Y) && test $mesTemp -eq $(date +%m)
	then 
		gastosDeudas=$[$gastosDeudas+$(grep $var2 ../BBDD/Tablas/deuda.txt|cut -d: -f5)]
	fi

done

mess=$(date +%m)
anioo=$(date +%Y)
if test $mes -eq $mess && test $anio -eq $anioo
then 
gastosComunes=2000
fi

tput cup 4 5 
tput setaf 0
echo "Gastos comunes:       $gastosComunes"

tput cup 6 5
echo "Deuda:                $deuda"

tput cup 8 5
echo "Cuotas por reservas   $gastosDeudas"



if test $gastosComunes -eq 0 && test $deuda -eq 0 && test $gastosDeudas -eq 0
then 

	tput cup 11 10
	tput setaf 1
	echo "Todo pago, toque cualquier boton para continuar"
	read fff
else
	tput cup 11 10
	tput setaf 1
	echo "Va a pagar? (0=si 1=no)"
	read elecion
	tput cup 11 10
	tput setaf 8
	echo "                       "
	if test $elecion -eq 0
	then
		tput cup 11 10
		tput setaf 1
		echo "Debera pagar $[$gastosComunes+$deuda+$gastosDeudas]"
		tput cup 11 10
		tput setaf 8
		echo "                                                   "
		
		echo "" > ../BBDD/DatosTemporales/tempVerPagos
		
		for var3 in $(cat ../BBDD/Tablas/usuario.txt)
		do
			if test $(grep $var3 ../BBDD/Tablas/usuario.txt| cut -d: -f4) -eq $numeroPuerta 2> /dev/null
			then	
				echo :$(grep $var3 ../BBDD/Tablas/usuario.txt| cut -d: -f2):$(grep $var3 ../BBDD/Tablas/usuario.txt| cut -d: -f3):$(grep $var3 ../BBDD/Tablas/usuario.txt| cut -d: -f4):$(grep $var3 ../BBDD/Tablas/usuario.txt| cut -d: -f5):0:$(date -d "1 month" +%m):$(date -d "1 month" +%Y): >> ../BBDD/DatosTemporales/tempVerPagos
			else	
				echo $var3 >> ../BBDD/DatosTemporales/tempVerPagos
			fi			

		done
		
		cat ../BBDD/DatosTemporales/tempVerPagos > ../BBDD/Tablas/usuario.txt
		echo "" > ../BBDD/DatosTemporales/tempVerPagos

		for var4 in $(cat ../BBDD/Tablas/deuda.txt)
		do
			if test $(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f3) -eq $numeroPuerta && test $(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f4) -gt 0
			then
				echo :$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f2):$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f3):$[$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f4)-1]:$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f5):$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f6):$(date -d "1 month" +%m):$(date -d "1 month" +%Y):$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f9):$(grep $var4 ../BBDD/Tablas/deuda.txt|cut -d: -f10): >> ../BBDD/DatosTemporales/tempVerPagos
			else
				echo $var4 >> ../BBDD/DatosTemporales/tempVerPagos
			fi
		
		done
		cat ../BBDD/DatosTemporales/tempVerPagos > ../BBDD/Tablas/deuda.txt
				

		tput cup 11 10
		tput setaf 1
		echo "Pago realizado"
		tput cup 11 10
		tput setaf 8
		echo "              "

		
	fi
			
fi 



