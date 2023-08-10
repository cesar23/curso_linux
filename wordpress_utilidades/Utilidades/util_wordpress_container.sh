#!/bin/bash
#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
NAME_DIR=$(basename $CURRENT_DIR) # nombre del Directorio actual

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileTemp=$(echo "$scriptPathFile" | sed 's/.sh/.tmp/g')
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

# ::::::::::::::::::::::::::::::::: Configuraciones::::::::::::::::::::::::::::::

regex="s/\/${NAME_DIR}//"
ROOT_PATH=$(echo $CURRENT_DIR | sed -e $regex) # D:/repos/curso_plugin_theme_wordpress
PATH_DOMAIN="${ROOT_PATH}/www/server.local"
PATH_TEMP="${ROOT_PATH}/tmp/"
mkdir -p $PATH_TEMP

# ::::::::::::::::::::::::::: Configuraciones mysql ::::::::::::::::::::::::::
source ./libs_shell/read_env.sh
#DB_HOST="localhost"
#DB_PORT="3306"
#DB_USER="root"
#DB_PASSWORD="cesar203"
#DB_NAME="pluging_wp"

#PATH_ENV='/D/repos/curso_linux/xcomandos_standar/.env'
PATH_ENV="${ROOT_PATH}/.env"

DOCKER_MYSQL_CONTAINER=$( find_env 'MYSQL_HOST_DOCKER' $PATH_ENV )
DB_HOST=$( find_env 'MYSQL_HOST' $PATH_ENV )
DB_PORT=$( find_env 'MYSQL_PORT' $PATH_ENV )
DB_USER=$( find_env 'MYSQL_USER_ROOT' $PATH_ENV )
DB_PASSWORD=$( find_env 'MYSQL_ROOT_PASSWORD' $PATH_ENV )
DB_NAME=$( find_env 'MYSQL_DATABASE' $PATH_ENV )

# printf " DB_HOST=${DB_HOST} \n DB_PORT=${DB_PORT} \n DB_USER=${DB_USER} \n DB_PASSWORD=${DB_PASSWORD} \n DB_NAME=${DB_NAME}," && exit

#DB_HOST="localhost"
#DB_PORT="3306"
#DB_USER="root"
#DB_PASSWORD="cesar203"
#DB_NAME="pluging_wp"

PATH_CONFIG_MYSQL="${scriptPathDir}/config_mysql.cnf"
PATH_FILE_SQL="${scriptPathDir}/backup.sql"
PATH_MYSQL="C:/laragon/bin/mysql/mysql-8.0.30-winx64/bin/mysql.exe"
PATH_MYSQL_DUMP="C:/laragon/bin/mysql/mysql-8.0.30-winx64/bin/mysqldump.exe"

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
#$CURRENT_DIR

FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
ANIO=$(date +'%Y')
MES=$(date +'%m')
DIA=$(date +'%d')

