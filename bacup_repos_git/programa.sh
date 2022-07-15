scriptPath=$(dirname $0)

source ${scriptPath}/funGit.sh
##--------variables
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"

PATH_LOG="logHistory.log"
FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
ANIO=$(date +'%Y')
MES=$(date +'%m')
DIA=$(date +'%d')
#cada primero del mes se generar un tag
DIA_GENERAR_TAG=1
PATH_CONTADOR="${scriptPath}/contador.txt"

#obtendra el ultimo valor del contador
VAL_CONTADOR=$(Fun_getContador "${PATH_CONTADOR}")
#echo $VAL_CONTADOR

RUTAS_TAG[0]="C:\laragon\www\gspmarinov1"
RUTAS_TAG[1]="C:\laragon\www\curso-electron"


declare -a RUTAS_REPOS=(
  "D:\www\curso_plugin_theme_wordpress"
  "D:\www\test_trabajos"
  "D:\repos\curso_android"
  "D:\repos\curso_kubernetes"
  "D:\repos\curso_autoplay"
  "D:\repos\curso_csharp"
  "D:\repos\curso_chrome_extensiones"
  "D:\repos\curso_djando_Login"
  "D:\repos\curso_django_codigo_facilito"
  "D:\repos\curso_django_entorno_virtual"
  "D:\repos\curso_docker"
  "D:\repos\curso_excel"
  "D:\repos\curso_dos_batch"
  "D:\repos\curso_efectos_matrix"
  "D:\repos\curso_firebase"
  "D:\repos\curso_javascript"
  "D:\repos\curso_nextjs"
  "D:\repos\curso_nodejs_mongo"
  "D:\repos\curso_linux"
  "D:\repos\curso_mongodb"
  "D:\repos\curso_postgresql"
  "D:\repos\curso_powershell"
  "D:\repos\curso_python"
  "D:\repos\curso_flask_python"
  "D:\repos\curso_reactjs"
  "D:\repos\curso_reactjs_swr"
  "D:\repos\curso_vbscript"
  "D:\repos\web_cursos_geral"
  "D:\repos\curso_cisco_packetTracer"
  "D:\repos\curso_mysql"
  "D:\repos\curso_raspberrypi"
  "D:\repos\curso_google_apps_script"
  "D:\repos\curso_graphql"
  "D:\repos\curso_typescript"
  "D:\repos\curso_typescript_projects"
  "D:\repos\repositorio_python_google_colab"
  "D:\repos\ccboot_licencia"
  "D:\repos\curso_serverless"
  "D:\repos\curso_spring_framework"
  "D:\repos\curso_spring_boot_universidad"
  "D:\repos\curso_spring_boot"
  "D:\repos\curso_asp_net_mvc"
  "D:\repos\editor.md-master"
  "D:\repos\curso_foxPro"
  "D:\repos\gsptrackv1"
  "D:\repos\curso_node_mysql_typescript"
  "D:\repos\pcbyte_software_sincronizador"
)

echo "bacup del dia:${FECHA_HORA}" >>${scriptPath}/$PATH_LOG

#RUTAS=("D:\cesar\curso_vbscript" "D:\cesar\curso-hacking" "D:\cesar\curso_autoplay" )
for element in "${RUTAS_REPOS[@]}"; do

  # ejecutar funcion que actualizara  repo
  echo "-------------------------------------------------------------"
  echo "----------repor name:${element}------------------"
  SALIDA=$(Fun_gitUp "${element}")
  echo "${SALIDA}" >>${scriptPath}/$PATH_LOG
  # echo "$element"

  #si esta en el dia  de  sacar backup tag
  if [ $DIA -eq $DIA_GENERAR_TAG ]; then
    #si es una de los repos a  sacar tag
    if [[ "${RUTAS_TAG[@]}" =~ "${element}" ]]; then
      echo "se  saco backup de ${element}"
      SALIDA=$(Fun_gitTag "${element}" "${VAL_CONTADOR}")
      echo "${SALIDA}" >>${scriptPath}/$PATH_LOG
    fi
    #generar una nueva numeracion para el tag
    #(PATH_CONTADOR= ruta del archivo del contador)
    #(VAL_CONTADOR= valor actual contador)
    #(1= se le  sumara al contador)
    SALIDA=$(Fun_setContador "${PATH_CONTADOR}" "${VAL_CONTADOR}" "1")
  fi

done

##le  sumarara  al contador

echo "termino--------------------"
slepp 20
#leer el dato del teclado y guardarlo en la variable de usuario var1
# read var1

cesar auris saga
