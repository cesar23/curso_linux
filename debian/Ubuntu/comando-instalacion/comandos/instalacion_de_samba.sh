1. Actualizar el sistema:
 sudo apt update

2. Instalar Samba:
 sudo apt install samba

3. Revisamos que el servicio este corriendo sin problemas:
 sudo systemctl status nmbd


4. Revisar el firewall, aquí debemos enterarnos si esta activado o desactivado
 sudo ufw status
 sudo ufw enable
 sudo ufw disable
 sudo ufw app list
 sudo ufw app info "Samba"
 sudo ufw allow "Samba"

5. Crear copia del archivo de configuración de samba
 cd /etc/samba
 sudo cp smb.conf smb.conf.copia
 
6. Revisar algunas configuraciones globales
 sudo gedit /etc/samba/smb.conf

 ...
 # Most people will want "standalone sever" or "member server".
 # Running as "active directory domain controller" will require first
 # running "samba-tool domain provision" to wipe databases and create a
 # new domain.
    server role = standalone server
 ...

 ...
 # The specific set of interfaces / networks to bind to
 # This can be either the interface name or an IP address/netmask;
 # interface names are normally preferred
 interfaces = 127.0.0.0/8 eth0

 # Only bind to the named interfaces and/or networks; you must use the
 # 'interfaces' option above to use this.
 # It is recommended that you enable this feature if your Samba machine is
 # not protected by a firewall or is a firewall itself.  However, this
 # option cannot handle dynamic or non-broadcast interfaces correctly.
 bind interfaces only = yes
 ...

#  Si hubo cambios es necesario reiniciar el servicio para que este tenga efecto
 sudo systemctl restart nmbd 
 sudo service smbd restart


# CREANDO USUARIOS Y DIRECTORIOS

# 7. En nuestro directorio home vamos a crear la carpeta "samba"
 sudo mkdir compartido

# 8. Cuando Samba se instala crea un grupo llamado "sambashare", entonces vamos a dejar como propietario
# de la carpeta "samba" recien creada a nuestro grupo "sambashare"
 sudo chgrp sambashare compartido

# 9. Creamos un usuario dentro del sistema pero que solo utilizará el servicio de samba
 sudo useradd -M -d /compartido/pepito2 -s /usr/sbin/nologin -G sambashare pepito2

  -M -do not create the user’s home directory. We’ll manually create this directory.
    -d /samba/pepito2 - set the user’s home directory to /samba/pepito2.
      -s /usr/sbin/nologin - disable shell access for this user.
     -G sambashare - add the user to the sambashare group.

# 10. Creamos el directorio que será compartido bajo la propiedad del usuario que recien se creó
 sudo mkdir /home/cesar/compartido/pepito2
 sudo chown pepito2:sambashare /home/cesar/compartido/pepito2

# 11. Configuramos algunos permisos sobre el directorio
 sudo chmod 2770 /home/cesar/compartido/pepito2

# 12. Asignamos una contraseña de samba para el usuario que recien creamos
 sudo smbpasswd -a pepito2

# 13. Habilitamos esa contraseña con ese usuario para samba
 sudo smbpasswd -e pepito2



 #14..  creamos una  carpeta publica para  todos

 sudo mkdir /home/cesar/compartido/publico
 sudo chmod 777 -R /home/cesar/compartido/publico
 sudo chmod 2770 -R /home/cesar/compartido/publico
 sudo chown admin:sambashare /home/cesar/compartido/publico


#Verificamos la configuración ejecutando el siguiente comando:
>testparm

CONFIGURACIÓN DEL ARCHIVO SMB.CONF

[publico]
    path = /home/cesar/compartido/publico
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = @sambashare @admins

[pepito2]
    path = /home/cesar/compartido/pepito2
    browseable = no
    read only = no
    #------------soli  si hay problemas de acceso paar  un usuario administrador
    #force user = root 
    #force group = root
    force create mode = 0660
    force directory mode = 2770
    valid users = pepito2 @admins


#fuente: https://www.cambiatealinux.com/instalar-y-configurar-samba-en-ubuntu-linux
                                                      # sudo smbpasswd -L -a asolano
                                                      # ponemos un password
                                                      # sudo smbpasswd -L -e asolano
# [pruebas_samba]
# comment = directorio de pruebas samba
# path = /home/depruebas/pruebas_samba
# guest ok = no
# writeable = yes
# write list = depruebas
# browseable = yes
# create mask = 0755
# directory mask = 0755
