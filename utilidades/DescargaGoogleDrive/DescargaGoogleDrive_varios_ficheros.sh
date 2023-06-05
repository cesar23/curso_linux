#!/bin/bash
#------------------------------------ https://drive.google.com/file/d/1M5O3koc2NRFHukLEQsdc_ReDOihyhtKZ/view
#--ejemplo : https://drive.google.com/file/d/1lBzMfW9TPXRvJy8d1iTr3sQR3iIOdY3Y/view?usp=sharing

#----https://drive.google.com/open?id=1M5O3koc2NRFHukLEQsdc_ReDOihyhtKZ
#------------------------------------ https://drive.google.com/open?id=1By4eluemqbKHKhhC5R01AkmhcU6Z_Rqu
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

cd $SCRIPT_DIR

function DonwloadFile(){
    #----paranmetros
#    fileid="15q0fuq4eNdrhV3kNrIJZH9qZXW3qKD4i"
#    filename="SM-A125M_A125MUBS3BVD1_A125MOWO3BVD1_ZTM_4file.zip"
#    echo  " 22 ${1} ${2}"
#    fileid=$1
#    filename=$2

  # :::::::::Try
  (
    # this flag will make to exit from current subshell on any error
    # inside it (all functions run inside will also break on any error)
    set -Ee
    echo "-------------------------------------------------------------------------------"
    echo "----------------[ descargado el archibo: ${filename}]--------------------------"
    echo "----------------[ Directorio: ${SCRIPT_DIR}]--------------------------"
    echo "-------------------------------------------------------------------------------"

    curl -A 'Mozilla/3.0 (Win95; I)' -c "${CURRENT_DIR}/cookie.txt" -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
    #curl -A 'Mozilla/3.0 (Win95; I)' -Lb ./cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie.txt`&id=${fileid}" -o ${filename}
    sleep 5

  )
  # :::::::::catch
  errorCode=$?
  if [ $errorCode -ne 0 ]; then
    # ---------start colores para errores ----------
    BRed='\e[1;31m'         # Red (Bold)
    Red='\e[0;31m'          # Red
    Color_Off='\e[0m'       # Text Reset
    # ---------end  colores para errores ----------
    echo -en "${BRed}Error Code (${errorCode}): ${Color_Off} \n"
    echo -en "${Red}We have an error${Color_Off} \n"
    exit $errorCode
  fi

}




declare -A Descargas=(
  # fileid =  filename (id del fichero de descarga , nombre con el cual se guardara)
  ["15q0fuq4eNdrhV3kNrIJZH9qZXW3qKD4i"]="SM-A125M_A125MUBS3BVD1_A125MOWO3BVD1_ZTM_4file.zip"
)

for key in "${!Descargas[@]}"; do
  echo ""
  #------- Fun_gitUp_v2 (PathRepo,rama)
#  SALIDA=$(Fun_gitUp_v2 "${key}" "${RUTAS_REPOS[${key}]}")
  echo  "  ${key} ${Descargas[${key}]}"

  #:seteamos las  variables para la funcion
  export fileid="${key}"
  export filename="${Descargas[${key}]}"
  # ejecuatamso la funcion
  SALIDA=$(DonwloadFile)
  echo $SALIDA



done
