# Instalaciond e postgresql en Debian ubuntu
fuente
- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04-es
- 

## 1. Instalacion
```shell
# instalamos
sudo apt -y install postgresql postgresql-contrib postgresql-client
```

## 2. Usuarios  roles
```shell
# entramos como el usuario postgresql a la consola
sudo -i -u postgres
# entramos a la console del postgresql
psql
```

### 2.1 Cambio de clave de base de datos

```postgresql
postgres=# alter user postgres with password 'cesar203';
-- ALTER ROLE

-- ::: Salimos del postgresql
postgres=#\q
```
o lo cambiamos desde shell
```shell
# o lo hacemos directamente
psql -c "ALTER USER postgres WITH PASSWORD 'cesar203'"
```



### 2.2 crear usuario de postgresql y base de datos

#### ingresar a la consola local y remota
```shell
# :::::::: Local
psql -h localhost -U postgres -W

# :::::::: Remoto
    # psql -h <localhost> -d <dbname> -U <userdb>
psql -h localhost -d alumnos -U user_admin2
```

ahora crear un `usuario` o `rol`
```postgresql
postgres=# create user user_admin;
-- :: cresar usuario con password
postgres=# CREATE USER user_admin WITH PASSWORD 'cesar203';
```

crear una base de datos
```postgresql
postgres=# CREATE DATABASE alumnos;
```

Para otorgar pribilegios a un usuario
```postgresql
postgres=# GRANT ALL PRIVILEGES ON DATABASE alumnos TO user_admin2;
```


## Habilitación del acceso remoto en PostgreSQL
```shell
sudo nvim /etc/postgresql/14/main/postgresql.conf
```

En este archivo de configuración, busque listen_addresses en la sección “CONEXIONES Y AUTENTICACIÓN”. Descomenta la línea y cambia localhost a ‘*’. Esto le da instrucciones a PostgreSQL para escuchar en todas las interfaces de red las conexiones entrantes.

```postgresql
listen_addresses="*"
```
<img width="100%" src="https://i.imgur.com/Xokpcif.png" alt="My cool logo"/>

-- -- 
Guarde su configuración y reinicie PostgreSQL Server para que se produzcan los cambios reflejados.

```shell
$ sudo systemctl restart postgresql.service
```

Ahora debería poder ver que PostgreSQL está escuchando El servicio en una interfaz diferente. Puede ejecutar el siguiente comando para confirmarlo.

```shell
$ ss -ltn
```
<img width="100%" src="https://i.imgur.com/KAxCR6R.png" alt="My cool logo"/>

-- -- 

## 4. Habilitar Firewall

Si ha habilitado el cortafuegos UFW en el servidor, necesita puerto abierto 5432 para conexiones TCP entrantes ejecutando el siguiente comando.

```shell
$ sudo ufw allow 5432/tcp
```
También verifique la regla de firewall de UFW ejecutando el siguiente comando.

```shell
$ sudo ufw status verbose
```





### Ejecutar comandos de test de conexion
```shell
#psql -h <hostname or ip address> -p <port number of remote machine> -d <database name which you want to connect> -U <username of the database server>

# # -------------- database: canvas_prod
DB_HOST="database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_USER="canvas_prod"
DB_PASSWORD="Vrn8EDgxBIJJ"
DB_NAME="canvas_prod"

# #----------------------local
DB_HOST="localhost"
DB_PORT="5432"
DB_USER="postgres"
DB_PASSWORD="1234"
DB_NAME="canvas_prod"

export PGPASSWORD=$DB_PASSWORD;
#psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER 
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c 'SELECT * FROM information_schema.tables limit 10' 


# :::::::: ejcutar un script sql
export PGPASSWORD='Vrn8EDgxBIJJ'; psql -h 'database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com' -U 'canvas_prod' -d 'canvas_prod' -c 'SELECT * FROM information_schema.tables'
export PGPASSWORD='Vrn8EDgxBIJJ'; psql -h 'database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com' -U 'canvas_prod' -d 'canvas_prod' -c 'SELECT count(*) FROM public.failed_jobs'
export PGPASSWORD='Vrn8EDgxBIJJ'; psql -h 'localhost' -U 'postgres' -d 'canvas_prod' -c 'SELECT count(*) FROM public.accounts'


psql --host database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com --port 5432 --username canvas_prod  --dbname=canvas_prod -c 'SELECT * FROM information_schema.tables'
psql --host localhost --port 5432 --username postgres  --dbname=canvas_prod -c 'SELECT * FROM information_schema.tables'
```

### ✅ Reiniciamos
```shell
# Ahora reiniciar servicio
sudo systemctl restart postgresql

# Ahora reiniciar servicio
sudo systemctl enable postgresql
```
