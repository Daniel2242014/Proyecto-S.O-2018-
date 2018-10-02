#!/bin/bash
usuario=1
while test $usuario -ne -1 #Agusitn te puse un while para una prueba si queres eliminalo
do
clear
tput setab 9
tput setaf 4
echo "																		        ______________"
echo "																		        |XXXXXXXXXXXX|"
echo "																		        |X    XX    x|"
echo "																		        |X    XX    x|"
echo "																		________|X___XXXXXXXX|"
echo "																		|XXXXXXXXXXX| XX    X|"
echo "																		|X   XXX   X| XX    X|"
echo "							 _____                                  	|X   XXX   X|XXXXXXXX|"
echo "							|  ___|   _ _ __ _ __ _   _             	|XXXXXXXXXXX| XX    X|"
echo "							| |_ | | | | '__| '__| | | | 			    |X   XXX   X| XX    X|"
echo "							|  _|| |_| | |  | |  | |_| |				|X   XXX   X|XXXXXXXX|"
echo "							|_|  |___,_|_|  |_|  |___, |                |XXXXXXXXXXX| XX    X|"
echo "							 ____        _ _     _|___/              	|X   XXX   X| XX    X|"
echo "							| __ ) _   _(_) | __| (_)_ ___  __ _ 		|X   XXX   X|XXXXXXXX|"
echo "							|  _ || | | | | |/ _  | |  _  |/ _  |		|XXXXXXXXXXX|XXXXXXXX|"
echo "							| |_) | |_| | | | (_| | | | | | (_| |		|X|   |   |X|  |  |XX|"
echo "							|____/|___,_|_|_||__,_|_|_| |_||__, |		|X|   |   |X|  |  |XX|"
echo "							                               |___/		|X|   |   |X|  |  |XX|"
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
