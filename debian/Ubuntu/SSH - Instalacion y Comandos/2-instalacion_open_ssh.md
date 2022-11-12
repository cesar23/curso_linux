[//]: # (Servidor ssh)
# instalacion de open ssh en debian ubuntu
 
```shell
sudo apt install openssh-server -y
```

### Ahora vamos a generar unas nuevas claves usando el comando 

```shell
ssh-keygen -t rsa
ssh-keygen -t dsa
```

Ahora vamos a ver el fichero de configuración de nuestro servidor SSH con

```shell
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_confi_bacup #bacup
sudo nano /etc/ssh/sshd_config

```





## 1 .🏆 Modificar el puerto de escucha de OpenSSH.

Por defecto escucha el puerto 22, pero si queremos que escuche otro, no tenemos que modificar en el fichero, la entrada donde hace referencia 
 a “Port 22“.

Podreis encontrarlo al principio del fichero.

Para establecer el puerto 2222 en lugar del 22, la linea de Port, quedaria:

Port 2222

## 2 .🏆 Para no permitir que se puedan conectar por SSH utilizando el usuario root, tendremos que ir a la seccion “Authentificacion“. En esta seccion hay una linea como esta:

 PermitRootLogin yes
Bien, para hacer que no se pueda conectar el usuario root, deberemos modificarla a “no“:

PermitRootLogin no

## 3 .🏆 Si queremos que cada vez que se relice sesion mediante SSH a nuestro servidor, muestre un mensaje en concreto, deberemos modificar el fichero que estamos comentando (/ect/ssh/sshd_config) para descomentar la linea:

X11 Forwarding: Nos indica que el reenviador X11 está activo
#Banner /etc/issue.net

## 4 . 🏆podemso personalizar el login ssh
Podemos, ya puestos, modificar el fichero `/etc/issue.net` para que muestre lo que nosotros queramos.

Reiniciar el servicio SSH

# Basta con ejecutar el siguiente comando:

```shell
sudo /etc/init.d/ssh restart
sudo systemctl status ssh
```
                                                                                                                                                 


### Si por alguna razón desea deshabilitar SSH en su máquina Ubuntu, simplemente puede detener el servicio SSH ejecutando:

```shell
sudo systemctl stop ssh
# Para comenzar de nuevo, ejecute:
sudo systemctl start ssh

# Para deshabilitar el servicio SSH para que se inicie durante el arranque del sistema:
sudo systemctl disable ssh

# Para habilitarlo nuevamente, escriba:
sudo systemctl enable ssh
```


# ------ AUTOINGRESO SSH--------

### 1 -  Generar la LLAVE id_rsa.pub en la pc  local

```shell
ssh-keygen
#luego de eso nos botara la ruta de la ubicacion del keygen
# Enter file in which to save the key (/y//.ssh/id_rsa):
#(OJO puede  estar ubicada  en otro klugar por lo general esta C:\Users\cauris\.ssh)
```


### 2  -  leer la clave ubicada en /y//.ssh/id_rsa.pub
   copiar el contenido en el servidor crea un archivo si no existe el la ubicacion /home/cesar/.ssh/authorized_keys

> Tenemos este  error al tratar de acceder
> <img  src="https://i.imgur.com/QoJzCEX.png" alt="My cool logo"/>


> nuestra key publica no esta como veremos
> <img  src="https://i.imgur.com/kM5z7VU.png" alt="My cool logo"/>

>y el servidor solo tenemos solo una  public key que no es nuestra
<img  src="https://i.imgur.com/m92J4PL.png" alt="My cool logo"/>

######  Ahora haremos el proceso de solucion par apoder acceder 

 - 🏆 Opcion 1
   - fuente: https://www.youtube.com/watch?v=_u3_z1ywWec
   
```shell
   #copiar desde una  ruta local al server
   #crear el archivo en el servidor y la  carpeta
   mkdir -p /home/cesar/.ssh/  &&  touch /home/cesar/.ssh/authorized_keys
   #enviar el archivo al server
   scp /y//.ssh/id_rsa.pub cesar@192.168.192.136:/home/cesar/id_rsa.pub
   # ya en el server remoto
   cesar@192.168.192.136:~# cat id_rsa.pub >> .ssh/authorized_keys
   
   # ------------------------------------------------------------- 
   # ::::::: si estas usando mobax
   scp /c/Users/Cesar/mobax/home/.ssh/id_rsa.pub root@142.93.195.232:id_rsa.pub
   # ya en el server remoto
   root@digi-ubuntu:~# cat id_rsa.pub >> .ssh/authorized_keys
```

> ############### resultado ahora en el server ##########################
<img width="90%" src="https://i.imgur.com/E1gUqMC.png" alt="My cool logo"/>

> ############### resultado ahora al conectarme ##########################
<img width="90%" src="https://i.imgur.com/FhyzTi4.png" alt="My cool logo"/>

### Posible error

<img   src="https://i.imgur.com/aK98iIu.png" alt="My cool logo"/>

### Solucion al error 
<img src="https://i.imgur.com/UqTlfRH.png" alt="My cool logo"/>




- 🏆 Opcion 2 (facil)
```shell
   #lo que  hara es copiar nuestro  /y//.ssh/id_rsa.pub a /home/cesar/.ssh/authorized_keys
   ssh-copy-id cesar@192.168.192.136
```



- 3 - OPCIONAL - Desabilitar el acceso por contraseña y solo por llave rsa
 
```shell
  #editar el fichero /etc/ssh/sshd_config

      PasswordAuthentication yes
      Por:
      PasswordAuthentication no
   #Ahora reiniciar el servidor

      sudo systemctl reload sshd.service
```


## ⚠ Posible problemas de conexion al querer ingresar por ssh

```shell
Usuario@DESKTOP-S7TEMR0 MINGW64 ~
⚡[12:58:07] <\>  ssh cesar@192.168.0.60
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:ifFnKKjvl+BeO+OkOPVpWe1LlZ3fU9HyLMi/+8tf3vw.
Please contact your system administrator.
Add correct host key in /c/Users/Usuario/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /c/Users/Usuario/.ssh/known_hosts:6
ECDSA host key for 192.168.0.60 has changed and you have requested strict checking.
Host key verification failed.
Usuario@DESKTOP-S7TEMR0 MINGW64 ~
```

![](https://i.imgur.com/dniqljD.png)

## Solucion

```shell
⚡[15:34:19] ssh-keygen -R 192.168.0.60
# Host 192.168.0.60 found: line 6
# /c/Users/Usuario/.ssh/known_hosts updated.
#Original contents retained as /c/Users/Usuario/.ssh/known_hosts.old
⚡[15:34:39] <\>  ssh cesar@192.168.0.60
The authenticity of host '192.168.0.60 (192.168.0.60)' can't be established.
ECDSA key fingerprint is SHA256:ifFnKKjvl+BeO+OkOPVpWe1LlZ3fU9HyLMi/+8tf3vw.
Are you sure you want to continue connecting (yes/no)? yes
```
