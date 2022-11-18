# comandos bacckup mysql

```shell
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASSWORD="cesar203"
#DB_NAME = "canvas_prod"

# escribimos en fichero
# :::simple
#(echo $'[client]\nuser="root"\npassword="cesar203"\nhost="localhost"') | tee /d/config_mysql.cnf 
# :::opcion 1
#(echo $'[client]\nuser='\""$DB_USER\""$'\npassword='\""$DB_PASSWORD\""$'\nhost='\""$DB_HOST\"" ) | tee /d/config_mysql.cnf 
# :::opcion 2
(printf "[client]\nuser=\"%s\"\npassword=\"%s\"\nhost=\"%s\"" $DB_USER $DB_PASSWORD $DB_HOST) | tee /d/config_mysql.cnf 

# aqui  jalamos el archivo de configuracion :/d/config_mysql.cnf
mysql --defaults-extra-file=/d/config_mysql.cnf  --ssl-mode=DISABLED -e "SHOW TABLES FROM INFORMATION_SCHEMA;"
```
