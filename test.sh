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

echo $CURRENT_DIR
echo $scriptPathDir
echo $(pwd)

function fn_check_changes_repositor(){
  #file_temp="${TMP}/temp_git_$(date +%s).tmp"
  OUT_GIT_STATUS=$( git status -s | grep origin2 | head -n 1 )

  if [ -n "$OUT_GIT_STATUS" ]
  then
      echo "1"
  else
      echo "0"
  fi
}

function fn_check_remote_origin_2(){
  cd '/D/repos/curso_excel'
#  cd '/D/repos/curso_git'
#  cd '/D/repos/curso_git'
  OUT_GIT_STATUS=$( git remote -v | grep origin2 | head -n 1 )

  if [ -n "$OUT_GIT_STATUS" ]
  then
      echo "1"
  else
      echo "0"
  fi
}
fn_check_remote_origin_2

if [ "1" == "$( fn_check_remote_origin_2 )" ]
then
   echo "cambios"
else
   echo "no cambios"
fi
#git status -s > "${CURRENT_DIR}/test.sh.txt" 2>&1
#git status -s > "${CURRENT_DIR}/test.sh.txt"
#
