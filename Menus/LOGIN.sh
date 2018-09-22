#!/bin/bash
usuario=1
while test $usuario -ne -1 #Agusitn te puse un while para una prueba si queres eliminalo
do
clear
tput setab 9
tput setaf 4
echo "                            _____                               "
echo "                           |  ___|   _ _ __ _ __ _   _           "
echo "                           | |_ | | | | '__| '__| | | |          "
echo "                           |  _|| |_| | |  | |  | |_| |          "
echo "                           |_|  |___,_|_|  |_|  |___, |          "
echo "                            ____        _ _     _|___/           "
echo "                           | __ ) _   _(_) | __| (_)_ ___  __ _ "
echo "                           |  _ || | | | | |/ _  | |  _  |/ _  |"
echo "                           | |_) | |_| | | | (_| | | | | | (_| |"
echo "                           |____/|___,_|_|_||__,_|_|_| |_||__, |"
echo "                                                          |___/"
tput setaf 0

tput setaf 6
echo "                   Ingrese Usuario: "
read usuario
echo "                   Pin:  "
read pin
tput setaf 4
echo $usuario>../BBDD/DatosTemporales/temp1.txt
# AGUSTIN, VOY A GUARDAR EL NOMBRE DEL USUARIO EN UNA ARCHIVO TEM1 PARA PODER TRABAJAR EN EL 
# REGISTRO, CUANDO EL LOGIN ESTE FUNCIONANDO VAS A TENER QUE HACER LO MISMO, PERO CON USUARIO #VERIFICADO 
clear
# CONFIGURAR LOGIN AGUSTIN 
sh menuUsuario.sh
done
