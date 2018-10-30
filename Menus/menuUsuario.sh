#!/bin/bash
seleccion=4
while test $seleccion -ne 0
do
tput sgr 0
tput setab 7
tput civis
clear
echo -e "\e[0;47;34m1. \e[0;47;30mReservar"
echo -e "\e[0;47;34m2. \e[0;47;30mDenunciar"
echo -e "\e[0;47;34m3. \e[0;47;30mIniciar evento"
echo -e "\e[0;47;34m4. \e[0;47;30mCambiar clave"
echo -e "\e[0;47;34m0. \e[0;47;30mCerrar sesion"
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
  0)
    tput setab 2
    tput setaf 0
    clear
    rm ../BBDD/DatosTemporales/temp1.txt
    touch ../BBDD/DatosTemporales/temp1.txt
    echo "Ha cerrado la sesion"
    read -s pause
    tput sgr 0
    tput cnorm
    seleccion=0
    clear
  ;;
  *) 
    tput setab 1
    tput setaf 0
    clear
    echo "Ingrese una opcion valida"
    read -s pause
    tput sgr 0
    seleccion=3
    clear
  ;;
esac
done
