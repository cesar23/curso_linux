DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
NAME_DIR=$(basename $CURRENT_DIR) # nombre del Directorio actual

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")" # gitup.sh
scriptPathFileTemp=$(echo "$scriptPathFileName" | sed 's/.sh/.tmp/g') #  ${scriptPathDir}/gitup.tmp
scriptPathFileTemp_system=$(echo "${TMP}/${scriptPathFileName}" | sed 's/.sh/.tmp/g') # /tmp/gitup.tmp

# par  darlo colores
if [ -f ${CURRENT_DIR}/libs_shell/gitbash/colors.sh ]; then
  source ${CURRENT_DIR}/libs_shell/gitbash/colors.sh
fi




function login_server_ssh(){
   # cesar@192.168.0.80
   local CONNEXION=$1
   # 22
   local PORT=$2

   printf "\n${Gray} connexion: ssh ${CONNEXION} -p ${PORT}\n"
   printf $Color_Reset_full
   ssh $CONNEXION -p $PORT
}

show_menu(){
    cd $CURRENT_DIR
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} local:ubuntuDocker cesar@192.168.0.80  ${normal}\n"
    printf "${menu}**${number} 2)${menu} local:ubuntuDocker cesar@192.168.0.80  ${normal}\n"
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
      echo "without resultss (sin resultados)"
      sleep 4
      exit;
    else
      case $opt in
        1) clear;
           option_picked "Connexion 1";
           login_server_ssh "cesar@192.168.0.80" 22
           sleep 3
           show_menu;
        ;;
        2) clear;
           option_picked "Connexion 1";
           login_server_ssh "cesar@192.168.0.80" 22
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
