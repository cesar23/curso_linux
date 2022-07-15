#!/bin/bash
CURRENT_DIR=$(dirname $0)
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
  #----paranmetros
  PARAM_1=$1
  curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
  cd
}
function fn_download_wordpress() {
  #----paranmetros
  PARAM_1=$1
  rm -rf ./*.*
  curl -O "https://es.wordpress.org/latest-es_ES.tar.gz"
  tar -xzvf latest-es_ES.tar.gz && cp -R ./wordpress/* ./

}

show_menu(){
    cd $CURRENT_DIR
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Descargar  wp-cli ${normal}\n"
    printf "${menu}**${number} 2)${menu} Descargar Wordpres es_ES ${normal}\n"
    printf "${menu}**${number} 3)${menu} Restart Apache ${normal}\n"
    printf "${menu}**${number} 4)${menu} ssh Frost TomCat Server ${normal}\n"
    printf "${menu}**${number} 5)${menu} Some other commands${normal}\n"
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
            option_picked "Instalacion de wp-cli";
            # nos ubicamos en la raiz del proyecto
            cd .. && cd ..
            fn_download_wp_cli
#            printf "sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte";
            sleep 3
            show_menu;
        ;;
        2) clear;
            option_picked "Descargar wordpress";
            # nos ubicamos en la raiz del proyecto
            cd .. && cd ..
            fn_download_wordpress
#            printf "sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte";
            sleep 3
            show_menu;
        ;;
        3) clear;
            option_picked "Option 3 escogida";
            printf "sudo service apache2 restart";
            show_menu;
        ;;
        4) clear;
            option_picked "Option 4 escogida";
            printf "ssh lmesser@ -p 2010";
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Elige una opción del menú" "error";
            show_menu;
        ;;
      esac
    fi
done
