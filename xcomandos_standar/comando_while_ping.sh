#!/bin/bash
intento=1
termina=10
escape=5

DNS="peru8.com"
EXITO=0

while [ $termina -ge $intento ]
do
  echo $intento
  let intento=$intento+1




  #::::::::::::para  linux
  #ping -c 2 -w 6 www.cisco.com >/dev/null 2>/dev/null
  #::::::::::::para  Windows
  ping -n 4  $DNS >/dev/null 2>/dev/null

  #--- aqui capturaremos el error que nos traera 2>/dev/null
  resp=$?

  if [ $resp != 0 ]
     then
          echo -e "\033[41mERROR\033[0;0m Tu PC no puede resolver DNS.\n"
          echo -e "Probando conectividad IP: \c"
          ping -c 2 -w 6 $DNS >/dev/null 2>/dev/null
          resp=$?
                  if [ $resp != 0 ]
                     then
                          echo -e "\033[41mERROR\033[0;0m Verifica el gateway o la IP de tu maquina.\n"
  #                        echo -e "resp : ${resp}"
                     else
                          EXITO=1
                          echo -e "\033[32mOK\033[0;0m\n"
  #                        echo -e "resp : ${resp}"
                  fi
     else
          echo -e "\033[32mOK\033[0;0m\n"
          EXITO=1
  #        echo -e "resp : ${resp}"
  fi


  #--------- escapamos si ya se conecto
  if [ "$EXITO" -eq 1 ]; then
    echo "se conecto a ${DNS}"
    break
  fi

  #--------- escapamos si supera los intentos
  if [ "$intento" -eq "$escape" ]; then
    echo "llego a 5"
    break
  fi



  sleep 4
done

#------------------------------------Aqui  ira el proceso
