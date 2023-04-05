# comprimir archivos

### :::::::::::::::::::: Archivos .tar.gz
```shell
# siempre tienes que estar dentro de la carpeta que comprimiremos



# entramos a la carpeta
cd /drives/D/temp_d/openoffice


# 
# /drives/D/repos/backup_cesar/daily/bac2.tar.gz =(donde esta  el backup)
# * = (comprimiremos todo de la carpeta actual)
tar -czvf /drives/D/temp_d/bak/bac2.tar.gz *
```
<img width="60%" src="https://i.imgur.com/P03U9hV.png" alt="My cool logo"/>

-- -- 

<img width="80%" src="https://i.imgur.com/OQD8haI.png" alt="My cool logo"/>

-- -- 

Excluyendo carpetas y ficheros

```shell

# ::::::: excluyendo path
tar -czvf l3mon.tar.gz L3MON --exclude="L3MON/app"

# backup de mobax
tar -czvf home.tar.gz * \
 --exclude=".ssh" \
 --exclude=".bash_history" \
 --exclude="*.tar.gz" \
 --exclude="*.ssh"


tar -czvf l3mon.tar.gz L3MON --exclude="L3MON/app" --exclude='*.png'

# :::: comprimir mas de una rutas (carpetas L3MON,build )
tar -czvf l3mon_2.tar.gz L3MON build --exclude='*.png'
```

# Descomprimir

```shell
# :::::::: descomprimir backup
tar -xzvf home.tar.gz ~/directorio
```
