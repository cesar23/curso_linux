fuentes:
- https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04
- 


# instalacion de servidor ftp ubutnu

Step 1 — Installing vsftpd
Start by updating your package list:

```shell
#sudo apt update -y && sudo apt dist-upgrade -y
sudo apt update  -y
# ------- Ahora instalamos el paquete que nos instala paquetes esenciales: 
sudo apt-get install -y build-essential
# instalar utilidades
sudo  apt-get install util-linux tree vim curl iftop -y 
```
Next, install the vsftpd daemon:

```shell
sudo apt install vsftpd -y
```

realizar una copia de la configuracion
```shell
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.back
```


Check the firewall status:
```shell
sudo ufw status
```

activar puertos
```shell
sudo ufw allow 20,21,22,990/tcp
```



```shell
sudo ufw status
```
## Preparar el directorio de usuarios

```shell
# crear usuario
sudo adduser userftp
# password: userftp

# crear carpeta
sudo mkdir /home/userftp/ftp


# Establecer su propiedad:
sudo chown nobody:nogroup /home/userftp/ftp

# Eliminar permisos de escritura:
sudo chmod a-w /home/userftp/ftp

# Verifique los permisos:
sudo ls -la /home/userftp/ftp

# A continuación, cree el directorio para cargar archivos:
sudo mkdir /home/userftp/ftp/files

# Luego asigne la propiedad al usuario:
sudo chown userftp:userftp /home/userftp/ftp/files

# Una verificación de permisos en el ftpdirectorio debería devolver el siguiente resultado:
sudo ls -la /home/userftp/ftp

```

##   Configurar el acceso FTP

```shell
sudo vim /etc/vsftpd.conf
```

Una vez que haya abierto el archivo, confirme que la anonymous_enabledirectiva está configurada en NOy la local_enabledirectiva está configurada en YES:

![](https://i.imgur.com/H4KYZnZ.png)
```shell
. . .
# Allow anonymous FTP? (Disabled by canvas.cesar.com.conf).
anonymous_enable=NO
#
# Uncomment this to allow local users to log in.
local_enable=YES
. . .
```

habilitaremos para que los usuarios eliminen archivos
![](https://i.imgur.com/KoCdOZZ.png) 
```shell
write_enable=YES
```


Quite el comentario chrootpara evitar que el usuario conectado por FTP acceda a cualquier archivo o comando fuera del árbol de directorios:
![](https://i.imgur.com/om0A6Hh.png) 
```shell
chroot_local_user=YES
```

A continuación, agregue una user_sub_tokendirectiva cuyo valor sea la $USERvariable de entorno. Luego agregue una local_rootdirectiva y configúrela en la ruta que se muestra, que también incluye la $USERvariable de entorno. Esta configuración garantiza que la configuración permitirá que este usuario y los usuarios futuros sean enrutados al directorio de inicio del usuario apropiado al iniciar sesión. Agregue esta configuración en cualquier parte del archivo:
![](https://i.imgur.com/ogPQ39X.png) 
```shell
user_sub_token=$USER
local_root=/home/$USER/ftp
```

Limite el rango de puertos que se pueden usar para FTP pasivo para garantizar que haya suficientes conexiones disponibles:
![](https://i.imgur.com/kRKpn5X.png) 
```shell
pasv_min_port=40000
pasv_max_port=50000
```

## Reinicie el demonio para cargar los cambios de configuración:

```shell
sudo systemctl restart vsftpd
```


## Abrir mas de un puerto
```shell
# sudo vim /etc/vsftpd.conf
listen_port=2020
#ftp_data_port=2121
```

### Ver log
```shell
tail -f /var/log/vsftpd.log
```
