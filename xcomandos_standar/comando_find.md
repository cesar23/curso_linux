


# Linux find: comando para buscar y encontrar archivos en Linux
fuentes:
- https://www.ionos.es/digitalguide/servidores/configuracion/comando-linux-find/#:~:text=Para%20encontrar%20un%20archivo%20en,todas%20las%20distribuciones%20de%20Linux.
- doc oficial: https://man7.org/linux/man-pages/man1/find.1.html

<a href="#" id="indice">Indice 👌</a>

## Tabla de contenido

- <a href="#100">📜1. General</a>
- <a href="#200">🏆 2. Filtrar por tipo de fichero o carpeta</a>
- <a href="#300">🏆 3. Utilizar el comando find de Linux para filtrar por tamaño</a>
- <a href="#302">🏆 3.2 Filtrar con regex</a>
- <a href="#400">🏆 4. Utilizar el comando find de Linux para filtrar por marca de tiempo</a>
- <a href="#500">🏆 5. Utilizar el comando find de Linux para filtrar por propietario, grupo y derechos de acceso</a>
- <a href="#600">🏆 6. Limitación de la profundidad de recursión del comando find de Linux</a>
- <a href="#700">🏆 7. Utilizar el comando find de Linux para encontrar y procesar archivos</a>
- <a href="#800">🏆 8.Utilizar el comando find de Linux para eliminar directorios y archivos vacíos</a>
- <a href="#xxxxxxx">xxxxxxxx</a>


-- - 



-- - 

