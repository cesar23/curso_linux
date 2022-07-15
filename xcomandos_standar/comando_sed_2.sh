#--------------------------------------------------------------------------------------
#--------------------------------- comando - SED (string editor) -----------------------
#----------------------------------tambien conexpresiones regulares----------------------------
#--------------------------------------------------------------------------------------



#ejemplo simple:

$echo "Welcome to LikeGeeks page" | sed 's/page/website/'



#--------------------------------------------------------------
#----1 ejemplo sustitucion -----------------------
#--------------------------------------------------------------

#--cambia la primera coincidencia que encuentre
sed 's/1879/2000/' demo2.txt

#--cambia la primera coincidencia que encuentre g global cambiara todo
sed 's/1879/2000/g' demo2.txt


#--------------------------------------------------------------
#----2 eliminar coincidencia -----------------------
#--------------------------------------------------------------

#--Quita el coincidencia con el comodin d (delete)
sed '/1879/d' demo2.txt



#--------------------------------------------------------------
#----3 eliminar coincidencia ya reemplazando el fichero original -----------------------
#--------------------------------------------------------------

# -i le dice modifica el fichero
sed -i 's/1879/2000/g' demo2.txt

# expresion regular tambien se usa
#aqui le digo qeu elimine todos los espacios en blanco
sed '/^$/d' demo2.txt


#-------------cesar (recomendado)
# IMPORTANTE PARA MANTENER UN BACKUP CREAMOS UNO DIFERENTE
sed -i.back 's/1879/2000/g' demo2.txt


 sed -i.back '/º/d' 5646.dat
  # ls -l
  # demo2.txt.orig

  read 