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

# fuente: https://www.geeksforgeeks.org/shell-script-to-put-file-in-a-ftp-server/

# The 3 variables below store server and login details
HOST="192.168.0.80"
USER="cesar"
PASSWORD="cesar203"


# $1 is the first argument to the script
# We are using it as upload directory path
# If it is '.', file is uploaded to current directory.
DESTINATION=$1


# Rest of the arguments are a list of files to be uploaded.
# ${@:2} is an array of arguments without first one.
ALL_FILES="${@:2}"


# FTP login and upload is explained in paragraph below

local_path_fichero="${CURRENT_DIR}/demo.txt"


ftp_name_fichero="docker/$(basename $local_path_fichero)"

echo "Fichero en local : ${local_path_fichero}"
echo "Fichero en ftp   : ${ftp_name_fichero}"

HOST="192.168.0.40"
USER="cesar"
PASSWD="cesar203"

ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
put $local_path_fichero $ftp_name_fichero
quit
END_SCRIPT

