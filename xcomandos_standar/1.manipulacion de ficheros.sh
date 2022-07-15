

whoami 
# es la concatenación de las palabras en ingles "Who am I?" (¿Quien soy?) Funciona para los sistemas tipo Unix, Windows Vista, Windows 7, y Windows Server 2008.

#--------------------------------------------------------------------------
#------------------------------ history -----------------------------------
#--------------------------------------------------------------------------

history
history -c #limpiar historial 
#historial de comando fuente:http://lamiradadelreplicante.com/2014/08/29/unos-tips-para-usar-el-comando-history-en-linux/

#--------------------------------------------------------------------------
#------------------------------ uname -------------------------------------
#--------------------------------------------------------------------------
#Muestra información del sistema. La sintaxis del comando uname es de la forma:

uname -s #Muestra el nombre del sistema.
Linux

uname -n #Muestra el nombre por el que se identifica el sistema en la red (el FQDN)
kali

uname -a #Muestra toda la información sobre el tipo de sistema que se esta utilizando.
Linux kali 3.12-kali1-686-pae #1 SMP Debian 3.12.6-2kali1 (2014-01-06) i686 GNU/Linux

uname -m #Muestra el tipo de arquitectura que se esta utilizando.
i686

uname -r
3.12-kali1-686-pae

uname -v #Muestra información sobre la versión del Sistema Operativo.
174-Ubuntu SMP Tue May 7 12:20:14 UTC 2019

#1 SMP Debian 3.12.6-2kali1 (2014-01-06)
uname -p #Muestra información sobre el procesador. 64 o 32 bits
x86_64


#--------------------------------------------------------------------------
#------------------------------ man -------------------------------------
#--------------------------------------------------------------------------
#Muestra las páginas de ayuda (manuales) de los distintos comandos.:

man ls

#--------------------------------------------------------------------------
#------------------------------ cat y tac -------------------------------------
#--------------------------------------------------------------------------
#Muestra el contenido del archivo:

cat mi_archivo.txt 

cat mi_archivo.txt mi_archivo2.txt 

tac mi_archivo.txt #muestra en contenido desendente

#--------------------------------------------------------------------------
#------------------------------ nl -------------------------------------
#--------------------------------------------------------------------------
#para  visualizar numero de lineas de un archivo:

nl mi_archivo.txt 


#--------------------------------------------------------------------------
#------------------------------ wc  -------------------------------------
#--------------------------------------------------------------------------
#realizar diferentes conteos desde la entrada estándar, ya sea de palabras:

  wc -l <archivo> número de lineas  #no exacto
   wc -c <archivo> número de bytes
   wc -m <archivo> imprime el número de caracteres
   wc -L <archivo> imprime la longitud de la línea más larga
   wc -w <archivo> imprime el número de palabras #exacto los demas no tanto

#--------------------------------------------------------------------------
#------------------------------ sort  -------------------------------------
#--------------------------------------------------------------------------
#ordena contenidod e lineas:

sort demo.txt #ordena texto ASC
sort -r demo.txt #ordena texto DESC
sort -n numeros.txt #ordena  numero

#--------------------------------------------------------------------------
#------------------------------ uniq  -------------------------------------
#--------------------------------------------------------------------------
#agrupa todos lso caracteres seguidos pero no los que estan en lineas mas abajo:

 uniq -i ips.txt #-i considera iguales las mayúsculas y minúsculas.
 uniq -u ips.txt #-u elimina las lineas consecutivas iguales.
 
#--------------------------------------------------------------------------
#------------------------------ expand  -------------------------------------
#--------------------------------------------------------------------------
#Convierte tabuladores a espacios, útil en entornos con diversos sitemas operativos, por ejemplo, se sustituye cada tabulador por nueve espacios:

 expand -t 9 expand.txt

 
 #--------------------------------------------------------------------------
#------------------------------ fmt  -------------------------------------
#--------------------------------------------------------------------------
#Limita el ancho de caracteres por cada línea:

fmt -70 texto.txt #ancho maximo 70


 
#--------------------------------------------------------------------------
#------------------------------ cut  -------------------------------------
#--------------------------------------------------------------------------
#Corta la extensión de las líneas de texto, como por ejemplo del carácter 1 al 10:
#muesra solo las primeras

cut -c 1-10 demo.txt #muesra solo las primeras 10 caracteres de cada palabras

 
#--------------------------------------------------------------------------
#------------------------------ split  -------------------------------------
#--------------------------------------------------------------------------
#Divide un archivo en varios trozos, como por ejemplo en trozos de 50Mb:


split -l 5 nombres.txt spli- #parte los ficheros por cada 5 lineas y un prefijo spli- de cada  fichero
split -b 8M salida.log spli2- #parte los ficheros por 5Megabites  y le da  un prefijo de spli2-
#tambien podemos unirlo con 
cat spli2-* >salida-2.log


