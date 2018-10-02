#!/bin/bash
clear
tput setab 0
tput setaf 4
echo -e "                                                                 \e[0;90m____________"
echo -e "                                                                \e[0;90m|\e[0;35mXXXXXXXXXXXX\e[0;90m|"
echo -e "                                                                \e[0;90m|\e[0;35mX    XX    x\e[0;90m|"
echo -e "                                                                \e[0;90m|\e[0;35mX    XX    x\e[0;90m|"
echo -e "                                                         \e[0;90m_______\e[0;90m|\e[0;35mX\e[0;90m__\e[0;35mXXXXXXXXX\e[0;90m|"
echo -e "                                                        \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m| \e[0;35mXX    X\e[0;90m|"
echo -e "                                                        \e[0;90m|\e[0;31mX   XXX   X\e[0;90m| \e[0;35mXX    X\e[0;90m|"
echo -e "              \e[0;34;1m _____                                    \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "              \e[0;34;1m|  ___|   _ _ __ _ __ _   _               \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "              \e[0;34;1m| |_ | | | | '__| '__| | | |              \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "              \e[0;34;1m|  _|| |_| | |  | |  | |_| |              \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "              \e[0;34;1m|_|  |___,_|_|  |_|  |___, |              \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "              \e[0;34;1m ____        _ _     _|___/               \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35m XX    X\e[0;90m|"
echo -e "              \e[0;34;1m| __ ) _   _(_) | __| (_)_ ___  __ _      \e[0;90m|\e[0;31mX   XXX   X\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "              \e[0;34;1m|  _ || | | | | |/ _  | |  _  |/ _  |     \e[0;90m|\e[0;31mXXXXXXXXXXX\e[0;90m|\e[0;35mXXXXXXXX\e[0;90m|"
echo -e "              \e[0;34;1m| |_) | |_| | | | (_| | | | | | (_| |     \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
echo -e "              \e[0;34;1m|____/|___,_|_|_||__,_|_|_| |_||__, |     \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
echo -e "              \e[0;34;1m                               |___/      \e[0;90m|\e[0;31mX\e[0;90m|   |   |\e[0;31mX\e[0;90m|  |  |\e[0;35mXX\e[0;90m|"
tput setaf 6
tput cup 20 
echo "Nº Apartamento: "
tput cup 20 16
read usuario
tput cup 21
echo -e "Pin: "
tput cup 21 5
read -s pin
pinencrypt=`echo -n $pin | base64`
tput setaf 4
if test `grep ":$usuario:$pinencrypt:" ../BBDD/Tablas/datosLogin.txt | cut -d: -f1,2`
then	
	echo $usuario>../BBDD/DatosTemporales/temp1.txt
	clear
	tput sgr 0
	sh menuUsuario.sh
else
	tput setab 1
	tput setaf 7
	tput cup 23
	echo -e "Apartamento o contraseña incorrectos"
	read -s pause
fi
tput sgr 0
sh ../Menus/LOGIN.sh