[//]: # (100------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="100">🏆🚀📜1. General</h2>
sintaxis
`find <directory_path> <search_parameter>`


| **Parámetro de búsqueda** | **Explicación**                                                           |
|---------------------------|---------------------------------------------------------------------------|
| -name, -iname             | Filtrar por nombre de archivo                                             |
| -type                     | Filtrar por tipo de archivo( f= fichero, d=directorio, l= archibos links) |
| -size, -empty             | Filtrar por tamaño de archivo                                             |
| -ctime, -mtime, -atime    | Filtrar por marca de tiempo                                               |
| -user, -group             | Filtrar por propietario y grupo                                           |
| -perm                     | Filtrar por derechos de archivo                                           |


## ejemplos basicos
 busca el archivo my-file.txt en el duirectorio actual
```shell
find . -name "my-file.txt"
find . -type f -name "puma.conf"
find . -type f -name "puma.sock"
# buscar recursoivamente 
find . -name .gitignore
```

## 🏆 También se pueden combinar varios parámetros de búsqueda. Aquí se asume implícitamente una operación lógica AND. Esto puede escribirse explícitamente. Además, se puede utilizar un enlace OR o negar una condición:

| **Parámetro de búsqueda** | **Explicación**                                                                 |
|---------------------------|---------------------------------------------------------------------------------|
| -and                      | Los resultados de la búsqueda deben cumplir ambas condiciones                   |
| -or                       | Los resultados de la búsqueda deben cumplir al menos una de las dos condiciones |
| -not                      | Negar la condición posterior                                                    |
| -ctime, -mtime, -atime    | Filtrar por marca de tiempo                                                     |
| -user, -group             | Filtrar por propietario y grupo                                                 |
| -perm                     | Filtrar por derechos de archivo                                                 |

-- -


busca el archivo my-file.txt en el duirectorio actual MAYUSCULA Y MINUSCULAS
```shell
find . -iname "my-file.txt"
# buscar por  comodin cualquier archivo que contenga la  palabra git o log
find . -iname "*git*"
find . -iname "*git*" -or -iname "*log*"
```

buscar  todos  menos
```shell
find . -not -name "my-file.txt"
```

buscar barios  archivo con extension txt
```shell
find . -name "*.txt"
```

buscar archivos y eliminarlos
```shell
find . -name "my-file.txt" -delete
```


-- - 

[//]: # (200------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="200">🏆 2. Utilizar el comando find de Linux para filtrar por tipo de archivo</h2>
Aquí es donde entra en juego el argumento -type. Linux ofrece a los usuarios las siguientes opciones para buscar archivos por tipo:

| **Tipo de archivo** | **Explicación**            |
|---------------------|----------------------------|
| f                   | Archivo                    |
| d                   | Directorio                 |
| l                   | Enlace                     |
| c                   | dispositivos de caracteres |
| b                   | dispositivos de bloque     |


##### busqueda en la raiz el archivo normal con nombre
```shell
find / -type f -name "my-file.txt"
```

Buscar todos los archivos con la extensión jpeg o JPEG:
```shell
find . -type f -iname "*.jpeg"
find . -type f -iname "*.jpeg" -or -iname "*.jpg"
```

-- - 

[//]: # (300------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="300">🏆 3. Utilizar el comando find de Linux para filtrar por tamaño</h2>
En Linux, el concepto de archivo vincula varias piezas de información. Esto suele incluir al menos lo siguiente:

- Nombre
- Tipo de archivo
- Tamaño del archivo
- Marca de tiempo
- Propietario y grupo
- Derechos de acceso

Todos ellos `pueden`{.red} filtrarse utilizando el comando find y los parámetros adecuados. Para filtrar por el tamaño de un archivo, utilizamos el parámetro “-size” seguido de una especificación de tamaño.

El siguiente comando find devuelve archivos que tienen un tamaño mínimo de 700 megabytes:



🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸

**📢 !OJO**
_El filtrado por tamaño solo funciona para los archivos. Para los directorios, no se almacena el tamaño en el sistema de datos. En su lugar, el tamaño se puede calcular recursivamente si es necesario._

🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸


Las especificaciones de tamaño consisten en un número seguido de una unidad. A continuación, presentamos un resumen de las unidades disponibles:

| **Unidades** | **Explicación**  |
|--------------|------------------|
| c            | Bytes            |
| k            | Kilobytes        |
| M            | Megabytes        |
| G            | Gigabytes        |
| b            | 512-byte bloques |


Paar  aumentar o disminuir

| **Modificador** | **Explicación**                            |
|-----------------|--------------------------------------------|
| +               | El archivo es mayor que el tamaño indicado |
| -               | El archivo es más pequeño que el tamaño    |

-- --
El siguiente comando proporciona archivos de menos de 500 megabytes:

```shell
# buscar  ficheros de menos de 500MB
find . -size -500M
```
El siguiente comando proporciona archivos cuyo tamaño oscila entre 400 y 500 megabytes.

```shell
# ficheros entre 400MB y 500MB
find . -size +400M -and -size -500M
# mostrando el tama;o
find . -size +400M  -exec ls -lah {} \;
# excluyendo path
find . -size +400M  -not -path "./AppData/Local/Docker*" -not -path "./AppData/Local/JetBrains/*"  -exec ls -lah {} \;
# eliminando
#find . -size +400M  -exec rm -rf {} \;
find . -size +400M  -not -path "./AppData/Local/Docker*" -not -path "./AppData/Local/JetBrains/*"  -exec rm -rf  {} \;
```

Buscar archivos vacios

```shell
# solo archivos  vacios
find . -type f -empty
```
Este comando también funciona para los directorios:
```shell
# solo para  directorios
find . -type d -empty
```

-- - 

[//]: # (302------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>

<h2  id="400">🏆 3.2 Utilizar regex </h2>

seleciona todos los archivos con extensiones `sql,zip,7z` ojo puede traer confligto si utilizas otros filtros
```shell
find . -type f -regex ".*\.\(sql\|zip\|7z\)"
```

buscar directorios con estos  nombre `build,dist`
```shell
find . -type d  \( -iname 'build' -o -iname 'dist' \) 
```

-- - 

[//]: # (400------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="400">🏆 4. Utilizar el comando find de Linux para filtrar por marca de tiempo</h2>

marcas de tiempo para la creación, la última modificación y el último acceso a un archivo.


| **Parámetro de búsqueda** | **Explicación**                   |
|---------------------------|-----------------------------------|
| -ctime, -cmin             | Filtrar por fecha de creación     |
| -mtime, -mmin             | Filtrar por fecha de modificación |
| -atime, -amin             | Filtrar por fecha de acceso       |

Para encontrar los archivos que se modificaron hace apenas un día, utilizamos el parámetro de búsqueda `-mtime` seguido del valor `1`:

```shell
find . -type f -mtime 1
```
| **Modificad0r** | **Explicación**                                    |
|-----------------|----------------------------------------------------|
| +               | La fecha es de hace más días que la especificada   |
| -               | La fecha es de hace menos días que la especificada |


Para encontrar archivos creados hace más de 100 días utilizamos `-ctime` seguido del valor `+100`:

```shell
find . -type f -ctime +100
```


Al igual que al filtrar por tamaño de archivo, los parámetros de búsqueda pueden 
combinarse para cubrir un rango. Para encontrar los archivos a los que se accedió 
hace entre tres y cinco días, utilizamos el parámetro de búsqueda `-atime` 
dos veces, cada una con los valores `+2` y `-6`. La combinación explícita mediante el parámetro `-and` es opcional:


```shell
find . -type f -atime +2 -and -atime -6
```

Para encontrar los archivos cuyos cambios tienen menos de cinco minutos de 
antigüedad, utilizamos la búsqueda `-mmin` con el valor `-5`:

```shell
find . -type f -mmin -5
```


Esto listará todos los archivos que tienen un tiempo de modificación de más de dos días.
```shell
find / -mtime +2
#find /home/kpopilrp/ -mtime -2 -exec ls -lha {} \;
```

Entonces, para buscar archivos de texto que se modificaron por última vez hace 60 días, use
```shell
find /home/you -iname "*.txt" -mtime -60 -print
```

Mostrar el contenido del archivo en la pantalla que se modificó por última vez hace 60 días, usar
```shell
$ find /home/you -iname "*.txt" -mtime -60 -exec cat {} \;
```

El siguiente comando imprimirá la lista de todos los archivos pdf
a los que se accedió en los últimos 60 días:
```shell
find /home/you -iname "*.pdf" -atime -60 -type -f
```

También hay una opción llamada `-daystart`. Mide los tiempos desde
el comienzo de hoy en lugar de desde hace 24 horas. Entonces, para enumerar
todos los mp3 en su directorio de inicio a los que se accedió ayer, escriba el comando
```shell
$ find /home/you -iname "*.mp3" -daystart -type f -mtime 1
#Dónde,
#  -tipo f : solo busca archivos y no directorios
```


listar por rango modificados
```shell

#----- buscando por rango fecha
#----- excluyendo path
#----- executando detalle
find /c/Users/demo/Desktop \
 -newermt "2020-07-01 00:00:00" ! -newermt "2020-07-14 00:00:00" \ 
 -not -path "/c/Users/demo/Desktop/SoftFactura50-2016/*" \
 -exec ls -lah {} \;
```


buscar cambios y excluyendo carpetas
```shell
 find /c/ -newermt "2020-08-14 05:18:00" ! -newermt "2020-08-14 08:17:00" \
  ! -path '/c/$Recycle.Bin/*' \
  ! -path "/c/ProgramData/Microsoft/*" \
  ! -path "/c/Users/demo/AppData/LocalLow/Microsoft/*" \
  ! -path "/c/Windows/System32/winevt/Logs/*" \
 -exec ls -lah {} \;

```

-- - 

[//]: # (500------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="500">🏆 5. Utilizar el comando find de Linux para filtrar por propietario, grupo y derechos de acceso</h2>

En Linux, cada archivo tiene asignado un usuario que actúa como propietario. Además, cada archivo pertenece a un determinado grupo de usuarios. En base a esto, se definen ciertos derechos de acceso (permisos) para cada archivo. En base a toda esta información, podemos utilizar el comando find para filtrar y encontrar archivos en Linux. A continuación, presentamos un resumen de los parámetros de búsqueda utilizados:

| **Parámetro de búsqueda** | **Explicación**                |
|---------------------------|--------------------------------|
| -user                     | Filtrar por propietario        |
| -group                    | Filtrar por grupo              |
| -perm                     | Filtrar por derechos de acceso |



Para buscar los archivos propiedad del usuario raíz, utilizamos el parámetro de búsqueda “-user” seguido del valor “root”:

```shell
find . -user root
```
Para buscar los archivos propiedad del propio usuario, utilizamos el parámetro de búsqueda “-user” seguido de la expresión “$(whoami)”. Esta última se resuelve con el nombre del usuario conectado:

```shell
find . -user $(whoami)
```
Para buscar más archivos que pertenezcan al grupo admin, utilizamos el parámetro de búsqueda “-group” seguido del valor “admin”:

```shell
find . -group admin
```


Para encontrar archivos totalmente accesibles para cualquier usuario, utilizamos el parámetro de búsqueda “-perm” seguido del valor “777”:

```shell
find . -perm 777
```
Para encontrar archivos a los que solo puede acceder el propietario, utilizamos el parámetro de búsqueda “-perm” seguido del valor “700”:

```shell
find . -perm 700
```


-- - 

[//]: # (600------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="600">🏆 6. Limitación de la profundidad de recursión del comando find de Linux</h2>
Normalmente, el comando find de Linux recorre recursivamente todos los subdirectorios.
Sin embargo, a menudo es útil limitar la profundidad de la recursión. 
Para ello, utilizamos los parámetros de búsqueda `-maxdepth` y `-mindepth`:

| **Parámetro de búsqueda** | **Explicación**                 |
|---------------------------|---------------------------------|
| -maxdepth                 | Profundidad máxima de recursión |
| -mindepth                 | Profundidad de recursión mínima |


Para encontrar los archivos de más de 50 megabytes, incluyendo solo los directorios que no están a más de dos niveles de profundidad que el directorio actual, utilizamos el siguiente comando:

```shell
find . -type f -maxdepth 2 -size +50M
```
Para encontrar los archivos que son mayores de 50 megabytes, incluyendo solo los directorios que están al menos tres niveles y no más de cinco niveles más profundos que el directorio actual, utilizamos el siguiente comando:

```shell
find . -type f -mindepth 3 -and -maxdepth 5 -size +50M
```

-- - 

[//]: # (700------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="700">🏆 7. Utilizar el comando find de Linux para encontrar y procesar archivos</h2>
procesamiento masivo de los archivos encontrados.

Utilizar el comando find de Linux para ajustar el usuario y los grupos
Para establecer el propietario y el grupo de todos los archivos y directorios 
al valor `www-data` utilizamos el siguiente comando find con el comando chown:

```shell
find . -maxdepth 1 -exec chown www-data:www-data {} \;
```

###### Utilizar el comando find de Linux para ajustar los derechos de archivos
Para encontrar archivos con derechos `777` y ponerlos en `664` utilizamos el siguiente comando find con el comando chmod:

```shell
find . -type f -maxdepth 1 -perm 777 -exec chmod 664 {} \;
```

Para establecer los permisos de todos los directorios a `755`, utilizamos el siguiente comando find con el comando chmod:

```shell
# solo en el directori actual no recursivo
find . -type d -maxdepth 1 -exec chmod 755 {} \;
```

-- - 

[//]: # (800------------------)

<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>



<h2  id="800">🏆 8.Utilizar el comando find de Linux para eliminar directorios y archivos vacíos</h2>
También puedes utilizar el comando find para borrar los archivos y directorios 
encontrados. Como precaución, mostraremos esto aquí solo para archivos y directorios 
vacíos. Además, en lugar del parámetro `-exec`, utilizamos el parámetro `-ok` 
para obligar al usuario a aceptar explícitamente el borrado.



###### Para eliminar todos los directorios de Linux vacíos utilizamos el siguiente comando find junto con el comando rmdir:

```shell
# carchivos modificados de mas de 90 dias
find . -mtime +90 -exec echo rm -f {} \; # para solo ver la  salida

find . -mtime +90 -exec rm -f {} \;

find . -size +1024k -exec rm -f {} \;

#buscar archivos que mas de 80 dias y con un  peso   de 10 M los liste
find . -mtime +80 -size +2M -exec ls -lah {} \;
```

Eliminar correos antiguos del cpanel
```shell
# :::::::::: correo de cpanel
find "/home/kpopilrp/mail/.Archive/" \
"/home/kpopilrp/mail/.Drafts/" \
"/home/kpopilrp/mail/.Junk/" \
"/home/kpopilrp/mail/.Sent/" \
"/home/kpopilrp/mail/.spam/" \
"/home/kpopilrp/mail/.Trash/" \
"/home/kpopilrp/mail/cur/" \
"/home/kpopilrp/mail/new/" \
"/home/kpopilrp/mail/tmp/" \
  -type f \
  -mtime +60 \
    -exec ls -lsha {} \;  
  -exec  rm -f {} \;


# :::::::::: para dominio  
find /home/kpopilrp/mail/lissacorp.pe/*/.Archive/ \
/home/kpopilrp/mail/lissacorp.pe/*/.Drafts/ \
/home/kpopilrp/mail/lissacorp.pe/*/.Junk/ \
/home/kpopilrp/mail/lissacorp.pe/*/.Sent/ \
/home/kpopilrp/mail/lissacorp.pe/*/.spam/ \
/home/kpopilrp/mail/lissacorp.pe/*/.Trash/ \
/home/kpopilrp/mail/lissacorp.pe/*/cur/ \
/home/kpopilrp/mail/lissacorp.pe/*/new/ \
/home/kpopilrp/mail/lissacorp.pe/*/tmp/ \
  -type f \
  -mtime +60 \
  -exec  rm -f {} \;
#  -exec ls -lsha {} \;  
  
  
  


```

```shell
# comprobar lo que  eliminara
find . -type d -maxdepth 1 -empty -ok echo rmdir {} \;
find . -type d -maxdepth 1 -empty -ok rmdir {} \;
```

###### Para borrar todos los archivos vacíos de Linux, utilizamos el siguiente comando find con el comando rm:

```shell
# comprobar lo que  eliminara
find . -type f -maxdepth 1 -empty -ok echo rm {} \;
find . -type f -maxdepth 1 -empty -ok rm {} \;
```




