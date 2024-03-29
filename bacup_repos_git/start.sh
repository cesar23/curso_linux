#!/bin/bash
scriptPath=$(dirname $0)
intento=1
termina=10
escape=5
segundos=4

DNS="google.com"
EXITO=0

while [ $termina -ge $intento ]
do

  # aqui agregamso segundos por los  intentos
  echo ""
  echo "-----------------------------------------------------------------"
  echo ""
  echo ""
  let segundos=$segundos*$intento
  printf "Intento Numero :%s despues de %s segundos \n" $intento $segundos
  sleep $segundos

  #::::::::::::para  linux
  #ping -c 2 -w 6 www.cisco.com >/dev/null 2>/dev/null
  #::::::::::::para  Windows
  ping  $DNS  -n 4 >/dev/null 2>/dev/null
#  ping $DNS -n $segundos >/dev/null 2>/dev/null

  #--- aqui capturaremos el error que nos traera 2>/dev/null
  resp=$?

  #-------------------- start comprobaciones de red
  if [ $resp != 0 ]
     then
          echo ""
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
  #-------------------- end comprobaciones de red


  #--------- escapamos si ya se conecto
  if [ "$EXITO" -eq 1 ]; then
#    echo "se conecto a ${DNS}"
    printf "\nExito se conecto a ${DNS} en el intento :%s \n\n" $intento
    break
  fi

  #--------- escapamos si supera los intentos
  if [ "$intento" -eq "$escape" ]; then
#    echo "llego a 5"
    printf "\n\n Nos e pudo conectar a ${DNS} se intento :%s \n\n" $intento
    break
  fi



  let intento=$intento+1
  sleep 9
done

#------------------------------------Aqui  ira el proceso
#source ./saludo.sh
if [ "$EXITO" -eq 1 ]; then # es igual  a 1
   source "${scriptPath}/programa_v2.sh"
fi

