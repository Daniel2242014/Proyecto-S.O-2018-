#!/bin/bash
cat ../BBDD/Tablas/denuncias.txt
echo "presione [1] para editar costos, presione cualquier tecla para volver al menu"
read $aux1
case $aux1 in
	1)
	echo "Ingrese el numero de denuncia"
	read $numDen
	echo "Ingrese un valor"
	read $valor
	sed -i "$numDen s|$|=$valor|" ../BBDD/Tablas/denuncias.txt
	sed -i "$numDen s|$|:|" ../BBDD/Tablas/denuncias.txt
	sh menuAdministrador.sh
	;;
	*) sh menuAdministrador.sh
esac
