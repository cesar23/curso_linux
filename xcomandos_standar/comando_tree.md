# Comando Tree

```shell
tree        # Muestra directorios y ficheros
tree -d     # Muestra sólo directorios
tree -L X   # Muestra hasta X directorios de profundidad (ejemplo : tree -L 2)
tree -f     # Muestra los archivos con su respectiva ruta
tree -a     # Muestra todos los archivos, incluidos los ocultos.
tree /      # Muestra un árbol de todo nuestro sistema
tree -ugh   # Muestra los ficheros con su respectivo propietario (-u),
            # el grupo (-g) y el tamaño de cada archivo (-h)
tree -H . -o tudirectorio.html # Exporta tu árbol de directorio a un archivo




# ----------------------------------------------------
# --------- Opciones de Listado ----------------------
# ----------------------------------------------------


-a    # Se enumeran todos los archivos.
-d    # Listar solo directorios.
-l    # Seguir enlaces simbólicos como directorios.
-f    # Imprime el prefijo de la ruta completa para cada archivo.
-x    # Permanecer solo en el sistema de archivos actual.
-L    # nivel Desciende solo directorios de nivel profundo.
-R    # Vuelva a ejecutar el árbol cuando se alcance el nivel máximo de directorio.
-P    # pattern  Muestra solo los archivos que coinciden con el patrón dado.
-I    # pattern  No muestra archivos que coincidan con el patrón dado.
–ignore-case    # Ignora mayúsculas y minúsculas cuando se comparan patrones.
–matchdirs    # Incluya los nombres de directorio en la coincidencia de patrones -P.
–noreport     # Desactiva el recuento de archivos/directorios al final de la lista del árbol.
–charset X    # Use charset X para terminal/HTML y salida de línea de sangría.
–filelimit    # No descender directorios con más de # archivos en ellos.
–timefmt      # Imprime y formatea la hora según el formato .
-o            # nombre de archivo Salida a archivo en lugar de salida estándar.

# ----------------------------------------------------
# --------- Opciones de Archivo ----------------------
# ----------------------------------------------------


-q    # Imprime caracteres no imprimibles como '?'.
-s    # Imprimir caracteres no imprimibles tal cual.
-Q    # Cita nombres de archivo con comillas dobles.
-p    # Imprime las protecciones para cada archivo.
-u    # Muestra el propietario del archivo o el número de UID.
-g    # Muestra el propietario del grupo de archivos o el número GID.
-s    # Imprime el tamaño en bytes de cada archivo.
-h    # Imprime el tamaño de una manera más legible por humanos.
–si like -h, # pero se usa en unidades SI (potencias de 1000).
-D    # Imprime la fecha de la última modificación o (-c) cambio de estado.
-F    # Agrega '/', '=', '*', '@', '|' o '>' según ls -F.
–inodes # Imprime el número de inodo de cada archivo.
–device # Imprime el número de ID del dispositivo al que pertenece cada archivo.

# ----------------------------------------------------
# --------- Opciones de ordenamiento -----------------
# ----------------------------------------------------

-v   # Ordenar archivos alfanuméricamente por versión.
-t   # Ordenar archivos por hora de última modificación.
-c   # Ordenar archivos por última hora de cambio de estado.
-U   # Deja los archivos sin ordenar.
-r   # Invierte el orden de la ordenación.
–dirsfirst  # Lista los directorios antes que los archivos (-U deshabilita).
–sort X     # Seleccione ordenar: nombre,versión,tamaño,mtime,ctime.

# ----------------------------------------------------
# --------- Opciones de Visualizacion -----------------
# ----------------------------------------------------

-i    # No imprima líneas de sangría.
-A    # Imprimir líneas ANSI líneas de sangría gráficas.
-S    # Imprimir con líneas de sangrado de gráficos CP437 (consola).
-n    # Desactiva siempre la coloración (-C anula).
-C    # Activa la coloración siempre.

# ----------------------------------------------------
# --------- ——- XML/HTML/JSON ——- -----------------
# ----------------------------------------------------

-X    # Imprime una representación XML del árbol.
-J    # Imprime una representación JSON del árbol.
-H    # baseHREF Imprime formato HTML con baseHREF como directorio superior.
-T    # cadena Reemplace el título HTML predeterminado y el encabezado H1 con una cadena.
–nolinks # Desactiva los hipervínculos en la salida HTML.

```

## buscar solo con extension
cuales fueron los archivos que se modificaron en fechas mas recientes
```shell
> tree  -t -P *.txt ~/Documents
 /home/user/Documents
├── SIA TEST.txt
├── migracio de xen server a vmware.txt
├── users_linux.txt
├── userlist_A.txt
├── userlist_M.txt
├── users_domain.txt
├── test.txt
├── Books
├── Personal
└── Notes
```

## Como ver los permisos de los archivos y directorios con el comando tree
También puedes requerir ver los permisos que tienen los archivos y directorios dentro de una ruta en particular, ya sea para depurar algun error o para asegurar que solo los usuarios correctos puedan leer o modificar un archivo o directorio. Esto lo puedes hacer agregando el parámetro -p

```shell
> tree  -t -p -P *.txt ~/Documents

├── [-rw-r--r--]  SIA TEST.txt
├── [-rw-r--r--]  migracio de xen server a vmware.txt
├── [-rw-r--r--]  users_linux.txt
├── [-rw-r--r--]  userlist_GA.txt
├── [-rw-r--r--]  userlist_GACOM.txt
├── [-rw-r--r--]  users_domain.txt
├── [-rw-r--r--]  test.txt
├── [drwxr-xr-x]  Books
├── [drwx------] Personal
└── [drwxr-xr-x]  Notes
```

### mostrar solo nivel 2 directorios
```shell
> tree -d -L 2
.                                         
|-- MobaXterm_Portable                    
|-- aws                                   
|-- bin                                   
|-- config                                
|   |-- libs                              
|   `-- profile.d                         
|-- exe                                   
|-- icons                                 
|-- myScripts                             
|   `-- BACUP_GIT                         
|-- opt                                   
|-- ssl                                   
|   |-- certs                             
|   `-- misc                              
|-- themes                                
|   `-- background                        
`-- vendor                                
    |-- bin                               
    |-- clink                             
    |-- clink-completions                 
    |-- conemu-maximus5                   
    |-- git-for-windows                   
    |-- lib                               
    `-- psmodules                         
                                           
```
## Si queremos ver incluso los archivos ocultos, usamos la bandera -a:
```shell
tree -L 1 -a 

# ver los archivos  ocultos y sus persmisos con p
tree -L 2 -pa
```