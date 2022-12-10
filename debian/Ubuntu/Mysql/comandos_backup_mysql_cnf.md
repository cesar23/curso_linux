# comandos bacckup mysql

```shell
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASSWORD="cesar203"

PATH_CONFIG_MYSQL="/drives/d/config_mysql.cnf"
PATH_CONFIG_MYSQL_WIND="D:\config_mysql.cnf"
PATH_MYSQL="C:/laragon/bin/mysql/mysql-5.7.24-winx64/bin/mysql.exe"


#DB_NAME = "canvas_prod"

# escribimos en fichero
# :::simple
#(echo $'[client]\nuser="root"\npassword="cesar203"\nhost="localhost"') | tee /d/config_mysql.cnf 
# :::opcion 1
#(echo $'[client]\nuser='\""$DB_USER\""$'\npassword='\""$DB_PASSWORD\""$'\nhost='\""$DB_HOST\"" ) | tee /d/config_mysql.cnf 
# :::opcion 2
(printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"\nport=%s" $DB_USER $DB_PASSWORD $DB_HOST $DB_PORT) | tee $PATH_CONFIG_MYSQL

# aqui  jalamos el archivo de configuracion :/d/config_mysql.cnf
echo "OK"
# aqui  jalamos el archivo de configuracion :/d/config_mysql.cnf
mysql --defaults-extra-file=$PATH_CONFIG_MYSQL_WIND  --ssl-mode=DISABLED -e "SHOW TABLES FROM INFORMATION_SCHEMA;"
```
