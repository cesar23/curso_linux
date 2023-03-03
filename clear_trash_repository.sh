#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && read -plink "$0" || echo "$0")")"

#------------------Funciones --------------------

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
clear
echo "---------- Repositorio: ${CURRENT_DIR} ------------"
printf 'Calculando peso... \n'
PESO_DIR=$(fn_file__get_dir_weight "${CURRENT_DIR}")
echo "Peso Actual:${PESO_DIR}"
printf '\n\n'
##------------------------------------------------
echo "----------------------------------------------"
echo "----------Limpieza de repositorio ------------"
echo "----------------------------------------------"
echo ""
#-------------------------


echo "----------------------------------------------"
echo "::::::::::: Limpieza [carpetas no deseadas] -----------"
echo "----------------------------------------------"
echo "------(build,dist,__pycache__)------------------------"
echo ""
# pra ver peso en  carpetas con find usaremos du
find . -type d  -name "__pycache__"  -exec du  -smh {} \;
find . -type d  \( -iname 'build' -o -iname 'dist' \) -exec du  -smh {} \;

# :::::::::: limpieza
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
   echo "clean ..."
   find . -type d  -name "__pycache__"    -exec rm -rf  {} \;
   find . -type d  \( -iname 'build' -o -iname 'dist' \)   -exec rm -rf  {} \;
fi


# ----------------------------------------------------------------------
regex_extensions=".*\.\(sql\|7z\|tar\|tar.gz|mp3|mp4\)"
extensions_show=$(echo "${regex_extensions}" | sed 's/\\//g' | sed -e 's/\.\*\.//g')
echo ""
echo "----------------------------------------------"
echo "::: Limpieza [por extensiones ${extensions_show}] -----------"
echo "----------------------------------------------"
echo ""


find . -type f -regex "${regex_extensions}"  -exec ls -lah {} \;


# :::::::::: limpieza
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
   echo "clean ..."
  find . -type f -regex ".*\.\(sql\|7z\|tar\|tar.gz\)"  -exec rm -rf  {} \;
fi


# ----------------------------------------------------------------------
echo ""
echo "----------------------------------------------"
echo "::::::::::: Limpieza [archivos pesados pero no los .py] -----------"
echo "----------------------------------------------"
echo ""



find .  -not -path "./.git/*"  \
  -type f \
  -not \( -iname '*.py' -o -iname '*.sh' -o -iname '*.md' \) \
  -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \
  -size +3M \
  -exec  ls -lah {} \;



# :::::::::: limpieza
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
  echo "clean ..."
  find .  -not -path "./.git/*"  \
    -type f \
    -not \( -iname '*.py' -o -iname '*.sh' -o -iname '*.md' \) \
    -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \
    -size +3M \
    -exec rm -rf  {} \;
fi



PESO_DIR=$(fn_file__get_dir_weight "${CURRENT_DIR}")
echo ""
echo "Peso Actual:${PESO_DIR}"
echo ""
#-------------------------

read -p "[Enter para salir]" out