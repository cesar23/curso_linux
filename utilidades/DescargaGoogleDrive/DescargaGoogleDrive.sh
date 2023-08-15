#!/bin/bash
#------------------------------------ https://drive.google.com/file/d/1M5O3koc2NRFHukLEQsdc_ReDOihyhtKZ/view
#--ejemplo :


#----https://drive.google.com/drive/folders/1AqeH0zW0bYwxD09XmcqqhGLsFDphj5SE
#------------------------------------ https://drive.google.com/open?id=1By4eluemqbKHKhhC5R01AkmhcU6Z_Rqu
SCRIPT_DIR=$(dirname $0)
CURRENT_DIR=$(pwd)

cd $SCRIPT_DIR

#https://drive.google.com/file/d/1FOZZhMVZjNrdYClEV2N9uoawp-Cxwo5F/view?usp=drive_link
fileid="1FOZZhMVZjNrdYClEV2N9uoawp-Cxwo5F"
filename="des.iso"


echo "-------------------------------------------------------------------------------"
echo "----------------[ descargado el archibo: ${filename}]--------------------------"
echo "-------------------------------------------------------------------------------"


#curl -A 'Mozilla/3.0 (Win95; I)' -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -A 'Mozilla/3.0 (Win95; I)' -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > salida.html

curl -A 'Mozilla/3.0 (Win95; I)' -Lb ./cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie.txt`&id=${fileid}" -o ${filename}




echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "----------------[ Sistema Implementado por: Cesar Auris -HL]-------------------"
echo "------------------[mail:sistemas_aempresarial@hotmail.com]---------------------"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
echo "----------------------- se descargo presione  enter --------------------------"
read

