PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
# --------------------------------------------------------
# ----- Para  encontrar el tipo de terminal actual--------
# --------------------------------------------------------
CURRENT_TERMINAL='gitbash'

if [ "$SHELL" == "/usr/bin/bash" ]; then
    CURRENT_TERMINAL='gitbash'
    # si existe la variable $CMDER_ROOT es cmder
    if [ -n "$CMDER_ROOT"  ]; then
      CURRENT_TERMINAL='cmder'
    fi

fi


# si la  shel es de Linux
if [ "$SHELL" == "/bin/bash" ]; then
    CURRENT_TERMINAL='linux'
fi


# si la  shel es de mobax
if [ "$SHELL" == "/bin/bash.exe" ]; then
    CURRENT_TERMINAL='mobax'
fi



CURRENT_TERMINAL_SCRIPTS="${CURRENT_DIR}/${CURRENT_TERMINAL}"

#echo "---------CURRENT_TERMINAL: ${CURRENT_TERMINAL}"
#echo "---------CURRENT_TERMINAL_SCRIPTS: ${CURRENT_TERMINAL_SCRIPTS}"

case "$CURRENT_TERMINAL" in
    # ---------------------------------------------------------
    # gitbash
    # ---------------------------------------------------------
   "gitbash")

    if [ -f "${CURRENT_TERMINAL_SCRIPTS}/colors.sh" ]; then

              function reload_config(){
                source "${CURRENT_TERMINAL_SCRIPTS}/colors.sh"
                #--------- Includes Core ----------------------
                # source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones.sh"
                #------------------------------
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_1.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_2.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_level_1.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_ides.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_files.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_extras.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_menu.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_neofetch.sh"
                source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_docker.sh"

              }
              #--------cargar funciones
              reload_config


    fi

   ;;

   # ---------------------------------------------------------
   # cmder
   # ---------------------------------------------------------
   "cmder")

   if [ -f "${CURRENT_TERMINAL_SCRIPTS}/colors.sh" ]; then
              function reload_config(){
                    source "${CURRENT_TERMINAL_SCRIPTS}/z.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/fzf_script.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/colors.sh"
                    #--------- Includes Core ----------------------
                    #------------------------------
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_1.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_2.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_level_1.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_ides.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_files.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_extras.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_menu.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_neofetch.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_docker.sh"
              }
              reload_config
       fi
   ;;


   # ---------------------------------------------------------
   # Linux
   # ---------------------------------------------------------
   "linux")

   if [ -f "${CURRENT_TERMINAL_SCRIPTS}/colors.sh" ]; then
              function reload_config(){

                    source "${CURRENT_TERMINAL_SCRIPTS}/colors.sh"
                    #--------- Includes Core ----------------------
                    #------------------------------
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_1.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_2.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_level_1.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_ides.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_extras.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_menu.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_neofetch.sh"
                    source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_docker.sh"
              }
              reload_config
       fi
   ;;

    # ---------------------------------------------------------
    # mobax
    # ---------------------------------------------------------
   "mobax")


                  function reload_config(){
#                         source "${CMDER_ROOT}/libs/conf_funciones_level_1.sh"
#                          source "${CMDER_ROOT}/libs/conf_funciones_level_2.sh"
#                          source "${CMDER_ROOT}/libs/conf_alias_level_1.sh"
#                          source "${CMDER_ROOT}/libs/conf_funciones_ides.sh"
#                          source "${CMDER_ROOT}/libs/conf_extras.sh"
#                          source "${CMDER_ROOT}/libs/conf_menu.sh"
#                          source "${CMDER_ROOT}/libs/conf_alias_docker.sh"
#                          source "${CMDER_ROOT}/libs/mobax.sh"
#                          source "${CMDER_ROOT}/libs/conf_neofetch.sh"



                           source "${CURRENT_TERMINAL_SCRIPTS}/colors.sh"
                          #--------- Includes Core ----------------------
                          #------------------------------
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_1.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_level_2.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_level_1.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_ides.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_funciones_files.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_extras.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_menu.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_neofetch.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/mobax.sh"
                           source "${CURRENT_TERMINAL_SCRIPTS}/conf_alias_docker.sh"
                 }
                 reload_config
   ;;
esac
