# creacion de servicio con system linux

## 1. creaciondel servicio SSH
 crearemos el servicio en `sudo nano /etc/systemd/system/cesar.service`
```shell
[Unit]
Description=Servicio Cesar
# ::::::: siqueremos que inicie despues que otro servicio aya iniciado
#After=network.target mysql.service
#Before=network.target mysql.service
[Service]
Type=simple
# :::si obia el User  ejecutar como Root
User=cesar
# :::directorio de trabajo
WorkingDirectory=/home/cesar/script

# ::::: par usar python
#ExecStart=/usr/bin/env python3 /home/cesar/script/servicio_creacion_fichero.py

ExecStart=sh /home/cesar/script/start_servicio.sh
# :::::por ahora no se puede  configurar
#ExecStop=sh /home/cesar/script/stop_servicio.sh
[Install]
# ::::: multi-user.target (modo no grafico)
WantedBy=multi-user.target
```

dar permiso de ejecucion
```shell
 sudo chmod +x /etc/systemd/system/cesar.service
 
sudo chmod +x /home/cesar/script/servicio_creacion_fichero.py
sudo chmod +x /home/cesar/script/start_servicio.sh
sudo chmod +x /home/cesar/script/stop_servicio.sh

# reconfiguramos  srevicio
sudo systemctl daemon-reload

```

## 1.2 Configuraciones del servicio
```shell
sudo systemctl daemon-reload
# bscamso  nuestrio serviio
sudo systemctl list-unit-files -t service | grep 'cesar'

# inicamos nuestro servicio
sudo systemctl start cesar
sudo systemctl stop cesar
```

## 2. creaciondel servicio con Python

1) Abrimos un terminal y creamos el fichero con las instrucciones  del nuevo servicio:

`vim /lib/systemd/system/mipy.service`

```shell
[Unit]
Description=Ejemplo
# para que  inici despues del servicio de internet
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=cesar
ExecStart=/usr/bin/env python3 /home/cesar/script/servicio_creacion_fichero.py

[Install]
WantedBy=multi-user.target
```
dar permisos
```shell
sudo chmod +x /home/cesar/script/servicio_creacion_fichero.py
sudo chmod +x /lib/systemd/system/mipy.service

# ::recargamso servicios
sudo systemctl daemon-reload
# bscamso  nuestrio serviio
sudo systemctl list-unit-files -t service | grep 'mipy'

# inicamos nuestro servicio
sudo systemctl start mipy
sudo systemctl stop mipy
```
