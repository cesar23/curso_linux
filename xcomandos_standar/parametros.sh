#!/bin/bash
# uso:  ./parametros.sh uno dos tres cuatro y cinco
# parametros_shift

echo "El número de parámetros es: $#" # Esta línea desplegará un 5
echo "Los valores de los parámetros son: $*" # El valor que despliega esta línea es uno dos tres cuatro cinco
shift 3  # Con el comando shift indicamos que ahora el parámetro primero sea $4, pues hemos hecho que empiece inmediatamente después de la tercera posición
echo -e "Ahora que hemos usado shitf 3 el parámetro 1 es: $1 y el parámetro 2 es: $2" #\\ Esto devuelve: cuatro cinco
echo "Ahora el número de parámetros es: $#" # Pues el número de parámetros ahora es: dos (cuatro cinco)
