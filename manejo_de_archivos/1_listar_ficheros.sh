#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
NAME_DIR=$(basename $CURRENT_DIR)

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileTemp=$(echo "$scriptPathFile" | sed 's/.sh/.tmp/g')
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

#ROOT_PATH=`echo $CURRENT_DIR | sed -e 's/\/\$NAME_DIR//'` # D:/repos/curso_plugin_theme_wordpress
#
regex="s/\/${NAME_DIR}//"
ROOT_PATH=$(echo $CURRENT_DIR | sed -e $regex) # D:/repos/curso_plugin_theme_wordpress



echo "ROOT:${ROOT_PATH}"
echo $(basename $CURRENT_DIR)

cd $ROOT_PATH
for filename in *
  do
    echo $filename
#    if [ -f "$filename" ] ; then
#      echo "put \"$filename\"" >> $tempfile
#      count=$(($count + 1))
#    fi
  done