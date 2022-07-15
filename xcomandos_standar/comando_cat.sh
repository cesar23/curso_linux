#También podemos contar lineas dentro de ficheros
cat ficheros.txt | wc -l

#Tambien podemos contar caracteres dentro de un fichero
cat ficheros.txt | wc -m


#Crear un archivo con el comando cat
cat > filename.txt


#Para evitar desplazarse por archivos muy grandes, puedes agregar la opción | more ver la pantalla de menos o más:
cat filename.txt | less


cat source.txt > destination.txt

#concatenar fichero
cat source1.txt source2.txt > destination.txt

#numeracion
cat -n filename.txt