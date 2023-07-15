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

# -------------------------------------------------------------

DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASSWORD="cesar203"
DB_NAME="pluging_wp"

PATH_CONFIG_MYSQL="${scriptPathDir}/config_mysql.cnf"
PATH_FILE_SQL="${scriptPathDir}/backup.sql"
PATH_CONFIG_MYSQL_WIND="D:\config_mysql.cnf"
PATH_MYSQL="C:/laragon/bin/mysql/mysql-5.7.24-winx64/bin/mysql.exe"
#PATH_MYSQL_DUMP="C:/laragon/bin/mysql/mysql-5.7.24-winx64/bin/mysqldump.exe"

(printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"\nport=%s" $DB_USER $DB_PASSWORD $DB_HOST $DB_PORT) | tee $PATH_CONFIG_MYSQL > null
sleep 1
"${PATH_MYSQL}" --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED -h $DB_HOST -u $DB_USER $DB_NAME --port=$DB_PORT -e "DROP DATABASE IF EXISTS ${DB_NAME}; CREATE DATABASE ${DB_NAME};"
"${PATH_MYSQL}"  --defaults-file="${PATH_CONFIG_MYSQL}" --ssl-mode=DISABLED -h $DB_HOST -u $DB_USER $DB_NAME --port=$DB_PORT --default-character-set=utf8 --comments --database=$DB_NAME  < "${PATH_FILE_SQL}"

