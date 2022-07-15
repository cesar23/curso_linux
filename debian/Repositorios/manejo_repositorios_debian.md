# Manejo de repositorios debian

### 1. restaurar desde backup

descargar el archivo
```shell
# hacer un backup desde una instalacion de ubuntu (SERVER 1)
cat /etc/apt/sources.list > repo_ubuntu_2022-07.list.conf
# Descargar esa copia a local (SERVER 2 => LOCAL)
scp "cesar@192.168.0.63:/home/cesar/repo_ubuntu_2022-07.txt" "/d/temp/repo_ubuntu_2022-07.tx"
# 
```
```shell
# Copia de configuracion (SERVER 2)
cp /etc/apt/sources.list /etc/apt/sources.list.bak
# copiar lo que tenemos en local   (LOCAL => SERVER 2)
scp  "/d/temp/repo_ubuntu_2022-07.tx" cesar@192.168.0.63:~/sources.list
sudo cp ~/sources.list /etc/apt/sources.list
```

Agregarlo por comando
```shell
sudo sh -c "echo deb http://archive.ubuntu.com/ubuntu focal main restricted > /etc/apt/sources.list"
```
