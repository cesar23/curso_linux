fuente: https://www.youtube.com/watch?v=s42Kp1A_yUI

### Cómo compartir carpetas en Linux PASO a PASO

Para poder compartir carpetas en Linux (también aplica a los archivos) como primer medida <br>tenemos que contar con «Samba» ya instalado en el sistema.

Si no lo tenemos instalado abrimos una terminal y en ella escribimos el siguiente comando:

```shell
    sudo apt update
    sudo apt install samba
```

### ojo si  hay  algun error o  bloqueo  ejecutar 
![](https://i.imgur.com/iuX0SMs.png) 
```shell
    sudo rm /var/lib/dpkg/lock
```


Si usas KDE como escritorio, tal vez quieras también incluir el paquete kdenetwork-filesharing. Esto lo haces así:

    sudo apt install kdenetwork-filesharing
Con estos paquetes instalados ya podemos configurar «Samba» para que nos permita compartir carpetas en Linux por ejemplo con Windows.


### 3. Revisamos que el servicio este corriendo sin problemas:
```shell
sudo systemctl status nmbd
```
![](https://i.imgur.com/v2gdbKq.png) 


### 4. Revisar el firewall, aquí debemos enterarnos si esta activado o desactivado
```shell
 sudo ufw status
 sudo ufw enable
 sudo ufw disable
 sudo ufw app list
 sudo ufw app info "Samba"
    #--------- para  darle el permiso del firewall a samba
    sudo ufw allow "Samba"
    sudo ufw allow samba
    sudo ufw allow "OpenSSH"
```

```shell
# allow outbound icmp
-A ufw-before-output -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A ufw-before-output -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
```
Guardar configuracion..
```shell
sudo ufw reload
```

### 4.2 Revisar Estado deFirewall
```shell
 sudo ufw status
```
![](https://i.imgur.com/5x0A9YJ.png)    

### 5. Crear copia del archivo de configuración de samba
```shell
 cd /etc/samba
 sudo cp smb.conf smb.conf.copia
```
 
### 6. Revisar algunas configuraciones globales
```shell
 sudo vim smb.conf
 # editarlo con nvim
 sudo -E-s nvim /etc/samba/smb.conf
```

```shell

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

```


 Si hubo cambios es necesario reiniciar el servicio para que este tenga efecto
```shell
 sudo systemctl restart nmbd
```


#CREANDO USUARIOS Y DIRECTORIOS

### 7. En nuestro directorio home vamos a crear la carpeta "compartido"
```shell
 sudo mkdir /compartido
```


### 8. Cuando Samba se instala crea un grupo llamado "sambashare", entonces vamos a dejar como propietario
# de la carpeta "compartido" recien creada a nuestro grupo "sambashare"
```shell
sudo chgrp sambashare /compartido
```

### 9. Creamos un usuario dentro del sistema pero que solo utilizará el servicio de samba
```shell
 sudo useradd -M -d /compartido/pepito -s /usr/sbin/nologin -G sambashare pepito

  -M -do not create the user’s home directory. We’ll manually create this directory.
  -d /samba/pepito - set the user’s home directory to /samba/pepito.
  -s /usr/sbin/nologin - disable shell access for this user.
  -G sambashare - add the user to the sambashare group.

```


### 10. Creamos el directorio que será compartido bajo la propiedad del usuario que recien se creó
```shell
 sudo mkdir /compartido/pepito
 sudo chown pepito:sambashare /compartido/pepito
```

### 11. Configuramos algunos permisos sobre el directorio
```shell
sudo chmod 2770 /compartido/pepito
```

### 12. Asignamos una contraseña de samba para el usuario que recien creamos
```shell
sudo smbpasswd -a pepito
```

### 13. Habilitamos esa contraseña con ese usuario para samba
```shell
sudo smbpasswd -e pepito
```

### 13.2 creamos un usuario adminsamba
```shell
sudo useradd -M -d /compartido/publico -s /usr/sbin/nologin -G sambashare adminsamba
sudo smbpasswd -a adminsamba
sudo smbpasswd -e adminsamba
```



### 14.  creamos una  carpeta publica para  todos

```shell
 sudo mkdir /compartido/publico

 #-----------Opcion 1 -------------
 #------si queremos que guest  solo lectura
 sudo chmod 0755 -R /compartido/publico

 #-----------Opcion 2 -------------
 #------si queremos que guest  solo lectura y escritura
 sudo chmod 777 -R /compartido/publico

 #-----------Opcion 3 -------------
 #------La carpeta /compartido/publico debe tener acceso de lectura, escritura y ejecución para 
 #------todo el grupo sambashare y usuarios, así que para esto vamos a ejecutar:
 sudo chmod -R 0770 /compartido/publico
 sudo chown -R root:sambashare /compartido/publico

 sudo chmod 2770 -R /compartido/publico
 sudo chown adminsamba:sambashare /compartido/publico
```
# CONFIGURACIÓN DEL ARCHIVO SMB.CONF

```shell
[publico]
    path = /compartido/publico
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    guest ok = yes
    # Quienes pueden ingresar a este recurso  compartido
    # Todos que  pertenescan a samba y  adminsamba
    #valid users = @sambashare @adminsamba

[pepito]
    path = /compartido/pepito
    browseable = no
    read only = no
    force create mode = 0660
    force directory mode = 2770
    # Todos que son pepito y  adminsamba
    valid users = pepito @adminsamba

```

Luego de  eso  reiniciamos  samba
```shell
 sudo systemctl restart nmbd
 # y lo anadimo como servicio o al demonio
 sudo systemctl enable nmbd
```

###Verificamos la configuración ejecutando el siguiente comando:
```shell
testparm
```

evanzado: https://www.samba.org/samba/docs/using_samba/ch09.html

## si estas montando una  particion en samba
#### 💾 para NTFS
```shell
UUID=XXXXXXXXXXXXX /media/carpeta de montaje ntfs-3g default_permissions,uid=1000 0 0
# :: para usarlo con samba
UUID=XXXXXXXXXXXXX /media/common/multimedia1 ntfs-3g defaults,nls=utf8,_netdev,umask=000,user,owner 0 0
```
