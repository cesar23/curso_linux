# uso de rsync
fuente: https://www.linuxtotal.com.mx/index.php?cont=rsync-manual-de-uso

| Opción |     | Descripción |
| --- | --- | --- |
| Corta | Larga |
| **_-a_** | **_--archive_** | Modo archive, es igual a indicar las opciones r,l,p,t,g,o y D |
| **_-r_** | **_--recursive_** | Recursivo, copia recursivamente los directorios. |
| **_-l_** | **_--links_** | Cuando encuentra symlinks (enlaces simbólicos), estos son recreados en el destino. |
| **_-p_** | **_--perms_** | Opción que causa en el destino establecer los permisos igual que en el origen. |
| **_-t_** | **_--times_** | Transfiere los tiempos de los archivos (atime, ctime, mtime) al destino |
| **_-g_** | **_--group_** | Establece en el destino que el grupo del archivo copiado sea igual que el origen. |
| **_-o_** | **_--owner_** | Establece en el destino que el propietario del archivo copiado sea igual que el origen. |
| **_-D_** |     | Esto es igual que indicar las opciones _--devices_ y _--specials_ |
|     | **_--exclude PATTERN_** | Excluye archivos que igualan el patrón o pattern indicado. |
|     | **_--include PATTERN_** | Incluye archivos que igualan el patrón o pattern indicado. |
|     | **_--devices_** | Transfiere archivos de dispositivos de bloque y caracter al destino donde son recreados. Esto solo puede suceder si en el destino se tienen permisos de root. |
|     | **_--specials_** | Transfiere archivos especiales como fifos y named sockets. |
|     | **_--version_** | Indica el número de versión de `rsync` |
| **_-v_** | **_--verbose_** | Incrementa la cantidad de información que se informa durante la transferencia o copia de archivos. Es la opción contraria a _--quiet_ |
| **_-q_** | **_--quiet_** | Decremente la cantidad de información que se informa durante la transferecnia o copia de archivos. Generalmente se utiliza cuando `rsync` se utiliza en una tarea cron. Es la opción contraria a _--verbose_ |
| **_-I_** | **_--ignore-times_** | Una de las grandes virtudes de `rsync` es que al momento de copiar o transferir archivos, si estos son iguales en el destino en términos de tiempos y tamaño ya no lo copia, no hay cambios. Esta opción permite que esto sea ignorado y todos los archivos serán copiados/actualizados en el destino. (ver _--size-only_ también) |
|     | **_--size-only_** | Normalmente solo se transfieren archivos con los tiempos cambiados o el tamaño cambiado. Con esta opción se ignoran los tiempos de los archivos y se transfiere cualquiera con un tamaño distinto en el destino. |
| **_-n_** | **_--dry-run_** | Crea una prueba de test de lo que realmente ocurrirá sin esta opción, sin realizar ningún cambio. Es decir, la salida mostrada será muy similar a lo que realmente pasará si no se incluye _--dry-run_. Generalmente se usa junto con la opción _--verbose_ y la opción _--itemize-changes_ |
| **_-i_** | **_--itemize-changes_** | Reporta una lista de los cambios realizados en cada archivo, incluidos cambios en sus atributos. Esto es equivalente a utilizar _-vv_ en versiones obsolteas de `rsync`. |
|     | **_--remove-source-files_** | Remueve los archivos en el origen (no directorios) si en el destino estos fueron exitosamente duplicados o copiados. |
|     | **_--timeout=TIEMPO_** | Especifica un timeout en segundos, si no datos son transferidos en tiempo indicado `rsync` terminará. El default es 0 segundos que quiere decir sin timeout. |
|     | **_--log-file=ARCHIVO_** | Bitacoriza lo que se ha realizado en el ARCHIVO indicado. |
|     | **_--stats_** | Imprime un conjunto informativo de datos estadísticos sobre la transferencia realizada. |
|     | **_--progress_** | Muestra el avance o progreso de los archivos que están siendo transferidos. |
|     | **_--bwlimit=KBPS_** | Permite establecer un límite de transferencia en kilobytes por segundo. Esta opción su default es 0, lo que indica no límite en el uso del ancho de banda en la transferencia. |
|     | **_--max-size=TAMAÑO_** | No transfiere cualquier archivo más grande que el TAMAÑO indicado. |
|     | **_--min-size=TAMAÑO_** | No transfiere cualquier archivo más pequeño que el TAMAÑO indicado. |
| **_-z_** | **_--compress_** | Comprimir datos durante la transferencia. |



