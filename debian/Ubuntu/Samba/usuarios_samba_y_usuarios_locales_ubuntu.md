# 1. CREACIÓN DE USUARIOS para SAMBA


### - Crear usuario local en la maquina Linux:
un usuario normal de linux
```shell
useradd sambauser
```
### - Crear usuario como usuario de samba,con el comando smbpasswd.

`smbpasswd` es un comando de Linux que permite configurar la contraseña o password de un usuario Samba.

```shell
smbpasswd -a sambauser
```
### Listar usuarios samba
Podemos listar todos los usuarios habilitados para acceder como clientes Samba, con el comando:

```shell
pdbedit -L
```

# 2. Creación de Usuarios y Grupos locales para SAMBA
Creamos el grupo administración y el grupo jefes:

```shell
sudo groupadd administracion
sudo groupadd jefes
```
<img width="90%" src="https://i.imgur.com/0hI44PX.png" alt="My cool logo"/>


Añadimos un usuario a cada uno de los grupos para hacer luego las pruebas (creamos el usuario en la máquina y después su password):


```shell
# primer usuario
sudo useradd administracionuser
sudo passwd administracionuser

# segundo usuario
sudo useradd jefeuser
sudo passwd jefeuser
```
<img width="90%" src="https://i.imgur.com/9tKXACD.png" alt="My cool logo"/>


# 2.1 Añadir usuarios locales a grupos locales

- Añadimos el usuario `administracionuser` al grupo `administracion`

- y el usuario `jefeuser` al grupo `jefes`

Como ya existen, no usaremos
```shell
sudo useradd -g administracion administracionuser
```

Sino:

```shell
sudo usermod -g administracion administracionuser
sudo usermod -g jefes jefeuser
```
<img width="90%" src="https://i.imgur.com/clNibIM.png" alt="My cool logo"/>

sintax
```shell
usermod -g <grupo> <usuario>
```

# 3. CREAR USUARIOS LOCALES COMO USUARIOS SAMBA

–> Ahora hemos de crear esos usuarios locales como usuarios en SAMBA

```shell
sudo smbpasswd -a administracionuser
sudo smbpasswd -a jefeuser
# mi usuarioque me logeo
sudo smbpasswd -a cesar
```
<img width="90%" src="https://i.imgur.com/QfTdlE0.png" alt="My cool logo"/>

# 4. PERMISOS LOCALES ADECUADOS PARA LOS RECURSOS COMPARTIDOS SAMBA (crear permisos en carpeta para equipo)

Es importante reseñar que si no otorgamos los permisos del directorio en Linux, al intentar acceder al recurso compartido, aunque hayamos especificado qué grupos de usuarios de samba pueden leer o escribir en dichos directorios (especificado en el archivo smb.conf), Linux aplicará los permisos más restrictivos.

Por tanto, aplicamos permiso recursivo ``775`` al directorio (al ser recursivo se aplicará a los subdirectorios y ficheros que se creen después dentro de ese directorio), y cambiamos el propietario de los recursos al grupo que deseamos que tenga permisos de escritura; y después en Samba definimos los grupos que pueden leer y/o escribir.

Así que sobre el directorio administracion, en el cual queremos aplicar una configuración de lectura y escritura basada en grupos (solo podrá escribir el grupo administracion), ejecutamos:


Creamos los directorios:

```shell
# /srv/samba/administracion
# /srv/samba/publico

sudo mkdir -p /srv/samba/publico
sudo mkdir -p /srv/samba/administracion
```


```shell
sudo chmod 775 /srv/samba/administracion
```
Y cambiamos el usuario y grupo propietarios al grupo que puede escribir :

```shell
sudo chown -hR root:administracion /srv/samba/administracion
```


## 🧡 Resumen para poner un usuario local y poner su carpeta raiz como compartida

```shell
# agregar usuario local al grupo de samba y ponerle un passwprd
sudo smbpasswd -a cesar

# editar el archivo de configuracion
sudo -E-s nvim /etc/samba/smb.conf
```
agregar al final de la  linea

```shell
# ....
[cesar]
    path = /home/cesar
    browseable = yes
    read only = yes
    force create mode = 0660
    force directory mode = 2770
    # Todos que son pepito y  adminsamba
    valid users = cesar

```
