#!/usr/bin/env python
# -*- coding: utf-8 -*-
import subprocess
import os
import time
from os import remove
from os import rmdir
from os import path
import shutil


# ------------------------------------ start Funciones ------------------------
def existFile(path_archivo):
    if path.isfile(path_archivo):
        return True
    else:
        return False


def eliminar_archivoo_directorio(path_archivo):
    if path.isdir(path_archivo):
        shutil.rmtree(path_archivo)
        print(':: se elimino carpeta:' + path_archivo)
    elif path.isfile(path_archivo):
        remove(path_archivo)
        print(':: se elimino archivo:' + path_archivo)
    else:
        print("No existe el archivo:" + path_archivo)
    """DOCSTRING_DE_FUNCION"""
    return True




# ------------------------------------ end Funciones ------------------------


DB_HOST = "dbdev.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com"
DB_PORT = "5432"
DB_USER = "canvas_prod"
DB_PASSWORD = "Vrn8EDgxBIJJ"
DB_NAME = "canvas_prod"


# os.chdir(os.path.expanduser("~"))
# print(os.path.expanduser("~"))
# exit()

os.putenv('PGPASSWORD', DB_PASSWORD)
# os.chdir("/home/ubuntu")
os.chdir(os.path.expanduser("~"))
# os.chdir("/home/ubuntu")


# file_backup_path = '/home/ubuntu/{0}.tar'.format(db_name)
file_backup_path = '/d/backups/{0}.tar'.format(DB_NAME)


# file_backup_path = 'E:/backup_terrestre/segundas_tablas/{}'.format(i)
print("-------------------------------------")
print("backup DB: {}".format(DB_NAME))
print("-------------------------------------")
time.sleep(1.4)

# --------------------------------------- Example -------------------------------------------------------------
#   pg_dump -i -h localhost -p 5432 -U postgres -F c -b -v -f "/home/damian/backups/mibase.backup" mibase
# ----------------------------------------------------------------------------------------------------
     # pg_dump es el comando en si mismo.
     # -i le indica que ignore la versión (entre el comando y la base de datos).
     # -h localhost especifica el host del motor de base de datos (localhost en este caso).
     # -p 5432 es la indicación del puerto donde corre el servicio.
     # -U postgres es para indicarle que usaremos el usuario postgres.
     # -F indica el formato de salida.
             # p => (salida simple .sql)
             # c => (salida personalizado .dump - para utilizarlo despues con pg_restore )
             # t => (salida .tar - tambien optimo uso con pg_restore)
         # c es la elección del formato (comprime en este caso).

     # -b indica que vuelque los LO (large objects).
     # -v verbose.
     # -f es el archivo de salida.
     # /home/damian/backups/mibase.backup es el nombre para el archivo de salida (con path).
     # mibase es el nombre de la base a backupear.

print("")
print(":::::::::: Ejecutar en terminal shell ")
print("")
print("export PGPASSWORD={password}".format(password=DB_PASSWORD))
cmd = '{bin}  --host {dbo_host} --port 5432 --username {db_user}  -F t -b --dbname={db_name} --verbose -f "{path_file_backup}"  '.format(
    bin="pg_dump", dbo_host=DB_HOST, db_user=DB_USER, db_name=DB_NAME, path_file_backup=file_backup_path)


print(cmd)
# --abrir el archiv binario escritura
# with open(file_backup_path, 'wb') as f:
#     os.system(cmd)



# nombre = input("pause:")


# %PATH_PG_DUMP%  -h %HOST% -p 5432 -U admings %TABLAS_BACKUP%  %TABLAS_EXCLUIDAS% -F %TIPO_FORMATO_SALIDA_PG_DUMP% -b -v -f %PATH_SALIDA%  dbmaritimo
