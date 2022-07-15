# listar servicios de systemctl 
systemctl list-unit-files

# Si estoy en un sistema basado en System V
service --status-all


# creamso  el archivo de  servicio

vim /etc/systemd/system/servicio_notification_marine.service

[Unit]
Description=Script creado por :Cesar Auris
After=networking.target

[Service]
Type=simple
ExecStart=/usr/local/bin/noficication_node_marine
ExecStop=/usr/local/bin/noficication_node_marine_apagado
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target


#--------------scrip start
vim /usr/local/bin/noficication_node_marine
	
	#!/bin/bash
    DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"

    cd /var/www/geosupply.com.pe/marine_mensages
    # cd /home/cesar/project_terrestre_node


    STATUS=$?
    if (( $STATUS!=0 )); then
    logger -p local6.info "ERROR no se  encontro la ubicacion[projetc marino]: /var/www/geosupply.com.pe/terrestre_mensages"
    exit
    fi

    logger -p local6.info "INFO: servicio[projetc marino]: ${DATE_HOUR}"
    npm run serve



    STATUS=$?
    if (( $STATUS!=0 )); then
    logger -p local6.info "ERROR se pudo ejecutar[projetc marino]: npm run serve"
    exit
    fi


chmod +x /usr/local/bin/noficication_node_marine


#--------------scrip stop
vim /usr/local/bin/noficication_node_marine_apagado
	
	#!/bin/bash

	  DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
	  echo "BorrarConexiones ${DATE_HOUR}">BorrarConexiones.log #ojo si hay un echo en el proceso segundo plano se vera


chmod +x /usr/local/bin/noficication_node_marine_apagado
    #!/bin/bash
    DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
    logger -p local6.info "INFO: servicio[projetc terrestre]: APAGADO: ${DATE_HOUR}"



#cargamos el servicio
root@ubuntu:/root# systemctl daemon-reload
#buscamos el servicio
root@ubuntu:/root# systemctl list-unit-files -t service | grep servicio_notification_marine
				# prueba.service                             disabled
				
root@ubuntu:/root# systemctl start servicio_notification_marine.service

root@ubuntu:/root# systemctl status servicio_notification_marine.service
# ● prueba.service - Servicio de prueba inicial en debian
   # Loaded: loaded (/etc/systemd/system/prueba.service; disabled; vendor preset: enabled)
   # Active: active (running) since Tue 2019-10-22 12:44:24 -05; 3s ago
  # Process: 15503 ExecStop=/root/BorrarConexiones.sh (code=exited, status=203/EXEC)
 # Main PID: 15551 (conexiones.sh)
    # Tasks: 2
   # Memory: 276.0K
      # CPU: 17ms
   # CGroup: /system.slice/prueba.service
           # ├─15551 /bin/bash /root/conexiones.sh
           # └─15581 sleep 2

# Oct 22 12:44:24 ubuntu systemd[1]: Started Servicio de prueba inicial en debian.
