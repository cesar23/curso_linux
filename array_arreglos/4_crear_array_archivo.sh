#! /bin/bash
CURDIR=$(dirname $0)

#--leemos el archivos
filecontent=( `cat "${CURDIR}\paises.txt" `)
for t in "${filecontent[@]}"
do
echo $t
done

echo "contenido leido!"