#------------dividiendo y uniendo un archivo binario-----------
split -b 10M video1.mp4 mp4- #dividiend el video por 10megas
cat mp4-* >videoSalvado.mp4 #uniendo el video por 10megas

 
#--------------------------------------------------------------------------
#------------------------------ join y paste  -------------------------------------
#--------------------------------------------------------------------------
#Busca las líneas comunes en dos archivos y las muestra. Previamente tienen que estar ordenadas (con el comando sort, por ejemplo):
join archivo1.txt archivo2.txt

paste personas.txt apellidos.txt >salida2.txt #si me  funciono 

#--------------------------------------------------------------------------
#------------------------------ grep      :busqueda de un fichero ---------
#--------------------------------------------------------------------------
#	-c En lugar de imprimir las líneas que coinciden, muestra el número de líneas que coinciden.
#	-e PATRON nos permite especificar varios patrones de búsqueda o proteger aquellos patrones de búsqueda que comienzan con el signo -.
#	-r busca recursivamente dentro de todos los subdirectorios del directorio actual.
#	-v nos muestra las líneas que no coinciden con el patrón buscado.
#	-i ignora la distinción entre mayúsculas y minúsculas.
#	-n Numera las líneas en la salida.
#	-E nos permite usar expresiones regulares. Equivalente a usar egrep.
#	-o le indica a grep que nos muestre sólo la parte de la línea que coincide con el patrón.
#	-f ARCHIVO extrae los patrones del archivo que especifiquemos. Los patrones del archivo deben ir uno por línea.
#	-H nos imprime el nombre del archivo con cada coincidencia.

grep : office.txt #buscamos todos las lineas que contengan :
grep An office.txt #buscamos todos las lineas que inicien con An :
grep -i An office.txt #buscamos todos las lineas que en cualquier lugar  An (Cesar  yo lo   use):

#------------ busquedas por patron 
grep -i -e An -e : office.txt #busca las coincidencias ( An y : )

#------------ busqueda  inversa
grep -v : office.txt

#--------------------------------------------------------------------------
#------------------------------ grep      :busqueda varios ficheros ------
#--------------------------------------------------------------------------

grep cesar *  #buscamos en el directorio actual la palabra cesar en todos los ficheros
grep -r cesar * #buscamos en el directorio actual y en los  sub directorios la palabra cesar


#--------------------------------------------------------------------------
#------------------------------ grep      :patron 2 ------
#--------------------------------------------------------------------------

grep -i ^a nombres.txt #buscado todos los que  empiezan con a
grep -i a$ nombres.txt #buscado todos los que  terminan con a
grep ^....$ nombres.txt #busca todos los que tengan 4 caracteres

grep -i ^[cz] nombres.txt #busca todos los que comienzen con la letra c ó z
grep -i ^[a-d] nombres.txt #busca todos los que empiezen  esten entre a y d
grep -i ^[^a-d] nombres.txt #busca todos los que empiezen NO  esten entre a y d

#---------------------------
#--------------- E  expresion regular REGEX ------------
#---------------------------
grep -E "^[0-9][0-9]?$" numeros.txt #numero que tengan un caracter o dos 
grep -E "^[0-9][0-9]*$" numeros.txt #numero que tengan un caracter o dos 
grep -E "^[0-9][0-5]+$" numeros.txt #que  empiezen con un numero y otro numero  si  estan entre o 5 seguiran apareciendo

grep -E "^[0-9]{3}$" numeros.txt #numero que se repitan al comienzo 3 vecces

grep -E "^[0-9]{2,3}$" numeros.txt #numero que se repitan al comienzo 2 ó 3 vecces

#---- agrupaciones
grep -E -e "^[0-9][0-9][0-9]$" -e "^[0-9]$" numeros.txt #pueden ser tres numero o uno
grep -E "^[0-9][0-9]?[0-9]?$" numeros.txt #primer numero es obligatorio, el segundo puede estar o no, el tercero puede estar o no
grep -E "^[0-9]([0-9][0-9])?$" numeros.txt #primer numero es obligatorio, el segundo y tercero pueden o no estar

grep -E "^([0-9]|[0-9][0-9][0-9])$" numeros.txt #puede empezar con un numero o con tres numeros
grep -E "^([0-9]|[0-9]{3})$" numeros.txt #lo mismo de arriba


#--------------------------------------------------------------------------
#------------------------------ egrep      Expresiones regurares lo mismo que (grep -E ) ------
#--------------------------------------------------------------------------

egrep -E "^[0-9]{3}$" numeros.txt 


#--------------------------------------------------------------------------
#------------------------------ fegrep     DEsabilita todas las expresiones regulares  ------
#--------------------------------------------------------------------------
 fgrep  . nombres.txt #busca todas la que tengan un punto (aqui nos  sirve por que si usaramos e grep o grep nos cogeria el . como si fuera un caracter)
