#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import time
import datetime
# file_backup_path = 'E:/backup_terrestre/segundas_tablas/{}'.format(i)

from mis_libs.file_util import *
from mis_libs.compress_utility import compressUtility
# import mis_libs.compress_utility

time.sleep(1.4)
hora_actual = datetime.datetime.fromtimestamp(time.time()).strftime("%Y-%m-%d__%H-%M-%S")
CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))

PATH_MYSQL = 'C:/laragon/bin/mysql/mysql-5.7.33-winx64/bin/mysqldump.exe'
# PATH_MYSQL = 'mysqldump'

# ---------- Data Produccion
dir_input = "D:/temp_d/openoffice"
dir_backup = "D:/repos/curso_linux/Servers_Clients/laborem_spdtss/backup_cesar/daily"
# ---- donde se almacenara el backup
# ---- con que nombre se guardara el backup
file_backup = f"{hora_actual}_spdtsso2.sql"
# file_output_path = f"{dir_backup}/{file_backup}"
# file_output_path = dir_backup, os.sep, file_backup
file_output_path = f'{dir_backup}/{file_backup}'



# ------------- local
db_host = "localhost"
db_username = "root"
db_password = "cesar203"
db_name = "pluging_wp"

# ------------- server
# db_host = "192.168.101.22"
# db_username = "pcbyte"  # TIENE Q TENER PRIVILEGIOS
# db_password = "20506472343SEE"
# db_name = "pcbyte"


# ------------------- Creando fichero de configuracion para ejecutar comandos mysql

config_path_cnf = CURRENT_DIR + os.sep + 'config.cnf'

FileUtil.create_file(config_path_cnf)
FileUtil.write_file(config_path_cnf, "[client]\npassword=\"{db_password}\"".format(db_password=db_password))

# os.chdir("C:/laragon/bin/mysql/mysql-5.7.24-winx64/bin")


#  aqui es el acrhivo de  salida
PATH_SALIDA_FILE =file_output_path

cmd = ''
if db_password == "":
    cmd = f'{PATH_MYSQL} --ssl-mode=DISABLED  -h {db_host} -u {db_username}  {db_name}   --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF   --result-file="{file_output_path}" '
else:
    cmd = f'{PATH_MYSQL} --defaults-file="{config_path_cnf}" --ssl-mode=DISABLED -h {db_host} -u {db_username} {db_name}  --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF  --result-file="{file_output_path}" '

# cmd_delete='DROP DATABASE exampledb;'



print("comando: {}".format(cmd))
print(":::::: generando fichero")
# --abrir el archiv binario escritura
with open(PATH_SALIDA_FILE, 'wb') as f:
    os.system(cmd)


print(":::::: comprimiendo fichero")
file_path_gz=file_output_path.replace(".sql",".sql.gz")

objCompress=compressUtility()
objCompress.gzip_local(file_output_path,file_path_gz)