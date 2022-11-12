#! /bin/sh


#---------------------------------------------------------------------------
#------------------ PASO 1 - CRERA EL ARCHIVO A  EJECUTAR ------------------
#---------------------------------------------------------------------------
#------------------- vim /root/peru_service.php
#---------------------------------------------------------------------------

<?php

$filename = "peru_service.log";

while (true) {
	sleep(2);
	$present = date('l | jS \of F Y h:i:s A', time());
	$entry = $present."\n";
	file_put_contents($filename, $entry, FILE_APPEND|LOCK_EX);
 }
?>



#---------------------------------------------------------------------------
#------------------ PASO 1.2 - permisos ------------------
#---------------------------------------------------------------------------
chmod +x /root/peru_service.php



#---------------------------------------------------------------------------
#------------------ PASO 2 - CREAR EL ARCHIVO DE SERVICIO------------------
#---------------------------------------------------------------------------
#------------------- vim /etc/init.d/relog_servicio
#---------------------------------------------------------------------------

#! /bin/sh
NAME=relog_servicio
DESC="Demonio del servicio de reloj en PHP"
PIDFILE="/var/run/${NAME}.pid" #ruta  dond e se guarda el pid de ejecucion
LOGFILE="/var/log/${NAME}.log" # ruta  dodne se  guardara el log del servico 

#indicamos que vamos a ejecutar un archivo PHP
DAEMON="/usr/bin/php"
#Ruta del archivo
DAEMON_OPTS="/root/peru_service.php"

START_OPTS="--start --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ${DAEMON_OPTS}"

##-----------------------------Ejemplo para  entender lo de arriba ----------------
										 # start-stop-daemon --start --chuid <username> --background --make-pidfile --pidfile /var/run/<pidfile>.pid --exec $PROGRAM -- $PROGRAM-ARGUMENT
										   # `--chuid username`: establezca el usuario en el que desea ejecutar el programa.
										   #                    (Se recomienda no ejecutarlo con acceso de root)
											
										  # `--backgroud`: hacer que el programa se ejecute en segundo plano
										  
										  # `--make-pidfile`: forzar el programa para crear un archivo pid
										  #               (a veces no funciona consultar documento de `start-stop-daemon` for more

										  # `--pidfile`: especifique pidfile para el programa
										  
										  # `$PROGRAM-ARGUMENT`: es ARGUMENTO para el programa
										  
										# fuente:https://kiennt.com/blog/2012/06/29/run-program-and-generate-pid.html

##-----------------------------Fin Ejemplo para  entender lo de arriba ----------------

STOP_OPTS="--stop --pidfile ${PIDFILE}"

#si no existe el archivo y no es  un ejecutable saldra
test -x $DAEMON || exit 0

# opción indica a bash que salga inmediatamente si algún comando 
# tiene un estado de salida distinto de cero
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


##---------------------------------------------
### BEGIN INIT INFO
# Provides:          single
# Required-Start:    $local_fs $all killprocs
# Required-Stop:
# Default-Start:     1
# Default-Stop:
# Short-Description: executed by init(8) upon entering runlevel 1 (single).
### END INIT INFO

PATH=/sbin:/bin

#indicamos que vamos a ejecutar un archivo PHP
DAEMON="/usr/bin/php"
#Ruta del archivo
DAEMON_OPTS="/root/peru_service.php"
MYSERVICE_BIN="php /root/peru_service.php"
RETVAL=0


. /lib/lsb/init-functions

do_start () {
        log_action_msg "Will now switch to single-user mode"
        exec init -t1 S
}

case "$1" in
  start)
        echo -n $"Starting SimpleHttp server: "
       $MYSERVICE_BIN &
        RETVAL=$?
        echo
        return $RETVAL
        exit 3
        ;;
  stop|status)
        echo -n $"Stopping SimpleHttp server: "
        killproc $MYSERVICE_BIN
        RETVAL=$?
        echo
        return $RETVAL
        ;;
  *)
        echo "Usage: $0 start|stop" >&2
        exit 3
        ;;
esac




#---------------------------------------------------------------------------
#------------------ PASO 3 - DAREL PERMISOS------------------
#---------------------------------------------------------------------------

# Por último sólo tenemos que darle permiso al archivo recien creado.
chmod +x /etc/init.d/relog_servicio

#comando update-rc.d que este script va a ser un servicio a arrancar en los runlevels por defecto.
update-rc.d relog_servicio defaults

# Y esto es todo, si queremos activar el demonio tan sólo tenemos que escribir la siguiente línea:
service relog_servicio start
