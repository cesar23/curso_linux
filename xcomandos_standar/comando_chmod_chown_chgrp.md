fuentes: 
- https://usuariodebian.blogspot.com/2020/09/apache-permisos-usuario-y-grupo-www-data.html
-- --


### Resumen 🥇
-- --
**chown**: cambia el usuario y el grupo propietarios.

**chgrp**: cambia sólo el grupo propietario.

**chmod**: cambia permisos.

-- ---
## 1. Comando CHMOD
chmod en octal
```shell
# La representación octal de chmod es muy sencilla

# Lectura tiene el valor de 4
# Escritura tiene el valor de 2
# Ejecución tiene el valor de 1

# Entonces:

# x-----x-----x-----------------------------------x
# | rwx |  7  | Lectura, escritura y ejecución    |
# | rw- |  6  | Lectura, escritura        |
# | r-x |  5  | Lectura y ejecución       |
# | r-- |  4  | Lectura               |
# | -wx |  3  | Escritura y ejecución             |
# | -w- |  2  | Escritura                         |
# | --x |  1  | Ejecución             |
# | --- |  0  | Sin permisos          |
# x-----x-----x-----------------------------------x
# Por lo tanto:

# x------------------------x-----------x
# |chmod u=rwx,g=rwx,o=rx  | chmod 775 | 
# |chmod u=rwx,g=rx,o=     | chmod 760 |
# |chmod u=rw,g=r,o=r      | chmod 644 |
# |chmod u=rw,g=r,o=       | chmod 640 |
# |chmod u=rw,go=          | chmod 600 |
# |chmod u=rwx,go=         | chmod 700 |
x------------------------x-----------x
```

## Permisos para apache

1. poner los permisos por defecto con los permisos de `apache2`
```shell
chown -R www-data:www-data /var/www/html
```

2. Ahora le damos permisos de escritura en el directorio /var/www/html, al grupo `www-data`
```shell
chmod -R 775 /var/www/html 
#ó 
#chmod -R g+w /var/www/html
```
Una vez dado el permiso de escritura al grupo, los permisos quedarían asignados 
con el `775`, tanto propietario como grupo tendrán todos los privilegios 
(lectura, escritura y ejecución) sobre dicha carpeta; el resto de usuarios tendrá permiso de lectura y ejecución


3. Para facilitar la administración del sitio web, añadimos nuestro usuario (por ejemplo: `diego`)
al grupo de apache llamado: `www-data`.

```shell
# OJO: desppues salir de la session e ingresar denuevo 
sudo usermod -a -G www-data diego
#sudo usermod -a -G www-data $user
```

verificamos con el comando `groups` si estamos en el grupo 
```shell
# OJO: desppues salir de la session e ingresar denuevo
ubuntu@ip-10-0-1-10:~$ groups
# output:
ubuntu adm dialout cdrom floppy sudo audio dip www-data video plugdev netdev lxd

    
```

### 💊Observación: 
Si hemos realizados cambios en el algún momento, y no se encuentran con los permisos correcto para 
nuestro servidor, usaremos el siguiente comando para poner el permisos `775` a todas las `carpeta`:

```shell
find /var/www/html -type d -exec chmod 755 {} \;
```
Si hemos realizados cambios en el algún momento, y no se encuentran con los permisos correcto para
nuestro servidor, usaremos el siguiente comando para poner el permisos `664` a todos los `ficheros`:

```shell
find /var/www/html -type f -exec chmod 644 {} \;
```

### 💊Nota importante:
- Todo lo anterior es para el servidor por defecto, directorio: `/var/www/html`. También podemos servir
paginas web desde nuestro propio espacio de usuario (`/home/diego`), creando la carpeta public_html,
usando el comando: `mkdir /home/diego/public_html`, donde diego es el nombre del usuario con el que 
estamos trabajando.

- A continuación, debemos asegurarnos que nuestro directorio web public_html también pertenece 
al grupo `www-data` de Apache:

```shell
chgrp -R www-data /home/diego/public_html
```

- Le damos los permisos adecuados para que los archivos y directorios creados dentro del mismo 
directorio sean visibles en la web, usamos el comando:

```shell
chmod -R 2755 /home/diego/public_html
```

-- --
### 🎉 Con esto tenemos configurado los permisos, usuarios y grupos para mostrar y ejecutar adecuadamente sitios web en Apache.

Nota explicativa:
Los propietarios y los permisos se gestionan desde el shell con los comandos:

chown: cambia el usuario y el grupo propietarios.
chgrp: cambia sólo el grupo propietario.
chmod: cambia permisos.