
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





# buscar en texto
grep -i "ReportMobil"  /var/www/geosupply.com.pe/public_html/utilities/storage/logs/history-scan.log

tail -1000f /var/www/geosupply.com.pe/public_html/utilities/storage/logs/history-scan.log | grep -i "success"

# buscar palabras que no contengas con -v  la palabra 2019-10
tail -1000f /var/www/geosupply.com.pe/public_html/utilities/storage/logs/history-scan.log | grep -v "2019-10"
# buscar palabras que contengan comienzen
tail -1000f /var/www/geosupply.com.pe/public_html/utilities/storage/logs/history-scan.log | egrep -i '^(a|o)'


# buscar sin expresiones regulares
tail -1000f /var/www/geosupply.com.pe/public_html/utilities/storage/logs/history-scan.log | grep -F "INFO" |less


$tail -100f /var/log/applications/application.log | awk '
/INFO/ {print "\033[32m" $0 "\033[39m"}
/Exception/ {print "\033[31m" $0 "\033[39m"}
'

#buscar los persmosos de los archivo sylog y miapp.log

# drwxr-xr-x  6 root   root   4.0K Oct  9 12:48 libvirt
# drwxr-xr-x  2 root   root   4.0K Dec  7  2017 lxd
# -rw-r-----  1 syslog adm    1.2K Oct 11 16:18 mail.log
# -rw-r--r--  1 root   root      0 Oct 11 14:58 messages
# -rw-r-----  1 syslog adm       0 Oct 11 18:20 miapp.log
# -rwxrwxrwx  1 root   root     50 Oct 11 16:44 mycustomlog
# drwxr-x---  2 mysql  adm    4.0K Oct  9 12:48 mysql
# -rwxr-xr-x  1 syslog adm       0 Oct 11 14:55 perulog
# -rw-r-----  1 syslog adm    557K Oct 11 19:28 syslog
# drwxr-x---  2 root   adm    4.0K Oct 10 11:46 unattended-upgrades
# -rw-r--r--  1 root   root    640 Oct  9 12:57 vmware-network.1.log
# -rw-r--r--  1 root   root   4.0K Oct 10 10:57 vmware-network.log
# -rw-r--r--  1 root   root   4.4K Oct 11 09:38 vmware-vmsvc.1.log
# -rw-r--r--  1 root   root   1.2K Oct 11 15:46 vmware-vmsvc.log
# -rw-rw-r--  1 root   utmp    15K Oct 11 15:48 wtmp
ls -lah  | grep -E -e ".*+ syslog+.*adm+.*miapp" -e ".*+ syslog+.*adm+.*syslog"

# -rw-r-----  1 syslog adm       0 Oct 11 18:20 miapp.log
# -rw-r-----  1 syslog adm    557K Oct 11 19:28 syslog


#-----------------------equivalencia de grep en  windows

#--buscar texto en archivo
findstr /C:"Cesar" empresas.txt

#-- buscar tezto en listado
tasklist |findstr /C:"chrome"

