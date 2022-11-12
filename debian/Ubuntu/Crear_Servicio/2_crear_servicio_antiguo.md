# creacion de servicio linux antiguo

## 1. crearemos un archivo enal  siguiente  ruta
`nano /etc/init.d/soluciones_service`

```shell
#! /bin/sh
 
NAME=soluciones_service
DESC="Demonio del soluciones_service"
PIDFILE="/var/run/${NAME}.pid"
LOGFILE="/var/log/${NAME}.log"
 
#indicamos que vamos a ejecutar un archivo PHP
DAEMON="/usr/bin/php"
#Ruta del archivo
DAEMON_OPTS="/home/cesar/script/contador.php"
 
START_OPTS="--start --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ${DAEMON_OPTS}"
STOP_OPTS="--stop --pidfile ${PIDFILE}"
 
test -x $DAEMON || exit 0
 
set -e
 
case "$1" in
    start)
        echo -n "Starting ${DESC}: "
        start-stop-daemon $START_OPTS >> $LOGFILE
        echo "$NAME."
        ;;
    stop)
        echo -n "Stopping $DESC: "
        start-stop-daemon $STOP_OPTS
        echo "$NAME."
        rm -f $PIDFILE
        ;;
    restart|force-reload)
        echo -n "Restarting $DESC: "
        start-stop-daemon $STOP_OPTS
        sleep 1
        start-stop-daemon $START_OPTS >> $LOGFILE
        echo "$NAME."
        ;;
    *)
        N=/etc/init.d/$NAME
        echo "Usage: $N {start|stop|restart|force-reload}" >&2
        exit 1
        ;;
esac
 
exit 0
```
Donde tendremos que cambiar el contenido de las líneas siguientes, para ajustarlo a nuestras necesidades.

- NAME
- DESC
- DAEMON
- DAEMON_OPTS

Una vez creado el archivo con el contenido mencionado anteriormente, tendremos que darle permisos de ejecución (0755).
```shell
sudo chmod +x /etc/init.d/soluciones_service
sudo chmod +x /home/cesar/script/contador.php
```

Tras éstos pasos ya podremos usar los siguientes comandos:
```shell
sudo service soluciones_service start
sudo service soluciones_service restart
sudo service soluciones_service stop
```
