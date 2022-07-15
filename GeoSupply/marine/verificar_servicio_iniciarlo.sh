#!/bin/bash
DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
# systemctl list-unit-files | grep servicio_notification| grep disabled | wc -l
# con esto comprobamos si el servicio esat  apagado o deteneido
var=`systemctl status servicio_notification_marine | grep "active (running)"| wc -l`
if [ $var -eq 0 ];then
        systemctl start servicio_notification_marine
echo "${DATE_HOUR}| se inicio servicio - ${var}" >> /usr/local/service/check_service.log
else
        echo "${DATE_HOUR}| todo ok - ${var}"  >> /usr/local/service/check_service.log
fi

# luego siempre  hacer  el  tail de los para  ver cuando estubo corriendo
# tail -f /usr/local/service/check_service.log