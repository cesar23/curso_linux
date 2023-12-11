
# instalacion Ubuntu GoAcces

fuente ofical: https://goaccess.io/


## 1. instalar requerimientos

```shell
#  Uso de los repositorios oficiales de GoAccess
echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list

# Con el repositorio en su lista de fuentes, ahora puede descargar la clave GPG para verificar la firma:
wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/goaccess.gpg add -


#actuializamos paquetes
sudo apt update
```


## 2. Ahora  instalamos el goAccess
```shell
sudo apt install goaccess 
```
ver versiond e goacces
```shell
goaccess --version

```


## 3. descargar DB GEOIP

descargar de la web  el archvo de la db de ips


```shell
wget -c https://download.db-ip.com/free/dbip-country-lite-2023-12.mmdb.gz
gzip -d dbip-country-lite-2023-12.mmdb.gz

# :::::::::::: utilizar esta  ruta
# /home/cesar/dbip-country-lite-2023-12.mmdb

```

## 4. Configurar 

coamndo para ver ubicacion de la cobnfiguraraciond e goAccess `goaccess --dcf`
```shell
goaccess --dcf
# output:
#  /etc/goaccess/goaccess.conf

# --------------------------------------------------------
# Ahora lo editamos
sudo nvim /etc/goaccess/goaccess.conf
sudo cp /etc/goaccess/goaccess.conf /etc/goaccess/goaccess.conf.back

```


descomentaremos las siguientes  lineas correspondientes a `Apache/NGINX`
```shell
# ----------- Descomentar estas lineas
time-format
date-format
log-format
# ---------- comentarestas  linas para que no sean ignoradas opciones
ignore-panel REFERRES
ignore-panel KEYPARSES
```




<img src="https://i.imgur.com/HXSjGHd.png" >

-- --------------------------

<img src="https://i.imgur.com/QzN4yBL.png" >

-- --------------------------
<img src="https://i.imgur.com/Kisb1n5.png" >

-- --------------------------

<img src="https://i.imgur.com/QSSc3kv.png" >

-- --------------------------

<img src="https://i.imgur.com/DdAXNV8.png" >

-- --------------------------


## 5. Probar GoAccess

```shell
sudo goaccess pcbyte_10.log


sudo goaccess pcbyte_10.log -o pcbyte.html
```



```shell
goaccess pcbyte_10.log --log-format='%h %^[%d:%t %^] %T "%U" %s %^ %^ %b "%q" %^ %^ %^ %^ %^ %^ "%u"' --date-format=%d/%b/%Y --time-format=%T --http-method=no --http-protocol=no
```

#### Filtro para UserAgent

```shell
goaccess pcbyte_10.log  --log-format='%h %^[%d:%t %^] "%r" %s  %b %u "%R" "%u"' --date-format='%d/%b/%Y' --time-format='%H:%M:%S'
```
<img src="https://i.imgur.com/mZ9pGwb.png" >

-- --------------------------


