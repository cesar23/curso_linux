# --------Ejecutar un script al iniciar sesión 



# fuente:https://www.alvarolara.com/2013/03/20/ejecutar-un-script-al-iniciar-sesion-en-ubuntu/
#---------------------------------------
#----------------------------------------------  metodo 1--- /etc/rc.local ----
#---------------------------------------

vim  /home/usuario/script.sh
chmod +x /home/usuario/script.sh

sudo nano /etc/rc.local
        #!/bin/sh -e
        #
        # rc.local
        #
        # This script is executed at the end of each multiuser runlevel.
        # Make sure that the script will "exit 0" on success or any other
        # value on error.
        #
        # In order to enable or disable this script just change the execution
        # bits.
        #
        # By default this script does nothing.
        sleep 100 #poner un sleep 100 antees qeu  inicie  systema
        sh /home/usuario/script.sh
        exit 0

#---------------------------------------
#----------------------------------------------  metodo 2--- crontab ----
#---------------------------------------
vim  /etc/crontab

@reboot ( sleep 100 ; servicio_notification )
@reboot ( sleep 100 ; servicio_notification_marine )
# @reboot ( sleep 90 ; sh \location\script.sh )