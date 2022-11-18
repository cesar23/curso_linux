

#---------------------------------------------------------------------------
#------------------ PASO 1 - CRERA EL SERVICIO ------------------
#---------------------------------------------------------------------------
#------------------- vim /etc/systemd/system/servicio_notification.service
#---------------------------------------------------------------------------

[Unit]
Description=Script creado por :Cesar Auris
After=networking.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/noficication_node
ExecStop=/usr/local/bin/noficication_node_apagado
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target


#---------------------------------------------------------------------------
#------------------ PASO 2 - CRERA EL ARCHIVO A  EJECUTAR START	 ------------------
#---------------------------------------------------------------------------
#------------------- vim /usr/local/bin/noficication_node
#---------------------------------------------------------------------------


#!/bin/bash
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"

cd /home/cesar/project_terrestre_node

STATUS=$?
if (( $STATUS!=0 )); then
   logger -p local6.info "ERROR no se  encontro la ubicacion: /home/cesar/project_terrestre_node"
   exit
fi

logger -p local6.info "INFO: servicio[projetc terrestre]: ${DATE_HOUR}"
npm run serve



STATUS=$?
if (( $STATUS!=0 )); then
   logger -p local6.info "ERROR se pudo ejecutar: npm run serve"
   exit
fi

#---------------------------------------------------------------------------
#------------------ PASO 3 - CRERA EL ARCHIVO A  EJECUTAR STOP	 ------------------
#---------------------------------------------------------------------------
#------------------- vim /usr/local/bin/noficication_node_apagado
#---------------------------------------------------------------------------

#!/bin/bash
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
logger -p local6.info "INFO: servicio[projetc terrestre]: APAGADO: ${DATE_HOUR}"