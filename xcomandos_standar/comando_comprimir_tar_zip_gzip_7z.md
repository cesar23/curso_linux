# comprimir archivos

### :::::::::::::::::::: Archivos .tar.gz
```shell
# siempre tienes que estar en la ruta de compresion

tar -czvf empaquetado.tar.gz /carpeta/a/empaquetar/

# ejemplo mobax
cd /drives/D/lemon

tree -d -L 1 # listamos directorios en primer nivel
# 
# └── L3MON
# 

# una vez  ubicados en el directorio para  comprimir
tar -czvf l3mon.tar.gz L3MON
```
<img width="80%" src="https://i.imgur.com/YNAOU6r.png" alt="My cool logo"/>

-- -- 

<img width="80%" src="https://i.imgur.com/xUtwlBO.png" alt="My cool logo"/>

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
