#!/bin/bash
tput setab 7
tput setaf 0
clear
seleccion=0
while test $seleccion -ne 4
do
  clear
  tput setab 9
  tput setaf 4
  echo "1. Ver denuncias"
  echo "2. Actualizar pagos"
  echo "3. Editar usuarios"
  echo "4. Cerrar sesion"
  read seleccion
  case $seleccion in
    1) sh ../admin/verdenuncias.sh
    ;;
    2) sh ../admin/verPagos.sh
    ;;
    3) sh ../admin/editarusers.sh
    ;;
    4) rm ../BBDD/DatosTemporales/temp1.txt
    touch ../BBDD/DatosTemporales/temp1.txt
    clear
    tput setab 2
    tput setaf 0
    echo "Ha cerrado la sesion"
    tput setaf 4
    tput setab 9
    ;;
    *) clear
    tput setab 1
    tput setaf 0
    echo "Ingrese una opcion valida"
    tput setaf 4
    tput setab 9
    ;;
  esac
done
