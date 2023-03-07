#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileTemp=$(echo "$scriptPathFile" | sed 's/.sh/.tmp/g')
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

function upgit() {
	git pull
    git add -A
    git commit -m "${MY_INFO} se actualizo :${DATE_HOUR_GIT}"
    git push -u origin master
}

function gitup() {
    # git pull
    CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
    echo "Actualizando rama: ${CURRENT_BRANCH} ..." && sleep 3

    git pull origin $CURRENT_BRANCH
    git add -A
    git commit -m "${MY_INFO} se actualizo rama ${CURRENT_BRANCH} :${DATE_HOUR_GIT}"
    git push origin $CURRENT_BRANCH

    #-----------------------------------------------------
    printf "\n ------repositorio github----- \n\n" && sleep 2
    git push origin2 master
}

function gitup2() {
    git pull
	  git add -A
    git commit -m "${MY_INFO} se actualizo :${DATE_HOUR_GIT}"
    git push
}
clear
cd $scriptPathDir
gitup

echo ""
echo "  ██████  ██   ██                ██████ ███████ ███████  █████  ██████  "
echo " ██    ██ ██  ██                ██      ██      ██      ██   ██ ██   ██ "
echo " ██    ██ █████       █████     ██      █████   ███████ ███████ ██████  "
echo " ██    ██ ██  ██                ██      ██           ██ ██   ██ ██   ██ "
echo "  ██████  ██   ██                ██████ ███████ ███████ ██   ██ ██   ██ "
echo ""
echo ""
sleep 4
