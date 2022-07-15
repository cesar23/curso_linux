#!/bin/bash
CURRENT_DIR=$(dirname $0)

function fn_download_wp() {
  #----paranmetros
  PARAM_1=$1
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
}

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Mount dropbox ${normal}\n"
    printf "${menu}**${number} 2)${menu} Mount USB 500 Gig Drive ${normal}\n"
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
#    message=${@:-"${normal}Error: No message passed"}
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
            option_picked "Option 1 escogida";
            printf "sudo mount /dev/sdh1 /mnt/DropBox/; #The 3 terabyte";
            show_menu;
        ;;
        2) clear;
            option_picked "Option 2 escogida";
            printf "sudo mount /dev/sdi1 /mnt/usbDrive; #The 500 gig drive";
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
