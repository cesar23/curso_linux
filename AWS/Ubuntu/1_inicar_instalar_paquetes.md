

    cesa

![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)


## 
```
ssh -i "cesar-amazon-ohio.pem" ubuntu@ec2-18-188-237-241.us-east-2.compute.amazonaws.com 
```

## instalar actualizar 
```shell script
sudo apt update
sudo apt-get upgrade
sudo apt install apache2
sudo apt install curl
# ------- instalar mysql
sudo apt install mysql-server
sudo mysql_secure_installation
```

## instalar php 7.2
fuente: https://www.rosehosting.com/blog/how-to-install-php-7-2-on-ubuntu-16-04/

## -------------------Instalar PHP7 y APACHE
instalando repo necesario

```shell script
sudo apt install software-properties-common #Si no esta  instalado
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
```


```
sudo apt-get install php7.2 php7.2-cli php7.2-common
sudo apt-get install php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-intl php7.2-mysql php7.2-xml php7.2-xmlrpc php7.2-zip
sudo apt-get install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-cli php7.2-mbstring php7.2-mysql php7.2-fpm php7.2-mysql
sudo apt-get install php7.2-cgi php7.2-xml php7.2-zip php7.2-dev php7.2-curl php7.2-gd
sudo apt-get install php7.2-mcrypt php7.2-xsl php7.2-intl


```
### chech php version
```
php -v
```

## Reiniciar servicio apache

```
sudo systemctl restart apache2
```




##Paso 3 — Ajustar la Configuración de Apache para Permitir Sobre-escritura y Re-escritura para .htaccess
### Habilitar Sobre-escritura por .htaccess
###    Abra el archivo de configuración primaria de Apache para hacer nuestro primer cambio:
