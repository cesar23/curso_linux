# Agregar Scripts para los terminales

### 1. para agregar en mobax
ingresar al directorio: `C:\Users\Cesar\mobax\home\.bash_profile`

```shell
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
# DATE_HOUR_GIT="`date +%d`/`date +%m`/`date +%Y`_`date +%H``date +%M``date +%S`"
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
# CURRENT_DIR=$(dirname $0)

MOBAX_PATH="/home/mobaxterm"
scriptPath2=${0%/*}
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
INFO_PC="${CURRENT_USER}@${CURRENT_PC_NAME}"
	
# :::::::: Importanmos las librerias
if [ -f "${MOBAX_PATH}/libs/init.sh" ]; then
 source "${MOBAX_PATH}/libs/init.sh"
fi




	
# :::::::: importamos los  colores
# if [ -f "${CMDER_ROOT}/libs/colors.sh" ]; then
 # source "${CMDER_ROOT}/libs/colors.sh"
# fi
# # --------------
# # --------- Includes Core ----------------------
# # source "${CMDER_ROOT}/libs/conf_funciones.sh"
# # --------- require  fzf


# function reload_config(){
  # source "${CMDER_ROOT}/libs/conf_funciones_level_1.sh"
  # source "${CMDER_ROOT}/libs/conf_funciones_level_2.sh"
  # source "${CMDER_ROOT}/libs/conf_alias_level_1.sh"
  # source "${CMDER_ROOT}/libs/conf_funciones_ides.sh"
  # source "${CMDER_ROOT}/libs/conf_extras.sh"
  # source "${CMDER_ROOT}/libs/conf_menu.sh"
  # source "${CMDER_ROOT}/libs/conf_alias_docker.sh"
  # source "${CMDER_ROOT}/libs/mobax.sh"
  # source "${CMDER_ROOT}/libs/conf_neofetch.sh"

# }
# #--------cargar funciones
# reload_config

slepp_m=0.000000002s

echo "${Green_full}"

CONTADOR=1
while [ $CONTADOR -lt 400 ]
do
#echo "El contador vale ${CONTADOR} y es menor que 10."

echo -n "手 き き 手 大 手 き                  き 大 手 き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 き き 大 手 き 手 き き 手 大 手 き き 手                手 き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 き き 大 手 き 手"
# sleep $slepp_m
echo -n "き 手 き { 手 手 手                  き 手 き ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 手 手 大 手 き 手 き ! き き 手 手 { 手 大 手 き 手 き                ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 き き 手 大 手 き き き 大 手 き O"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                き 手 き き 手 大 手 き き き 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手"
# sleep $slepp_m
echo -n "き 手 き { 手 手 手                  き 手 き ñ き 手 き き 手 大 手 き 手 き ! き き 手 大 手 き 手 き き 手 大 手 き き き 大 手 き 手 き { 手 大 手 き 手                き ñ き 手 き き 手 大 手 き 手 き ! き き 手 手 手 % K [ 4 き 手 き 5 手 ? g A き"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                ^ き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手"
# sleep $slepp_m
echo -n "手 き き 手 大 手 き                  き 手 % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 手 き 手 x き 大 手 き 手 き き 手 大 手 き き 手                % き き 手 き 手 き き 手 き 大 手 き 手 き き 手 大 手 き 手 き 1 き 1 x き 1 1 き 1"


# echo -n "1 き き 1 1 1 き                  き 1 1 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1                1 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 0 0 1 1 0 1"
# sleep $slepp_m
# echo -n "0 1 0 { 1 1 1                  0 1 0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 1 1 1 1 0 1 0 ! 0 0 1 1 { 1 1 1 0 1 0                ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 0 0 1 1 1 0 0 0 1 1 0 O"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                0 1 0 0 1 1 1 0 0 0 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"
# sleep $slepp_m
# echo -n "0 1 0 { 1 1 1                  0 1 0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 0 1 0 0 1 1 1 0 0 0 1 1 0 1 0 { 1 1 1 0 1                0 ñ 0 1 0 0 1 1 1 0 1 0 ! 0 0 1 1 1 % K [ 4 0 1 0 5 1 ? g A 0"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                ^ 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"
# sleep $slepp_m
# echo -n "1 0 0 1 1 1 0                  0 1 % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1 0 0 1 1 1 0 0 1                % 0 0 1 0 1 0 0 1 0 1 1 0 1 0 0 1 1 1 0 1 0 1 0 1 x 0 1 1 0 1"


let CONTADOR++
done
echo "${Color_Off}" #pintado normal
clear


# menu cesar de : conf_menu
cesar

echo "${Color_Reset_full}"
#PS1='\[$BLUE\]\u@\h \[$BLUE\]\w/\[$GREEN\] \$\[$WHITE\] '
echo -en "   "
echo -en "${Red}██${BRed}██${IRed}██${BIRed}██"
echo -en "${Green}██${BGreen}██${IGreen}██${BIGreen}██"
echo -en "${Yellow}██${BYellow}██${IYellow}██${BIYellow}██"
echo -en "${Blue}██${BBlue}██${IBlue}██${BIBlue}██"
echo -en "${Purple}██${BPurple}██${IPurple}██${BIPurple}██"
echo -en "${Cyan}██${BCyan}██${ICyan}██${BICyan}██ \n"
echo "${Color_Reset_full}"

#--------------------------------------------------------------------
#---------------------------- Start Menu personalizado-------------
#menu
echo " "
echo " "
neofetch




```


### 2. Para  agregar a Git Bash
ruta `C:\Program Files\Git\etc\bash.bashrc`
```shell
# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>. 

# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# System-wide bashrc file

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# If started from sshd, make sure profile is sourced
if [[ -n "$SSH_CONNECTION" ]] && [[ "$PATH" != *:/usr/bin* ]]; then
    source /etc/profile
fi

# Warnings
unset _warning_found
for _warning_prefix in '' ${MINGW_PREFIX}; do
    for _warning_file in ${_warning_prefix}/etc/profile.d/*.warning{.once,}; do
        test -f "${_warning_file}" || continue
        _warning="$(command sed 's/^/\t\t/' "${_warning_file}" 2>/dev/null)"
        if test -n "${_warning}"; then
            if test -z "${_warning_found}"; then
                _warning_found='true'
                echo
            fi
            if test -t 1
                then printf "\t\e[1;33mwarning:\e[0m\n${_warning}\n\n"
                else printf "\twarning:\n${_warning}\n\n"
            fi
        fi
        [[ "${_warning_file}" = *.once ]] && rm -f "${_warning_file}"
    done
done
unset _warning_found
unset _warning_prefix
unset _warning_file
unset _warning

# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
#if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
#  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
#  else _ps1_symbol='\$'
#fi
case "$(declare -p PS1 2>/dev/null)" in
'declare -x '*) ;; # okay
*)
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"${_ps1_symbol}"' '
  ;;
esac
unset _ps1_symbol

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh
# ----------------------------------------------------
# --------------   Agregado por Cesar   --------------
# ----------------------------------------------------

PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

# :::::::: Importanmos las librerias
if [ -f "${CURRENT_DIR}/libs/init.sh" ]; then
 source "${CURRENT_DIR}/libs/init.sh"
fi


```
