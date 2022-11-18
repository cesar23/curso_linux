
# 1. Para crear un nuevo usuario llamado josh, use el siguiente comando:

sudo useradd -M -d /samba/josh -s /usr/sbin/nologin -G sambashare josh

sudo useradd -M -d /samba/administracion3 -s /usr/sbin/nologin -G sambashare administracion3
sudo useradd -M -d /samba/programacion3 -s /usr/sbin/nologin -G sambashare programacion3

# Las useradd opciones tienen los siguientes significados:
# -M-no cree el directorio de inicio del usuario. Crearemos manualmente este directorio.
# -d /samba/josh- establece el directorio de inicio del usuario en /samba/josh.
# -s /usr/sbin/nologin - deshabilitar el acceso de shell para este usuario.
# -G sambashare- Agregar el usuario al sambasharegrupo.



# 2.Cree el directorio de inicio del usuario y establezca la propiedad del directorio en usuario joshy grupo sambashare:

mkdir /samba/programacion3
mkdir /samba/administracion3
chown administracion3:sambashare /samba/administracion3
chown programacion3:sambashare /samba/programacion3

/samba/publico
/samba/administracion3
/samba/programacion3


# 3 .establece los permisos del directorio 2770 y el sadminusuario crea un nuevo archivo, 
# el usuario joshno podrá leer / escribir en este archivo.

chmod 2770 /samba/administracion3
chmod 2770 /samba/programacion3


# 4. Agregue la joshcuenta de usuario a la base de datos de Samba 
# configurando la contraseña de  usuario:
sudo smbpasswd -a administracion3  # sele puso de pass=  admin2018
sudo smbpasswd -a programacion3 #  sele puso de pass= programacion3

# 5. Una vez establecida la contraseña, habilite la cuenta Samba escribiendo:

sudo smbpasswd -e administracion3
sudo smbpasswd -e programacion3



# 6. A continuación, creemos un usuario y un grupo sadmin. Todos los miembros de este grupo tendrán permisos 
# administrativos. Más adelante, si desea otorgar permisos administrativos a otro usuario, simplemente agregue 
# ese usuario al sadmingrupo .
# Cree el usuario administrativo escribiendo:

 useradd -M -d /samba/users -s /usr/sbin/nologin -G sambashare sadmin


# 7. El comando anterior también creará un grupo sadmin y agregará el usuario a ambos sadminy sambashare grupos.
# Establezca una contraseña y habilite al usuario:

smbpasswd -a sadmin # el pass se le puso= adminadmin
smbpasswd -e sadmin

# 8. A continuación, cree el Usersdirectorio compartido:

mkdir /samba/users

# 9. Establezca la propiedad del directorio en usuario sadmin y grupo sambashare:

chown sadmin:sambashare /samba/users

# 10 .Este directorio será accesible para todos los usuarios autenticados. El siguiente comando 
# configura el acceso de escritura / lectura a los miembros del sambashare grupo en el /samba/users directorio:

chmod 2770 /samba/users



# 11.  IMPORTANTE Verifique la base de datos de los usuarios de Samba:
pdbedit -L


---------------------------------------------------------------
------------- Aplicar contexto SELinux --------------------
---------------------------------------------------------------

#.1 Veamos el contexto predeterminado de SELinux:
sestatus -v
#-- modo seLinux enforcing 0
setenforce 1 #enforcing
setenforce 0  #premisivo
#editar selinux 
vi /etc/selinux/config

#verificar si hay errores de linux si los  hay
#less /var/log/messages





# En preparación para configurar /samba como un recurso compartido de Samba, 
# tendremos que desactivar SELinux o establecer los valores de contexto 
# booleanos y de seguridad adecuados de la siguiente manera 
# (de lo contrario, SELinux evitará que los clientes accedan al recurso compartido):

setsebool -P smbd_anon_write=1
setsebool -P samba_export_all_ro=1 samba_export_all_rw=1
getsebool -a | grep samba_export

#permitir a las carpetas en se linux la escritura
semanage fcontext -a -t samba_share_t "/samba/administracion3(/.*)?"
semanage fcontext -a -t samba_share_t "/samba/programacion3(/.*)?"

restorecon /samba/administracion3
restorecon /samba/programacion3
restorecon /samba
restorecon -R -v /samba/administracion3
restorecon -R -v /samba/programacion3
setsebool -P allow_smbd_anon_write 1


# ls -dZ /srv/samba_*
drwxrwsr-x. root devops unconfined_u:object_r:var_t:s0  /srv/samba_group
drwxrwxrwx. root root   unconfined_u:object_r:var_t:s0  /srv/samba_pub




---------------------------------------------------------------
------------- Configurar acciones de Samba --------------------
---------------------------------------------------------------

# 1. Abra el archivo de configuración de Samba y agregue las secciones:
sudo nano /etc/samba/smb.conf


[users]
    path = /samba/users
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = @sambashare @sadmin

[josh]
    path = /samba/josh
    browseable = no
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = josh @sadmin


# Las opciones tienen los siguientes significados:

# [users] y [josh]- Los nombres de los recursos compartidos que utilizará al iniciar sesión.
# path - El camino a la acción.
# browseable- Si el recurso compartido debe figurar en la lista de acciones disponibles. Al configurar a nootros usuarios no podrá ver el recurso compartido.
# read only- Si los usuarios especificados en la valid userslista pueden escribir en este recurso compartido.
# force create mode - Establece los permisos para los archivos recién creados en este recurso compartido.
# force directory mode - Establece los permisos para los directorios recién creados en este recurso compartido.
# valid users- Una lista de usuarios y grupos que pueden acceder al recurso compartido. Los grupos tienen el prefijo con el @símbolo.





# 2. Una vez hecho esto, reinicie los servicios de Samba con:

systemctl restart nmb
systemctl restart smb 
# 3. verificar configuracion:
testparm



---------------------------------------------------------------
------------- Carpeta publica --------------------
---------------------------------------------------------------
 #1..  creamos una  carpeta publica para  todos

 mkdir /samba/publico
 chmod 777 -R /samba/publico
 chmod 2770 -R /samba/publico
 chown -R nobody:nogroup /samba/publico

chown -R nobody.nobody /samba/publico
chmod -R 777 /samba/publico


#2. seLinux
setsebool -P samba_export_all_ro=1 samba_export_all_rw=1
semanage fcontext -at samba_share_t "/samba/publico(/.*)?"

restorecon /samba/publico
restorecon -R -v /samba/publico
setsebool -P allow_smbd_anon_write 1

 # mkdir -p /srv/samba/anonymous
# chmod -R 0775 /srv/samba/anonymous
# chown -R nobody:nobody /srv/samba/anonymous

# 2. Abra el archivo de configuración de Samba y agregue las secciones:
sudo nano /etc/samba/smb.conf



[global]
    workgroup = WORKGROUP
    server string = Samba Server %v
    netbios name = ubuntu
    security = user
    map to guest = bad user
    name resolve order = bcast host
    dns proxy = no
    bind interfaces only = yes

[publico]
    public = yes   
    path = /samba/publico
    writable = yes
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    guest only=yes  

[administracion3]
    path = /samba/administracion3
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = administracion3 @sadmin

[programacion3]
    path = /samba/programacion3
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = programacion3 @sadmin
