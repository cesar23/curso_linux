# Actualizar Repositorio
si hay error
<img width="100%" src="https://i.imgur.com/OZtlvTs.png" alt="My cool logo"/>

-- -- 

```shell
## resolverlo actualizando dnds
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo apt-get update

# ---------opcion 2
# limpiar repositorio
apt-get clean
apt-get update
```

# Agregar repositorio de google
fuente: https://www.softzone.es/linux/tutoriales/actualizar-lista-repositorios-linux/

````shell
# Descargar reposotorio
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
````
Una vez ejecutado el anterior comando, ya podemos añadir el repositorio a la lista de repositorios de Ubuntu. Y eso lo haremos con el siguiente comando:

```shell
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# actualizar nuestro repos
sudo apt update
```


# Agregar un repositorio PAA
```shell
sudo add-apt-repository ppa:ondrej/php
```
# Eliminar un repositorio
```shell
sudo add-apt-repository --remove ppa:jd-team/jdownloader
```
## Eliminar el programa y los archivos de configuración creados en la instalación:
```shell
sudo apt-get --purge remove PAQUETE
```
# Después de eliminar el repositorio PAA es conveniente:
`sudo apt-get autoremove`

```shell
$ sudo apt-get remove "nombre del paquete"
$ sudo apt-get purge "nombre del paquete"
$ sudo apt-get clean "nombre del paquete"
```


##### hacer esto cuando no dej einstalar con sudo apt-get UBUNTU #####
## _______________________________________
```shell
cd /var/lib/dpkg/info
```
### despues
```shell
ls |grep “nombre del pakete roto sin comillas” ej ls |grep nvidia
```
 depues sudo rm “el paquete.postinst”, ejemplo sudo rm nvidia.postinst


# Paquetes instalados:
```shell
dpkg --get-selections
```

## ___________________________________________
```shell
add-apt-repository ppa:ondrej/php
apt update
apt install php5.6 libapache2-mod-php5.6 php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-xmlrpc
a2dismod php7.0
a2enmod php5.6
systemctl restart apache2
```

## ___________________________________________
```shell
sudo apt-get autoremove     # (Borra lo que ya no se necesita)
sudo apt-get clean          # (Limpia la caché de archivos bajados)
sudo apt-get update         # (actualiza los paquetes)
```

## Limpiar
```shell
sudo apt-get install ppa-purge
sudo ppa-purge ppa:ondrej/php-7.0
```
