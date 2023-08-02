#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
#FILES="/D/repos/curso_linux/xcomandos_standar/archivos_test/*"
FILES="/D/repos/curso_linux/array_arreglos/*"
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #cat "$f"
done
sleep 3


echo -en "\n\n--------------------------------------------------------\n"
echo -en "------------------ recorriendo----------------------------"
echo -en "\n--------------------------------------------------------\n\n"

for f in $(find "/D/repos/curso_linux/wordpress_utilidades/"  -maxdepth 1  -type f  )
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  #cat "$f"
done

