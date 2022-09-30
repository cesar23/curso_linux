# Instalaciond e postgresql en Debian ubuntu
fuente
- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04-es
- 

### Instalacion
```shell
# instalamos
sudo apt install postgresql postgresql-contrib

# entramos como el usuario postgresql a la consola
sudo -i -u postgres

sudo -u postgres psql


```
### una vez  dentro cambiaremos la  clave del usuario postgres de la  base de datos
```shell
# ubuntu@ip-172-31-4-187:~$ sudo -u postgres psql
# could not change directory to "/home/ubuntu": Permission denied
# psql (14.5 (Ubuntu 14.5-0ubuntu0.22.04.1))
# Type "help" for help.
# 
# postgres=#
    alter user postgres with password 'cesar203';
    psql -c "ALTER USER postgres WITH PASSWORD 'cesar203'"
    
    psql -h localhost -U postgres -W
    
    
# -----------:::::: resultado
#   postgres=# alter user postgres with password 'cesar203';
#   ALTER ROLE
#   postgres=#

#Ahora  reiniciar servicio
sudo systemctl restart postgresql

# ahora si ingresamos como deberia ser:

psql -U postgres -W
```


### Ejecutar comandos de test de conexion
```shell
#psql -h <hostname or ip address> -p <port number of remote machine> -d <database name which you want to connect> -U <username of the database server>
DB_HOST="localhost"
DB_PORT="5432"
DB_USER="postgres"
DB_PASSWORD="1234"
DB_NAME="postgres"
#  database: canvas_prod
#  host: database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com
#  username: canvas_prod
#  password: Vrn8EDgxBIJ
DB_HOST="database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_USER="canvas_prod"
DB_PASSWORD="1234"
DB_NAME="canvas_prod"

psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER 
 
```