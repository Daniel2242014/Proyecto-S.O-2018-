#!/bin/bash
clear
tput setab 7
tput setaf 4
seleccion=0
while test $seleccion -ne 5
do
  clear
  tput setab 7
  tput setaf 4
  echo "1. Reservar"
  echo "2. Denunciar"
  echo "3. Iniciar evento"
  echo "4. Cambiar pin"
  echo "5. Cerrar sesion"
  read seleccion
  case $seleccion in
    1)
      tput sgr 0 
      sh ../usuario/reserva.sh
    ;;
    2)
      tput sgr 0 
      sh ../usuario/denuncias.sh
    ;;
    3)
      tput sgr 0
      sh ../usuario/cambiarpass.sh
    ;;
    4)
      tput sgr 0 
      sh ../usuario/iniciarevento.sh
    ;;
    5)
      tput setab 2
      tput setaf 0
      clear
      echo "Ha cerrado la sesion"
      read -s pause
      tput sgr 0
      sh ../Menus/LOGIN.sh 
      clear
    ;;
    *) 
      tput setab 1
      tput setaf 0
      clear
      echo "Ingrese una opcion valida"
      read -s pause
      sh ../Menus/menuUsuario.sh
      tput sgr 0
      clear
    ;;
  esac
done
