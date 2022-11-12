fuente : https://www.ochobitshacenunbyte.com/2020/09/01/como-se-usa-el-comando-ss-en-linux/

## Uso
```shell
ss
root@serv-docker:/home/cesar# ss
#  Netid  State   Recv-Q  Send-Q                                                                        Local Address:Port          Peer Address:Port   Process
#  u_str  ESTAB   0       0                                                               /run/systemd/journal/stdout 30280                    * 30279
#  u_str  ESTAB   0       0                                                                                         * 36129                    * 36130
#  ....
#  icmp6  UNCONN  0       0                                                                                   *%ens33:ipv6-icmp                *:*
#  tcp    ESTAB   0       48                                                                             192.168.0.80:ssh            192.168.0.3:57831
#  tcp    ESTAB   0       0                                                                              192.168.0.80:ssh            192.168.0.3:64091
#  tcp    ESTAB   0       0                                                                              192.168.0.80:ssh            192.168.0.3:64099
#  tcp    ESTAB   0       0                                                                              192.168.0.80:ssh            192.168.0.3:57837
#  v_str  ESTAB   0       0                                                                                1165651151:1023                     0:976

```
<img width="100%" src="https://i.imgur.com/TWX6yfW.png" alt="My cool logo"/>

-- -- 

## 2. Listar todos los puertos
   Podemos recuperar una lista de puertos de escucha y no escucha usando la opción -a como se muestra a continuación.

```shell
ss -a
```

<img width="100%" src="https://i.imgur.com/XXs2Av9.png" alt="My cool logo"/>

-- -- 
## 3. Listar únicamente los sockets que están escuchando
   Con el parámetro -l nos muestra únicamente los sockets que están escuchando:

```shell
ss -l
```

## 4. Mostrar las conexiones TCP o UDP
   Con el parámetro -t podemos listar todas las conexiones TCP y con -u todas las conexiones UDP.

```shell
ss -t
```

## 5. Listar todas las conexiones TCP o UDP
   También podemos combinar el parámetro -l, que como hemos visto nos muestra los sockets, con los parámetros -t y -u, para que nos muestren las conexiones TCP o UDP

Por ejemplo:

```shell
ss -lt
```
<img width="100%" src="https://i.imgur.com/CWMCRYB.png" alt="My cool logo"/>

-- -- 

## 7. Mostrar un resumen de las estadísticas
   Podemos ver un resumen de la lista de conexiones. Puede ser útil cuando la cantidad de datos es tan grande que analizar los datos puede ser como un dolor de muelas.

```shell
ss -s
```

<img width="100%" src="https://i.imgur.com/8s2thJ6.png" alt="My cool logo"/>

-- -- 

## 8. Mostrar las conexiones IPv4 o IPv6
   Podemos ver únicamnete las conexiones IPv4 con el parámetro -4 o las conexiones IPv6 con el parámetro -6, como sigue:

```shell
ss -4
#ss -6
```
<img width="100%" src="https://i.imgur.com/IYg2xp1.png" alt="My cool logo"/>

-- -- 
## 9. Mostras conexiones TCP sin resolución de nombres
Una de los usos más habituales que hago en netstat es con el parámetro -tn, que me mostrará las conexiones TCP sin intentar la resolución de nombres. Con ss los parámetros son los mismos, bueno, como la mayoría, la verdad. De esta manera podemos ver tanto la dirección local como la remota, en la conexión:

```shell
ss -tn
```
<img width="100%" src="https://i.imgur.com/JdBe4mY.png" alt="My cool logo"/>

-- -- 

## 10. Filtrar conexiones por el número de puerto
El comando ss también nos permite filtrar el número de puerto del socket o la dirección. En este ejemplo vemos como mostrar todas las conexiones de socket con un puerto de origen o destino de ssh, como sigue:

```shell
ss -at '( dport = :22 or sport = :22 )'
```
<img width="100%" src="https://i.imgur.com/VWbIRLA.png" alt="My cool logo"/>

-- -- 


## 11. buscar por  PID
```shell
ss -tunelp
```

<img width="100%" src="https://i.imgur.com/q9g13P1.png" alt="My cool logo"/>

-- -- 


## Lista de conexiones a una dirección IP específica

### A. Conexiones a un Destino


Por ejemplo:
```shell
# ss dst <address>
ss dst 104.21.3.132
```
<img width="100%" src="https://i.imgur.com/4uRcyFp.png" alt="My cool logo"/>

-- -- 

### A. Conexiones a un Destino
Para mostrar conexiones a una dirección de origen específica, use:


```shell
ss src 192.168.100.2
```

<img width="100%" src="https://i.imgur.com/Jz5zHzw.png" alt="My cool logo"/>

-- -- 

## Comprobar ID de proceso
Para mostrar los ID de proceso (PID), utilice:

```shell
ss -p
```
<img width="100%" src="https://i.imgur.com/MFt9Q0T.png" alt="My cool logo"/>

-- -- 


# Conexiones de filtro
El sscomando permite el filtrado avanzado de resultados y la búsqueda de puertos específicos o estados TCP.

Por ejemplo, para encontrar todas las conexiones TCP que escuchan:

```shell
ss -t state listening
```
<img width="100%" src="https://i.imgur.com/41r3nZF.png" alt="My cool logo"/>

-- -- 



### Filtre por un número de puerto de `destino` específico o nombre de puerto:

```shell
ss dst :5228
```
<img width="100%" src="https://i.imgur.com/p3NZe90.png" alt="My cool logo"/>

-- -- 
O use un nombre de puerto:
```shell
ss dst :https
```
<img width="100%" src="https://i.imgur.com/M4ibD5k.png" alt="My cool logo"/>

-- -- 

### Filtre por un número de puerto de `local` específico o nombre de puerto:

```shell
# ss src :22 or src:ssh
ss -a  src :22 or src :ssh
```
<img width="100%" src="https://i.imgur.com/cUx5QSg.png" alt="My cool logo"/>

-- -- 


Combinando puertos
```shell
ss -a dst :5228 or src :mysql
```
<img width="100%" src="https://i.imgur.com/kVerUub.png" alt="My cool logo"/>

-- -- 
