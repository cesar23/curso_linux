#!/bin/bash
CURRENT_DIR=$(dirname $0)
PATH_ARCHIVO="${CURRENT_DIR}/nombres2.txt"
PATH_CONTADOR="${CURRENT_DIR}/contador.txt"
CONT=0


#---metodo uno
# while read linea ; do
#    echo ${linea}
# done <<< "`cat ${PATH_ARCHIVO}`"


for line in $(cat $PATH_CONTADOR) 
  do 
    echo "$line"
    # CONT=$line
    
done

echo "salida ${CONT}"


read
