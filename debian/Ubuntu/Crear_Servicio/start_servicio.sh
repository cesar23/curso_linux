#!/usr/bin/env bash
#!bin/bash
scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
#scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
#!/bin/bash

# La única finalidad de este script es probar el proceso
# de configuración de un servicio en systemd.

# Enviamos mensaje inforamtivo del inicio de nuestro servicio.
echo "cesar.service   *** iniciando ***" | systemd-cat -p info

# realizamos un loop infinito que mantendrá nuestro escript en ejecución.
# Grabaremos la hora cada minuto en el log del sistema.
COUNTER=0
while true; do
   FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
   let COUNTER=COUNTER+1
   echo "REPETICIONES: ${COUNTER}" > /tmp/servicio_cesar.txt
   echo "iniciado fecha:${FECHA_HORA} - info:${MY_INFO}" >> /tmp/servicio_cesar.txt
#   echo "mi-servicio: $ahora" | systemd-cat -p info
   sleep 60
done
