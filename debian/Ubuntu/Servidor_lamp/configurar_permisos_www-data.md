


# Vamos a configurar correctamente la carpeta: `/var/www/html`
Luego de instalar el servidor web apache2 en Debian GNU/Linux, vamos a configurar la carpeta: **/var/www/html** con el usuario, el grupo y los permisos adecuados, para el correcto funcionamiento.



## 1. Permisos que debe tener la carpeta: /var/www/html  

La carpeta **/var/www/html** debería tener el permiso **755** (nunca el permiso 777). Con el permiso 755, el propietario tiene todos los privilegios (lectura, escritura y ejecución), el grupo y el resto de usuarios solo tendrán permisos de lectura y de ejecución en la misma carpeta.

<img width="100%" src="https://i.imgur.com/GjQf2Gc.png" alt="My cool logo"/>

-- -- 

Pero nosotros vamos a usar el permiso **775**. Con este permiso (775), el propietario y el grupo tiene todos los privilegios (lectura, escritura y ejecución), y el resto de usuarios solo tendrán permisos de lectura y de ejecución en la misma carpeta. Vamos a usar este permiso para no cambiar ni el propietario y ni el grupo por defecto del servidor apache, que por defecto se llama: **www-data**

<img width="100%" src="https://i.imgur.com/hKCCt2r.png" alt="My cool logo"/>

-- -- 



## 2. Cambiaremos el permiso
Por defecto, una vez instalado el servidor web apache, en Debian GNU/Linux, el dueño del grupo y el directorio por defecto pertenecen a root. Nosotros **vamos a cambiar el dueño del directorio y el grupo**, al usuario por defecto de apache, llamado: **www-data**.
poner los permisos por defecto con los permisos de `apache2`
```shell
chown -R www-data:www-data /var/www/html
```




-- -- 


## Permisos para apache


<img width="100%" src="https://i.imgur.com/S92PDoP.png" alt="My cool logo"/>

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

**Algunas capturas de pantalla**



[![](https://1.bp.blogspot.com/-5fkXllueb6I/XzRlwmbEfLI/AAAAAAAASv4/KyOMnk_poicBzTPZkebzayl7ns2fSI1HwCLcBGAsYHQ/s640/phpfilemanager-2.png)](https://1.bp.blogspot.com/-5fkXllueb6I/XzRlwmbEfLI/AAAAAAAASv4/KyOMnk_poicBzTPZkebzayl7ns2fSI1HwCLcBGAsYHQ/s1544/phpfilemanager-2.png)



[![](https://1.bp.blogspot.com/-LtXwRan_Lhc/XzRlwign5HI/AAAAAAAASv8/yh_UCPtGRp8LCTsd9O2aoSzYMHamvOWzwCLcBGAsYHQ/s640/phpfilemanager-1.png)](https://1.bp.blogspot.com/-LtXwRan_Lhc/XzRlwign5HI/AAAAAAAASv8/yh_UCPtGRp8LCTsd9O2aoSzYMHamvOWzwCLcBGAsYHQ/s1544/phpfilemanager-1.png)



[![](https://1.bp.blogspot.com/-7K7NHhNlVf8/XzRlwmutiYI/AAAAAAAASwA/r6YJJOaWA5k88XFihvI8W-v0xSSEHispQCLcBGAsYHQ/s640/extplorer.png)](https://1.bp.blogspot.com/-7K7NHhNlVf8/XzRlwmutiYI/AAAAAAAASwA/r6YJJOaWA5k88XFihvI8W-v0xSSEHispQCLcBGAsYHQ/s1264/extplorer.png)
