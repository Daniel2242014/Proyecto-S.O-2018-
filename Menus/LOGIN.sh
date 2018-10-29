#!/bin/bash
tput sgr 0
clear
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
echo "Nro Apartamento:"
tput cup 20 17
read dpto
tput cup 21
echo "Clave:"
tput cup 21 7
read -s clave
pinencrypt=`echo $clave| base64`
tput setaf 4
if test `grep ":$dpto:$pinencrypt:" ../BBDD/Tablas/datosLogin.txt| wc -l` -eq 1
then	
	echo $dpto> ../BBDD/DatosTemporales/temp1.txt
	tput sgr 0
	if test $dpto = "admin"
	then
		sh menuAdministrador.sh
	else
		sh menuUsuario.sh
	fi
else
	tput setab 1
	tput setaf 7
	tput cup 23
	echo -e "Apartamento o clave incorrectos"
	tput cup 23 31
	read -s pause
fi
tput sgr 0
sh ../Menus/LOGIN.sh
