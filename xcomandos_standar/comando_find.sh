# busca el archivo my-file.txt en el duirectorio actual
find . -name "my-file.txt"
# busca el archivo my-file.txt en el duirectorio actual MAYUSCULA Y MINUSCULAS
find . -iname "my-file.txt"

# buscar  todos  menos
find . -not -name "my-file.txt"

# buscar barios  archivo con extension txt
find . -name "*.txt"


# Finalmente, si deseas buscar un determinado archivo por nombre y eliminarlo, 
# usa el argumento -delete después del nombre del archivo:

find . -name "my-file.txt" -delete

#-----------------------------------------------------------------
# ------------------ Búsqueda por tipo
#-----------------------------------------------------------------

# Para la mayoría de los usuarios, basta con saber cómo encontrar archivos por sus nombres. Sin embargo, siempre es útil conocer todas las herramientas que se ofrecen para aprovechar Linux al máximo.

# Aquí es donde entra en juego el argumento -type. Linux ofrece a los usuarios las siguientes opciones para buscar archivos por tipo:

# f – archivo normal
# d – directorio o carpeta
# l – enlace simbólico
# c – dispositivos de caracteres
# b – dispositivos de bloque


# busqueda en la raiz el archivo normal con nombre
find / -type f -name "my-file.txt"




#-----------------------------------------------------------------
# ------------------ Búsqueda por fecha
#-----------------------------------------------------------------

# Tiempo de acceso (-atime) – Fecha más reciente en que el archivo fue leído o escrito.
# Tiempo de modificación (-mtime) – Fecha más reciente en que se modificó el archivo.
# Hora de cambio (-ctime) – Fecha más reciente en que se actualizaron los metadatos del archivo.



# Esto encontrará todos los archivos a los que se accedió hace un día desde el momento actual. 
# Esto significa que se listarán todos los archivos que fueron leídos y/o escritos desde el día anterior.
find / -atime 1

# Esto listará todos los archivos que tienen un tiempo de modificación de más de dos días.
find / -mtime +2
#find /home/kpopilrp/ -mtime -2 -exec ls -lha {} \;

# Esto buscará archivos que se modificaron hace menos de un minuto. Además, 
# el argumento -newer se puede usar para comparar la antigüedad de dos archivos y encontrar el más reciente.
find / -mmin -1


#-mtime +60 significa que está buscando un archivo modificado hace 60 días.
#-mtime -60 significa menos de 60 días.
#-mtime 60 Si omite + o - significa exactamente 60 días.


#Entonces, para buscar archivos de texto que se modificaron por última vez hace 60 días, use
find /home/you -iname "*.txt" -mtime -60 -print



#Mostrar el contenido del archivo en la pantalla que se modificó por última vez hace 60 días, usar
$ find /home/you -iname "*.txt" -mtime -60 -exec cat {} \;


#Cuente el número total de archivos con el comando wc
$ find /home/you -iname "*.txt" -mtime -60 | wc -l


#También puede usar el tiempo de acceso para encontrar archivos pdf.
#El siguiente comando imprimirá la lista de todos los archivos pdf
#a los que se accedió en los últimos 60 días:
$ find /home/you -iname "*.pdf" -atime -60 -type -f


#Lista todos los mp3 a los que se accedió exactamente hace 10 días:
$ find /home/you -iname "*.mp3" -atime 10 -type -f




#También hay una opción llamada -daystart. Mide los tiempos desde
#el comienzo de hoy en lugar de desde hace 24 horas. Entonces, para enumerar
#todos los mp3 en su directorio de inicio a los que se accedió ayer, escriba el comando
$ find /home/you -iname "*.mp3" -daystart -type f -mtime 1
        #Dónde,
        #  -tipo f : solo busca archivos y no directorios






# ----------------- opción de día de inicio ---------------

#La opción -daystart se usa para medir el tiempo desde el comienzo del día actual
# en lugar de hace 24 horas. Descubra todos
# los archivos perl (* .pl) modificados ayer, ingrese:

find /nas/projects/mgmt/scripts/perl -mtime 1 -daystart -iname "*.pl"



#También puede enumerar los archivos perl que se modificaron hace 8-10 días, ingrese:
#Para enumerar todos los archivos en su árbol de directorio de inicio que se modificaron hace dos o cuatro días, escriba:

find /nas/projects/mgmt/scripts/perl -mtime 8 -mtime -10 -daystart -iname "*.pl"

