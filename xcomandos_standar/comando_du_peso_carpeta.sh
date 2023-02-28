#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileTemp=$(echo "$scriptPathFile" | sed 's/.sh/.tmp/g')
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

du -a  "D:/repos/curso_ojs" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }' > $scriptPathFileTemp

FIRSTLINE=`head -n 1 $scriptPathFileTemp`
echo $FIRSTLINE
echo "=============================="


#######################################
# @description debuelve el peso de un path de directorio
# @author Cesar Auris
# @param str
# @return str
# @example: path_dir="D:/repos/curso_ojs"
#           PESO_DIR=$(fn_file__get_dir_weight "${path_dir}")
# @since   2023-19-28
#######################################
function fn_file__get_dir_weight() {
  #----paranmetros
  PATH_DIR=$1
  LOG_TEMP=$(dirname $0)
  LOG_TEMP="${LOG_TEMP}/get_weight.tmp"

  # ------------------------------------------
  # ----1 . obtenemos el peso y lo ponemos en un fichero temporal
  # ------------------------------------------

  #du -a  "D:/repos/curso_ojs" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }' > $scriptPathFileTemp
  du -a  "${PATH_DIR}" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }' > "${LOG_TEMP}"


  # ------------------------------------------
  # ----2 .leemos el fichero pero solo la primera linea
  # ------------------------------------------
  OUTPUT=`head -n 1 $LOG_TEMP`
  # eliminamos el fichero temporal
  rm -rf "${LOG_TEMP}"
  echo -n $OUTPUT
}
path_dir="D:/repos/curso_ojs"
PESO_DIR=$(fn_file__get_dir_weight "${path_dir}")
echo "-----"
echo "${PESO_DIR}"
echo "-----"