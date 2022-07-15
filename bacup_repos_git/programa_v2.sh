#!/bin/bash










scriptPath=$(dirname $0)
#colores
RED='\033[0;31m'
VERDE='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
LIGHT_YELLOW='\033[1;33m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
RED_BOLD='\033[1;31m'
PUPURE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color
# end colores
source ${scriptPath}/funGit.sh
##--------variables
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"

export GLOBAL_AUTHOR="CEsar Auris"
export GLOBAL_MSG=()

PATH_LOG="logHistory.log"
FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
ANIO=$(date +'%Y')
MES=$(date +'%m')
DIA=$(date +'%d')
#cada primero del mes se generar un tag
DIA_GENERAR_TAG=10
PATH_CONTADOR="${scriptPath}/contador.txt"

#obtendra el ultimo valor del contador
VAL_CONTADOR=$(Fun_getContador "${PATH_CONTADOR}")
#echo $VAL_CONTADOR

declare -a RUTAS_TAG=(
"D:\www\test_trabajos"
"D:\repos\curso_firebase"
)

declare -A RUTAS_REPOS=(
  ["D:\www\curso_plugin_theme_wordpress"]="master"
  ["D:\www\test_trabajos"]="master"
  ["D:\repos\curso_android"]="master"
  ["D:\repos\curso_kubernetes"]="master"
  ["D:\repos\curso_autoplay"]="master"
  ["D:\repos\curso_csharp"]="master"
  ["D:\repos\curso_chrome_extensiones"]="master"
  ["D:\repos\curso_djando_Login"]="master"
  ["D:\repos\curso_django_codigo_facilito"]="master"
  ["D:\repos\curso_django_entorno_virtual"]="master"
  ["D:\repos\curso_docker"]="master"
  ["D:\repos\curso_excel"]="master"
  ["D:\repos\curso_dos_batch"]="master"
  ["D:\repos\curso_efectos_matrix"]="master"
  ["D:\repos\curso_firebase"]="master"
  ["D:\repos\curso_javascript"]="master"
  ["D:\repos\curso_nextjs"]="master"
  ["D:\repos\curso_nodejs_mongo"]="master"
  ["D:\repos\curso_linux"]="master"
  ["D:\repos\curso_mongodb"]="master"
  ["D:\repos\curso_postgresql"]="master"
  ["D:\repos\curso_powershell"]="master"
  ["D:\repos\curso_python"]="master"
  ["D:\repos\curso_flask_python"]="master"
  ["D:\repos\curso_reactjs"]="master"
  ["D:\repos\curso_reactjs_swr"]="master"
  ["D:\repos\curso_vbscript"]="master"
  ["D:\repos\web_cursos_geral"]="master"
  ["D:\repos\curso_cisco_packetTracer"]="master"
  ["D:\repos\curso_mysql"]="master"
  ["D:\repos\curso_raspberrypi"]="master"
  ["D:\repos\curso_google_apps_script"]="master"
  ["D:\repos\curso_graphql"]="master"
  ["D:\repos\curso_typescript"]="master"
  ["D:\repos\curso_typescript_projects"]="master"
  ["D:\repos\repositorio_python_google_colab"]="master"
  ["D:\repos\ccboot_licencia"]="master"
  ["D:\repos\curso_serverless"]="master"
  ["D:\repos\curso_spring_framework"]="master"
  ["D:\repos\curso_spring_boot_universidad"]="main"
  ["D:\repos\curso_spring_boot"]="main"
  ["D:\repos\curso_asp_net_mvc"]="master"
  ["D:\repos\editor.md-master"]="master"
  ["D:\repos\curso_foxPro"]="master"


  ["D:\repos\curso_node_mysql_typescript"]="master"
  ["D:\repos\pcbyte_software_sincronizador"]="master"
)

echo "bacup del dia:${FECHA_HORA}" >>${scriptPath}/$PATH_LOG

echo "----------------------------------------------------------------------"
echo "----------------------------------------------------------------------"
echo "--- ::: Fecha de tags el :${DIA_GENERAR_TAG} de cada mes ::: ---------"
echo ""
if [ $DIA -eq $DIA_GENERAR_TAG ]; then  printf "Hoy ${VERDE} SI ${NC} genera el tag"; else printf "Hoy ${PUPURE} NO ${NC} se genera el tag"; fi

echo "--- Tag a actual: v1.0.${VAL_CONTADOR} "
NEW_TAG=$((VAL_CONTADOR + 1))
echo "--- Tag a generar: v1.0.${NEW_TAG} "
echo ""

echo "--- ::: Repos a generar Tags ::: ---------"
for e in "${RUTAS_TAG[@]}";  do echo $e;  done
echo "---------------------------------------------------"
echo "---------------------------------------------------"
echo ""
echo ""
echo ""
sleep 4

#RUTAS=("D:\cesar\curso_vbscript" "D:\cesar\curso-hacking" "D:\cesar\curso_autoplay" )

for key in "${!RUTAS_REPOS[@]}"; do
  echo ""
  printf "${LIGHT_CYAN}-----------------------------------------------\n"
  echo "Repo: ${key} "
  printf "${NC}\n"
  #------- Fun_gitUp_v2 (PathRepo,rama)
  SALIDA=$(Fun_gitUp_v2 "${key}" "${RUTAS_REPOS[${key}]}")
#  echo $SALIDA
  printf "${SALIDA}"

  echo "${SALIDA}" >>${scriptPath}/$PATH_LOG
#  echo "${key} - ${RUTAS_REPOS[${key}]}"

 #si esta en el dia  de  sacar backup tag
  if [ $DIA -eq $DIA_GENERAR_TAG ]; then
    #si es una de los repos a  sacar tag
    echo ""
    printf "${LIGHT_YELLOW}Verificando bacup ...\n"

    # shellcheck disable=SC2076
    if [[ "${RUTAS_TAG[*]}" =~ "${key}" ]]; then
         printf "${LIGHT_PURPLE}Realizando Backup ...\n"
        SALIDA=$(Fun_gitTag "${key}" "${VAL_CONTADOR}")
        read variable
    fi
    printf "${NC}\n"


#    generar una nueva numeracion para el tag
#    (PATH_CONTADOR= ruta del archivo del contador)
#    (VAL_CONTADOR= valor actual contador)
#    (1= se le  sumara al contador)
    SALIDA=$(Fun_setContador "${PATH_CONTADOR}" "${VAL_CONTADOR}" "1")
  fi


done

##le  sumarara  al contador
echo "**************"
for value in "${ARRAY[@]}"
do
     echo $value
done
echo " ::: termino--------------------"
sleep 20
#leer el dato del teclado y guardarlo en la variable de usuario var1
# read var1