#-nueva opción
#Para buscar archivos en el árbol de directorios / nas / images que sean más nuevos que el archivo / tmp / foo, ingrese:
find /etc -newer /tmp/foo



#Puede usar el comando touch  para establecer la marca de fecha y hora que desea buscar, y luego usar
#la opción -newer de la siguiente manera


touch --date "2010-01-05" /tmp/foo
# Encuentra archivos más nuevos que 2010 / Jan / 05, en / data / images
find /data/images -newer /tmp/foo



# listar por rango modificados
find . -newermt "2013-01-01 00:00:00" ! -newermt "2013-01-02 00:00:00"
find ./* -mtime -10 -mtime +4 -ls


#----- buscando por rango fecha
#----- excluyendo path
#----- executando detalle
find /c/Users/demo/Desktop -newermt "2020-07-01 00:00:00" ! -newermt "2020-07-14 00:00:00"  -not -path "/c/Users/demo/Desktop/SoftFactura50-2016/*" -exec ls -lah {} \;


find /c/ -newermt "2020-07-19 00:00:00" ! -newermt "2020-07-19 23:00:00" \
 -not -path "/c/ProgramData/Microsoft/*" \
 -exec ls -lah {} \;

#---------- buscar cambios y excluyendo carpetas
 find /c/ -newermt "2020-08-14 05:18:00" ! -newermt "2020-08-14 08:17:00" \
  ! -path '/c/$Recycle.Bin/*' \
  ! -path "/c/ProgramData/Microsoft/*" \
  ! -path "/c/Users/demo/AppData/LocalLow/Microsoft/*" \
  ! -path "/c/Windows/System32/winevt/Logs/*" \
 -exec ls -lah {} \;




#-----------------------------------------------------------------
# ------------------ Búsqueda por tamaño
#-----------------------------------------------------------------

# Al igual que Linux te brinda la opción de buscar archivos basados ​​en registros de tiempo, también te permite hacer lo mismo con los tamaños. 
# La sintaxis básica para buscar archivos por tamaño es:

# find <startingdirectory> -size <size-magnitude> <size-unit>
# Puedes especificar las siguientes unidades de tamaño:

# c – bytes
# k – kilobytes
# M – megabytes
# G – gigabytes
# b – trozos de 512 bytes


# busca  archivos tengan exactamente 10 megabytes de tamaño.
find / -size 10M

# El comando anterior listará todos los archivos de tu disco que tengan MAS de 5 Gigabytes de tamaño.
find / -size +5G

# El comando anterior listará todos los archivos de tu disco que tengan MENOS de 5 Gigabytes de tamaño.
find / -size -5G



#-----------------------------------------------------------------
# ------------------ Búsqueda por propiedad
#-----------------------------------------------------------------

# Esto devolverá una lista de todos los archivos que posee el usuario llamado cesar.

find / -user cesar
# Esto devolverá una lista de todos los archivos que posee el grupo llamado cesar.
find / -group cesar



#-----------------------------------------------------------------
# ------------------ Búsqueda por permisos
#-----------------------------------------------------------------


# En Linux, 644 corresponde a permisos de lectura y escritura. Lo que significa que este comando buscará 
# todos los archivos que solo tienen permisos de lectura y escritura. Puedes jugar con esta opción un poco más, así:

find / -perm 644

# Esto mostrará todos los archivos que tengan al menos el permiso 644.
find / -perm -644

#Ahora, si deseamos ver los archivos que si tienen los permisos 777 vamos a ejecutar:
find . -type f -perm 0777 -print

#----------------------cambiar permisos de archivos por lotes
  # paso 1 buscar archivos  - ARCHIVOS
  find /home/kpopilrp/ -type f -perm 0777 -exec ls -la {} \;
  #paso 2 reemplazarlos con ottro permiso
  find /home/kpopilrp/ -type f -perm 0777 -exec chmod 0644 {} \;

  # paso 1 buscar archivos -  CARPETA
  find /home/kpopilrp/ -type d -perm 0777
  #paso 2 reemplazarlos con ottro permiso
  find /home/kpopilrp/ -type d -perm 0777 -exec chmod 0755 {} \;

#-----------------------------------------------------------------
# ------------------ Otras opciones útiles
#-----------------------------------------------------------------


# Por ejemplo, para buscar archivos y carpetas vacíos en tu sistema, usa lo siguiente:
find /home/kpopilrp/ -empty




