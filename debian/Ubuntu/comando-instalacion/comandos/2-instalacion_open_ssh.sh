>sudo apt install openssh-server -y
#Ahora vamos a generar unas nuevas claves usando el comando 
>ssh-keygen -t rsa y ssh-keygen -t dsa

#Ahora vamos a ver el fichero de configuración de nuestro servidor SSH con 
>sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_confi_bacup #bacup
>sudo nano /etc/ssh/sshd_config

#------------------------------------------



#------------------------------------------
# 1-. Modificar el puerto de escucha de OpenSSH.

# Por defecto escucha el puerto 22, pero si queremos que escuche otro, no tenemos que modificar en el fichero, la entrada donde hace referencia 
# a “Port 22“.

# Podreis encontrarlo al principio del fichero.

# Para establecer el puerto 2222 en lugar del 22, la linea de Port, quedaria:

Port 2222

# 2-. Para no permitir que se puedan conectar por SSH utilizando el usuario root, tendremos que ir a la seccion “Authentificacion“. En esta seccion hay una linea como esta:

# PermitRootLogin yes

# Bien, para hacer que no se pueda conectar el usuario root, deberemos modificarla a “no“:

PermitRootLogin no

# 3-. Si queremos que cada vez que se relice sesion mediante SSH a nuestro servidor, muestre un mensaje en concreto, deberemos modificar el fichero que estamos comentando (/ect/ssh/sshd_config) para descomentar la linea:

X11 Forwarding: Nos indica que el reenviador X11 está activo
#Banner /etc/issue.net

#-----------------------podemso personalizar el login ssh
Podemos, ya puestos, modificar el fichero 
/etc/issue.net 
para que muestre lo que nosotros queramos.

# Reiniciar el servicio SSH

# Basta con ejecutar el siguiente comando:

sudo /etc/init.d/ssh restart

#      888                   888               888      d8b 888 d8b 888                                                     d8b          d8b                                 
#      888                   888               888      Y8P 888 Y8P 888                                                     Y8P          Y8P                                 
#      888                   888               888          888     888                                                                                                      
#  .d88888  .d88b.  .d8888b  88888b.   8888b.  88888b.  888 888 888 888888  8888b.  888d888      .d8888b   .d88b.  888  888 888  .d8888b 888  .d88b.                         
# d88" 888 d8P  Y8b 88K      888 "88b     "88b 888 "88b 888 888 888 888        "88b 888P"        88K      d8P  Y8b 888  888 888 d88P"    888 d88""88b                        
# 888  888 88888888 "Y8888b. 888  888 .d888888 888  888 888 888 888 888    .d888888 888   888888 "Y8888b. 88888888 Y88  88P 888 888      888 888  888                        
# Y88b 888 Y8b.          X88 888  888 888  888 888 d88P 888 888 888 Y88b.  888  888 888               X88 Y8b.      Y8bd8P  888 Y88b.    888 Y88..88P                        
#  "Y88888  "Y8888   88888P' 888  888 "Y888888 88888P"  888 888 888  "Y888 "Y888888 888           88888P'  "Y8888    Y88P   888  "Y8888P 888  "Y88P"                         
                                                                                                                                                        
sudo systemctl status ssh

# Si por alguna razón desea deshabilitar SSH en su máquina Ubuntu, simplemente puede detener el servicio SSH ejecutando:
>sudo systemctl stop ssh
# Para comenzar de nuevo, ejecute:
>sudo systemctl start ssh

# Para deshabilitar el servicio SSH para que se inicie durante el arranque del sistema:
>sudo systemctl disable ssh

# Para habilitarlo nuevamente, escriba:
>sudo systemctl enable ssh

##---------------------- AUTOINGRESO SSH-------------------------
#1 -  Generar la LLAVE id_rsa.pub en la pc  local
ssh-keygen
    #luego de eso nos botara la ruta de la ubicacion del keygen
    # Enter file in which to save the key (/y//.ssh/id_rsa): 
    #(OJO puede  estar ubicada  en otro klugar por lo general esta C:\Users\cauris\.ssh)


#2  -  leer la clave ubicada en /y//.ssh/id_rsa.pub
   #copiar el contenido en el servidor crea un archivo si no existe el la ubicacion /home/cesar/.ssh/authorized_keys


   # ---- Opcion 1
   #copiar desde una  ruta local al server
      #crear el archivo en el servidor y la  carpeta
      mkdir -p /home/cesar/.ssh/  &&  touch /home/cesar/.ssh/authorized_keys
   #enviar el archivo al server
   scp /y//.ssh/id_rsa.pub cesar@192.168.192.136:>>/home/cesar/.ssh/authorized_keys

   #----- Opcion 2 (facil)
   #lo que  hara es copiar nuestro  /y//.ssh/id_rsa.pub a /home/cesar/.ssh/authorized_keys
   ssh-copy-id cesar@192.168.192.136



#3 - OPCIONAL - Desabilitar el acceso por contraseña y solo por llave rsa
   #editar el fichero /etc/ssh/sshd_config

      PasswordAuthentication yes
      Por:
      PasswordAuthentication no
   #Ahora reiniciar el servidor

      sudo systemctl reload sshd.service


