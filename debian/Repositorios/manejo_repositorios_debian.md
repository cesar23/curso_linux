# Manejo de repositorios debian

### 1. Ubicaciones de Repositorio
Los repositorios se encuentran en el archivo sources.list, para añadir o modificar debemos abrir el editor nano como root.

```shell
nano /etc/apt/sources.list # principal

# ubicacion de repositorios agregados
cd /etc/apt/sources.list.d

root@ip-172-31-33-216:/etc/apt/sources.list.d# ll 
# output:
#   -rw-r--r-- 1 root root  136 Jan 25  2021 brightbox-ubuntu-ruby-ng-focal.list
#   -rw-r--r-- 1 root root   63 Jan 25  2021 nginx.list
#   -rw-r--r-- 1 root root  109 Mar 30  2021 nodesource.list
#   -rw-r--r-- 1 root root   47 Jan 25  2021 yarn.list

 
 
```
<img width="90%" src="https://i.imgur.com/Xw6odcf.png" alt="My cool logo"/>

Cada linea que describe un repositorio tiene una bien definida sintaxis:

```shell
deb [url] [distribution] [component…]
```

##### Si analizamos por separado sería:


- **[deb ó deb-src]**  =>  Con esto indicamos si el repositorio indicado contiene paquetes binarios o fuentes, en caso que necesitar ambos debes especificar cada uno en un linea diferente
- **[url]**  =>  Con esto indicamos si el repositorio indicado contiene paquetes binarios o fuentes, en caso que necesitar ambos debes especificar cada uno en un linea diferente
- **[distribution]**  => `deb https://deb.debian.org/debian **stable** main contrib non-free` indica la distribución (o rama) utilizada... es posible usar el nombre en código (Buster, Bullseye, sid) o el nombre genérico (stable, testing, unstable)
- **[component]**  => `deb https://deb.debian.org/debian stable **main contrib non-free**`  indica las secciones del repositorio, non-free , main , contrib....
A continuación veremos una lista de repositorios oficiales para agregar a nuestro sources.list


### 2. restaurar desde backup

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
