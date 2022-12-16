# comandos journalctl - (todos las distribuciones en Debian)

fuentes:

- https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs
- https://diocesanos.es/blogs/equipotic/2015/03/30/journalctl-logs-del-sistema-en-los-nuevos-linux/

> ------------ Menu ----------------


<!-- Ok -->

<a href="#" id="indice">Indice 👌</a>

## Tabla de contenido

- <a href="#101">1.1 para exportar y revisar los log localmente</a>
- <a href="#102">1.2. filtrar los log 🩸</a>
- <a href="#103">1.3. escuchar en linea cualquier log</a>
- <a href="#200">2. listar logs guardados por fechas</a>
- <a href="#300">3. Ver los mensajes del kernel</a>
- <a href="#400">4. Filtrar por número de entradas en el registro de logs</a>
- <a href="#500">5. Mostrar la salida por PID 💊</a>
- <a href="#600">6. Especificar la salida por usuarios</a>
- <a href="#700">7. Filtrar la salida por servicios de systemd</a>
- <a href="#800">8. Filtrar por fechas</a>
- <a href="#900">9. Filtrar por la prioridad del mensaje</a>
- <a href="#1000">10. Mensajes de los discos duros</a>
- <a href="#1100">11. Ver el espacio que están ocupando los diferentes logs</a>
- <a href="#1200">12. Ver Log de Forma clasica (💣💻) Servicios Linux con `tail`</a>





-- - 

