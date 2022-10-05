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
