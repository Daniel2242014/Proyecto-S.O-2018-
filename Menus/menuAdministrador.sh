#!/bin/bash
clear
seleccion=0
while test $seleccion -ne 6
do
  clear
  tput setab 9
  tput setaf 4
  echo "1. Ver denuncias"
  echo "2. Actualizar pagos"
  echo "3. Ver pagos"
  echo "4. Editar usuarios"
  echo "5. Editar reglamentos/ moneda"
  echo "6. Cerrar sesion"
  read seleccion
  case $seleccion in
    1) sh ../admin/verdenuncias.sh
    ;;
    2) sh ../admin/verpagos.sh
    ;;
    3) sh ../admin/actualizarpagos.sh
    ;;
    4) sh ../admin/editarusers.sh
    ;;
    5) sh ../admin/editarreglamentomoneda.sh
    ;;
    6) clear
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
