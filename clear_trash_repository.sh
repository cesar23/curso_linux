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
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
   echo "clean ..."
   find . -type d  -name "__pycache__"    -exec rm -rf  {} \;
   find . -type d  \( -iname 'build' -o -iname 'dist' \)   -exec rm -rf  {} \;
fi



echo "----------------------------------------------"
echo "::::::::::: Limpieza [por extensiones sql,zip,7z.etc] -----------"
echo "----------------------------------------------"
echo ""

find . -type f -regex ".*\.\(sql\|zip\|7z\|tar\|tar.gz\)"  -exec ls -lah {} \;


# :::::::::: limpieza
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
   echo "clean ..."
  find . -type f -regex ".*\.\(sql\|zip\|7z\|tar\|tar.gz\)"  -exec rm -rf  {} \;
  find . -type f -regex ".*\.\(mp3\|mp4\)"  -exec rm -rf  {} \;
fi



echo "----------------------------------------------"
echo "::::::::::: Limpieza [archivos pesados pero no los .py] -----------"
echo "----------------------------------------------"
echo ""



find .  -not -path "./.git/*"  \
  -type f \
  -not \( -iname '*.py' -o -iname '*.sh' -o -iname '*.md' \) \
  -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \
  -size +3M \
  -exec  ls -lah {} \;



# :::::::::: limpieza
BACK="$(tput cub1)"
yes_no=y
echo -e "Enter y to continue n to exit: $yes_no$BACK\c" ; read yes_no
#:::: si es y  entra  aqui
if [ "${yes_no}" == "y" ]
then
  echo "clean ..."
  find .  -not -path "./.git/*"  \
    -type f \
    -not \( -iname '*.py' -o -iname '*.sh' -o -iname '*.md' \) \
    -not \( -iname 'mongodump.exe' -o -iname 'mongoexport.exe' -o -iname 'mongorestore.exe' \) \
    -size +3M \
    -exec rm -rf  {} \;
fi





