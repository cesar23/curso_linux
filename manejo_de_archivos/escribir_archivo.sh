#!/bin/bash
CURRENT_DIR=$(dirname $0)
PATH_ARCHIVO="${CURRENT_DIR}/nombres2.txt"
PATH_CONTADOR="${CURRENT_DIR}/contador.txt"
CONT=0

#--leemos

for line in $(cat $PATH_CONTADOR) 
  do 
    #echo "$line"
     CONT=$line
    
done
#  aqui le  sumamos
CONT=$((CONT + 1))
echo $CONT
# actualizamos contador
echo $CONT >$PATH_CONTADOR