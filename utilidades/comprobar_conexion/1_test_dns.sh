#!/bin/bash
clear
echo -e "Probando conexion a Internet: \c"
#::::::::::::para  linux
#ping -c 2 -w 6 www.cisco.com >/dev/null 2>/dev/null
#::::::::::::para  Windows
ping -n 4  www.cisco.comw >/dev/null 2>/dev/null

#--- aqui capturaremos el error que nos traera 2>/dev/null
resp=$?

if [ $resp != 0 ]
   then
        echo -e "\033[41mERROR\033[0;0m Tu PC no puede resolver DNS.\n"
        echo -e "Probando conectividad IP: \c"
        ping -c 2 -w 6 66.102.9.147 >/dev/null 2>/dev/null
        resp=$?
                if [ $resp != 0 ]
                   then
                        echo -e "\033[41mERROR\033[0;0m Verifica el gateway o la IP de tu maquina.\n"
#                        echo -e "resp : ${resp}"
                   else
                        echo -e "\033[32mOK\033[0;0m\n"
#                        echo -e "resp : ${resp}"
                fi
   else
        echo -e "\033[32mOK\033[0;0m\n"
#        echo -e "resp : ${resp}"
fi
