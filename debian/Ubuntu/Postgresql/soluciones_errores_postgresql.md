# solucionar errores de postgresql

## - Error numero 1

fuente: https://dba.stackexchange.com/questions/182189/how-do-i-access-postgres-when-i-get-an-error-about-var-run-postgresql-s-pgsql

```shell
root@cesar-virtual-machine:/home/cesar# sudo -u postgres psql
# psql: error: could not connect to server: No such file or directory
#         Is the server running locally and accepting
#         connections on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?

```
<img width="90%" src="https://i.imgur.com/3jurkhD.png" alt="My cool logo"/>

### solucion: 

**PASO 1**. Ejecutar ` pg_lsclusters` enumerará todos los clústeres de postgres que se ejecutan en su dispositivo
 ```shell
 pg_lsclusters 
 # output:
  # Ver Cluster Port Status Owner    Data directory              Log file
  # 12  main    5432 down   postgres /var/lib/postgresql/12/main /var/log/postgresql/postgresql-12-main.log

 ```
<img width="90%" src="https://i.imgur.com/XgEinFP.png" alt="My cool logo"/>

lo más probable es que el estado sea inactivo en su caso. Intente reiniciar los clústeres y el servicio de Postgres
 
👁‍🗨 ejecutar el comando  del servicio del cluster para ver el error que bota y solucionarlo
```shell
systemctl status postgresql@12-main.service
```
<img width="90%" src="https://i.imgur.com/hj3gPqg.png" alt="My cool logo"/>






**PASO 2**.  Reiniciar `pg_ctlcluster`

-  fformato del cluster `pg_ctlcluster <version> <cluster> <action>`
```shell
sudo pg_ctlcluster 12 main start
```

```shell
#restart postgresql service
sudo service postgresql restart
```

**PASO 3**. falló y arrojó un error
Si este proceso no tiene éxito, arrojará el error. 
Mi error fue (Puedes ver el registro de error en `cat /var/log/postgresql/postgresql-12-main.log`

```shell
FATAL: could not access private key file "/etc/ssl/private/ssl-cert-snakeoil.key": Permission denied
Try adding `postgres` user to the group `ssl-cert`
```

**PASO 4**. verificar la propiedad de postgres

Asegúrate de que `postgres` es el dueño de `/var/lib/postgresql/version_no/main` eg: 
```shell
sudo chown postgres -R /var/lib/postgresql/12/main/
```

**PASO 5**. verifique que el usuario de Postgres pertenezca al grupo de usuarios
ssl-cert Me pasó y resultó que eliminé por error al usuario de 
Postgres del grupo "ssl-cert". Ejecute el siguiente código para solucionar 
el problema del grupo de usuarios y corregir los permisos
```shell
#set user to group back with
sudo gpasswd -a postgres ssl-cert

# Fixed ownership and mode
sudo chown root:ssl-cert  /etc/ssl/private/ssl-cert-snakeoil.key
sudo chmod 740 /etc/ssl/private/ssl-cert-snakeoil.key

sudo service postgresql restart
```


## - Error numero 2
#### conexion
<img width="90%" src="https://i.imgur.com/270Wjwz.png" alt="My cool logo"/>

Aqui hay que editar el archivo `pg_hba.conf` de postgresql
#### En el cliente 🙎
el cliente tiene la  direccion ip `192.168.0.3`

#### En el Servidor 💻
Verifique la dirección de red de la máquina **Servidor**
configure los parámetros en el archivo `pg_hba.conf`
para que postgresql pueda aceptar conexiones desde hosts de `máquinas virtuales`.
agrega la direccion `192.168.0.3`al archivo `pg_hba.conf`:

```shell
# editar
sudo nano /etc/postgresql/12/main/pg_hba.conf
```
<img width="90%" src="https://i.imgur.com/y5wDO3r.png" alt="My cool logo"/>

quedaria  asi para que se pueda  acceder localmente
```shell
host    all             all              192.168.0.0/24                       md5
# :cualquier  lugar
#host    all             all              0.0.0.0/0                       md5
```

<img width="90%" src="https://i.imgur.com/GjH4Sln.png" alt="My cool logo"/>


Ahora  reiniciar
```shell
sudo service postgresql restart
```
