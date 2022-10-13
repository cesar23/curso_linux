fuente: https://medium.com/@klvst3r/c%C3%B3mo-configurar-ufw-en-ubuntu-18-o-debian-67dab8c72170

# 1. Cómo instalar UFW en Debian Y Ubuntu
>sudo apt install ufw

# 2. Cómo habilitar UFW en Linux
# Para llevar a cabo el proceso de activación de UFW, vamos a ejecutar el siguiente comando el cual carga el firewall y le permite iniciarse al arrancar el sistema.
>sudo ufw enable
# En caso de desear deshabilitar UFW vamos a ejecutar el siguiente comando el cual le impide sea iniciado desde el arranque:
>sudo ufw disable

# Estas reglas por defecto de UFW las encontramos en la ruta /etc/canvas.cesar.com.conf/ufw y las podremos editar con el siguiente comando:
>sudo ufw default deny incoming
>sudo ufw default allow outgoing



# 4. Cómo ver perfiles para aplicaciones en UFW Linux
# Al instalar cualquier paquete de software a través del administrador de paquetes APT, se incluye un perfil de aplicación 
# en el directorio /etc/ufw/applications.d el cual define el servicio y mantiene la configuración de UFW activa.
# Sera posible enumerar todos los perfiles de aplicaciones disponibles en Ubuntu o Debian utilizando el siguiente comando:
>sudo ufw app list

# Si deseamos obtener más información sobre un perfil especifico y las reglas definidas para este, vamos a usar el siguiente comando:
>sudo ufw app info 'OpenSSH'




# En caso de realizar algún cambio, guardamos estos usando las teclas Ctrl + O y salimos del editor 
# usando Ctrl + X. Ahora, vamos a reiniciar el firewall ejecutando:
>sudo ufw disable
>sudo ufw enable


# 6. Cómo permitir conexiones SSH en UFW Linux
# Recordemos que al activar el firewall UFW, se bloquearán todas las conexiones entrantes y, en caso de estar conectados al servidor 
# a través de SSH desde una ubicación remota, no será posible establecer la conexión.
# Para ello será necesario habilitar las conexiones SSH para evitar errores y esto lo logramos ejecutando el siguiente comando:
>sudo ufw allow ssh



# En caso de usar un puerto SSH personalizado, este se debe abrir en el firewall UFW con el siguiente comando:
>sudo ufw allow 2220/tcp

# Si deseamos bloquear una conexión SSH podemos ejecutar lo siguiente:
>sudo ufw deny ssh/tcp


#-------------------- 7. Cómo habilitar puertos específicos en UFW Linux
# Con UFW también será posible abrir un puerto específico con el objetivo de permitir las conexiones a un determinado servicio a través de él, por ejemplo, si se necesita configurar un servidor web para escuchar en los puertos 80 (HTTP) y 443 (HTTPS) de forma predeterminada, ejecutaremos lo siguiente según sea el caso:
# Permitir puerto 80
sudo ufw allow http #(Por nombre de servicio)
sudo ufw allow 80/tcp #(Por número de puerto)
sudo ufw allow ‘Apache’ #(Por perfil de aplicación)



# Permitir puerto 443
sudo ufw allow http
sudo ufw allow 443/tcp
sudo ufw allow 'Apache Secure'




# Permitir un rango de puertos en UFW
# En algunas ocasiones podemos contar con aplicaciones que harán uso de un tango especifico de puertos 
# que deben ser autorizados en UFW, para activar un rango de puertos vamos a ejecutar lo siguiente:
sudo ufw allow 6000:6003/tcp
sudo ufw allow 6000:6003/udp


# Permitir una dirección IP
# UFW nos da la opción de permitir el acceso de una sola dirección IP al sistema, para ello debemos ejecutar lo siguiente:
sudo ufw allow from 192.168.0.19

# Ahora, si deseamos habilitar el uso de una dirección IP en un puerto especifico vamos a ejecutar lo siguiente:
sudo ufw allow from 192.168.0.19 to any port 22



#--------------------- 8. Cómo borrar reglas en UFW Linux
# Contamos con 2 opciones para eliminar las reglas UFW, por número de regla y por regla real.
# Paso 1
# Para eliminar las reglas de UFW haciendo uso del número de regla, primero debemos enumerar las reglas por números con el siguiente comando:
sudo ufw status numbered

# Ahora podremos eliminar la regla usando la siguiente sintaxis:
sudo ufw delete (n)
