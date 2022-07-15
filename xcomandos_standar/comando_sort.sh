#Ordenar líneas de los archivos de entrada a partir de criterios de ordenación. Los espacios en blanco son tomados por defecto como separadores de campo.

#---------Alguno de sus opciones son:

#   -b Ignora espacios en blanco precedentes.
#
#   -d Ordena ignorando todos los caracteres salvo caracteres letras, números y espacios.
#
#   -f considera iguales las mayúsculas y minúsculas.
#
#   -n ordena por valor numérico.
#
#   -r invertirá el orden.


#orden asc
sort  paises.txt
#oreden desc
sort -r paises.txt

#ordernar pór numeros
sort -n  numeros.txt

#ordernar por columnas (orden por el pais)
sort -k 2  numeros_paises.txt

#ordernar por columnas
#-k2 = columna 2
# -t= tabulador :
sort -k 2  -t : clientes.txt