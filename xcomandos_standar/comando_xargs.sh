
#-----------------------------------------------------------------
# ------------------ Búsqueda por fecha
#-----------------------------------------------------------------

# xargs options :
# -0 : los elementos de entrada terminan con un carácter nulo en lugar de espacios en blanco
# -a file : leer elementos del archivo en lugar de la entrada estándar
# –delimiter = delim : los elementos de entrada terminan con un carácter especial
# -E eof-str : establecer el final de la cadena de archivo en eof-str
# -I replace-str : reemplazar ocurrencias de replace-str en los argumentos iniciales con nombres leídos de la entrada estándar
# -L max-lines : utilice como máximo líneas de entrada no en blanco por línea de comando.
# -p : prompt  el usuario acerca de si debe ejecutar cada línea de comando y leer una línea desde la terminal.
# -r : Si la entrada estándar no contiene espacios en blanco, no ejecute el comando
# -x : salir si se excede el tamaño.
# –help : imprima el resumen de opciones para xargs y salga
# –version : imprime la versión no. de xargs y salida





# Mostrará el contenido del archivo
xargs  -a peruano.txt
# Mostrará el contenido del archivo pedira una  confirmacion para  ejecutarlo
xargs -p -a peruano.txt


#---------------------------------------------------------------------------------------------------
#Ejemplos del video https://mega.nz/#F!WSQQgIIJ!qb1wC8-dLmnJDNaZGlYeHw!XD4AiQ5T

cat peruano.txt  |  xargs wc -l # (wc -l archivo.txt) muestra cuantas lineas tiene un archivo y ejecuta
	 # ║   			  ║
	 # ║   			  ╚════    36 /etc/passwd
	 # ║					   11 /etc/fstab
	 # ║					   64 /etc/group
	 # ║					   111 total
	 # ║   
	 # ╚═ /etc/passwd
	 # 	  /etc/fstab
	 #    /etc/group


 cat peruano.txt | xargs echo wc -l  #muestrara lo que hara el comando sin ejecutarlo			 
	 # ║			
	 # ║		
	 # ║					
	 # ║   
	 # ╚═ wc -l /etc/passwd /etc/fstab /etc/group





 cat peruano.txt |xargs -i echo wc -l {} #muestrara lo que hara el comando en cada linea sin ejecutarlo
	 # ║			
	 # ║		
	 # ║					
	 # ║   wc -l /etc/passwd
	 # ║   wc -l /etc/fstab
	 # ╚═  wc -l /etc/group 



  ls *.txt | xargs echo rm  #muestrara lo que hara el comando sin ejecutarlo			 
	 # ║			
	 # ║		
	 # ║					
	 # ║   
	 # ╚═ rm eeru2.txt final.txt hjdts.c.txt my-file.txt otroo.txt peruano.txt qeru1.txt salidas.txt



mio


 ls | egrep "(^[a-z])" | find -not -name "demo" | grep -v -e ".npm" | grep -v -e ".ssh" | xargs  rm -fr
