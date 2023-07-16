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



#find $CURRENT_DIR -name "*.txt" -print | xargs sed -i "s/SYSADMIT/--SYSADMIT--/g"

#:::::::: reemplaza solo el que empieza con SYSADMIT
find $CURRENT_DIR -name "test.txt" -print | xargs sed -i "s/^SYSADMIT/--SYSADMIT--/g"



#find $CURRENT_DIR -name "wp-config.php" -print | xargs sed -i "s/DB_NAME/cesar$1/g"

echo "">wp-config_new.php
#sed -r 's/^define(.*)/cesar\1/g' wp-config.php > wp-config_new.php
sed -r 's/^(define)(.*)DB_NAME(.*)+(.*)/\1\2DB_NAME\3/g' wp-config.php > wp-config_new.php

#find $CURRENT_DIR -name "wp-config.txt" -print | xargs sed -i "s/SYSADMIT/--SYSADMIT--/g"
