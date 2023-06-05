#!/bin/bash
#------------------------------------ https://drive.google.com/file/d/1M5O3koc2NRFHukLEQsdc_ReDOihyhtKZ/view
#--ejemplo : https://drive.google.com/file/d/1lBzMfW9TPXRvJy8d1iTr3sQR3iIOdY3Y/view?usp=sharing

#----https://drive.google.com/open?id=1M5O3koc2NRFHukLEQsdc_ReDOihyhtKZ
#------------------------------------ https://drive.google.com/open?id=1By4eluemqbKHKhhC5R01AkmhcU6Z_Rqu
SCRIPT_DIR=$(dirname $0)
CURRENT_DIR=$(pwd)

cd $SCRIPT_DIR

#https://drive.google.com/file/d/1eu4WN6SBPJz2GpLZbbIkYLTLZG9XsxML
fileid="15q0fuq4eNdrhV3kNrIJZH9qZXW3qKD4i"
filename="SM-A125M_A125MUBS3BVD1_A125MOWO3BVD1_ZTM_4file.zip"


echo "-------------------------------------------------------------------------------"
echo "----------------[ descargado el archibo: ${filename}]--------------------------"
echo "-------------------------------------------------------------------------------"


curl -A 'Mozilla/3.0 (Win95; I)' -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -A 'Mozilla/3.0 (Win95; I)' -Lb ./cookie.txt "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie.txt`&id=${fileid}" -o ${filename}



clear
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

