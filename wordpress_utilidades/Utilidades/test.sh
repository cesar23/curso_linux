#!/bin/bash
#!/usr/bin/env bash
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

path_file='/D/repos/curso_linux/wordpress_utilidades/Utilidades/wp-config-sample.php'
path_file_new='/D/repos/curso_linux/wordpress_utilidades/Utilidades/wp-config.php'
cp $path_file $path_file_new

sed -i 's/database_name_here/db-plugin/g' $path_file_new
sed -i 's/username_here/root/g' $path_file_new
sed -i 's/password_here/cesar203/g' $path_file_new
sed -i 's/localhost/localhost/g' $path_file_new

