fuentes:
- https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04
- 


# instalacion de servidor ftp ubutnu

Step 1 — Installing vsftpd
Start by updating your package list:

```shell
sudo apt update -y 
#&& sudo apt dist-upgrade -y
# ------- Ahora instalamos el paquete que nos instala paquetes esenciales: 
sudo apt-get install -y build-essential
# instalar utilidades
sudo  apt-get install util-linux tree vim curl iftop -y 
```
Next, install the vsftpd daemon:

```shell
sudo apt install vsftpd
```

realizar una copia de la configuracion
```shell
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.back
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


## Reinicie el demonio para cargar los cambios de configuración:

```shell
sudo systemctl enable vsftpd
sudo systemctl restart vsftpd
```


### Ver log
```shell
tail -f /var/log/vsftpd.log
```