#### 0. creamos  archivos  de  test ene  origen

```
touch /root/Desktop/origen/file{1..5}.txt

```


#### 1. El modo más utilizado
Una vez entendiendo que rsync es similar en uso que el comando cp veamos las opciones más utilizadas:
```
$ rsync -vazh  /root/Desktop/origen/ /root/Desktop/destino/
```

    -v modo verboso, info extra de los archivos siendo copiados, etc.
    -a modo archive, esta opción es la que necesitarás mas frecuentemente, ya que copia los archivos y directorios recursivamente y a diferencia de la opción -r preserva enlaces, permisos de archivos, usuario y grupo del archivo, y estampas de tiempo.
    -z comprime datos de los archivos al transferir, útil sobre todo en transferencias o copias remotas.
    -h modo humano, salida de números en formato legible para humanos.

#### 2. (Aqui se copía todos los archivos que comienza con "file"
```
rsync -avzh /root/Desktop/origen/file* /root/Desktop/destino/
```

#### 3. excluyendo archivos

```
rsync -azP --exclude '*.txt' /root/Desktop/origen/ /root/Desktop/destino/
```
#### 4. incluyendo y excluyendo archivos
```
rsync -azP --include 'file*'  --exclude '*' /root/Desktop/origen/ /root/Desktop/destino/
```

#### 5.Borrando en el destino
No es algo muy frecuente, pero supongamos que deseas mantener dos 
directorios completamente iguales, los mismos archivos, 
es decir, que el directorio destino sea idéntico al directorio 
origen. Tienes entonces uno o mas archivos que existen en el 
destino pero que ya no están en el origen, al utilizar `rsync` con la opción `--delete` lo logras. Se eliminarán los archivos que estén en el destino que ya no existan en el origen.


```
 rsync -avhP --delete /root/Desktop/origen/ /root/Desktop/destino/
```

#### 6. Y borrando el origen
Si después de una transferencia o copia de datos exitosa no deseas ocupar 
más espacio en el origen, entonces utiliza la opción `--remove-source-files`, 
que como su nombre lo indica claramente eliminará los archivos en el 
origen. `¡¡¡CUIDADO CON ESTA OPCIÓN!!!` (Checa la siguiente opción)


ojo dejara  las  carpetas del origen  vacias
```
rsync -avh --remove-source-files  /root/Desktop/origen/ /root/Desktop/destino/
```


#### 7. Simular o testear la transferencia antes de realmente realizarla
```
rsync -avh --dry-run --remove-source-files   /root/Desktop/origen/ /root/Desktop/destino/

```


#### 8. Estableciendo limite de archivos de datos
--max-size='500k' esta opción permite definir el tamaño máximo de los archivos a transferir. Asi que solo se copiaran los archivos iguales o menores al tamaño indicado.

--min-size='500k' esta opción permite definir el tamaño mínimo de los archivos a transferir. Asi que solo se copiaran los archivos iguales o mayores al tamaño indicado.
```
rsync -avzhP -e ssh --max-size='500k' /home/ventas/reportes/*.xls  root@172.16.0.50:/backups/
```
(Solo se transfieren archivos xls menores o iguales a 500 kilobytes.
Prefijos para el tamaño puede ser k, m, g)

#### 8.2 Estableciendo  límites de ancho de banda y/o transferencia máxima/mínima
_--bwlimit=100 por default, rsync no limita el ancho de banda en las transferencias entre equipos, pero si se desea limitarla con esta opción se logra._

```
rsync -avzhP -e ssh --max-size='500k' --bwlimit=100 /root/Desktop/origen/ /root/Desktop/destino/
```

(Si no se indica prefijo, el default es 'k', en kilobytes.
Prefijos para el ancho de banda pueden ser k, m, g
Si se indica --bwlimit=0 es ancho de banda ilimitado, o es lo mismo
no indicar la opción en si.)