#!/usr/bin/env bash
DATE_HOUR_GIT="`date +%Y`-`date +%m`-`date +%d`_`date +%H`:`date +%M`:`date +%S`"
CURRENT_USER=$(id -un)
CURRENT_PC_NAME=$(exec /usr/bin/hostname)
MY_INFO="${CURRENT_USER}@${CURRENT_PC_NAME}"

scriptPathDir=$(dirname $0)
scriptPathFile=$(realpath $0)
scriptPathFileName="$(basename "$(test -L "$0" && read -plink "$0" || echo "$0")")"


echo "----------------------------------------------"
echo "----------Limpieza de repositorio ------------"
echo "----------------------------------------------"
echo ""

#-------------------------


echo "----------------------------------------------"
echo "::::::::::: Limpieza [carpetas no deseadas] -----------"
echo "----------------------------------------------"
# pra ver peso en  carpetas con find usaremos du
find . -type d  -name "__pycache__"  -exec du  -smh {} \;
find . -type d  \( -iname 'build' -o -iname 'dist' \) -exec du  -smh {} \;

# :::::::::: limpieza
read -p " se realizara la limpieza [ presionar Enter ]"

find . -type d  -name "__pycache__"    -exec rm -rf  {} \;
find . -type d  \( -iname 'build' -o -iname 'dist' \)   -exec rm -rf  {} \;




echo "----------------------------------------------"
echo "::::::::::: Limpieza [por extensiones sql,zip,7z.etc] -----------"
echo "----------------------------------------------"
echo ""

find . -type f -regex ".*\.\(sql\|zip\|7z\|tar\|tar.gz\)"  -exec ls -lah {} \;

# :::::::::: limpieza
read -p " se realizara la limpieza [ presionar Enter ]"

find . -type f -regex ".*\.\(sql\|zip\|7z\|tar\|tar.gz\)"  -exec rm -rf  {} \;
find . -type f -regex ".*\.\(mp3\|mp4\)"  -exec rm -rf  {} \;



echo "----------------------------------------------"
echo "::::::::::: Limpieza [archivos pesados pero no los .py] -----------"
echo "----------------------------------------------"
echo ""

# Oviamos ficheros y Oviaremos archivos especificos
find . -type f -not -regex ".*\.\(py\|sh\|md\)" -size +5M \
  -not -path "/D/repos/curso_linux/.git" \
  -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \
  -exec ls -lah {} \;


find .  -type f  -size +5M


# :::::::::: limpieza
read -p " se realizara la limpieza [ presionar Enter ]"

find .  -not -path "./.git/*"  \
  -type f \
  -size +5M \
  -exec  ls -lah {} {} \;




find .  -not -path "./.git/*"  \
  -type f \
  -not \( -iname '*.py' -o -iname '*.sh' -o -iname '*.md' \) \  \
  -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \ \
  -size +5M \
  -exec  ls -lah {} \;