#PS3='Please enter your choice: '
#OPTIONS=("Option 1" "Option 2" "Option 3" "Option 4")
##options=("Option fff" "Option 2" "Option 3" "Quit")
#select opt in "${OPTIONS[@]}"
#do
#    case $opt in
#        1)
#            echo "you chose choice 1"
#            ;;
#        2)
#            echo "you chose choice 2"
#            ;;
#        3)
#            echo "you chose choice $REPLY which is $opt"
#            ;;
#        4)
#            break
#            ;;
#        *) echo "invalid option $REPLY";;
#    esac
#done
function fn_download_wp_cli() {
  cd $PATH_DOMAIN
  #----paranmetros
  PARAM_1=$1
  echo ""
  echo "Descargando WP-CLI ..."
  curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
  echo ""
  echo "Version de Wordpress instalada:"
  php wp-cli.phar core version
}
function fn_download_wordpress() {
  #----paranmetros
  PARAM_1=$1
  # limpiamos la instalacion de wordpres anterior
  rm -rf $PATH_DOMAIN/*
  cd $PATH_TEMP

  echo "Limpiandos files de wordpress..."
#  rm -rf ./wordpress/*
#  rm -rf ./wp-admin/*
#  rm -rf ./wp-content.*
#  rm -rf ./wp-includes.*
  rm -rf ./*.*
  sleep 3
  # ::: descargamos y ponemos la ultima version de wordpress
  echo "Descargando wordpress..."
  curl -O "https://es.wordpress.org/latest-es_ES.tar.gz"
  tar -xzvf latest-es_ES.tar.gz && cp -R ./wordpress/* "${PATH_DOMAIN}/"
  # ::: limpiar basuras
  rm -rf ./wordpress
  rm -rf ./latest-es_ES.tar.gz
  #  descargar wp-cli
  cd $PATH_DOMAIN
  fn_download_wp_cli
  # generaremos el wp-config.php con los accesos a la  DB
  generate_config_wp

}

function fn_backup_wordpress() {
  #----paranmetros
  PARAM_1=$1
  FECHA_TEMP=$(date +'%Y-%m-%d_%H-%M')
  # ::: Backup
  echo "Backup files de wordpress..."
  # :: creacion de dirs
  mkdir -p "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-admin/"
  mkdir -p "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-content/"
  mkdir -p "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-includes/"
  # :: copiar files
  cd $PATH_DOMAIN
  cp -R ./wp-admin/* "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-admin/"
  cp -R ./wp-content/* "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-content/"
  cp -R ./wp-includes/* "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/wp-includes/"
  cp -R  *.* "${ROOT_PATH}/my_resource/backup_files/${FECHA_TEMP}/"

}

function fn_backup_wordpress_db() {

  PATH_FILE_SQL="${ROOT_PATH}/my_resource/backup_db/backup_${DB_NAME}.sql"

  (printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"\nport=%s" $DB_USER $DB_PASSWORD $DB_HOST $DB_PORT) | tee $PATH_CONFIG_MYSQL > null
  sleep 1
  "${PATH_MYSQL_DUMP}" --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED --protocol=TCP --host=${DB_HOST} --user=${DB_USER}  $DB_NAME  --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF  --result-file="${PATH_FILE_SQL}"
}

function fn_restore_wordpress_db() {

  PATH_FILE_SQL="${ROOT_PATH}/my_resource/backup_db/backup_${DB_NAME}.sql"
  (printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"\nport=%s" $DB_USER $DB_PASSWORD $DB_HOST $DB_PORT) | tee $PATH_CONFIG_MYSQL > null
  sleep 1
  "${PATH_MYSQL}" --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED -h $DB_HOST -u $DB_USER $DB_NAME --port=$DB_PORT -e "DROP DATABASE IF EXISTS ${DB_NAME}; CREATE DATABASE ${DB_NAME};"
  "${PATH_MYSQL}"  --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED -h $DB_HOST -u $DB_USER $DB_NAME --port=$DB_PORT --default-character-set=utf8 --comments --database=$DB_NAME  < "${PATH_FILE_SQL}"

}

function fn_backup_completo_wordpress() {

   #----Proceso backup files
    PARAM_1=$1
    FECHA_TEMP=$(date +'%Y-%m-%d_%H-%M')
    echo "Backup files de wordpress..."
    mkdir -p "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-admin/"
    mkdir -p "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-content/"
    mkdir -p "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-includes/"
    # :: copiar files
    cd $PATH_DOMAIN
    cp -R ./wp-admin/* "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-admin/"
    cp -R ./wp-content/* "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-content/"
    cp -R ./wp-includes/* "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/wp-includes/"
    cp -R  *.* "${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/"


   #----Proceso backup DB

  PATH_FILE_SQL="${ROOT_PATH}/my_resource/completo/${FECHA_TEMP}/backup_${DB_NAME}.sql"

  (printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"\nport=%s" $DB_USER $DB_PASSWORD $DB_HOST $DB_PORT) | tee $PATH_CONFIG_MYSQL > null
  sleep 1
  "${PATH_MYSQL_DUMP}" --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED -h $DB_HOST -u $DB_USER $DB_NAME  --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF  --result-file="${PATH_FILE_SQL}"
}


function fn_update_wordpres_version() {
  cd $PATH_DOMAIN
  pwd
  php wp-cli.phar core update
}

function generate_config_wp(){
  path_file="${PATH_DOMAIN}/wp-config-sample.php"
  path_file_new="${PATH_DOMAIN}/wp-config.php"
  cp $path_file $path_file_new

  sed -i "s/database_name_here/${DB_NAME}/g" $path_file_new
  sed -i "s/username_here/${DB_USER}/g" $path_file_new
  sed -i "s/password_here/${DB_PASSWORD}/g" $path_file_new
  sed -i "s/localhost/${DOCKER_MYSQL_CONTAINER}/g" $path_file_new
}



show_menu(){
    cd $CURRENT_DIR
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Nueva instalacion nueva de Wordpres es_ES (Elimina completo la actual) ${normal}\n"
    printf "${menu}**${number} 2)${menu} Descargar  wp-cli ${normal}\n"
    printf "${menu}**${number} 3)${menu} Backup de ficheros wordpress actual ${normal}\n"
    printf "${menu}**${number} 4)${menu} Backup de DB wordpress DB actual ${normal}\n"
    printf "${menu}**${number} 5)${menu} Restaurar Backup DB wordpress ${normal}\n"
    printf "${menu}**${number} 6)${menu} Backup DB y Files Wordpress (Completo) ${normal}\n"
    printf "${menu}**${number} 7)${menu} Actualizar Version wordpress ${normal}\n"
    printf "${menu}**${number} 8)${menu} SSH Frost TomCat Server ${normal}\n"
    printf "${menu}**${number} 9)${menu} Some other commands${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Ingrese una opción de menú e ingrese o ${fgred}x para  salir: ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;32m"` # bold green
    normal=`echo "\033[00;00m"` # normal white
    if [ "${2}" == "error" ]
    then
       msgcolor=`echo "\033[01;31m"` # bold red
    fi
    printf "${msgcolor}${1}${normal}\n"
}

clear
show_menu
while true
    do
    if [ $opt = '' ]; then
      echo "ffffffffff"
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Descargar wordpress";
            # nos ubicamos en la raiz del proyecto
            cd .. && cd ..
            fn_download_wordpress
          #            printf "sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte";
            sleep 3
            show_menu;

        ;;
        2) clear;
           option_picked "Instalacion de wp-cli";
           # nos ubicamos en la raiz del proyecto
           cd .. && cd ..
           fn_download_wp_cli
          #            printf "sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte";
           sleep 3
           show_menu;
        ;;
        3) clear;
            option_picked "Backup Files wordpress";
            # nos ubicamos en la raiz del proyecto
            cd .. && cd ..
            fn_backup_wordpress
            show_menu;
        ;;
        4) clear;
            option_picked "Backup DB de Wordpress";
            # nos ubicamos en la raiz del proyecto
            cd .. && cd ..
            fn_backup_wordpress_db
            show_menu;
        ;;
       5) clear;
            option_picked "Restaurar Backup DB Wordpress";
            fn_restore_wordpress_db
            show_menu;
        ;;
       6) clear;
            option_picked "Backup DB y Files Wordpress (Completo)";
            fn_backup_completo_wordpress
            show_menu;
        ;;
      7) clear;
             option_picked "Update Version Wordpress";
             fn_update_wordpres_version
              show_menu;
              ;;
       8) clear;
            option_picked "Option 4 escogida";
            printf "ssh lmesser@ -p 2010";
            show_menu;
              ;;
       9) clear;
            option_picked "Option 4 escogida";
            printf "ssh lmesser@ -p 2010";
            show_menu;
              ;;
        \n)exit;
        ;;
        x)exit;
              ;;
        *)clear;
            option_picked "Elige una opción del menú" "error";
            show_menu;
        ;;
      esac
    fi
done
