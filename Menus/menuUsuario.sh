#!/bin/bash
seleccion=0
while test $seleccion -ne 5
do
tput sgr 0
tput setab 7
tput civis
clear
echo -e "\e[0;47;34m1. \e[0;47;32mReservar"
echo -e "\e[0;47;34m2. \e[0;47;32mDenunciar"
echo -e "\e[0;47;34m3. \e[0;47;32mIniciar evento"
echo -e "\e[0;47;34m4. \e[0;47;32mCambiar clave"
echo -e "\e[0;47;34m5. \e[0;47;32mCerrar sesion"
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
