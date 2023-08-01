DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
TIME_NOW="`date +%Y`-`date +%m`-`date +%d`_`date +%H`-`date +%M`-`date +%S`"
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

# --------------------------------------------------------------------------------------
path_dir="/home/cesar/libs_shell"
#path_dir="/home/cesar/jenkins"

dirs_backups="/home/cesar/backups"
mkdir -p $dirs_backups


tar -zcvf "${dirs_backups}/${TIME_NOW}_name.tar.gz"  $path_dir
