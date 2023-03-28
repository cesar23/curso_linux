FECHA_HORA=$(date +'%Y-%m-%d')
scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

RUTA_LOG="${scriptPathDir}/${scriptPathFileName}.log"

echo "${FECHA_HORA} | Que Usuario lo Ejecuto :${CURRENT_USER}  | Ruta Script Ejecucion :${scriptPathFile}" >> $RUTA_LOG

# Cada 5 minutos, monitoreamos el estado de nuestra web
# */5 * * * * /home/cesar/test_crontab.sh

