### Algunos comandos mas usados 

```shell
#   help    =>  Enumerar todos los comandos de FTP disponibles.
#   cd      =>  Cambia el directorio en la máquina remota.
#   lcd     =>  Cambiar el directorio en la máquina local.
#   ls      =>  Ver los nombres de los archivos y directorios en el directorio remoto actual.
#   mkdir   =>  Crea un nuevo directorio dentro del directorio remoto.
#   pwd     =>  Imprime el directorio de trabajo actual en la máquina remota.
#   delete  =>  Elimina un archivo en el directorio remoto actual.
#   rmdir   =>  Elimina un directorio en el directorio remoto actual.
#   get     =>  Copia un archivo del servidor remoto a la máquina local.
#   mget    =>  Permite copiar múltiples archivos del servidor remoto a la máquina local.
#   put     =>  Copia un archivo de la máquina local a la máquina remota.
#   mput    =>  Copia un archivo de la máquina local a la máquina remota.
```

# 1. Login desde la terminal
```shell
> ftp 192.168.0.40
Name (192.168.0.40:cesar): cesar
Password:
# 230 Login successful.
```
<img width="50%" src="https://i.imgur.com/D67mg20.png" alt="My cool logo"/>

-- -- 


## 1.2 ver ubicacion del remoto y descargar fichero
```shell
# :::::::::::::: listar directorio remoto
ftp> ls
# 200 PORT command successful. Consider using PASV.
# 150 Here comes the directory listing.
# -rw-------    1 1000     1000         2874 Aug 09  2022 deftp.xml
# drwxrwsr-x    7 1000     1000         4096 Jan 11 23:35 docker
# -rw-r--r--    1 0        0            5849 Mar 27 19:41 vsftp.conf
# 226 Directory send OK.

# :::::::::::::: descargar fichero remoto
ftp> get defp.xml
# 200 PORT command successful. Consider using PASV.
```
<img width="60%" src="https://i.imgur.com/fpwk1mU.png" alt="My cool logo"/>

-- -- 
se descargara donde nosotros nos logeamos al Ftp

<img width="80%" src="https://i.imgur.com/sCWbZ3o.png" alt="My cool logo"/>

-- -- 

## 1.3 Subiendo archivos con comandos FTP

```shell
ftp> put /drives/d/repos/curso_linux/debian/Ubuntu/FTP_instalacion/login_shell/demo.txt demo.txt
#   200 PORT command successful. Consider using PASV.
#   150 Ok to send data.
#   226 Transfer complete.
#   15 bytes sent in 0.000374 seconds (40106 bytes/s)
```
<img width="80%" src="https://i.imgur.com/jW0zBBX.png" alt="My cool logo"/>

-- -- 
