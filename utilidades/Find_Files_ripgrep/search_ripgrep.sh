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
LIGHT_GRAY='\033[0;37m'
NC='\033[0m' # No Color
#$CURRENT_DIR

FECHA_HORA=$(date +'%Y-%m-%d_%H:%M:%S')
ANIO=$(date +'%Y')
MES=$(date +'%m')
DIA=$(date +'%d')


# ::::::::::::::::::::::::::::::::: FUNCIONES  CORE ::::::::::::::::::::::::::::::



#######################################
# @description convierte un path windows a  shell
# @author Cesar Auris
# @return object
# @param name $1
# @example path_windows_to_path_shell "D:\repos\test_repos"
# @version 0.1 2022-03-04
#######################################
#function path_windows_to_path_shell (){
function path_windows_to_path_shell (){
    PATH_REPO=$1
    # PATH_REPO='/c/Desktop/proyecto-tracking/NonFood'
    #\c\Desktop\proyecto-tracking\NonFood

    # si pasan (D:/repos/otro)  salida (D:\repos\otro)
    PATH_REPO=$(echo "${PATH_REPO}"  | sed -e 's/\//\\/g')

    REGEX='s/^([a-zA-Z])+:\\(.*)$/\/\1\/\2/'
    if [ "$CURRENT_TERMINAL" == "mobax" ]
    then
       REGEX='s/^([a-zA-Z])+:\\(.*)$/\/drives\/\1\/\2/'
    fi

    # para cmder
    #result=$(echo "${PATH_REPO}" | sed -r -e 's/^([a-zA-Z])+:\\(.*)$/\/\1\/\2/' | sed -e 's/\\/\//g')
    # para mobax
    result=$(echo "${PATH_REPO}" | sed -r -e $REGEX  | sed -e 's/\\/\//g')
    echo $result
}


# ::::::::::::::::::::::::::::::::: Variables de script ::::::::::::::::::::::::::::::
_BUSQUEDA=""
_DIR_SEARCH=""
_EXTENSION_FILTER=''
_DIR_FILTER=''

_CMD=''
# ----- valores por default de arriba
_BUSQUEDA_default="localhost"
echo "${CURRENT_DIR}"
_DIR_SEARCH_default=$(path_windows_to_path_shell "${CURRENT_DIR}")
#PATH_WINDOWS=$(path_windows_to_path_shell  "${dir}")
echo $_DIR_SEARCH_default
echo "find"
exit
#_DIR_SEARCH_default=$CURRENT_DIR
_EXTENSION_FILTER_default='{*.js,*.json,*.html}'
_DIR_FILTER_default='!{node_modules,babel-webpack,plugins}'


function fn_add_search() {
  read -e -i "$_BUSQUEDA_default" -p "Ingresar busqueda: " input
  _BUSQUEDA="${input:-$_BUSQUEDA_default}"
  _BUSQUEDA_default=$_BUSQUEDA
}
function fn_add_dir_search() {
  printf "${LIGHT_GRAY}\n examples: . , '/D/repos' ${normal}\n"
  read -e -i "$_DIR_SEARCH_default" -p "Ingresar dir buscar: " input
  _DIR_SEARCH="${input:-$_DIR_SEARCH_default}"
  _DIR_SEARCH_default=$_BUSQUEDA

}
function fn_add_extension_filter() {
  printf "${LIGHT_GRAY}\n examples: {*.js,*.json,*.html} , !{*.js,*.json,*.html} ${normal}\n"
  read -e -i "$_EXTENSION_FILTER_default" -p "Ingresar extension: " input
  _EXTENSION_FILTER="${input:-$_EXTENSION_FILTER_default}"

  _EXTENSION_FILTER_default=$_EXTENSION_FILTER

}
function fn_add_dir_filter() {
  printf "${LIGHT_GRAY}\n examples: !{node_modules,babel-webpack,plugins} ${normal}\n"
  read -e -i "$_DIR_FILTER_default" -p "Ingresar dir excluir: " input
  _DIR_FILTER="${input:-$_DIR_FILTER_default}"
  _DIR_FILTER_default=$_DIR_FILTER
}

function fn_view_command() {
  printf "${PUPURE}\n :::::::: Preview Command :::::::: ${normal}\n"
  CMD="rg \"${_BUSQUEDA}\" '${_DIR_SEARCH}' -g '${_EXTENSION_FILTER}'  -g '${_DIR_FILTER}'"
  echo $CMD
}
function fn_command_run() {
  cls
  printf "${VERDE}\n :::::::: RUN Command :::::::: ${normal}\n"
  CMD="rg \"${_BUSQUEDA}\" '${_DIR_SEARCH}' -g '${_EXTENSION_FILTER}'  -g '${_DIR_FILTER}'"
  sleep 2
  $CMD

}



show_menu(){
    cd $CURRENT_DIR
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} intractivo ${normal}\n"
    printf "${menu}**${number} 2)${menu} String a buscar ${normal}\n"
    printf "${menu}**${number} 3)${menu} que directorio buscar ${normal}\n"
    printf "${menu}**${number} 4)${menu} Editar extensiones a buscar ${normal}\n"
    printf "${menu}**${number} 5)${menu} Editar carpetas a incluir o excluir ${normal}\n"
    printf "${menu}**${number} 6)${menu} Vista Previa Comando ${normal}\n"
    printf "${menu}**${number} 7)${menu} Ejecutar comando Busqueda ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Ingrese una opción de menú e ingrese [x] ${fgred} para  salir: ${normal}"
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
            option_picked "Winzar busqueda";
            # nos ubicamos en la raiz del proyecto
            fn_add_search
            fn_add_dir_search
            fn_add_extension_filter
            fn_add_dir_filter
            fn_view_command
            sleep 3
            show_menu;

        ;;
        2) clear;
            option_picked "Agregar / editar termino busqueda";
            # nos ubicamos en la raiz del proyecto
            fn_add_search
            show_menu;

        ;;
        3) clear;
            option_picked "Donde realizar la busqueda";
            # nos ubicamos en la raiz del proyect
            fn_add_dir_search
            show_menu;
        ;;
        4) clear;
            option_picked "Editar busqueda por extension";
            # nos ubicamos en la raiz del proyecto
            fn_add_extension_filter
            show_menu;
        ;;
        5) clear;
            option_picked "Editar exclusion directorio";
            fn_add_dir_filter
            show_menu;
        ;;
       6) clear;
            option_picked "Vista Previea Comando";
            fn_view_command
            show_menu;
        ;;
       7) clear;
             option_picked "Ejecutar Comando";
             fn_command_run
             show_menu;
        ;;
      8) clear;
             option_picked "Update Version Wordpress";
             fn_update_wordpres_version
              show_menu;
              ;;
       9) clear;
            option_picked "Actualizar wp-config.php";
            generate_config_wp
            show_menu;
              ;;
       10) clear;
            option_picked "Crear la DB";
            fn_create_db
            show_menu;
              ;;
        \n) exit;
        ;;
        x)exit;
              ;;
        *)clear;
            option_picked "Presione [Enter] para salir...";
            exit
        ;;
      esac
    fi
done


