import subprocess
import os
import time

#para  windows usar (shell=True)



os.putenv('PGPASSWORD', 'cesar203')

filename_backup = 'E:/QSR/backup_2.tar'
pgRestore = 'C:/Program Files/PostgreSQL/10/bin/pg_restore.exe'



DB_HOST = "dbdev.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com"
DB_PORT = "5432"
DB_USER = "canvas_prod"
DB_PASSWORD = "Vrn8EDgxBIJJ"
DB_NAME = "canvas_prod"

file_backup_path = '/d/backups/{0}.tar'.format(DB_NAME)


os.putenv('PGPASSWORD', DB_PASSWORD)






print("-------------------------------------")
print("Restaurando  DB: {}".format(DB_NAME))
print("-------------------------------------")

time.sleep(1.4)
#print(db_name)
#print(db_shcema)
#print( db_table_name)
#print( file_backup_path)
#-------anterior
#cmd ='"{0}" --host {1} --port 5432 --username {2}  --dbname={3}  --verbose "{4}" '.format(pgRestore,db_host,db_username,db_name,file_backup_path)

print("")
print(":::::::::: Ejecutar en terminal shell ")
print("")

print("export PGPASSWORD={password}".format(password=DB_PASSWORD))
cmd = '{bin}  --host {dbo_host} --port 5432 --username {db_user}  --dbname={db_name} --verbose "{path_file_backup}"  '.format(
    bin="pg_restore", dbo_host=DB_HOST, db_user=DB_USER, db_name=DB_NAME, path_file_backup=file_backup_path)


print(cmd)


##--abrir el archiv binario lectura
# with open(file_backup_path, 'rb') as f:
#           #popen = subprocess.run(cmd, shell=True,stdout=subprocess.PIPE, universal_newlines=True)
#           os.system(cmd)
#


