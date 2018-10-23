#!/bin/bash
echo "" >../BBDD/DatosTemporales/tempActualisar2
montoACargar=0

for var1 in $(cat ../BBDD/Tablas/deuda.txt)
do
	mesAnterior=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f7)	
        anioAnterior=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f8)
	mesAPagar=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f4)

	if test $mesAPagar -gt 0 2> /dev/null && ( test $anioAnterior -lt $(date +%Y) 2> /dev/null || (test $anioAnterior -eq $(date +%Y) 2> /dev/null && test $mesAnterior -lt $(date +%m) 2> /dev/null))
	then 	
		if test $anioAnterior -lt $(date +%Y)
		then 
			mesesAPagar=$[ ( (12*( $(date +%Y)-$anioAnterior))-$mesAnterior) + $(date +%m)]
			echo $mesesAPagar
		else
			let mesesAPagar=$(date +%m)-$mesAnterior
		fi
				
		
		montoAPagar=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f5)
		cuotas=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f6)
                numPuerta=$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f3)
		deudaAnterior=$(grep $numPuerta ../BBDD/Tablas/usuario.txt|cut -d: -f6)

		if test $mesesAPagar -gt $mesAPagar
		then
			mesesAPagar=$mesAPagar
		fi
		totalAPagar=$[$mesesAPagar * $[$montoAPagar/$cuotas]]
		echo $totalAPagar
		nuevoUsuario=$(echo $(grep $numPuerta ../BBDD/Tablas/usuario.txt | sed s/:$deudaAnterior:/:$[$deudaAnterior+$totalAPagar]:/g)) 	
		rutaPRev=$(grep $numPuerta ../BBDD/Tablas/usuario.txt)	
                contador=0		
		for var2 in $(sed /$rutaPRev/d ../BBDD/Tablas/usuario.txt) 
		do
			if test $contador -eq 0
			then 
				echo $var2 > ../BBDD/Tablas/usuario.txt
				contador=$[$contador+1]
			else
				echo $var2 >> ../BBDD/Tablas/usuario.txt
			fi
		done 
		echo $nuevoUsuario >> ../BBDD/Tablas/usuario.txt

		#:codFactura:numPuerta:pagosRestantes:Monto:cuotas:siguienteMes:siguienteAño:
		aaa=$anioAnterior
		mesAnterior=$[$mesAnterior+$mesesAPagar]
		if test $mesAnterior -gt 12
		then 
			aaa=$[$aaa+1]
  			mesAnterior=$[$mesAnterior-12]
		fi

		echo :$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f2):$numPuerta:$[$mesAPagar-$mesesAPagar]:$montoAPagar:$cuotas:$mesAnterior:$aaa:$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f9):$(grep $var1 ../BBDD/Tablas/deuda.txt|cut -d: -f10): >> ../BBDD/DatosTemporales/tempActualisar2
	
	else
		echo $var1 >>../BBDD/DatosTemporales/tempActualisar2
	fi

done 

cat ../BBDD/DatosTemporales/tempActualisar2 > ../BBDD/Tablas/deuda.txt

echo ""  > ../BBDD/DatosTemporales/tempActualisar2
numLinias2=0
for var5 in $(cat ../BBDD/Tablas/usuario.txt)
do	
	
	mesUsuario=$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f7)
	amioUsuario=$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f8)
	if test $amioUsuario -lt $(date +%Y) 2> /dev/null || test $mesUsuario -lt $(date +%m) 2> /dev/null
	then			
		deudaUsuario=$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f6)		
		mesesAPagarUsuario=$[((12*( $(date +%Y)-$amioUsuario))-$mesUsuario) + $(date +%m) -1]
		deudaUsuario=$[(2000*$mesesAPagarUsuario)+$deudaUsuario]
		echo :$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f2):$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f3):$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f4):$(grep $var5 ../BBDD/Tablas/usuario.txt| cut -d: -f5):$deudaUsuario:$(date +%m):$(date +%Y): >>../BBDD/DatosTemporales/tempActualisar2 

	else
		echo $var5 >>../BBDD/DatosTemporales/tempActualisar2
	fi

done
cat ../BBDD/DatosTemporales/tempActualisar2 > ../BBDD/Tablas/usuario.txt





