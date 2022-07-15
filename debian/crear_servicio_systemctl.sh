# listar servicios de systemctl 
systemctl list-unit-files

# Si estoy en un sistema basado en System V
service --status-all


# creamso  el archivo de  servicio

vim /etc/systemd/system/prueba.service

[Unit]
Description=Servicio de prueba inicial en debian
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
#RestartSec=1
User=root
WorkingDirectory=/root
ExecStart=/root/conexiones.sh
ExecStop=/root/BorrarConexiones.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target


#--------------scrip start
vim /root/conexiones.sh
	
	#!/bin/bash

	  while :
		do

		  DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
		  echo "HORA -conexiones ${DATE_HOUR}">> conexiones.log #ojo si hay un echo en el proceso segundo plano se vera

		  sleep 2
		done

chmod +x /root/conexiones.sh


#--------------scrip stop
vim /root/BorrarConexiones.sh
	
	#!/bin/bash

	  DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
	  echo "BorrarConexiones ${DATE_HOUR}">BorrarConexiones.log #ojo si hay un echo en el proceso segundo plano se vera


chmod +x /root/BorrarConexiones.sh

#cargamos el servicio
root@ubuntu:/root# systemctl daemon-reload
#buscamos el servicio
root@ubuntu:/root# systemctl list-unit-files -t service | grep prueba
				# prueba.service                             disabled
				
root@ubuntu:/root# systemctl start prueba.service

root@ubuntu:/root# systemctl status prueba.service
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
