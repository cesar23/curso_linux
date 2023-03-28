fuente:http://www.sromero.org/wiki/linux/aplicaciones/uso_de_awk

Formato de uso

# El uso básico de AWK es:

 # awk [condicion] { comandos }
		# Donde:

		# [condicion] representa una condición de matcheo de líneas o parámetros.
		# comandos : una serie de comandos a ejecutar:
		# $0 → Mostrar la línea completa
		# $1-$N → Mostrar los campos (columnas) de la línea especificados.
		# FS → Field Separator (Espacio o TAB por defecto)
		# NF → Número de campos (fields) en la línea actual
		# NR → Número de líneas (records) en el stream/fichero a procesar.
		# OFS → Output Field Separator (" ").
		# ORS → Output Record Separator ("\n").
		# RS → Input Record Separator ("\n").
		# BEGIN → Define sentencias a ejecutar antes de empezar el procesado.
		# END → Define sentencias a ejecutar tras acabar el procesado.
		# length → Longitud de la línea en proceso.
		# FILENAME → Nombre del fichero en procesamiento.
		# ARGC → Número de parámetros de entrada al programa.
		# ARGV → Valor de los parámetros pasados al programa.
		


# muestra la linea completa
ls -l | awk '{ print $0 }'
			 # ║  
			 # ║  
			 # ║   drwxr-xr-x 1 cauris 1049089       0 oct.  3 15:07 Postman/
			 # ║   lrwxrwxrwx 1 cauris 1049089      56 sep. 25 15:00 Reciente -> /c/Users/cauris/AppData/Roaming/Microsoft/Windows/Recent/
			 # ║   drwxr-xr-x 1 cauris 1049089       0 sep. 25 15:54 Saved Games/
			 # ║   drwxr-xr-x 1 cauris 1049089       0 sep. 25 15:54 Searches/
			 # ╚═  lrwxrwxrwx 1 cauris 1049089      56 sep. 25 15:00 SendTo -> /c/Users/cauris/AppData/Roaming/Microsoft/Windows/SendTo/
			 # 	   drwxr-xr-x 1 cauris 1049089       0 ago.  2 15:33 source/
			 # 	   drwxr-xr-x 1 cauris 1049089       0 sep. 25 15:54 Videos/
			 # 


 # Mostrar varias columnas, así como texto adicional (entre comillas):
 ls -l | awk '{ print $1 ":" $3 }' 
				# ║   drwxr-xr-x:cauris
				# ║   lrwxrwxrwx:cauris
				# ║   drwxr-xr-x:cauris
				# ║   drwxr-xr-x:cauris
				# ║   lrwxrwxrwx:cauris
				# ║   drwxr-xr-x:cauris
				# ╚═  drwxr-xr-x:cauris
				# 

 # Imprimir campos de un fichero: 
 awk '{ print $2, $1 }' demo2.txt

# a;adir caracteres a al hora de imprimir
awk '{print "*"$1"*" " " $2}'  salida_du.txt

awk '{ system("( " $1 " * 1000 - print | ); }' salida_du.txt
# printf $2 " - " ;                               => pinta el directorio
# numfmt --to=iec-i --suffix=B --format=\"%.3f\"  => funcion para obtener bytes a human
# $((" $1 " * 1000)) " )                          => para convertir Kilobytes a Bytes
awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.3f\"  $((" $1 " * 1000)) " ) }' salida_du.txt


# Imprimir último campo de cada línea:
awk '{ print $NF }' demo2.txt

 
 # Imprimir los campos en orden inverso:
awk '{ for (i = NF; i > 0; --i) print $i }' demo2.txt
 
 #Imprimir última línea:
 awk '{line = $0} END {print line}'  demo2.txt
 
 
  # Imprimir primeras N líneas:
 awk 'NR < 100 {print}'  demo2.txt #imprime las 100 primeras lineas


  # definir  separador:
 awk -F':' '{print $2}' clientes.txt


awk 'BEGIN { FS = ":" } ; { print $2 }' clientes.txt

#ejecutando comandos
awk 'BEGIN { FS = ":" } ; {system("mkdir " $1 " ")}' colores.txt
awk 'BEGIN { FS = ":" } ; {system("mkdir " $1 " " $2)}' colores.txt



# Crera  funcion:
awk '

function myfunc()
{

printf "The user %s has home path at %s\n", $1,$6

}
BEGIN{FS=":"}
{

myfunc()

}' clientes.txt


du -a | sort -n -r | head -n 7 | awk '
                                 function myfunc()
                                 {
                                 valor=$(kiloBytes_To_HumanReadable $1)

                                 printf "The user %s \n", $valor

                                 }

                                 {

                                 myfunc()

                                 }'

 
# busqueda de palabra

awk '/cesar/' personas.txt

awk '/cesar/ {print $0}' personas.txt
# busqueda de palabra y la pintamos
awk '/cesar/ {print "\033[32m" $0 "\033[39m"}' personas.txt

# busqueda de 2 palabra y la pintamos
awk '
	/cesar/ {print "\033[32m" $0 "\033[39m"}
	/juan/ {print "\033[31m" $0 "\033[39m"}
' personas.txt



#-------------------- if
# muestra todas las lineas que contengan menos de 12 caracteres.
awk '{if(length($0) < 12) print}' personas.txt



tail -100f /var/log/applications/application.log | awk '
/INFO/ {print "\033[32m" $0 "\033[39m"}
/Exception/ {print "\033[31m" $0 "\033[39m"}
'

#  crera  un texto
awk 'BEGIN {print "Report Title"}'

 screen -ls | grep '(Detached)' |  awk -exec
 screen -ls | grep '(Detached)' | awk '{system("screen -S -X  ${1}   quit")}' file.log
 screen -ls | grep '(Detached)' | awk '{system("echo $1  ")}'
 screen -ls | grep '(Detached)' | awk '{system("echo $1  ")}'




# con formateado Humano
du -a  /home | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }'
