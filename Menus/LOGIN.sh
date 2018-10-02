#!/bin/bash
usuario=1
while test $usuario -ne -1 #Agusitn te puse un while para una prueba si queres eliminalo
do
clear
tput setaf 4
echo -e "                                                   \e[0;90m____________"
echo -e "                                                  \e[0;90m|\e[0;35mXXXXXXXXXXXX\e[0;90m|"
echo -e "                                                  \e[0;90m|\e[0;35mX    XX    x\e[0;90m|"
echo -e "                                                  \e[0;90m|\e[0;35mX    XX    x\e[0;90m|"
echo -e "                                           \e[0;90m_______\e[0;90m|\e[0;35mX\e[0;90m__\e[0;35mXXXXXXXXX\e[0;90m|"
echo -e "                                          \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m| \e[0;35mXX    X\e[0;90m|"
echo -e "                                          \e[0;90m|\e[0;31mX   XXX   X\e[0;90m| \e[0;35mXX    X\e[0;90m|"
echo -e "\e[0;34;1m _____                                    \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "\e[0;34;1m|  ___|   _ _ __ _ __ _   _               \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "\e[0;34;1m| |_ | | | | '__| '__| | | |              \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "\e[0;34;1m|  _|| |_| | |  | |  | |_| |              \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "\e[0;34;1m|_|  |___,_|_|  |_|  |___, |              \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "\e[0;34;1m ____        _ _     _|___/               \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "\e[0;34;1m| __ ) _   _(_) | __| (_)_ ___  __ _      \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "\e[0;34;1m|  _ || | | | | |/ _  | |  _  |/ _  |     \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "\e[0;34;1m| |_) | |_| | | | (_| | | | | | (_| |     \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
echo -e "\e[0;34;1m|____/|___,_|_|_||__,_|_|_| |_||__, |     \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
echo -e "\e[0;34;1m                               |___/      \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
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
