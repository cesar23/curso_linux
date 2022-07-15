#!/bin/bash

#read path_dir
#echo $path_dir | sed -e "s/\/\"${replace}\"/g"

echo "Herramienta para  Visualizar el Peso de un Directorio"
echo 'ejemplo: /d/backup-soluciones'
echo
echo
read -p "Ingresa path linux aqui: " path_dir

#----------1 reemplazar
search="\/\/" # //
replace="\/"  # /
path_dir=$(echo "${path_dir}/" | sed -e "s/${search}/${replace}/g")

#-----2 trim a strin
path_dir=`echo $path_dir | sed 's/ *$//g'`

clear
echo "Pesdo  de Directorio: ${path_dir}"

du -bsh "${path_dir}"

read -p "Tecla [enter salir]"
