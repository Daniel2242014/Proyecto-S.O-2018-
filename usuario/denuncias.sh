#/bin/bash
echo "ingrese numero de denunciado:"
tput cup 0 30
read -n 3 denunciado
touch ../BBDD/DatosTemporales/numPuertas.txt
cut -d ":" -f 3 ../BBDD/Tablas/usuario.txt>>../BBDD/DatosTemporales/numPuertas.txt

if test grep $denunciado ../BBDD/DatosTemporales/numPuertas.txt>dev/null
then
	
	echo "ingrese una descripcion:"
	tput cup 1 24
	read $descripcion
	numDenuncia=$(wc -l ../BBDD/Tablas/denuncias.txt)+1
	clear
	echo "Ingrese el anio:"
	echo "Ingrese el mes:"
	echo "Ingrese el dia"
	tput cup 0 16
	read $dia 
	tput cup 1 15
	read $mes
	tput cup 2 15
	read $anio
	grep $denunciado ../BBDD/Tablas/reserva.txt|grep $dia|grep $anio>>../BBDD/DatosTemporales/aux1.txt
	numReserva=$(cut -d ":" -f 2 ../BBDD/DatosTemporales/aux1.txt)
	echo ":$numDenuncia:$denunciado:$descripcion:$numReserva:">>../BBDD/Tablas/denuncias.txt
	rm ../BBDD/DatosTemporales/numPuertas.txt
	rm ../BBDD/DatosTemporales/aux1.txt

else 
	echo "Numero no valido"
	rm ../BBDD/DatosTemporales/numPuertas.txt
	
	sh menuUsuario.sh
fi
sh menuUsuario.sh
