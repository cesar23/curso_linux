# Intalacion de python 2.7

[url_python]: https://www.python.org/


fuente: [enlace en línea](https://tecadmin.net/install-python-2-7-on-ubuntu-and-linuxmint/)

## 1. Requisitos

``` ssh
apt-get update

apt-get install build-essential checkinstall

apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
```

## 2. Instalacion
Descargue [Python][url_python] usando el siguiente comando del sitio oficial de Python. También puede descargar la última versión en lugar de la especificada a continuación.

``` ssh
cd /usr/src
sudo wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
```

Ahora extraiga el paquete descargado.
``` ssh
sudo tar xzf Python-2.7.16.tgz
```

## 3. compilar Python Source

Use el siguiente conjunto de comandos para compilar el código fuente de Python en su sistema usando altinstall .
 
``` ssh
# cd Python-2.7.16
# sudo ./configure --enable-optimizaciones
# sudo make altinstall
```
make altinstall se usa para evitar reemplazar el archivo binario predeterminado de python / usr / bin / python.

## 4 – Check Python Version
``` ssh
# python2.7 -V

Python 2.7.16
```