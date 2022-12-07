# ver archivos abiertos por un usuario o por un proceso
fuente : https://geekflare.com/es/lsof-command-examples/

### 1. ver procesos abiertos por un usuario
```shell
sudo lsof -u cesar

# processos abiertos que no sean del usuario
sudo lsof -u ^cesar

```

Eliminar todos los procesos por un usuario
```shell
kill -9 `lsof -t -u cesar`
```


```shell
sudo lsof -u cesar -c bash
```

### 2 .Listar procesos por archivo
Para listar los procesos de un archivo abierto especifico, introduce la ruta y el archivo como argumento:
tambien matar bloqueantes
```shell
lsof /home/cesar/peru.sh
lsof /var/lib/dpkg/lock-frontend
# output:
#    COMMAND  PID  USER   FD   TYPE DEVICE SIZE/OFF   NODE NAME
#    bash    2496 cesar  254r   REG    8,5       20 393363 /home/cesar/peru.sh

```
<img width="90%" src="https://i.imgur.com/ny5UwLy.png" alt="My cool logo"/>

-- --

### 3.Listar archivos abiertos por proceso
Para listar los archivos abiertos por un proceso, puedes utilizar su nombre de la siguiente forma:

```shell
lsof -c apache2
```

<img width="90%" src="https://i.imgur.com/xssCTZD.png" alt="My cool logo"/>

-- --

###  4. Listar archivos abiertos por PID
En caso de listar los archivos abiertos por PID del proceso, simplemente ejecuta:
```shell
lsof -p 14482
```
<img width="90%" src="https://i.imgur.com/KDxoOw3.png" alt="My cool logo"/>

-- --

### 5. Listar conexiones por procesos
Para listar las conexiones abiertas por procesos:
```shell
lsof -i
```

<img width="90%" src="https://i.imgur.com/mTWs0Qx.png" alt="My cool logo"/>

-- --

### 6.Listar conexiones por puerto
Para listar conexiones de un puerto determinado simplemente debes ejecutar:
```shell
lsof -i :80
# output
#   COMMAND   PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
#   apache2 12827     root    3u  IPv6  92701      0t0  TCP *:http (LISTEN)
#   apache2 12831 www-data    3u  IPv6  92701      0t0  TCP *:http (LISTEN)
#   apache2 12832 www-data    3u  IPv6  92701      0t0  TCP *:http (LISTEN)
#   apache2 12833 www-data    3u  IPv6  92701      0t0  TCP *:http (LISTEN)
#   apache2 12834 www-data    3u  IPv6  92701      0t0  TCP *:http (LISTEN)
#   apache2 12835 www-data    3u  IPv6  92701      0t0  TCP *:http (LISTEN)

```

### 7. Listar conexiones IPv4 o IPv6
Listar conexiones IPv4:
```shell
lsof -i4
```
Podrás utilizarlo en combinación con otros argumentos y para IPv6 sería:

```shell
lsof -i6
```
Un ejemplo de combinación es el siguiente:

```shell
lsof -i6 :numero_puerto
```
