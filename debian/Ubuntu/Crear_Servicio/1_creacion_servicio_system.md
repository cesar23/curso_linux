# creacion de servicio con system linux

## 1. creaciondel servicio
 crearemos el servicio en `sudo nano /etc/systemd/system/cesar.service`
```shell
[Unit]
Description=Servicio Cesar
# ::::::: siqueremos que inicie despues que otro servicio aya iniciado
#After=network.target mysql.service
#Before=network.target mysql.service
[Service]
Type=simple
# User=cesar
# :::directorio de trabajo
# WorkingDirectory=/home/cesar/script

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
sudo chmod +x /home/cesar/script/servicio_creacion_fichero.py
sudo chmod +x /home/cesar/script/start_servicio.sh
sudo chmod +x /home/cesar/script/stop_servicio.sh
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
