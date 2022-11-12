# Instalar Redis en ubuntu

instalar redis
```shell
sudo apt install redis-server
```

editar la configuracion
```shell
sudo nano /etc/redis/redis.conf
```

Encuentre la directiva supervised dentro del archivo. Esta directiva le permite declarar un sistema init para administrar Redis como un servicio, lo que le proporcionará mayor control sobre su funcionamiento. Por defecto, el valor de la directiva supervised es no. Debido a que se trata de Ubuntu, el cual utiliza el sistema init de `systemd`, cambie el valor a `systemd`:

```shell
# If you run Redis from upstart or systemd, Redis can interact with your
# supervision tree. Options:
#   supervised no      - no supervision interaction
#   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
#   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
#   supervised auto    - detect upstart or systemd method based on
#                        UPSTART_JOB or NOTIFY_SOCKET environment variables
# Note: these supervision methods only signal "process is ready."
#       They do not enable continuous liveness pings back to your supervisor.
supervised systemd

bind 0.0.0.0 ::1 #para que se conecten desde cualquier IP

requirepass cesar203
```

#### Ya con esto ya tenemos el apssword: cesar203

<img width="100%" src="https://i.imgur.com/01FX9xW.png" alt="My cool logo"/>

-- -- 


<img width="100%" src="https://i.imgur.com/e2epphC.png" alt="My cool logo"/>

-- -- 
<img width="100%" src="https://i.imgur.com/Mf6q70A.png" alt="My cool logo"/>

-- -- 



Ahora reiniciamos el servicio y lo ponemos al arranque
```shell
sudo systemctl restart redis.service
sudo systemctl enable --now redis-server
```
version de redis
```shell

cesar@serv-docker:~$ redis-server --version
Redis server v=5.0.7 sha=00000000:0 malloc=jemalloc-5.2.1 bits=64 build=66bd629f924ac924
cesar@serv-docker:~$

```


## Comprobamos los puertos escuchas
```shell
#ss -a  src :6379 or src :ssh
ss -a  src :6379 # para ver nuestras conexiones
```


## Pruebas de Redis

1. Probamos redis en nuestro server
```shell
redis-cli
# output:
#   127.0.0.1:6379> 6379 es el puerto del server

```
<img width="100%" src="https://i.imgur.com/EjSXBuP.png" alt="My cool logo"/>

-- -- 

2. Nos logeamos
```shell

root@serv-docker:/home/cesar# redis-cli
127.0.0.1:6379> AUTH cesar203
# OK

```

<img width="100%" src="https://i.imgur.com/yuLYwKY.png" alt="My cool logo"/>

-- -- 

3. Conectarse Remotamente

```shell
redis-cli -h <host> -p <port>
redis-cli -h <host> -p <port> -a <password>
```

Ejemplo:
```shell
redis-cli -h 92.101.91.8 -p 6379

redis-cli -h my-web.cache.amazonaws.com -p 6379 -a pass123

```

ejemplo  con URI
```shell

redis-cli -u redis://password@host:port
redis-cli -u redis://username:password@host:port


# ejemplo
redis-cli -u redis://pass123@my-web.cache.amazonaws.com:6379
# con usuario
redis-cli -u redis://user123:pass123@my-web.cache.amazonaws.com:6379


# :::::::: nios
redis-cli -h 192.168.0.80 -p 6379
# por url
redis-cli -u redis://192.168.0.80:6379

192.168.0.80:6379
```

# Inseracion de datos
fuente: https://www.youtube.com/watch?v=hRHM13uFpCE

setear valores en redis
```shell
127.0.0.1:6397> set foo "bar"
127.0.0.1:6397> set value 1
```

obtener los valores
```shell
127.0.0.1:6397> get foo
"bar"
127.0.0.1:6397> get value
"1"
```

borrar los valores
```shell
127.0.0.1:6397> del foo
(integer) 1
127.0.0.1:6397> get foo
(nil)
```

crear listas

```shell
# agregar a lista
127.0.0.1:6397> lpush mylist foo
(integer) 1
127.0.0.1:6397> lpush mylist bar

# listar valores de lista
127.0.0.1:6397> lrange mylist 0 -1
1) "foo"
2) "bar"
```

## configuraciones desde la linea comandos REDIS

#### Setear o  eliminar  password
```shell
127.0.0.1:6397> config set requirepass "cesar203"
# quitar password
127.0.0.1:6397> config set requirepass ""
```

#### Obtener la configuracion de redis
```shell
127.0.0.1:6397> config get *
127.0.0.1:6397> config get dbfilename  # obtiene una configuracion especifica
127.0.0.1:6397> config get requirepass # obtiene el password actual
```
