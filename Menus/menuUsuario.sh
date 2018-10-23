#!/bin/bash
seleccion=0
while test $seleccion -ne 5
do
tput sgr 0
tput setab 7
tput setaf 4
tput civis
clear
echo "1. Reservar"
echo "2. Denunciar"
echo "3. Iniciar evento"
echo "4. Cambiar clave"
echo "5. Cerrar sesion"
read seleccion
case $seleccion in
  1)
    tput sgr 0
    tput cnorm
    sh menuReservas.sh
  ;;
  2)
    tput sgr 0 
    tput cnorm
    sh ../usuario/denuncias.sh
  ;;
  3)
    tput sgr 0
    tput cnorm
    sh ../usuario/iniciarevento.sh
  ;;
  4)
    tput sgr 0
    tput cnorm
    sh ../usuario/cambiarpass.sh
  ;;
  5)
    tput setab 2
    tput setaf 0
    clear
    rm ../BBDD/DatosTemporales/temp1.txt
    touch ../BBDD/DatosTemporales/temp1.txt
    echo "Ha cerrado la sesion"
    read -s pause
    tput sgr 0
    tput cnorm
    clear
  ;;
  *) 
    tput setab 1
    tput setaf 0
    clear
    echo "Ingrese una opcion valida"
    read -s pause
    tput sgr 0
    clear
  ;;
esac
done
