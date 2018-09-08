#!/bin/bash
clean
seleccion=0
while test $seleccion -ne 5
do
  clean
  tput setab 9
  tput setaf 4
  echo "1. Reservar"
  echo "2. Denunciar"
  echo "3. Iniciar evento"
  echo "4. Cambiar pin"
  echo "5. Cerrar sesion"
  case $seleccion in
    1) sh ../usuario/reserva.sh
    ;;
    2) sh ../usuario/denuncias.sh
    ;;
    3) sh ../usuario/cambiarpass.sh
    ;;
    4) sh ../usuario/iniciarevento.sh
    ;;
    5) clean
    tput setab 2
    tput setaf 0
    echo "Ha cerrado la sesion"
    tput setaf 4
    tput setab 9
    ;;
    *) clean
    tput setab 1
    tput setaf 0
    echo "Ingrese una opcion valida"
    tput setaf 4
    tput setab 9
    ;;
  esac
done