[//]: # (101------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="101">1.1 para exportar y revisar los log localmente</h2>   
```shell
#puedes revisrlo en visual code
journalctl > journalctl.txt
```

-- - 

[//]: # (102------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="102">1.2. filtrar los log</h2> 
```shell
journalctl |grep 'error'
```

-- - 

[//]: # (103------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="103"> 1.3. escuchar en linea cualquier log q se genere como `tail -f` </h2> 
 ver los  ultimos logs

```shell
journalctl -f
```

-- - 

[//]: # (200------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="200">2. listar logs guardados por fechas</h2>  
```shell
root@ubuntu:# journalctl --list-boots
# -14 2a2bf3d9eb1c4122ad161ec1ff49157e Wed 2020-03-04 11:56:38 -05—Wed 2020-03-04 11:59:15 -05
# -13 bbd4e7734ae04a02ad9df2674e3ae37f Wed 2020-03-04 11:59:26 -05—Sat 2020-08-15 04:57:06 -05
# -12 52e313187d764cc7a89ab23ebd78ac7d Sat 2020-08-15 04:58:18 -05—Sat 2020-08-15 05:32:46 -05
# -11 ba51a3375a3f495bb46dc454cfd94595 Sat 2020-08-15 05:32:59 -05—Sat 2020-08-15 07:38:32 -05
# -10 49f8fb6da4e149c9862aca7730b6b26e Sat 2020-08-15 07:38:45 -05—Fri 2020-08-21 18:51:08 -05
#  -9 737326921e614770b76e4659143d573b Fri 2020-08-21 18:51:21 -05—Sun 2020-08-23 12:22:33 -05
#  -8 e9448a34116344abbe9020c4111238a5 Sun 2020-08-23 12:27:30 -05—Thu 2020-10-29 19:05:01 -05
#  -7 5554aad86bfa4db68e929c43ce1fad68 Fri 2022-08-05 21:24:43 -05—Fri 2022-08-05 21:56:38 -05
#  -6 0d2dc61f5e514f7d9442cc5a77d88f64 Fri 2022-08-05 22:04:27 -05—Fri 2022-08-05 22:09:29 -05
#  -5 1dca3f2ffa264f1fa0900664a903bb8a Fri 2022-08-05 22:09:48 -05—Mon 2022-08-08 10:24:04 -05
#  -4 4d9c8aebc23f4ba696a96860ad9c1224 Mon 2022-08-08 10:24:25 -05—Mon 2022-08-08 18:22:05 -05
#  -3 37b06260cb054f0b9d2cba73da9bfc57 Mon 2022-08-08 18:22:27 -05—Mon 2022-08-08 19:28:51 -05
#  -2 0d2a873cb7f84b28a64aa4a41817dedb Mon 2022-08-08 19:29:13 -05—Tue 2022-08-16 16:18:13 -05
#  -1 3d6d1999f4dd40cb869d4f2e23a2182a Tue 2022-08-16 16:18:34 -05—Wed 2022-09-28 10:22:33 -05
#   0 b27a1dcae2e8482fa7e9f577c31d9e7c Wed 2022-09-28 10:22:56 -05—Wed 2022-09-28 11:45:01 -05
```
<img width="100%" src="https://i.imgur.com/n27dwyy.png" alt="My cool logo"/>

-- -- 

#### Para ver los logs del boot actual:
```shell
journalctl -b
```
#### Si necesitamos ver alguno de los anteriores tenemos dos opciones:
Utilizamos simplemente una cuenta regresiva. Por ej para ver al anterior:
```shell
journalctl -b -1

# y asi recursivamenete
# journalctl -b -2
# journalctl -b -3
```

O elegimos usar la ID del boot, que nos aparecio al listar los procesos de arranque con “journal –list-boots”.  Sería algo así:
```shell
journalctl _BOOT_ID=dfe74d5a9d384a88821ff8d24d64f81f
```

-- - 

[//]: # (300------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="300">3. Ver los mensajes del kernel</h2>   

Le añadimos el parámetro -k:
```shell
journalctl -k

# para ver log del kernell actual
journalctl -k-b
```

De forma predeterminada, esto mostrará los mensajes del núcleo del arranque actual. Puede especificar un inicio alternativo utilizando los indicadores de selección de inicio normales discutidos anteriormente. Por ejemplo, para obtener los mensajes de hace cinco arranques, podría escribir:
```shell
journalctl -k -b -5
```


-- - 

[//]: # (400------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="400">4.Filtrar por número de entradas en el registro de logs</h2>  

La opción predeterminada es ejecutar
```shell
journalctl -n

journalctl -n 50
```

## 4. Filtras los logs por ejecutables o programas
En este caso también tenemos varias formas de hacerlo, bien directamente con el ejecutable:
```shell
journalctl _COMM=NetworkManager
# o 
journalctl /usr/sbin/NetworkManager
# o
journalctl | grep NetworkManager
```

-- - 

[//]: # (500------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="500">5. Mostrar la salida por PID</h2> 
Filtramos mediante el número identificador del proceso (algo que podemos consultar con top o htop), en esta ocasión como veis en el ejemplo 2527 corresponde a Firefox:
```shell
journalctl _PID=2527
```

-- - 

[//]: # (600------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="600">6.Especificar la salida por usuarios</h2>

La id de los usuarios la podéis encontrar ejecutando (obviamente sustituís la parte del nombre del usuario)

```shell
# ver  el id del usuario
> id
uid=197609(cesar) gid=197121 groups=197121

#ahora  buscamos pro el usuario

journalctl _UID=197609
```

-- - 

[//]: # (700------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="700">7. Filtrar la salida por servicios de systemd</h2>    
```shell
systemctl list-units -t service --all
#  UNIT                                                                                      LOAD      ACTIVE   SUB     DESCRIPTION
#  accounts-daemon.service                                                                   loaded    active   running Accounts Service
#  acpid.service                                                                             loaded    inactive dead    ACPI event daemon
#  apache-htcacheclean.service                                                               loaded    active   running Disk Cache Cleaning Daemon for Apache HTTP Serv
#  apache2.service    
```

y si nos interesa uno en particular, estudiamos sus mensajes añadiendo el parámetro -u y el nombre del service, como en este ejemplo
`journalctl -u apache2.service`
```shell
root@ubuntu:/var/log/apache2# journalctl -u apache2.service
root@ubuntu:/var/log/apache2# journalctl -u apache2.service -f
# -- Logs begin at Sun 2019-10-06 08:09:30 -05, end at Wed 2022-09-28 14:55:01 -05. --
# Oct 02 16:50:47 ubuntu systemd[1]: Starting LSB: Apache2 web server...
# Oct 02 16:50:47 ubuntu apache2[1303]:  * Starting Apache httpd web server apache2
# Oct 02 16:50:47 ubuntu apache2[1303]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' d
# Oct 02 16:50:48 ubuntu apache2[1303]:  *
# Oct 02 16:50:48 ubuntu systemd[1]: Started LSB: Apache2 web server.
# Oct 02 17:26:26 ubuntu systemd[1]: Started LSB: Apache2 web server.
# Oct 02 17:26:34 ubuntu systemd[1]: Stopping LSB: Apache2 web server...
# Oct 02 17:26:34 ubuntu apache2[3069]:  * Stopping Apache httpd web server apache2
# Oct 02 17:26:35 ubuntu apache2[3069]:  *
# Oct 02 17:26:35 ubuntu systemd[1]: Stopped LSB: Apache2 web server.
# Oct 02 17:27:37 ubuntu systemd[1]: Starting LSB: Apache2 web server...
# Oct 02 17:27:37 ubuntu apache2[3147]:  * Starting Apache httpd web server apache2
# Oct 02 17:27:37 ubuntu apache2[3147]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' d
# Oct 02 17:27:38 ubuntu apache2[3147]:  *

```
#### buscar mas de un servicio 
```shell
# separamas los s ervicion con +
journalctl _SYSTEMD_UNIT=apache2.service + _SYSTEMD_UNIT=dbus.service

#  filtrar todo de hoy
journalctl -u nginx.service -u php-fpm.service --since today

# --------- por ssh
journalctl -u ssh.service --since today


#journalctl -u ssh.service \
#  --since='2022-10-07 19:22:00' --until='2022-10-07 20:22:00'
#
#journalctl --since "2022-10-25" --until "2022-10-26"
journalctl -u ssh.service \
  --since "2022-10-25 01:00" --until "2022-10-25 22:00"
  
 # ver los  ultimos generados
journalctl -u ssh.service -f
  

```

#### ⚠️Revision de servicios mas usados
```shell
# Postgresql
journalctl -u nginx.service \
--since='2022-0-29 00:01' --until='2015-03-29 00:01'
```


-- - 

[//]: # (800------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="800">8. Filtrar por fechas</h2>    

Se utilizan los parámetros `–since` y `–until`, así como expresiones tipo `yesterday` `ago` o `today`. El formato de tiempo es habitualmente YYYY-MM-DD HH:MM:SS.

Algunos ejemplos:

-- --
Ver los logs desde el día de ayer hasta hoy a las 02:00 horas.
```shell
journalctl --since 'yesterday' --until '02:00'
```
un intervalo de fechas específico:
```shell
journalctl --since='2015-02-29 00:01' --until='2015-03-29 00:01'
```
Todos los logs especificando la fecha en el formato que os comentaba anteriormente, y filtrando por el programa firefox
```shell
journalctl _COMM=firefox --since='2015-02-29 00:01' --until='2015-03-29 00:01'
```
Lo mismo que el caso anterior pero en este caso filtrando por el servicio de sshd.service
```shell
journalctl -u sshd.service --since='2015-02-29 00:01' --until='2015-03-29 00:01'
```
O simplemente ver lo que ha pasado en la última media hora:
```shell
journalctl --since '30 min ago'
```

-- - 

[//]: # (900------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="900">9. Filtrar por la prioridad del mensaje</h2>


Los mensajes se clasifican en función de su prioridad en 7 niveles diferentes:
- emerg (0)
- alert (1)
- crit (2)
- err (3)
- warning (4)
- notice (5)
- info (6), y  debug (7)

Para filtrarlos utilizamos el parámetro -p seguido del número correspondiente. En este ejemplo vemos los críticos:

```shell
journalctl -p 2
```

-- - 

[//]: # (1000------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="1000">10. Mensajes de los discos duros</h2>    

Puede ser interesante para descubrir problemas de funcionamiento en nuestras unidades de discos duros.

```shell
journalctl /dev/sda
```
-- - 

[//]: # (1100------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="1100">11.Ver el espacio que están ocupando los diferentes logs</h2>    

Ejecutamos el comando: `journalctl --disk-usage`

```shell
root@ubuntu:~# journalctl --disk-usage
# Archived and active journals take up 1.0G in the file system.
```


[//]: # (1100------------------)
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>


<h2  id="1200">12. Ver log de servicios con (💣💻) Tail por Servicios</h2>

### Servicios de Nginx
```shell
# :::::::::::: NGINX :::::::::::::
 # ver los  ultimos generados
sudo journalctl -u nginx.service -f
# equivalencia
sudo tail -f /var/log/nginx/error.log
```

### Servicios de Apache

```shell
# :::::::::::: Apache :::::::::::::
sudo journalctl -u apache2.service -f -f
# equivalencia

sudo tail -f  /var/log/apache2/access.log
  # sudo tail -f -100 /var/log/apache2/access.log
sudo tail -f /var/log/apache2/error.log
```
