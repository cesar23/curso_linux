DATE_HOUR="`date +%Y`-`date +%m`-`date +%d`__`date +%H`-`date +%M`-`date +%S`"
DATE_MONTH="`date +%Y`-`date +%m`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"
PATH_SCRIPT=`readlink -f "${BASH_SOURCE:-$0}"`
CURRENT_DIR=`dirname $PATH_SCRIPT`
NAME_DIR=$(basename $CURRENT_DIR) # nombre del Directorio actual

scriptPathDir=$(dirname $0) # current_dir
name_dir=$(basename $scriptPathDir) # nombre del Directorio actual
scriptPathFile=$(realpath $0)
scriptPathFileTemp=$(echo "$scriptPathFile" | sed 's/.sh/.tmp/g')
scriptPathFileName="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"


# ---------- Data Produccion
dir_input=/home/spdtsso2/
dir_backup=/backup_cesar/daily
# ---- donde se almacenara el backup
# ---- con que nombre se guardara el backup
file_backup="${DATE_HOUR}_spdtsso2.tar.gz"
file_output_path="${dir_backup}/${file_backup}"




# ---------- Data Test
#dir_input=/drives/D/temp_d/openoffice/
#dir_backup=/drives/D/repos/curso_linux/Server_clientes/laborem_spdtss/backup_cesar/daily
## ---- donde se almacenara el backup
## ---- con que nombre se guardara el backup
#file_backup="${DATE_HOUR}_spdtsso2.tar.gz"
#file_output_path="${dir_backup}/${file_backup}"




# entramos al directorio que  comprimiremos
cd $dir_input
tar -czvf $file_output_path *

# --regresamos al directorio de los script
cd $CURRENT_DIR
echo "ejecutado el backup ${file_backup}">> "${DATE_MONTH}.log"