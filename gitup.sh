#!/usr/bin/env bash
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
if [ -f "${CURRENT_DIR}/colors.sh" ]; then
  source "${CURRENT_DIR}/colors.sh"
fi



function upgit() {
	git pull
    git add -A
    git commit -m "${MY_INFO} se actualizo :${DATE_HOUR_GIT}"
    git push -u origin master
}

function gitup() {
  echo -en "${Gray}[script project]${Color_Off} \n" && sleep 3
  CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  if [ "1" == "$( fn_check_changes_repositor )" ]
  then
         echo -en "Actualizando rama actual: [${BGreen}${CURRENT_BRANCH}${Color_Off}] \n" && sleep 3
         git pull origin $CURRENT_BRANCH
         git add -A
         git commit -m "${MY_INFO} se actualizo rama ${CURRENT_BRANCH} :${DATE_HOUR_GIT}"
         git push origin $CURRENT_BRANCH

         #-----------------------------------------------------
         printf "\n ------repositorio github----- \n\n" && sleep 2
         git push origin2 master
  else
     echo -en "No se encontraron cambios en rama actual: [${BGreen}${CURRENT_BRANCH}${Color_Off}] \n" && sleep 3
  fi

}

function gitup2() {
    git pull
	  git add -A
    git commit -m "${MY_INFO} se actualizo :${DATE_HOUR_GIT}"
    git push
}
# verificar si hay cambios en repositorio
function fn_check_changes_repositor(){
  file_temp="${TMP}/temp_git_$(date +%s).tmp"
#  cd '/D/repos/curso_excel'
#  cd '/D/repos/curso_git'
  git status -s > "${file_temp}" 2>&1
  OUT_GIT_STATUS=$( cat "${file_temp}" )
  rm -rf "${file_temp}"
  #cat "${CURRENT_DIR}/test.sh.txt"
  if [ -n "$OUT_GIT_STATUS" ]
  then
      echo "1"
  else
      echo "0"
  fi
}
clear
cd $scriptPathDir
gitup

echo -en "${Green} \n"
echo ""
echo "  ██████  ██   ██                ██████ ███████ ███████  █████  ██████  "
echo " ██    ██ ██  ██                ██      ██      ██      ██   ██ ██   ██ "
echo " ██    ██ █████       █████     ██      █████   ███████ ███████ ██████  "
echo " ██    ██ ██  ██                ██      ██           ██ ██   ██ ██   ██ "
echo "  ██████  ██   ██                ██████ ███████ ███████ ██   ██ ██   ██ "
echo ""
echo ""
sleep 4
